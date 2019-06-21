package com.bionische.biocare.pharmacy.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.common.s3.AmazonS3ClientService;
import com.bionische.biocare.doctor.controller.DoctorController;
import com.bionische.biocare.doctor.model.DoctorCertificateDetails;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.GetDoctorRatingReviewCount;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.LabCertificateDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.model.OtpSessionDetails;
import com.bionische.biocare.model.PackageDetails;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.Country;
import com.bionische.biocare.patient.model.ForgetPwdVerificationCode;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.patient.model.TermsAndConditions;
import com.bionische.biocare.pharmacy.model.MedicalDetails;
import com.bionische.biocare.pharmacy.model.MedicalLogin;
import com.bionische.biocare.pharmacy.model.PharmacyBankAccountInfo;
import com.bionische.biocare.pharmacy.model.PharmacyCertificateDetails;
import com.bionische.biocare.pharmacy.model.PharmacyDayOrderDetails;
import com.bionische.biocare.pharmacy.model.PrescriptionToMedical;
@Scope("session")
@Controller
public class PharmacyController {

	List<PrescriptionToMedical> prescriptionToMedical;
	MedicalDetails forgrtMedicalDetails = null;
	String verificationCode = null;
	private MedicalDetails medicalDetailsRes;
	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	String msg;

	private static final Logger logger = LoggerFactory.getLogger(PharmacyController.class);

	//private HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	
	public static String pharmacySubscriptionExpiryDate;

	@RequestMapping(value = "/showPharmacyLoginPage", method = RequestMethod.GET)

	public ModelAndView showPharmacyLoginPage() {
		ModelAndView model = new ModelAndView("pharmacy/pharmacyLoginPage");
		model.addObject("msg",msg);
		msg="";
		return model;

	}

	@RequestMapping(value = "/showPharmacyRegistrationPage", method = RequestMethod.GET)

	public ModelAndView showPharmacyRegistrationPage() {
		ModelAndView model = new ModelAndView("pharmacy/pharmacyRegistration");

		return model;

	}


	@RequestMapping(value = "/showPharmacyHomePage", method = RequestMethod.GET)

	public String showPharmacyHomePage(HttpServletRequest request , Model model) {
		 
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		
		if(medicalDetails.getCityId() == 0)
			return "redirect:/showUpdatePharmacyProfile";
		if(medicalDetails.getDelStatus()==2)
			return "redirect:/showPharmacyVerificationPending";
		if(medicalDetails.getDelStatus()==3)
			return "redirect:/showPharmacyVerificationReject";
		
		System.out.println("medicalDetailsmedicalDetails:"+medicalDetails.toString());
		int medicalId = medicalDetails.getMedicalId();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", medicalId);
		MedicalDetails medicalDetailsRes =Constant.getRestTemplate().postForObject(Constant.url + "medicalDetailsById", map,
				MedicalDetails.class);
		try {
		PharmacyBankAccountInfo pharmacyBankAccountInfo=Constant.getRestTemplate().postForObject(Constant.url + "getPharmacyBankDetails", map, PharmacyBankAccountInfo.class);
		model.addAttribute("pharmacyBankAccountInfo",pharmacyBankAccountInfo);

		}
		catch (Exception e) {
			logger.error("Error while fecthing pharmacy Bank Details in showPharmacyRegistrationPage",e);
		}
		//Parsing the date
          LocalDate dateBefore = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
          LocalDate dateAfter = LocalDate.parse(medicalDetailsRes.getString3());
	
        //calculating number of days in between
          long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
		model.addAttribute("medicalDetails", medicalDetailsRes);
		model.addAttribute("homeActive", "active");
		
		try {
			PharmacyCertificateDetails pharmacyCertificateDetails= Constant.getRestTemplate().postForObject(Constant.url + "/getPharmacyCertificate",map,PharmacyCertificateDetails.class);
			model.addAttribute("certificate", pharmacyCertificateDetails.getCetrificate());
			model.addAttribute("pharmacyUrl", Constant.pharmacyUrl);
			
			
			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("userId", medicalDetails.getMedicalId());
			map1.add("userType", 3);
			WalletDetails walletDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getUserWalletDetails", map1, WalletDetails.class);
			
			model.addAttribute("walletDetails", walletDetails);
			
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");  
			Date currentDate=new Date();
			
			Date expiryDate=new SimpleDateFormat("yyyy-MM-dd").parse(DateConverter.convertToYMD(pharmacySubscriptionExpiryDate));  
			
			System.out.println("exp date= "+expiryDate);
			
			Date dateBeforeFiveDays = new Date(expiryDate.getTime() - 5 * 24 * 3600 * 1000); 
			
			if (currentDate.equals(dateBeforeFiveDays) || currentDate.after(dateBeforeFiveDays))  {
				model.addAttribute("getExpiryDate", pharmacySubscriptionExpiryDate);
				System.out.println("Subscription last 5 days");
	            model.addAttribute("endDate",expiryDate);
	            model.addAttribute("subscriptionAlertStart", "0");
	            
	        }
			
			model.addAttribute("pharmacySubscriptionExpiryDate", pharmacySubscriptionExpiryDate);
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return "pharmacy/pharmacyHomePage";

	}

	@RequestMapping(value = "/pharmacyLoginProcess", method = RequestMethod.GET)
	public @ResponseBody Info pharmacyLoginProcess(HttpServletRequest request, HttpServletResponse response) {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String token = request.getParameter("token");
		Info info1 = new Info();
		String returnUrl;
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = new MedicalDetails();
		MedicalLogin medicalLogin = new MedicalLogin();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("userName", userName);
			map.add("password", password);
			map.add("token", token);
			medicalLogin =Constant.getRestTemplate().postForObject(Constant.url + "medicalLoginProcess", map, MedicalLogin.class);
			
			
			if (!medicalLogin.getInfo().isError()) {
				
				pharmacySubscriptionExpiryDate=medicalLogin.getPharmacySuscriptionInfo().getMessage();
				
				if(!medicalLogin.getPharmacySuscriptionInfo().isError()) {
					session.setAttribute("medicalDetails", medicalLogin.getMedicalDetails());
				 
				if (medicalLogin.getMedicalDetails().getCityId() != 0) {
					returnUrl = new String("showPharmacyHomePage");
					info1.setError(false);
					info1.setMessage("showPharmacyHomePage");
					if(medicalLogin.getMedicalDetails().getDelStatus()!=0)
					{
						returnUrl = new String("showPharmacyVerificationPending");
						info1.setError(false);
						info1.setMessage("showPharmacyVerificationPending");
						
						if (medicalLogin.getMedicalDetails().getDelStatus() == 3) {
							returnUrl = new String("showPharmacyVerificationReject");
							info1.setError(false);
							info1.setMessage("showPharmacyVerificationReject");
						}
					}
				} else {
					returnUrl = new String("showUpdatePharmacyProfile");
					info1.setError(false);
					info1.setMessage("showUpdatePharmacyProfile");
					
					
					
				}
				}
				else
				{
					session.setAttribute("tempDetails", medicalLogin.getMedicalDetails());
					
					returnUrl = new String("showPharmacySuscriptionPage");
					info1.setError(false);
					info1.setMessage("showPharmacySuscriptionPage");
				 
				}
			} else {
				info1.setError(true);
				info1.setMessage("wrong");
			}

		} catch (Exception e) {
			logger.error("Error while Login Pharmacy ", e);
			throw new RuntimeException("Error while Login Pharmacy", e);
		}
		return info1;
	}

	
	@RequestMapping(value="/showPharmacyVerificationPending", method=RequestMethod.GET)
	public String showPharmacyVerificationPending(HttpServletRequest request, Model model)
	{	 	
return "verificationPending";
	}
	
	@RequestMapping(value="/showPharmacyVerificationReject", method=RequestMethod.GET)
	public String showPharmacyVerificationReject(HttpServletRequest request, Model model)
	{	 	
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		map.add("medicalId", medicalDetails.getMedicalId());
		PharmacyCertificateDetails pharmacyCertificateDetails=Constant.getRestTemplate().postForObject(Constant.url + "/getLastRejectPharmacyCertificate",map,
				PharmacyCertificateDetails.class);	
		model.addAttribute("submitUrl","uploadPharmacyCertificateProcess");
		model.addAttribute("certificateDetails",pharmacyCertificateDetails);
		
		return "reverification";
	}
	
	
	
	

	@RequestMapping(value = "/uploadPharmacyCertificateProcess", method = RequestMethod.POST)

	public String uploadPharmacyCertificateProcess(HttpServletRequest request,@RequestParam("certificatePhoto") List<MultipartFile> certificatePhoto) {
		
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");

		try {
			PharmacyCertificateDetails pharmacyCertificateDetails=new PharmacyCertificateDetails();
			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			String certificatePhotoName=certificatePhoto.get(0).getOriginalFilename();
			   
			certificatePhotoName=new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
						+ medicalDetails.getMedicalId()+VpsImageUpload.getFileExtension(certificatePhoto.get(0));
			 //vpsImageUpload.saveUploadedFiles(certificatePhoto,6, certificatePhotoName,medicalDetails.getMedicalId());
			 
				amazonS3ClientService.uploadFileToS3Bucket(certificatePhoto.get(0),certificatePhotoName,"pharmacy/" + medicalDetailsRes.getMedicalId() + "/documents/", true);
				
				
			 pharmacyCertificateDetails.setCetrificate(certificatePhotoName);
			 pharmacyCertificateDetails.setMedicalId(medicalDetails.getMedicalId());
			    pharmacyCertificateDetails.setString1(" ");
				Info info=Constant.getRestTemplate().postForObject(Constant.url+"insertPharmacyCertificateDetails", pharmacyCertificateDetails,Info.class);
		

		}
		catch (Exception e) {
			logger.error("Error while upload pharmacy Certificate  processing in uploadPharmacyCertificateProcess", e);
			throw new RuntimeException("Error while upload pharmacy Certificate  processing in uploadPharmacyCertificateProcess", e);
		}
		return "redirect:/showPharmacyVerificationPending";
	}
	
	
	@RequestMapping(value="/showPharmacySuscriptionPage", method=RequestMethod.GET)
	public String showPharmacySuscriptionPage(HttpServletRequest request, Model model)
	{	 	

		
		try {
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			
			map.add("userType", 4);
			List<PackageDetails> packageDetailsList=Constant.getRestTemplate().postForObject(Constant.url+"getCurrentPackageDetailsByUserType",map,List.class);
		model.addAttribute("packageDetailsList",packageDetailsList);
		
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Error while getting doctor Packge details",e);
			throw new RuntimeException("Error while getting doctor Packge details",e);
		}
		
		return "pharmacy/pharmacy_suscription_payment/pharmacyPackageDetails";
	}
	
	
	@RequestMapping(value = "/getPharmacyByPatientId", method = RequestMethod.GET)
	public @ResponseBody List<MedicalDetails> getPharmacyByPatientId(HttpServletRequest request,
			HttpServletResponse response) {
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		HttpSession session = request.getSession();
		List<MedicalDetails> medicalDetailsList = new ArrayList<MedicalDetails>();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("patientId", patientId);
			medicalDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalsByPatientId", map, List.class);
		} catch (Exception e) {
			logger.error("Error while geting Pharmacy By PatientId ", e);
			throw new RuntimeException("Error while geting Pharmacy By PatientId", e);
		}
		return medicalDetailsList;
	}

	@RequestMapping(value = "/getPharmacyByPincode", method = RequestMethod.GET)
	public @ResponseBody List<MedicalDetails> getPharmacyByPincode(HttpServletRequest request,
			HttpServletResponse response) {
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		int deliveryStatus = Integer.parseInt(request.getParameter("deliveryStatus"));
		HttpSession session = request.getSession();
		List<MedicalDetails> medicalDetailsList = new ArrayList<MedicalDetails>();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("pincode", pincode);
			map.add("deliveryStatus", deliveryStatus);
			medicalDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getPharmacyByPincode", map, List.class);
		} catch (Exception e) {
			logger.error("Error while geting Pharmacy By PatientId ", e);
			throw new RuntimeException("Error while geting Pharmacy By PatientId", e);
		}
		return medicalDetailsList;
	}

	

	@RequestMapping(value = "/getRatingAndReviewsDetailsOfPharmacy", method = RequestMethod.GET)
	@ResponseBody
	public GetDoctorRatingReviewCount getRatingAndReviewsDetailsOfPharmacy(HttpServletRequest request,
			HttpServletResponse response) {
		RestTemplate rest = new RestTemplate();
		GetDoctorRatingReviewCount getDoctorRatingReviewCount = new GetDoctorRatingReviewCount();
		try {
			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			getDoctorRatingReviewCount =Constant.getRestTemplate().postForObject(Constant.url + "getRatingAndReviewsDetailsOfDoctor", map,
					GetDoctorRatingReviewCount.class);
		} catch (Exception e) {
			logger.error("Error while getting pharmacy Rating And Reviews ", e);
			throw new RuntimeException("Error while getting pharmacy Rating And Reviews ", e);
		}
		return getDoctorRatingReviewCount;
	}

	// Username Validation
	@RequestMapping(value = "/usernameValidationOfPharmacy", method = RequestMethod.GET)

	public @ResponseBody Info usernameValidationOfPharmacy(HttpServletRequest request) {
		Info info = new Info();
		String userName = request.getParameter("userName");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);
		RestTemplate rest = new RestTemplate();
		try {
			info =Constant.getRestTemplate().postForObject(Constant.url + "usernameValidationPharmacy", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while Pharmacy Username Validation ", e);
			throw new RuntimeException("Error while  Pharmacy Username Validation ", e);
		}
		return info;
	}

	@RequestMapping(value = "/submitPharmacyRegProcess", method = RequestMethod.POST)

	public String submitPharmacyRegProcess(HttpServletRequest request) {
		MedicalDetails medicalDetails = new MedicalDetails();
		medicalDetails.setMedicalName(request.getParameter("medicalName"));
		medicalDetails.setPassword(request.getParameter("password"));
		medicalDetails.setEmail(request.getParameter("email"));
		medicalDetails.setContact(request.getParameter("contactNo"));
		medicalDetails.setUserName(request.getParameter("userName"));
		medicalDetails.setAddress(request.getParameter("address"));
		medicalDetails.setInt1(0);
		medicalDetails.setInt2(0);
		medicalDetails.setInt3(0);
		medicalDetails.setString1("");
		medicalDetails.setString2("");
		medicalDetails.setString3("");
		medicalDetails.setDelStatus(2);
		RestTemplate rest = new RestTemplate();
		try {
			medicalDetails =Constant.getRestTemplate().postForObject(Constant.url + "insertMedicalDetails", medicalDetails, MedicalDetails.class);
		} catch (Exception e) {
			logger.error("Error while Submit Pharmacy Registration Process ", e);
			throw new RuntimeException("Error while Submit Pharmacy Registration Process ", e);
		}
		
		
		
		return "redirect:/showPharmacyLoginPage";
		
		
	}

	@RequestMapping(value = "/showUpdatePharmacyProfile", method = RequestMethod.GET)
	public ModelAndView showUpdatePharmacyProfile(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("pharmacy/pharmacyProfileEdit");
		RestTemplate rest = new RestTemplate();
		List<City> cityList;
		List<State> stateList;
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", medicalDetails.getMedicalId());
		medicalDetailsRes =Constant.getRestTemplate().postForObject(Constant.url + "medicalDetailsById", map, MedicalDetails.class);
		MultiValueMap<String, Object> mapState = new LinkedMultiValueMap<String, Object>();
		mapState.add("countryId", medicalDetails.getCountryId());
		List<Country> countryList =Constant.getRestTemplate().getForObject(Constant.url + "/getAllCountry", List.class);
		
		try {
			stateList =Constant.getRestTemplate().postForObject(Constant.url + "getAllStateByCountryId", mapState, List.class);
			MultiValueMap<String, Object> mapCity = new LinkedMultiValueMap<String, Object>();
			mapCity.add("stateId", medicalDetails.getStateId());
			cityList =Constant.getRestTemplate().postForObject(Constant.url + "getAllCityByStateId", mapCity, List.class);
		} catch (Exception e) {
			logger.error("Error while Show update pharmacy Profile ", e);
			throw new RuntimeException("Error while Show update pharmacy Profile ", e);
		}
		model.addObject("pharmacyName", medicalDetailsRes.getMedicalName());
		model.addObject("licenceNo", medicalDetailsRes.getLicenceNo());
		model.addObject("contactNo", medicalDetailsRes.getContact());
		model.addObject("emailId", medicalDetailsRes.getEmail());
		model.addObject("countryId", medicalDetailsRes.getCountryId());
		model.addObject("stateId", medicalDetailsRes.getStateId());
		model.addObject("cityId", medicalDetailsRes.getCityId());
		model.addObject("pinCode", medicalDetailsRes.getInt3());
		model.addObject("address", medicalDetailsRes.getAddress());
		model.addObject("delStatus", medicalDetailsRes.getDelStatus());
		model.addObject("delivery", medicalDetailsRes.getInt2());
		model.addObject("medicalId", medicalDetailsRes.getMedicalId());
		//	model.addObject("medicalDetails", medicalDetailsRes);
		model.addObject("countryList", countryList);
		model.addObject("stateList", stateList);
		model.addObject("cityList", cityList);
		model.addObject("pharmacyUrl", Constant.pharmacyUrl);
		try {
			PharmacyCertificateDetails pharmacyCertificateDetails= Constant.getRestTemplate().postForObject(Constant.url + "/getPharmacyCertificate",map,PharmacyCertificateDetails.class);
			model.addObject("certificate", pharmacyCertificateDetails.getCetrificate());
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	//	model.addObject("uName", medicalDetails.getUserName());
	//	model.addObject("password", medicalDetails.getPassword());
		return model;
	}

	@RequestMapping(value = "/updatePharmacyProfilesProcess", method = RequestMethod.POST)
	public String updatePharmacyProfilesProcess(HttpServletRequest request, HttpServletResponse response,@RequestParam("certificatePhoto") MultipartFile certificatePhoto) {
		String medicalId = request.getParameter("medicalId");
		
	//	medicalDetailsRes
		
		//MedicalDetails medicalDetails = new MedicalDetails();
		 
		 
		 
		medicalDetailsRes.setMedicalName(request.getParameter("labName"));
		medicalDetailsRes.setOwner(request.getParameter("owner"));
		medicalDetailsRes.setLicenceNo(request.getParameter("licenceNo"));
		medicalDetailsRes.setContact(request.getParameter("contact"));
		medicalDetailsRes.setEmail(request.getParameter("email"));
		medicalDetailsRes.setLatitude(9);
		medicalDetailsRes.setLongitude(5);
		medicalDetailsRes.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		medicalDetailsRes.setStateId(Integer.parseInt(request.getParameter("stateId")));
		medicalDetailsRes.setCityId(Integer.parseInt(request.getParameter("cityId")));
		medicalDetailsRes.setAddress(request.getParameter("address"));
		
		medicalDetailsRes.setString1("1");
		medicalDetailsRes.setString2("1");
		medicalDetailsRes.setString3("1");
		medicalDetailsRes.setInt1(0);
		medicalDetailsRes.setInt2(Integer.parseInt(request.getParameter("delivery")));
		medicalDetailsRes.setInt3(Integer.parseInt(request.getParameter("pincode")));
		
		try {
			medicalDetailsRes=Constant.getRestTemplate().postForObject(Constant.url + "insertMedicalDetails", medicalDetailsRes, MedicalDetails.class);
			
			HttpSession session = request.getSession();
		 session.setAttribute("medicalDetails",medicalDetailsRes);
			
		} catch (Exception e) {
			logger.error("Error while Updating Pharmacy Profiles ", e);
			throw new RuntimeException("Error while Updating Pharmacy Profiles ", e);
		}
		
		
		 
			/*	int status=Integer.parseInt(request.getParameter("uploadCertificateStatus"));*/
				
			PharmacyCertificateDetails pharmacyCertificateDetails=new PharmacyCertificateDetails();
				
				VpsImageUpload vpsImageUpload=new VpsImageUpload();
				
			
				
				
				try {
					 
					String certificatePhotoName=certificatePhoto.getOriginalFilename();
					   
					certificatePhotoName=new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
								+ medicalDetailsRes.getMedicalId()+VpsImageUpload.getFileExtension(certificatePhoto);
					amazonS3ClientService.uploadFileToS3Bucket(certificatePhoto,certificatePhotoName,"pharmacy/" + medicalDetailsRes.getMedicalId() + "/documents/", true);
					// vpsImageUpload.saveUploadedFiles(certificatePhoto,6, certificatePhotoName,medicalDetailsRes.getMedicalId());
					 pharmacyCertificateDetails.setCetrificate(certificatePhotoName);
					 pharmacyCertificateDetails.setMedicalId(medicalDetailsRes.getMedicalId());
					    pharmacyCertificateDetails.setString1(" ");
						Info info=Constant.getRestTemplate().postForObject(Constant.url+"insertPharmacyCertificateDetails", pharmacyCertificateDetails,Info.class);
						
					}
					catch (Exception e) {
						 pharmacyCertificateDetails.setCetrificate("");
						 logger.error("Error while updating lab cirtificate details processing in updateLabProfilesProcess",e);
 						// TODO: handle exception
					}
				
				
				
			   
				 
			   
			   
			
		
		 
		return "redirect:/showPharmacyHomePage";
	}

	@RequestMapping(value = "/showPharmacyChangePassword", method = RequestMethod.GET)
	public ModelAndView showPharmacyChangePassword() {
		return new ModelAndView("pharmacy/changePassword");
	}

	@RequestMapping(value = "/pharmPasswordValidation", method = RequestMethod.GET)
	public @ResponseBody Info passwordValidation(HttpServletRequest request) {
		Info info = new Info();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		String password = request.getParameter("password");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", "" + medicalId);
		map.add("password", password);
		RestTemplate rest = new RestTemplate();
		try {
			info =Constant.getRestTemplate().postForObject(Constant.url + "passwordMedicalValidation", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while show Pharmacy Change Password", e);
			throw new RuntimeException("Error while show Pharmacy Change Password", e);
		}
		return info;
	}

	@RequestMapping(value = "/changePharmacyPassword", method = RequestMethod.GET)
	public @ResponseBody Info changePatientPassword(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		Info info = new Info();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", "" + medicalId);
		map.add("newPassword", "" + newPassword);
		RestTemplate rest = new RestTemplate();
		try {
			info =Constant.getRestTemplate().postForObject(Constant.url + "changeMedicalPassword", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while changing Pharmacy Change Password", e);
			throw new RuntimeException("Error while changing Pharmacy Change Password", e);
		}
		return info;
	}

	/*@RequestMapping(value = "/ShowPharmacyForgotPassword", method = RequestMethod.GET)
	public ModelAndView ShowPharmacyForgotPassword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pharmacy/pharmacyLoginPage");
		String userName = request.getParameter("userName");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);
		RestTemplate rest = new RestTemplate();
		try {
			forgrtMedicalDetails =Constant.getRestTemplate().postForObject(Constant.url + "pharmacyDetailsByUsrname", map,
					MedicalDetails.class);
			if (forgrtMedicalDetails != null) {
				model = new ModelAndView("pharmacy/forgotpassword");
				model.addObject("email", forgrtMedicalDetails.getEmail());
				model.addObject("userName", userName);
			} else {
				model = new ModelAndView("pharmacyLoginPage");
				model.addObject("usrmessage", "please enter user name");
			}
		} catch (Exception e) {
			logger.error("Error while show Pharmacy Fogot Password", e);
			throw new RuntimeException("Error while show Pharmacy Fogot Password", e);
		}
		return model;
	}

	@RequestMapping(value = "/ShowPharmacyVerifyForgetPassword", method = RequestMethod.POST)
	public ModelAndView ShowDoctorVerifyForgetPassword(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("emailId");
		String userName = request.getParameter("userName");
		// create instance of Random class
		Random rand = new Random();
		// Generate random integers in range 0 to 999
		int rand_int1 = rand.nextInt(1000000);
		RestTemplate rest = new RestTemplate();
		ModelAndView model = null;
		ForgetPwdVerificationCode forgetPwdVerificationCode= new ForgetPwdVerificationCode();

        forgetPwdVerificationCode.setCode(String.valueOf(rand_int1));
        forgetPwdVerificationCode.setType(2);
        forgetPwdVerificationCode.setUserName(userName);;
     
        MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("email", email);
		map.add("verificationCode", String.valueOf(rand_int1));
        
		try {
			Info info1=Constant.getRestTemplate().postForObject(Constant.url+"mailVerificationCode", map, Info.class);
			Info info=Constant.getRestTemplate().postForObject(Constant.url+"submitVerificationCode", forgetPwdVerificationCode, Info.class);
						
			if(info1.getMessage().equals("success")&&info.getMessage().equals("success"))
			{
				model = new ModelAndView("pharmacy/verifyForgetPwd");
				model.addObject("message", "Mail Sent Succesfully");
				model.addObject("userName",userName);
			}
				else
				{
					model = new ModelAndView("pharmacy/forgotpassword");
					model.addObject("message", "failed to send mail");
					
					
				}
	 
		}
		catch (Exception e) {
			
			logger.error("Error while ShowPharmacyVerifyForgetPassword.",e);
			throw new RuntimeException("Error while ShowPharmacyVerifyForgetPassword.",e);
		}
		
		return model;
	}

	@RequestMapping(value = "/submitPharmacyPwdVerificationCode", method = RequestMethod.GET)
	public ModelAndView submitDoctorPwdVerificationCode(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		String verify = request.getParameter("verify");
		RestTemplate rest = new RestTemplate();
		String userName=request.getParameter("userName");
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("userName", ""+userName);
		map.add("type",2);

		ForgetPwdVerificationCode forgetPwdVerificationCode = new ForgetPwdVerificationCode();
		try {
			forgetPwdVerificationCode=Constant.getRestTemplate().postForObject(Constant.url+"getVerificationCodeByUserName", map, ForgetPwdVerificationCode.class);
		}
		catch (Exception e) {
			
			logger.error("Error while submitPharmacyPwdVerificationCode.",e);
			throw new RuntimeException("Error while submitPharmacyPwdVerificationCode.",e);
		}
							
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 						
			Date date = format.parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			System.out.println("date:"+date);
			long duration = date.getTime() - forgetPwdVerificationCode.getTime().getTime();
			int time = (int) TimeUnit.MILLISECONDS.toMinutes(duration);
			
		if(time<2)	
		{
			
		if(verify.equals(forgetPwdVerificationCode.getCode()))
		{				
			model = new ModelAndView("pharmacy/setNewPwd");
			model.addObject("userName",userName);
			
		}
		else
		{
			model = new ModelAndView("pharmacy/pharmacyLoginPage");
			model.addObject("usrmessage", "invalid code");
			 
			
		}
		}
		else
		{
			model = new ModelAndView("pharmacy/pharmacyLoginPage");
			model.addObject("usrmessage", "invalid");
			 
			
		}
		
		
		}catch (Exception e) {
			logger.error("Error while submitPharmacyPwdVerificationCode.",e);
			throw new RuntimeException("Error while submitPharmacyPwdVerificationCode.",e);
		}				
		
				return model;
	}

	@RequestMapping(value = "/updatepharmacyNewPassword", method = RequestMethod.GET)
	public @ResponseBody Info updatepharmacyNewPassword(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");
		String userName = request.getParameter("userName");
		Info info = new Info();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);
		map.add("newPassword", "" + newPassword);
		RestTemplate rest = new RestTemplate();
		try {
			info =Constant.getRestTemplate().postForObject(Constant.url + "changeMedicalPasswordByuserName", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while updating Pharmacy New Password ", e);
			throw new RuntimeException("Error while  updating Pharmacy New Password ", e);
		}
		return info;
	}*/

	
	@RequestMapping(value = "/ShowPharmacyForgotPassword", method = RequestMethod.GET)

	public String ShowPharmacyForgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
 
		model.addAttribute("msg",msg);
		msg="";
		return "pharmacy/forgotpassword";

	}
	 
	@RequestMapping(value = "/searchUserNameForPharmacyForgotPassword", method = RequestMethod.POST)
	public String searchUserNameForPharmacyForgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
		String userName = request.getParameter("userName");

	 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		 
String returnString="redirect:/ShowPhanacyForgotPassword";
		try {
			MedicalDetails medicalDetails = Constant.getRestTemplate().postForObject(Constant.url + "pharmacyDetailsByUsrname",
					map, MedicalDetails.class);

			if (medicalDetails != null) {
				returnString = "pharmacy/forgotPasswordOtp";
				 
				HttpSession session = request.getSession();
				OtpSessionDetails otpSessionDetails=new OtpSessionDetails();
				Calendar now = Calendar.getInstance();
				now.add(Calendar.MINUTE, 2);
				Date nowDateTime = now.getTime();
				otpSessionDetails.setUserName(userName);
				otpSessionDetails.setDate(nowDateTime);
				otpSessionDetails.setId(medicalDetails.getMedicalId());
				otpSessionDetails.setOtp(medicalDetails.getPassword());
				session.setAttribute("otpSessionDetails", otpSessionDetails);
				
				model.addAttribute("mobileNo",medicalDetails.getContact());
				
			} else {
				returnString="redirect:/ShowPhamacyForgotPassword";
msg="User Name not found";
			}

		} catch (Exception e) {
			logger.error("Error while fetching doctor details by username in ShowPhanacyForgotPassword", e);
			throw new RuntimeException("Error while fetching doctor details by username in ShowPhanacyForgotPassword",
					e);
		}
		return returnString;
	}
	@RequestMapping(value = "/verifyPharmacyOpt", method = RequestMethod.POST)
	public String verifyPharmacyOpt(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
		HttpSession session = request.getSession();
		 
		
		 
		OtpSessionDetails otpSessionDetails=(OtpSessionDetails)session.getAttribute("otpSessionDetails");
		String returnString="";
		Calendar now = Calendar.getInstance();
		Date nowDateTime = now.getTime();
						    if(otpSessionDetails.getDate().compareTo(nowDateTime)>0)
						    {
						    String otp=	request.getParameter("otp"); 
						    System.out.println("otp :"+otp+"  Session : "+otpSessionDetails.getOtp());
						    if(otp.equals(otpSessionDetails.getOtp()))
						    {
						    	  returnString="pharmacy/changePharmacyForgotPassword";
						    }
						    else
						    {
						    	 returnString="pharmacy/forgotPasswordOtp";
						    	 
						    	 model.addAttribute("msg", "Invalid OTP Please Enter valid OTP");
						    }
						    
						    }
						    else {
						    	 returnString="pharmacy/forgotPasswordOtp";
						    	 model.addAttribute("userName", otpSessionDetails.getUserName());
						    	 model.addAttribute("msg", "Time out");
						    }
						    
						    return returnString;
	}
	
	
	@RequestMapping(value = "/changePharmacyForgotPassword", method = RequestMethod.POST)

	public String changePharmacyForgotPassword(HttpServletRequest request, HttpServletResponse response) {

		String password=request.getParameter("password");
		HttpSession session = request.getSession();
		 
		OtpSessionDetails otpSessionDetails=(OtpSessionDetails)session.getAttribute("otpSessionDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", "" + otpSessionDetails.getId());
		map.add("newPassword", "" + password);
		RestTemplate rest = new RestTemplate();
		try {
			Info info =Constant.getRestTemplate().postForObject(Constant.url + "changeMedicalPassword", map, Info.class);
		msg=info.getMessage();
		} catch (Exception e) {

			logger.error("Error while change doctor password in changePharmacyForgotPassword", e);
			throw new RuntimeException("Error while change doctor password in changePharmacyForgotPassword", e);

		}
		
		return "redirect:/showPharmacyLoginPage";
	}
	
	@RequestMapping(value = "/updatePharmacyProfilesPic", method = RequestMethod.POST)
	public String updatePharmacyProfilesPic(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("profilePhoto") List<MultipartFile> profilePhoto) {
		String profilePhotoName = null;
		Info info = new Info();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		RestTemplate rest = new RestTemplate();
		try {
			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			profilePhotoName = profilePhoto.get(0).getOriginalFilename();
			//vpsImageUpload.saveUploadedFiles(profilePhoto, 3, profilePhotoName,medicalDetails.getMedicalId());
			
			amazonS3ClientService.uploadFileToS3Bucket(profilePhoto.get(0),profilePhotoName,"pharmacy/" + medicalDetailsRes.getMedicalId() + "/profile/", true);
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("medicalId", medicalDetails.getMedicalId());
			map.add("profilePhoto", profilePhotoName);
			info =Constant.getRestTemplate().postForObject(Constant.url + "updatePharmacyProfilePic", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while updating Pharmacy Picture ", e);
			throw new RuntimeException("Error while updating Pharmacy Picture", e);
		}
		return "redirect:/showPharmacyHomePage";
	}
	
	@RequestMapping(value="/showPharmacyTermsnCondition", method=RequestMethod.GET)

	public ModelAndView ShowTermsnCondition(HttpServletRequest request,
			HttpServletResponse response)
	{
	   
		ModelAndView model=new ModelAndView("pharmacy/terms&condition");
		List<TermsAndConditions> termsConditionDetailsList=new ArrayList<>();
		int userType= 4;
		RestTemplate rest=new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("userType", userType);
		try {
								termsConditionDetailsList=Constant.getRestTemplate().postForObject(Constant.url+"getTermsAndConditionByUserType",map, List.class);
			model.addObject("termsConditionDetailsList",termsConditionDetailsList);
			System.out.println(termsConditionDetailsList.toString());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		return model; 
		
	}
	
	/*Doctor Registration form*/	

	//Contact Number Validation
			@RequestMapping(value="/verifyPharmacyContactNumber", method=RequestMethod.GET)

			public @ResponseBody Info verifyContactNumber(HttpServletRequest request)
			{
				Info info=new Info();
				
				String contactNo=request.getParameter("contactNo");
				
				MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
				map.add("contactNo",contactNo);

				RestTemplate rest=new RestTemplate();
				
				try {
					info=Constant.getRestTemplate().postForObject(Constant.url+"verifyPharmacyContactNumber", map, Info.class);
					System.out.println(""+info.getMessage());
				
				}catch (Exception e) {
					logger.error("Error while validating doctor mobile number in usernameValidationOfDoctor",e);
					throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor",e);
				}
				return info;
				
			}	
			
			//email Number Validation
					@RequestMapping(value="/verifyPharmacyEmail", method=RequestMethod.GET)

					public @ResponseBody Info verifyEmail(HttpServletRequest request)
					{
						Info info=new Info();
						
						String email=request.getParameter("email");
						
						MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
						map.add("email",email);

						RestTemplate rest=new RestTemplate();
						
						try {
							info=Constant.getRestTemplate().postForObject(Constant.url+"verifyPharmacyEmail", map, Info.class);
							System.out.println(""+info.getMessage());
						
						}catch (Exception e) {
							logger.error("Error while validating doctor mobile number in usernameValidationOfDoctor",e);
							throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor",e);
						}
						return info;
						
					}	
					
					
					 @RequestMapping(value="/showOrderMedicinePharmacy", method=RequestMethod.GET)
						
						public ModelAndView showOrderMedicine(HttpServletRequest request,
								HttpServletResponse response)
						{
						   
							ModelAndView model=new ModelAndView("order-medicine");
							
							
							return model;
							
						}
					 
					 
					/* @RequestMapping(value="/showCompletedOrderPharmacy", method=RequestMethod.GET)
						
						public ModelAndView showPatientConsultToPage(HttpServletRequest request,
								HttpServletResponse response)
						{
						   
							ModelAndView model=new ModelAndView("pharmacy/completedOrders");
							
							
							return model;
							
						}*/
					 
					/* @RequestMapping(value="/showPharmacyOrderHistory", method=RequestMethod.GET)
						
						public ModelAndView showPharmacyOrderHistory(HttpServletRequest request,
								HttpServletResponse response)
						{
						   
							ModelAndView model=new ModelAndView("pharmacy/ordersHistory");
							
							
							return model;
							
						}*/
						
					 @RequestMapping(value="/showPharmacyDashBoard", method=RequestMethod.GET)

					 public ModelAndView showPharmacyDashBoard(HttpServletRequest request,HttpServletResponse response)
					 {

					 	ModelAndView model=new ModelAndView("pharmacy/pharmacyDashBoard");
					 	
					 	RestTemplate rest=new RestTemplate();
					 	HttpSession session = request.getSession();
						MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
						
						MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
						map.add("medicald",""+medicalDetails.getMedicalId());
					 	map.add("appDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					 	
					     try {
					     	
					    	 PharmacyDayOrderDetails orderDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPharmacyDayOrderDetails", map, PharmacyDayOrderDetails.class);
					       
					     	model.addObject("orderDetails", orderDetails);
					     	
					    }
					     catch (Exception e)
					    {
					 	logger.error("Error while showPharmacyDashBoard",e);
					 	throw new RuntimeException("Error while showPharmacyDashBoard",e);
					    }

					   
					 	return model;
					 	
					 }

}
