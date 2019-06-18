package com.bionische.biocare.doctor.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.doctor.model.DoctorAppOfLastThirtyDays;
import com.bionische.biocare.doctor.model.DoctorAppointmentCount;
import com.bionische.biocare.doctor.model.DoctorBankAccountInfo;
import com.bionische.biocare.doctor.model.DoctorCertificateDetails;
import com.bionische.biocare.doctor.model.DoctorCircle;
import com.bionische.biocare.doctor.model.DoctorCollectionAndReportDetail;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.DoctorDetailsInformation;
import com.bionische.biocare.doctor.model.DoctorHospitalDetails;
import com.bionische.biocare.doctor.model.DoctorLogin;
import com.bionische.biocare.doctor.model.DoctorNotification;
import com.bionische.biocare.doctor.model.DoctorProfilePassword;
import com.bionische.biocare.doctor.model.DoctorSubscriptionDetails;
import com.bionische.biocare.doctor.model.FreequantlyUsedMedicines;
import com.bionische.biocare.doctor.model.GetDoctorBasicDetails;
import com.bionische.biocare.doctor.model.GetDoctorProfile;
import com.bionische.biocare.doctor.model.GetDoctorRatingReviewCount;
import com.bionische.biocare.doctor.model.GetHospitalDetails;
import com.bionische.biocare.doctor.model.GetHospitalDetailsByType;
import com.bionische.biocare.doctor.model.HospitalDetails;
import com.bionische.biocare.doctor.model.SpecializationDetails;
import com.bionische.biocare.doctor.model.SpecializationDetailsList;
import com.bionische.biocare.ewallet.model.GetWalletTransactionDetails;
import com.bionische.biocare.ewallet.model.ReferalDetails;
import com.bionische.biocare.ewallet.model.TransactionWalletDetails;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.model.GetPromoCodeValidRes;
import com.bionische.biocare.model.OtpSessionDetails;
import com.bionische.biocare.model.PackageDetails;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.Country;
import com.bionische.biocare.patient.model.GetHospitalClinicByDoctorIdAndAvailDate;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.patient.model.TermsAndConditions;
import com.bionische.biocare.patientdoctor.model.AppointmentTime;
import com.bionische.biocare.patientdoctor.model.GetRatingCount;
import com.bionische.biocare.pharmacy.model.MedicalDetails;

@Scope("session")
@Controller
public class DoctorController {

	List<City> cityList;
	List<State> stateList;
//	DoctorDetails frgtPwdDoctorDetails;
	GetDoctorRatingReviewCount getDoctorRatingReviewCount;
	float amount;
	int packageId;
	String orderId;
	int duration;
	int durationType;
	int offerId;
	float packageAmt;
	String signature = null;
	public static String subscriptionExpiryDate;
	String msg;
	HomeController homeController = new HomeController();
//	private HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	public static List<DoctorDetailsInformation> doctorDetailsListInfo;
	public static List<DoctorDetailsInformation> specialistDoctorList;
	private List<AppointmentTime> timeList = new ArrayList<AppointmentTime>();
	public final Log LOGGER = LogFactory.getLog(DoctorController.class);

	public static ReferalDetails referalDetails;

	@RequestMapping(value = "/showDoctorLoginPage", method = RequestMethod.GET)

	public ModelAndView showPatientLoginPage(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/doctorLoginPage");
model.addObject("msg",msg);
msg="";
		return model;

	}

	@RequestMapping(value = "/showDoctorHomePage", method = RequestMethod.GET)

	public ModelAndView showPatientHomePage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("doctor/doctorHomePage");
		HttpSession session = request.getSession();

		Info profileInfo = (Info) session.getAttribute("profilePassword");
		if(profileInfo==null) {
			model = new ModelAndView("profilePassword");
			model.addObject("redirectUrl","showDoctorHomePage");
			
			return model;
		}
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String, Object> mapRating = new LinkedMultiValueMap<String, Object>();
		mapRating.add("doctorId", "" + doctorDetails.getDoctorId());
		List<GetHospitalDetails> getHospitalDetailsList = new ArrayList<GetHospitalDetails>();
		getDoctorRatingReviewCount = new GetDoctorRatingReviewCount();

		GetDoctorProfile getDoctorProfile = new GetDoctorProfile();

		try {

			getDoctorProfile = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorProfile", mapRating,
					GetDoctorProfile.class);
			if (getDoctorProfile != null) {
				try {
					DoctorBankAccountInfo doctorBankAccountInfo = Constant.getRestTemplate().postForObject(
							Constant.url + "getDoctorBankDetails", mapRating, DoctorBankAccountInfo.class);
					model.addObject("doctorBankAccountInfo", doctorBankAccountInfo);
				} catch (Exception e) {
					LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
				}
				if (getDoctorProfile.getProfilePhoto() == null || getDoctorProfile.getProfilePhoto().equals(""))

				{
					getDoctorProfile.setProfilePhoto(Constant.emptyPhoto);

				} else {
					getDoctorProfile.setProfilePhoto(Constant.doctorUrl + doctorDetails.getDoctorId() + "/" + "profile"
							+ "/" + getDoctorProfile.getProfilePhoto());
				}

			} else {
				model = new ModelAndView("verificationPending");
				return model;
			}

			getHospitalDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalByDoctorId",
					mapRating, List.class);

			getDoctorRatingReviewCount = Constant.getRestTemplate().postForObject(
					Constant.url + "getRatingAndReviewsDetailsOfDoctor", mapRating, GetDoctorRatingReviewCount.class);
			GetRatingCount getRatingCount = Constant.getRestTemplate()
					.postForObject(Constant.url + "getDoctorRatingByDoctorId", mapRating, GetRatingCount.class);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", doctorDetails.getDoctorId());
			map.add("userType", 0);
			WalletDetails walletDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);

			model.addObject("walletDetails", walletDetails);
			model.addObject("rating", getRatingCount.getRating());
			model.addObject("totalPatient", getRatingCount.getCount());
			
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");  
			Date currentDate=new Date();
			System.out.println("subscriptionExpiryDate DATE is= "+subscriptionExpiryDate+" curreent date= "+currentDate);
		
			Date expiryDate=new SimpleDateFormat("yyyy-MM-dd").parse(DateConverter.convertToYMD(subscriptionExpiryDate));  
			
			
			
			
			/*DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			Date expiryDate = (Date)formatter.parse(subscriptionExpiryDate);*/
			
			
			System.out.println("exp date= "+expiryDate);
			
			Date dateBeforeFiveDays = new Date(expiryDate.getTime() - 5 * 24 * 3600 * 1000); 
			
			if (currentDate.equals(dateBeforeFiveDays) || currentDate.after(dateBeforeFiveDays))  {
				model.addObject("getExpiryDate", subscriptionExpiryDate);
	            model.addObject("endDate",expiryDate);
	            model.addObject("subscriptionAlertStart", "0");
	            
	        }

		      

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			LOGGER.error("Error in showDoctorHomePage", e);
			throw new RuntimeException("Error in showDoctorHomePage", e);

		}
		System.out.println("Hospital details" + getHospitalDetailsList.toString());
		session.setAttribute("gynecologist", getDoctorProfile.getSpecType());
		String gynech = (String) session.getAttribute("gynecologist");
		String radiologist = null;
		if(getDoctorProfile.getSpecType().equals("Radiologist")) {
		session.setAttribute("radiologist", getDoctorProfile.getSpecType());
		 radiologist = (String) session.getAttribute("radiologist");
		}
		
		System.out.println("radiologist"+radiologist);
		if (getHospitalDetailsList.isEmpty()) {
			model = new ModelAndView("doctor/addnewclinic");
			model.addObject("countryList", HomeController.countryList);
			model.addObject("noHospitalFound", "1");
		} else {
			model.addObject("noHospitalFound", "2");
			model.addObject("hospitalDetails", getHospitalDetailsList);
			model.addObject("homeActive", "active");
			model.addObject("getReviewCount", "5");
			model.addObject("ratingReviews", getDoctorRatingReviewCount.getRatingDetails());
			model.addObject("getDoctorRatingReviewCount", getDoctorRatingReviewCount);
			model.addObject("countryList", HomeController.countryList);
			model.addObject("getDoctorProfile", getDoctorProfile);
			model.addObject("gynech", gynech);
			model.addObject("radiologist", radiologist);
			
		}
		return model;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/doctorLoginProcess", method = RequestMethod.GET)
	public @ResponseBody Info doctorLoginProcess(HttpServletRequest request, HttpServletResponse response) {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println("nfrnun" + userName);

		String returnUrl = "w";
		Info info1 = new Info();

	
		
		HttpSession session = request.getSession();

		DoctorLogin doctorLogin = new DoctorLogin();

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {

			String webToken = request.getParameter("webToken");

		    map.add("webToken", webToken);
			
			map.add("userName", userName);
			map.add("password", password);

			doctorLogin = Constant.getRestTemplate().postForObject(Constant.url + "doctorLoginProcess", map,
					DoctorLogin.class);
			
		 
			if (!doctorLogin.getInfo().isError()) {

				 subscriptionExpiryDate=doctorLogin.getDoctorSuscriptionInfo().getMessage();
				if (!doctorLogin.getDoctorSuscriptionInfo().isError()) {

					session.setAttribute("doctorDetails", doctorLogin.getDoctorDetails());
					session.setAttribute("userType",Constant.DOCTOR_USER_TYPE);
					if (doctorLogin.getDoctorDetails().getSpecId() != 0) {

						
							returnUrl = new String("showDoctorDashBoard");
							info1.setError(false);
							info1.setMessage("showDoctorDashBoard");

					
						if (doctorLogin.getDoctorDetails().getDelStatus() != 0) {
							returnUrl = new String("showVerificationPendingPage");
							info1.setError(false);
							info1.setMessage("showVerificationPendingPage");
							if (doctorLogin.getDoctorDetails().getDelStatus() == 3) {
								returnUrl = new String("showRejectVerficationPage");
								info1.setError(false);
								info1.setMessage("showRejectVerficationPage");
							}

						}

					} else {

						returnUrl = new String("showFirstTimeUpdateDoctorProfile");
						info1.setError(false);
						info1.setMessage("showFirstTimeUpdateDoctorProfile");
					}
				} else {
					session.setAttribute("tempDetails", doctorLogin.getDoctorDetails());
					returnUrl = new String("showDoctorSuscriptionPage");
					info1.setError(false);
					info1.setMessage("showDoctorSuscriptionPage");
				}

			} else {
				info1.setError(true);
				info1.setMessage(doctorLogin.getInfo().getMessage());
			}

		} catch (Exception e) {

			LOGGER.error("Error while doctor trying to login in doctorLoginProcess", e);
			throw new RuntimeException("Error while doctor trying to login in doctorLoginProcess", e);

		}

		return info1;
	}

	@RequestMapping(value = "/showRejectVerficationPage", method = RequestMethod.GET)

	public String showRejectVerficationPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		map.add("doctorId", doctorDetails.getDoctorId());
		DoctorCertificateDetails doctorCertificateDetails=Constant.getRestTemplate().postForObject(Constant.url + "/getLastRejectDoctorCertificate",map,
				DoctorCertificateDetails.class);	
		model.addAttribute("submitUrl","uploadDoctorCertificateProcess");
		model.addAttribute("certificateDetails",doctorCertificateDetails);
		session.invalidate();
		return "reverification";
	}


	@RequestMapping(value = "/uploadDoctorCertificateProcess", method = RequestMethod.POST)

	public String uploadDoctorCertificateProcess(HttpServletRequest request,@RequestParam("certificatePhoto") List<MultipartFile> certificatePhoto) {
		
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		try {
			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			String certificatePhotoName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
					+ doctorDetails.getDoctorId() + VpsImageUpload.getFileExtension(certificatePhoto.get(0));

		 

			vpsImageUpload.saveUploadedFiles(certificatePhoto, 7, certificatePhotoName, doctorDetails.getDoctorId());
			DoctorCertificateDetails doctorCertificateDetails = new DoctorCertificateDetails();
			doctorCertificateDetails.setCetrificate(certificatePhotoName);
			doctorCertificateDetails.setDoctorId(doctorDetails.getDoctorId());
			doctorCertificateDetails.setString1(" ");
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctorCertificateDetails",
					doctorCertificateDetails, Info.class);

		}
		catch (Exception e) {
			LOGGER.error("Error while upload Doctor Certificate  processing in uploadDoctorCertificateProcess", e);
			throw new RuntimeException("Error while upload Doctor Certificate  processing in uploadDoctorCertificateProcess", e);
		}
		return "redirect:/showVerificationPendingPage";
	}
	
	@RequestMapping(value = "/showVerificationPendingPage", method = RequestMethod.GET)

	public String showVerificationPendingPage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		
		session.invalidate();
		return "verificationPending";
	}

	/* Doctor Registration form */
	@RequestMapping(value = "/showDoctorRegProcess", method = RequestMethod.GET)

	public ModelAndView showDoctorRegProcess(HttpServletRequest request, HttpServletResponse response) {

		SpecializationDetailsList specializationList = new SpecializationDetailsList();

		RestTemplate rest = new RestTemplate();
		List<Country> countryList = new ArrayList<Country>();
		try {

			specializationList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization",
					SpecializationDetailsList.class);
			// specializationList=specializationListResult.getBody();

			// specializationList=Constant.getRestTemplate().getForObject(Constant.url+"getAllSpecialization",SpecializationDetailsList.class);

			/*
			 * ResponseEntity<List> countryListResult =
			 * Constant.getRestTemplate().exchange(Constant.url + "/getAllCountry",
			 * HttpMethod.GET, req, List.class);
			 */
			countryList = HomeController.countryList;
			// countryList=rest.getForObject(Constant.url+"getAllCountry",List.class);

		} catch (Exception e) {
			LOGGER.error("Error while doctor trying to register on app in showDoctorRegProcess", e);
			throw new RuntimeException("Error while doctor trying to register on app in showDoctorRegProcess", e);
		}

		ModelAndView model = new ModelAndView("doctor/doctorRegistration");

		model.addObject("specialization", specializationList.getSpecializationDetailsList());
		model.addObject("countryList", countryList);
		return model;

	}
	/* Doctor Registration form */

	// Username Validation
	@RequestMapping(value = "/usernameValidationOfDoctor", method = RequestMethod.GET)

	public @ResponseBody Info usernameValidationOfDoctor(HttpServletRequest request) {
		Info info = new Info();

		String userName = request.getParameter("userName");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "usernameValidationOfDoctor", map,
					Info.class);

		} catch (Exception e) {
			LOGGER.error("Error while validating doctor user name in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	@RequestMapping(value = "/showFirstTimeUpdateDoctorProfile", method = RequestMethod.GET)

	public String showFirstTimeUpdateDoctorProfile(HttpServletRequest request, HttpServletResponse response,
			Model model) {

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		RestTemplate rest = new RestTemplate();
		// ModelAndView model = new ModelAndView("doctor/registor-doc");

		if (doctorDetails.getSpecId() != 0) {
			return "redirect:/showDoctorDashBoard";
		}

		try {

			SpecializationDetailsList specializationList = Constant.getRestTemplate()
					.getForObject(Constant.url + "/getAllSpecialization", SpecializationDetailsList.class);
			// SpecializationDetailsList specializationList =
			// specializationListResult.getBody();

			model.addAttribute("specialization", specializationList.getSpecializationDetailsList());
		} catch (Exception e) {
			LOGGER.error("Error while updating doctor details in showUpdateDoctorProfile", e);
			throw new RuntimeException("Error while updating doctor details in showUpdateDoctorProfile", e);
		}
		model.addAttribute("doctorDetails", doctorDetails);
		model.addAttribute("countryList", HomeController.countryList);
		// model.addObject("uploadCertificateStatus", 1);
		return "doctor/registor-doc";
	}

	@RequestMapping(value = "/showDoctorProfile", method = RequestMethod.GET)
	@ResponseBody
	public GetDoctorProfile showDoctorProfile(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		GetDoctorProfile getDoctorProfile = new GetDoctorProfile();

		try {

			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			getDoctorProfile = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorProfile", map,
					GetDoctorProfile.class);

			getDoctorProfile.setProfilePhoto(VpsImageUpload.doctorImages + "" + getDoctorProfile.getProfilePhoto());
			request.getSession().removeAttribute("doctorDetails");
			request.getSession().setAttribute("doctorDetails", doctorDetails);

		} catch (Exception e) {
			LOGGER.error("Error while fetching doctor details in showDoctorProfile", e);
			throw new RuntimeException("Error while fetching doctor details in showDoctorProfile", e);
		}
		return getDoctorProfile;

	}

	/* Submission of doctor registration */
	@RequestMapping(value = "/submitDoctorRegProcess", method = RequestMethod.POST)

	public String submitDoctorRegProcess(HttpServletRequest request) {

		try {

			DoctorDetails doctor = new DoctorDetails();

			doctor.setfName(request.getParameter("fName"));
			doctor.setmName(request.getParameter("mName"));
			doctor.setlName(request.getParameter("lName"));
			doctor.setUserName(request.getParameter("uname"));
			doctor.setPassword(request.getParameter("password"));
			doctor.setGender("gender");

			/*
			 * doctor.setCityId(Integer.parseInt(request.getParameter("cityId")));
			 * doctor.setStateId(Integer.parseInt(request.getParameter("stateId")));
			 * doctor.setCountryId(Integer.parseInt(request.getParameter("countryId")));
			 * doctor.setAddress(request.getParameter("address"));
			 * doctor.setYearOfExperience(request.getParameter("yearOfExperience"));
			 * doctor.setAboutMe(request.getParameter("aboutMe"));
			 */
			doctor.setContactNo(request.getParameter("contactNo"));
			doctor.setEmail(request.getParameter("email"));
			/*
			 * doctor.setQualification(request.getParameter("qualification"));
			 * doctor.setSpecId(Integer.parseInt(request.getParameter("specId")));
			 * doctor.setCollege(request.getParameter("college"));
			 * doctor.setPassingYear(request.getParameter("passingYear"));
			 * doctor.setCouncilRegNo(request.getParameter("councilRegNo"));
			 * doctor.setCouncilName(request.getParameter("councilName"));
			 */

			doctor.setDelStatus(Integer.parseInt("2"));
			doctor.setString1("1");
			doctor.setString2("1");
			doctor.setInt1(0);
			doctor.setInt2(0);

			RestTemplate rest = new RestTemplate();

			doctor = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctorDetails", doctor,
					DoctorDetails.class);

			if(doctor!=null)
			{
				DoctorProfilePassword doctorProfilePassword=new DoctorProfilePassword();
				doctorProfilePassword.setDoctorId(doctor.getDoctorId());
				doctorProfilePassword.setPassword(request.getParameter("password"));
				DoctorProfilePassword doctorProfilePasswordRes = Constant.getRestTemplate().postForObject(Constant.url + "updateDoctorProfilePassword", doctorProfilePassword,
						DoctorProfilePassword.class);
			}
			
			
			return "redirect:/showDoctorLoginPage";
		} catch (Exception e) {

			e.printStackTrace();
			LOGGER.error("Error while inserting doctor details in submitDoctorRegProcess", e);
			throw new RuntimeException("Error while inserting doctor details in submitDoctorRegProcess", e);

		}

	}

	@RequestMapping(value = "/showUpdateDoctorProfile", method = RequestMethod.GET)

	public ModelAndView showUpdateDoctorProfile(HttpServletRequest request, HttpServletResponse response) {
		SpecializationDetails specialization = new SpecializationDetails();

		SpecializationDetailsList specializationList = new SpecializationDetailsList();

		RestTemplate rest = new RestTemplate();
		List<Country> countryList = new ArrayList<Country>();

		DoctorCertificateDetails doctorCertificateDetails = new DoctorCertificateDetails();
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		GetDoctorProfile getDoctorProfile = new GetDoctorProfile();
		DoctorDetails doctorDetailsRes = new DoctorDetails();
		try {

			specializationList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization",
					SpecializationDetailsList.class);
			// specializationList=specializationListResult.getBody();

			countryList = HomeController.countryList;

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			getDoctorProfile = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorProfile", map,
					GetDoctorProfile.class);
			System.out.println(getDoctorProfile.toString());
			MultiValueMap<String, Object> mapState = new LinkedMultiValueMap<String, Object>();
			mapState.add("countryId", "" + getDoctorProfile.getCountryId());

			stateList = Constant.getRestTemplate().postForObject(Constant.url + "getAllStateByCountryId", mapState,
					List.class);

			MultiValueMap<String, Object> mapCity = new LinkedMultiValueMap<String, Object>();
			mapCity.add("stateId", getDoctorProfile.getStateId());

			cityList = Constant.getRestTemplate().postForObject(Constant.url + "getAllCityByStateId", mapCity,
					List.class);

			doctorCertificateDetails = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorCertificate",
					map, DoctorCertificateDetails.class);

		} catch (Exception e) {
			LOGGER.error("Error while updating doctor details in showUpdateDoctorProfile", e);
			throw new RuntimeException("Error while updating doctor details in showUpdateDoctorProfile", e);
		}

		ModelAndView model = new ModelAndView("doctor/editDoc");

		model.addObject("specialization", specializationList.getSpecializationDetailsList());
		model.addObject("countryList", countryList);
		model.addObject("stateList", stateList);
		model.addObject("cityList", cityList);
		model.addObject("documentPath", Constant.doctorUrl + "" + getDoctorProfile.getDoctorId() + "/documents/"
				+ doctorCertificateDetails.getCetrificate());
		model.addObject("doctorDetails", getDoctorProfile);
		return model;

	}

	@RequestMapping(value = "/updateDoctorProfilesProcess", method = RequestMethod.POST)

	public String updateDoctorProfilesProcess(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("certificatePhoto") List<MultipartFile> certificatePhoto,
			@RequestParam("signaturePhoto") List<MultipartFile> signaturePhoto) {
		String url = null;
		String doctorId = request.getParameter("doctorId");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());

		DoctorDetails doctorDetailsREs = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorDetailsById",
				map, DoctorDetails.class);

		DoctorDetails doctor = new DoctorDetails();
		if (doctorDetailsREs.getSpecId() == 0) {
			url = "/showInsertClinicPage";
		} else {
			url = "/showDoctorHomePage";

		}
		if (doctorId == null || doctorId == "") {

		} else {
			doctor.setDoctorId(Integer.parseInt(doctorId));

		}

		doctor.setfName(request.getParameter("fName"));
		doctor.setmName(request.getParameter("mName"));
		doctor.setlName(request.getParameter("lName"));
		doctor.setUserName(doctorDetailsREs.getUserName());
		doctor.setPassword(doctorDetailsREs.getPassword());
		doctor.setGender(request.getParameter("gender"));
		doctor.setCityId(Integer.parseInt(request.getParameter("cityId")));
		doctor.setHospitalId(Integer.parseInt(request.getParameter("hospitalId")));
		doctor.setStateId(Integer.parseInt(request.getParameter("stateId")));
		doctor.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		doctor.setAddress(request.getParameter("address"));
		doctor.setYearOfExperience(request.getParameter("yearOfExperience"));
		doctor.setAboutMe(request.getParameter("aboutMe"));
		doctor.setContactNo(request.getParameter("contactNo"));
		doctor.setEmail(request.getParameter("email"));
		doctor.setQualification(request.getParameter("qualification"));
		doctor.setProfilePhoto(request.getParameter("profilePhoto"));
		doctor.setSpecId(Integer.parseInt(request.getParameter("specId")));
		doctor.setCollege(request.getParameter("college"));
		doctor.setPassingYear(request.getParameter("passingYear"));
		doctor.setCouncilRegNo(request.getParameter("councilRegNo"));
		doctor.setCouncilName(request.getParameter("councilName"));
		doctor.setFees(Float.parseFloat(request.getParameter("fees")));

		doctor.setDelStatus(doctorDetailsREs.getDelStatus());
		doctor.setString1(doctorDetailsREs.getString1());
		doctor.setString2(doctorDetailsREs.getString2());
		doctor.setInt1(doctorDetailsREs.getInt2());
		doctor.setInt2(Integer.parseInt(request.getParameter("pincode")));

		System.out.println("signature="+signature);
		
		doctor.setSignature(signature);

		/*
		 * String signature=doctorDetailsREs.getSignature(); try {
		 * signaturePhoto.get(0).getOriginalFilename(); signature=new
		 * SimpleDateFormat("ddMMyyyyHHmmss").format(new Date()) +
		 * doctor.getDoctorId()+VpsImageUpload.getFileExtension(signaturePhoto.get(0));
		 * 
		 * } catch (Exception e) { signature=doctorDetailsREs.getSignature(); // TODO:
		 * handle exception }
		 */

		System.out.println("edit:" + doctor.toString());

		try {
			doctor = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctorDetails", doctor,
					DoctorDetails.class);
			session.setAttribute("doctorDetails", doctor);
			/* if(request.getParameter("uploadCertificateStatus")!=null) */
			try {
				/*
				 * int status=Integer.parseInt(request.getParameter("uploadCertificateStatus"));
				 */

				DoctorCertificateDetails doctorCertificateDetails = new DoctorCertificateDetails();

				VpsImageUpload vpsImageUpload = new VpsImageUpload();
				String certificatePhotoName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
						+ doctor.getDoctorId() + VpsImageUpload.getFileExtension(certificatePhoto.get(0));

				vpsImageUpload.saveUploadedFiles(signaturePhoto, 10, signature, doctor.getDoctorId());

				vpsImageUpload.saveUploadedFiles(certificatePhoto, 7, certificatePhotoName, doctor.getDoctorId());

				doctorCertificateDetails.setCetrificate(certificatePhotoName);
				doctorCertificateDetails.setDoctorId(doctor.getDoctorId());
				doctorCertificateDetails.setString1(" ");
				Info info = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctorCertificateDetails",
						doctorCertificateDetails, Info.class);

			} catch (Exception e) {
				// TODO: handle exception
			}

		} catch (Exception e) {

			LOGGER.error("Error while updating doctor details processing in showUpdateDoctorProfile", e);
			throw new RuntimeException("Error while updating doctor details processing in showUpdateDoctorProfile", e);

		}

		return "redirect:" + url;

	}

	
	@RequestMapping(value = "/getRatingAndReviewsDetailsOfDoctor", method = RequestMethod.GET)
	@ResponseBody
	public GetDoctorRatingReviewCount getRatingAndReviewsDetailsOfDoctor(HttpServletRequest request,
			HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		GetDoctorRatingReviewCount getDoctorRatingReviewCount = new GetDoctorRatingReviewCount();

		try {

			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			getDoctorRatingReviewCount = Constant.getRestTemplate().postForObject(
					Constant.url + "getRatingAndReviewsDetailsOfDoctor", map, GetDoctorRatingReviewCount.class);

		} catch (Exception e) {

			LOGGER.error("Error while fetching doctor rating and reviews in getRatingAndReviewsDetailsOfDoctor", e);
			throw new RuntimeException(
					"Error while fetching doctor rating and reviews in getRatingAndReviewsDetailsOfDoctor", e);

		}

		return getDoctorRatingReviewCount;

	}

	@RequestMapping(value = "/showFrequentlyUsedMedicine", method = RequestMethod.GET)

	public ModelAndView showFrequentlyUsedMedicine(HttpServletRequest request, HttpServletResponse response) {
		 

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<FreequantlyUsedMedicines> freequantlyUsedMedicinesList2 = new ArrayList<FreequantlyUsedMedicines>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());
		try {

			freequantlyUsedMedicinesList2 = Constant.getRestTemplate()
					.postForObject(Constant.url + "getFreequentlyUsedMedByDoctorId", map, List.class);

		} catch (Exception e) {

			LOGGER.error("Error while fetching doctor rating and reviews in showFrequentlyUsedMedicine", e);
			throw new RuntimeException("Error while fetching doctor rating and reviews in showFrequentlyUsedMedicine",
					e);

		}

		ModelAndView model = new ModelAndView("doctor/addMedicineList");
		model.addObject("freequantlyUsedMedicinesList2", freequantlyUsedMedicinesList2);

		return model;

	}

	/*
	 * @RequestMapping(value = "/addFreequentlyUsedMedicineList", method =
	 * RequestMethod.GET) public @ResponseBody List<FreequantlyUsedMedicines>
	 * addFreequentlyUsedMedicineList(HttpServletRequest request,
	 * HttpServletResponse response) { System.out.println("In Ajaxx");
	 * 
	 * HttpSession session = request.getSession(); DoctorDetails doctorDetails =
	 * (DoctorDetails)session.getAttribute("doctorDetails");
	 * 
	 * 
	 * FreequantlyUsedMedicines freequantlyUsedMedicines=new
	 * FreequantlyUsedMedicines();
	 * 
	 * String medicineName=request.getParameter("medicineName");
	 * System.out.println("x"+medicineName);
	 * 
	 * freequantlyUsedMedicines.setMedicineName(medicineName);
	 * 
	 * freequantlyUsedMedicines.setDoctorId(doctorDetails.getDoctorId());
	 * freequantlyUsedMedicines.setDelStatus(0);
	 * freequantlyUsedMedicines.setString1("1");
	 * freequantlyUsedMedicines.setString2("1");
	 * freequantlyUsedMedicines.setInt1(0); freequantlyUsedMedicines.setInt2(0);
	 * 
	 * System.out.println("prescriptionDetails "+freequantlyUsedMedicines.toString()
	 * );
	 * 
	 * try { freequantlyUsedMedicinesList1.add(freequantlyUsedMedicines);
	 * System.out.println("List "+freequantlyUsedMedicinesList1.toString()); }catch
	 * (Exception e) { System.out.println(e.getMessage()); e.printStackTrace(); }
	 * return freequantlyUsedMedicinesList1; }
	 */

	@RequestMapping(value = "/submitfreequentlyUsedMedicine", method = RequestMethod.GET)

	public String submitfreequentlyUsedMedicine(HttpServletRequest request, HttpServletResponse response) {
		RestTemplate rest = new RestTemplate();

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		FreequantlyUsedMedicines freequantlyUsedMedicines = new FreequantlyUsedMedicines();

		String medicineName = request.getParameter("medicineName");

		freequantlyUsedMedicines.setMedicineName(medicineName);

		freequantlyUsedMedicines.setDoctorId(doctorDetails.getDoctorId());
		freequantlyUsedMedicines.setDelStatus(0);
		freequantlyUsedMedicines.setString1("1");
		freequantlyUsedMedicines.setString2("1");
		freequantlyUsedMedicines.setInt1(0);
		freequantlyUsedMedicines.setInt2(0);

		Info info = new Info();
		try {

			if (medicineName != null && medicineName != "") {
				info = Constant.getRestTemplate().postForObject(Constant.url + "insertFreequentlyUsedMedicine",
						freequantlyUsedMedicines, Info.class);
			}

		} catch (Exception e) {
			LOGGER.error("Error while inserting doctor frequently used medicine in submitfreequentlyUsedMedicine", e);
			throw new RuntimeException(
					"Error while inserting doctor frequently used medicine in submitfreequentlyUsedMedicine", e);
		}

		return "redirect:/showFrequentlyUsedMedicine";

	}

	@RequestMapping(value = "/getFrequentlyUsedMedByDoctorId", method = RequestMethod.GET)

	public @ResponseBody List<FreequantlyUsedMedicines> getFrequentluUsedMedByDoctorId(HttpServletRequest request,
			HttpServletResponse response) {
	 

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<FreequantlyUsedMedicines> freequantlyUsedMedicinesList = new ArrayList<FreequantlyUsedMedicines>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());
		try {

			freequantlyUsedMedicinesList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getFreequentlyUsedMedByDoctorId", map, List.class);

		} catch (Exception e) {
			LOGGER.error("Error while fetching doctor frequently used medicine in getFrequentlyUsedMedByDoctorId", e);
			throw new RuntimeException(
					"Error while fetching doctor frequently used medicine in getFrequentlyUsedMedByDoctorId", e);
		}

		return freequantlyUsedMedicinesList;

	}

	@RequestMapping(value = "/deleteMedicineById", method = RequestMethod.GET)

	public @ResponseBody Info deleteMedicineById(HttpServletRequest request, HttpServletResponse response) {
	 

		Info info = new Info();

		int medicineId = Integer.parseInt(request.getParameter("medicineId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicineId", medicineId);
		try {

			info = Constant.getRestTemplate().postForObject(Constant.url + "deleteMedicineById", map, Info.class);
		} catch (Exception e) {
			LOGGER.error("Error while delete medicine in deleteMedicineById", e);
			throw new RuntimeException("Error while delete medicine in deleteMedicineById", e);
		}

		return info;

	}

	@RequestMapping(value = "/showDoctorList", method = RequestMethod.GET)

	public ModelAndView showDoctorList(HttpServletRequest request, HttpServletResponse response) {
	 
		ModelAndView model = new ModelAndView("doctor/doctorList");

		String getCurrentCity = request.getParameter("city");
		String[] city = getCurrentCity.split(",");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("cityName", city[0]);

			ParameterizedTypeReference<List<DoctorDetailsInformation>> typeRef = new ParameterizedTypeReference<List<DoctorDetailsInformation>>() {
			};

			ResponseEntity<List<DoctorDetailsInformation>> responseEntity = Constant.getRestTemplate().exchange(
					Constant.url + "getDoctorsListByCityName", HttpMethod.POST,
					new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			doctorDetailsListInfo = responseEntity.getBody();

			for (int i = 0; i < doctorDetailsListInfo.size(); i++) {
				if (doctorDetailsListInfo.get(i).getProfilePhoto() == null) {

					doctorDetailsListInfo.get(i).setProfilePhoto(Constant.emptyPhoto);

				} else {

					doctorDetailsListInfo.get(i)
							.setProfilePhoto(Constant.doctorUrl + doctorDetailsListInfo.get(i).getDoctorId() + "/"
									+ "profile" + "/" + doctorDetailsListInfo.get(i).getProfilePhoto());

				}
			}
			System.out.println(doctorDetailsListInfo.toString());

		} catch (Exception e) {
			LOGGER.error("Error while feting current city doctor list time in showDoctorList", e);
			throw new RuntimeException("Error while feting current city doctor list time in showDoctorList", e);
		}
		if (doctorDetailsListInfo == null) {
			model.addObject("message", "Ooop's Sorry");
			model.addObject("message1", "Doctor Not Found");
		} else {
			model.addObject("message", null);
			model.addObject("currentCity", getCurrentCity);
			model.addObject("doctorDetailsListInfo", doctorDetailsListInfo);
		}
		return model;

	}

//getSpecializationDoctorList
	@RequestMapping(value = "/getSpecializationDoctorList", method = RequestMethod.GET)
	public ModelAndView getSpecializationDoctorList(HttpServletRequest request, HttpServletResponse response) {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		int specId = Integer.parseInt(request.getParameter("specId"));
		ModelAndView model = new ModelAndView("doctor/doctorList");
		RestTemplate rest = new RestTemplate();

		List<DoctorDetailsInformation> doctorDetailsListInfo = new ArrayList<DoctorDetailsInformation>();
	 
		String doctorCity = request.getParameter("cityNameWithState");

		String[] getParticularCity = doctorCity.split(",");
		try {

			map.add("cityName", getParticularCity[0]);
			map.add("specId", "" + specId);

			ParameterizedTypeReference<List<DoctorDetailsInformation>> typeRef = new ParameterizedTypeReference<List<DoctorDetailsInformation>>() {
			};

			ResponseEntity<List<DoctorDetailsInformation>> responseEntity = Constant.getRestTemplate().exchange(
					Constant.url + "getDoctorsListByCityIdAndSpecId", HttpMethod.POST,
					new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			doctorDetailsListInfo = responseEntity.getBody();
			System.out.println(doctorDetailsListInfo.toString());

			for (int i = 0; i < doctorDetailsListInfo.size(); i++) {
				if (doctorDetailsListInfo.get(i).getProfilePhoto() == null) {

					doctorDetailsListInfo.get(i).setProfilePhoto(Constant.emptyPhoto);

				} else {

					doctorDetailsListInfo.get(i)
							.setProfilePhoto(Constant.doctorUrl + doctorDetailsListInfo.get(i).getDoctorId() + "/"
									+ "profile" + "/" + doctorDetailsListInfo.get(i).getProfilePhoto());

				}
			}

			// doctorDetailsListInfo=rest.postForObject(Constant.url+"getDoctorsListByCityIdAndSpecId",
			// map, List.class);

			this.doctorDetailsListInfo = doctorDetailsListInfo;

		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(
					"Error while feting city and specialization wise doctor list time in getSpecializationDoctorList",
					e);
			throw new RuntimeException(
					"Error while feting city and specialization wise doctor list time in getSpecializationDoctorList",
					e);

		}

		if (doctorDetailsListInfo.isEmpty()) {

			model.addObject("message1", "Doctor Not Found");
			model.addObject("currentCity", doctorCity);

		} else {
			model.addObject("specType", doctorDetailsListInfo.get(0).getSpecializationType());
			model.addObject("currentCity", doctorCity);
			model.addObject("doctorDetailsListInfo", doctorDetailsListInfo);
		}

		return model;

	}

	@RequestMapping(value = "/showDoctorChangePassword", method = RequestMethod.GET)

	public ModelAndView showDoctorChangePassword(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/changePassword");

		return model;

	}

	@RequestMapping(value = "/doctorPasswordValidation", method = RequestMethod.GET)

	public @ResponseBody Info passwordValidation(HttpServletRequest request) {
		Info info = new Info();

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		int doctorId = doctorDetails.getDoctorId();

		String password = request.getParameter("password");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", "" + doctorId);
		map.add("password", password);
 

		try {

			info = Constant.getRestTemplate().postForObject(Constant.url + "passwordDocValidation", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while validating doctor password in doctorPasswordValidation", e);
			throw new RuntimeException("Error while validating doctor password in doctorPasswordValidation", e);

		}
		return info;

	}

	@RequestMapping(value = "/changeDoctorPassword", method = RequestMethod.GET)

	public @ResponseBody Info changePatientPassword(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		int doctorId = doctorDetails.getDoctorId();

		Info info = new Info();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", "" + doctorId);
		map.add("newPassword", "" + newPassword);
 

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "changeDoctorPassword", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while change doctor password in changeDoctorPassword", e);
			throw new RuntimeException("Error while change doctor password in changeDoctorPassword", e);

		}
		return info;

	}

	@RequestMapping(value = "/getMaleOrFemaleDoctor", method = RequestMethod.GET)
	public ModelAndView getMaleOrFemaleDoctor(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		ModelAndView model = new ModelAndView("doctor/doctorList");
		List<DoctorDetailsInformation> doctorDetailsListInfo = new ArrayList<DoctorDetailsInformation>();
		List<DoctorDetailsInformation> maleOrFemaleDoctorList = new ArrayList<DoctorDetailsInformation>();
		maleOrFemaleDoctorList = DoctorController.doctorDetailsListInfo;
		String gender = request.getParameter("gender");
		for (int i = 0; i < maleOrFemaleDoctorList.size(); i++) {

			String s = maleOrFemaleDoctorList.get(i).getGender();

			if (s.equalsIgnoreCase(gender)) {

				doctorDetailsListInfo.add(maleOrFemaleDoctorList.get(i));

			}

		}

		model.addObject("gender", gender);
		model.addObject("doctorDetailsListInfo", doctorDetailsListInfo);
		return model;

	}

	@RequestMapping(value = "/getSortedDoctorsByExperiance", method = RequestMethod.GET)
	public ModelAndView getSortedDoctorsByExperiance(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		ModelAndView model = new ModelAndView("doctor/doctorList");
		List<DoctorDetailsInformation> doctorDetailsListInfo = DoctorController.doctorDetailsListInfo;

		int callToExecute = Integer.parseInt(request.getParameter("callToSort"));

		System.out.println("cdcdbn" + callToExecute);
		if (callToExecute == 1 || callToExecute == 2 || callToExecute == 3 || callToExecute == 4) {
			Collections.sort(doctorDetailsListInfo, new DoctorExperianceComp(callToExecute));
		} /*
			 * else if(callToExecute==2) { Collections.sort(doctorDetailsListInfo, new
			 * DoctorExperianceComp(callToExecute)); }else if(callToExecute==3) {
			 * Collections.sort(doctorDetailsListInfo, new
			 * DoctorExperianceComp(callToExecute)); }
			 */

		/*
		 * model.addObject("cityId",doctorDetailsListInfo.get(0).getCityName());
		 * model.addObject("specId",doctorDetailsListInfo.get(0).getSpecializationType()
		 * );
		 */
		model.addObject("doctorDetailsListInfo", doctorDetailsListInfo);
		return model;

	}

	class DoctorExperianceComp implements Comparator<DoctorDetailsInformation> {
		public int s;

		DoctorExperianceComp(int i) {
			this.s = i;
		}

		@Override
		public int compare(DoctorDetailsInformation e1, DoctorDetailsInformation e2) {

			int xyz = -1;
			if (s == 1) {
				if (e1.getYearOfExperience() < e2.getYearOfExperience()) {

					return 1;
				} else {
					return -1;
				}
			} else if (s == 2) {
				if (e1.getFees() < e2.getFees()) {
					return 1;
				} else {
					return -1;
				}
			} else if (s == 3) {
				if (e1.getFees() > e2.getFees()) {
					return 1;
				} else {
					return -1;
				}
			} else if (s == 4) {
				if (e1.getYearOfExperience() > e2.getYearOfExperience()) {

					return 1;
				} else {
					return -1;
				}
			}
			return xyz;
		}
	}

	@RequestMapping(value = "/ShowDoctorForgotPassword", method = RequestMethod.GET)

	public String ShowDoctorForgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
 
		model.addAttribute("msg",msg);
		msg="";
		return "doctor/forgotpassword";

	}
	 
	@RequestMapping(value = "/searchUserNameForDoctorForgotPassword", method = RequestMethod.POST)
	public String searchUserNameForDoctorForgotPassword(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		
		String userName = request.getParameter("userName");

	 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		 
String returnString="redirect:/ShowDoctorForgotPassword";
		try {
			OtpSessionDetails otpSessionDetails = Constant.getRestTemplate().postForObject(Constant.url + "doctorDetailsByUsrname",
					map, OtpSessionDetails.class);

			if (otpSessionDetails != null) {
				returnString = "doctor/forgotPasswordOtp";
				 
				HttpSession session = request.getSession();
			 
				Calendar now = Calendar.getInstance();
				now.add(Calendar.MINUTE, 2);
				Date nowDateTime = now.getTime();
				otpSessionDetails.setDate(nowDateTime);
				 
				session.setAttribute("otpSessionDetails", otpSessionDetails);
				model.addAttribute("mobileNo",otpSessionDetails.getContactNo());
				
				
			} else {
				returnString="redirect:/ShowDoctorForgotPassword";
msg="User Name not found";
			}
			 

		} catch (Exception e) {
			LOGGER.error("Error while fetching doctor details by username in searchUserNameForDoctorForgotPassword", e);
			throw new RuntimeException("Error while fetching doctor details by username in searchUserNameForDoctorForgotPassword",
					e);
		}
		return returnString;
	}
	@RequestMapping(value = "/verifyDoctorOpt", method = RequestMethod.POST)
	public String verifyDoctorOpt(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
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
						    	  returnString="doctor/changeDoctorForgotPassword";
						    }
						    else
						    {
						    	 returnString="doctor/forgotPasswordOtp";
						    	 
						    	 model.addAttribute("msg", "Invalid OTP Please Enter valid OTP");
						    }
						    
						    }
						    else {
						    	 returnString="doctor/forgotPasswordOtp";
						    	 model.addAttribute("userName", otpSessionDetails.getUserName());
						    	 model.addAttribute("msg", "Time out");
						    }
						    
						    return returnString;
	}
	
	
	@RequestMapping(value = "/changeDoctorForgotPassword", method = RequestMethod.POST)

	public String changeDoctorForgotPassword(HttpServletRequest request, HttpServletResponse response) {

		String password=request.getParameter("password");
		HttpSession session = request.getSession();
		 
		OtpSessionDetails otpSessionDetails=(OtpSessionDetails)session.getAttribute("otpSessionDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", "" + otpSessionDetails.getId());
		map.add("newPassword", "" + password);
 

		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "changeDoctorPassword", map, Info.class);

			msg=info.getMessage();
		} catch (Exception e) {

			LOGGER.error("Error while change doctor password in changeDoctorPassword", e);
			throw new RuntimeException("Error while change doctor password in changeDoctorPassword", e);

		}
		
		return "redirect:/showDoctorLoginPage";
	}
	 
	@RequestMapping(value = "/showClinicPage", method = RequestMethod.GET)

	public ModelAndView showClinicPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("doctor/clinicRegistration");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<GetHospitalDetails> getHospitalDetailsList = new ArrayList<GetHospitalDetails>();
		List<Country> countryList = new ArrayList<Country>();
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());

		try {
			getHospitalDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalByDoctorId",
					map, List.class);

		} catch (Exception e) {
			LOGGER.error("Error while feching doctor clinic data in showClinicPage", e);
			throw new RuntimeException("Error while feching doctor clinic data in showClinicPage", e);
		}

		countryList = HomeController.countryList;

		model.addObject("hospitalDetails", getHospitalDetailsList);
		model.addObject("countryList", countryList);

		return model;

	}

	@RequestMapping(value = "/submitClinicReg", method = RequestMethod.GET)

	public String submitClinicReg(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("doctor/clinicRegistration");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());

		DoctorDetails doctorDetailsREs = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorDetailsById",
				map, DoctorDetails.class);
		HospitalDetails hospitalDetails = new HospitalDetails();
		/*
		 * int hospitalId=doctorDetails.getHospitalId();
		 * 
		 * if(doctorDetailsREs.getHospitalId()!=0) {
		 * hospitalDetails.setHospitalId(hospitalId); }
		 */

		hospitalDetails.setHospitalName(request.getParameter("name"));
		hospitalDetails.setContactNo(request.getParameter("contact"));
		hospitalDetails.setEmail(request.getParameter("email"));
		hospitalDetails.setCityId(Integer.parseInt(request.getParameter("cityId")));
		hospitalDetails.setStateId(Integer.parseInt(request.getParameter("stateId")));
		hospitalDetails.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		hospitalDetails.setAddress(request.getParameter("address"));
		hospitalDetails.setDelStatus(0);
		hospitalDetails.setString1("1");
		hospitalDetails.setString2("1");
		hospitalDetails.setInt1(0);
		hospitalDetails.setInt2(0);
		hospitalDetails.setLatitude(0);
		hospitalDetails.setLongitude(0);
		hospitalDetails.setType(0);

		try {
			hospitalDetails = Constant.getRestTemplate().postForObject(Constant.url + "insertHospitalDetails",
					hospitalDetails, HospitalDetails.class);

			if (doctorDetailsREs.getHospitalId() == 0) {
				MultiValueMap<String, Object> mapHospital = new LinkedMultiValueMap<String, Object>();

				mapHospital.add("doctorId", doctorDetailsREs.getDoctorId());
				mapHospital.add("hospitalId", hospitalDetails.getHospitalId());

				Info info = Constant.getRestTemplate().postForObject(Constant.url + "updateDoctorHospitalId",
						mapHospital, Info.class);
			}

		} catch (Exception e) {
			LOGGER.error("Error while inserting doctor clinic data in submitClinicReg", e);
			throw new RuntimeException("Error while inserting doctor clinic data in submitClinicReg", e);
		}

		return "redirect:/showDoctorDashBoard";

	}

	@RequestMapping(value = "/updateDoctorProfilesPhoto", method = RequestMethod.POST)

	public String updateDoctorProfilesPhoto(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("profilePhoto") List<MultipartFile> profilePhoto) {
		String url = null;
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		 
		Info info = new Info();
		String profilePhotoName = null;

	 
		try {

			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			profilePhotoName = profilePhoto.get(0).getOriginalFilename();

			vpsImageUpload.saveUploadedFiles(profilePhoto, 1, profilePhotoName, doctorDetails.getDoctorId());

			MultiValueMap<String, Object> mapUpload = new LinkedMultiValueMap<String, Object>();
			mapUpload.add("files", profilePhoto);
			mapUpload.add("userId", doctorDetails.getDoctorId());
			mapUpload.add("imageType", 1);
			mapUpload.add("imageName", profilePhotoName);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", doctorDetails.getDoctorId());
			map.add("profilePhotoName", profilePhotoName);

			// info=rest.postForObject(Constant.url+"uploadFile",mapUpload,Info.class);

			info = Constant.getRestTemplate().postForObject(Constant.url + "updateDoctorProfilePic", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while update doctor profile picture in updateDoctorProfilesPhoto", e);
			throw new RuntimeException("Error while update doctor profile picture in updateDoctorProfilesPhoto", e);
		}
		return "redirect:/showDoctorHomePage";
	}

	@RequestMapping(value = "/getOnloadDoctorSpecialization", method = RequestMethod.GET)

	public @ResponseBody List<SpecializationDetails> getOnloadDoctorSpecialization(HttpServletRequest request) {

	 

		SpecializationDetailsList specializationDetailsList = new SpecializationDetailsList();
 
		try {

			specializationDetailsList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization",
					SpecializationDetailsList.class);
			// specializationDetailsList=specializationListResult.getBody();

			// specializationDetailsList=rest.getForObject(Constant.url+"getAllSpecialization",SpecializationDetailsList.class);

			System.out.println("kk" + specializationDetailsList.toString());
		} catch (Exception e) {

			LOGGER.error("Error while fetching doctor specialization in getOnloadDoctorSpecialization", e);
			throw new RuntimeException("Error while fetching doctor specialization in getOnloadDoctorSpecialization",
					e);

		}
		return specializationDetailsList.getSpecializationDetailsList();

	}

	@RequestMapping(value = "/showDoctorTermsnCondition", method = RequestMethod.GET)

	public ModelAndView ShowTermsnCondition(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("doctor/terms&condition");
		TermsAndConditions termsConditionDetails = new TermsAndConditions();

		// This user is for doctor terms and condition
		int userType = 1;
		 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userType", userType);
		try {
			termsConditionDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getTermsAndConditionByUserType", map, TermsAndConditions.class);
			System.out.println(termsConditionDetails.toString());
			model.addObject("termsConditionDetailsList", termsConditionDetails);

		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;

	}

	/* Doctor Registration form */

//Contact Number Validation
	@RequestMapping(value = "/verifyContactNumber", method = RequestMethod.GET)

	public @ResponseBody Info verifyContactNumber(HttpServletRequest request) {
		Info info = new Info();

		String contactNo = request.getParameter("contactNo");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("contactNo", contactNo);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "mobileValidationOfDoctor", map, Info.class);
			System.out.println("" + info.getMessage());

		} catch (Exception e) {
			LOGGER.error("Error while validating doctor mobile number in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	// email Number Validation
	@RequestMapping(value = "/verifyDoctorEmail", method = RequestMethod.GET)

	public @ResponseBody Info verifyEmail(HttpServletRequest request) {
		Info info = new Info();

		String email = request.getParameter("email");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("email", email);
 

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "verifyDoctorEmail", map, Info.class);
			System.out.println("" + info.getMessage());

		} catch (Exception e) {
			LOGGER.error("Error while validating doctor mobile number in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	@RequestMapping(value = "/showAllDoctorReviews", method = RequestMethod.GET)

	public ModelAndView showAllDoctorReviews(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("doctor/allReviews");
		model.addObject("ratingReviews", getDoctorRatingReviewCount.getRatingDetails());

		return model;

	}

	@RequestMapping(value = "/showInsertClinicPage", method = RequestMethod.GET)

	public ModelAndView showInsertClinicPage(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/addnewclinic");

		List<Country> countryList = new ArrayList<Country>();
		 
		countryList = HomeController.countryList;

		model.addObject("countryList", countryList);
		return model;

	}

	@RequestMapping(value = "/getDoctorNotification", method = RequestMethod.GET)
	public @ResponseBody List<DoctorNotification> getDoctorNotification(HttpServletRequest request) {

	 
		List<DoctorNotification> doctorNotificationList = new ArrayList<DoctorNotification>();
		try {

			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			doctorNotificationList = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorNotification",
					map, List.class);

		} catch (Exception e) {
			LOGGER.error("Error while fetching doctor Notification", e);
			throw new RuntimeException("Error while fetching doctor Notification", e);
		}
		return doctorNotificationList;
	}

	@RequestMapping(value = "/showDoctorNotification", method = RequestMethod.GET)
	public ModelAndView showDoctorNotification(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/notification");

	 
		List<DoctorNotification> doctorNotificationList = new ArrayList<DoctorNotification>();
		try {

			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			doctorNotificationList = Constant.getRestTemplate().postForObject(Constant.url + "getAllDoctorNotification",
					map, List.class);
			model.addObject("doctorNotificationList", doctorNotificationList);
		} catch (Exception e) {
			LOGGER.error("Error while fetching doctor Notification", e);
			throw new RuntimeException("Error while fetching doctor Notification", e);
		}

		return model;

	}

	@RequestMapping(value = "/changeDoctorNotificationStatus", method = RequestMethod.GET)
	public @ResponseBody int changeDoctorNotificationStatus(HttpServletRequest request) {
		int notificationId = Integer.parseInt(request.getParameter("notificationId"));
		int res = 0;
		try {
		 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("notificationId", notificationId);
			res = Constant.getRestTemplate().postForObject(Constant.url + "changeDoctorNotificationStatus", map,
					Integer.class);
		} catch (Exception e) {
			LOGGER.error("Error while Updating doctor Notification status", e);
			throw new RuntimeException("Error while Updating doctor Notification status", e);
		}
		return res;
	}

	@RequestMapping(value = "/submitNewClinicReg", method = RequestMethod.GET)

	public String submitNewClinicReg(HttpServletRequest request) {
		 

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
 

		HospitalDetails hospitalDetails = new HospitalDetails();

		hospitalDetails.setHospitalName(request.getParameter("name"));
		hospitalDetails.setContactNo(request.getParameter("contact"));
		hospitalDetails.setEmail(request.getParameter("email"));
		hospitalDetails.setCityId(Integer.parseInt(request.getParameter("cityId")));
		hospitalDetails.setStateId(Integer.parseInt(request.getParameter("stateId")));
		hospitalDetails.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		hospitalDetails.setAddress(request.getParameter("address"));
		hospitalDetails.setDelStatus(0);
		hospitalDetails.setString1("1");
		hospitalDetails.setString2("1");
		hospitalDetails.setInt1(0);
		hospitalDetails.setInt2(0);
		hospitalDetails.setLatitude(0);
		hospitalDetails.setLongitude(0);
		hospitalDetails.setType(0);

		try {
			hospitalDetails = Constant.getRestTemplate().postForObject(Constant.url + "insertHospitalDetails",
					hospitalDetails, HospitalDetails.class);

			DoctorHospitalDetails doctorHospitalDetails = new DoctorHospitalDetails();
			doctorHospitalDetails.setDoctorId(doctorDetails.getDoctorId());
			doctorHospitalDetails.setHospitalId(hospitalDetails.getHospitalId());
			doctorHospitalDetails.setDelStatus(0);
			doctorHospitalDetails.setInt1(0);
			doctorHospitalDetails.setString1("1");
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctorHospital",
					doctorHospitalDetails, Info.class);

		} catch (Exception e) {
			LOGGER.error("Error while inserting doctor clinic data in submitClinicReg", e);
			throw new RuntimeException("Error while inserting doctor clinic data in submitClinicReg", e);
		}

		return "redirect:/showDoctorHomePage";

	}

	@RequestMapping(value = "/submitEditClinicReg", method = RequestMethod.GET)

	public String submitEditClinicReg(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("doctor/clinicRegistration");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		RestTemplate rest = new RestTemplate();

		HospitalDetails hospitalDetails = new HospitalDetails();

		hospitalDetails.setHospitalId(Integer.parseInt(request.getParameter("hospitalId")));
		hospitalDetails.setHospitalName(request.getParameter("name"));
		hospitalDetails.setContactNo(request.getParameter("contact"));
		hospitalDetails.setEmail(request.getParameter("email"));
		hospitalDetails.setCityId(Integer.parseInt(request.getParameter("cityId")));
		hospitalDetails.setStateId(Integer.parseInt(request.getParameter("stateId")));
		hospitalDetails.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		hospitalDetails.setAddress(request.getParameter("address"));
		hospitalDetails.setDelStatus(0);
		hospitalDetails.setString1("1");
		hospitalDetails.setString2("1");
		hospitalDetails.setInt1(0);
		hospitalDetails.setInt2(0);
		hospitalDetails.setLatitude(0);
		hospitalDetails.setLongitude(0);
		hospitalDetails.setType(0);
		System.out.println(hospitalDetails.toString());
		try {
			hospitalDetails = Constant.getRestTemplate().postForObject(Constant.url + "insertHospitalDetails",
					hospitalDetails, HospitalDetails.class);

		} catch (Exception e) {
			LOGGER.error("Error while inserting doctor clinic data in submitClinicReg", e);
			throw new RuntimeException("Error while inserting doctor clinic data in submitClinicReg", e);
		}

		return "redirect:/showDoctorHomePage";

	}

	@RequestMapping(value = "/editHospitalDetails", method = RequestMethod.GET)
	public @ResponseBody HospitalDetails editHospitalDetails(HttpServletRequest request) {

		HospitalDetails getHospitalDetails = new HospitalDetails();
		try {
			int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
			System.out.println(hospitalId);

		 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("hospitalId", hospitalId);
			getHospitalDetails = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalById", map,
					HospitalDetails.class);
			System.out.println(getHospitalDetails.toString());
		} catch (Exception e) {
			LOGGER.error("Error while getting clinic details", e);
			throw new RuntimeException("Error while getting clinic details", e);
		}
		return getHospitalDetails;
	}

	@RequestMapping(value = "/getAllHospitalByType", method = RequestMethod.GET)
	public @ResponseBody List<GetHospitalDetails> getAllHospitalByType(HttpServletRequest request) {
		List<GetHospitalDetails> getHospitalDetailsList = new ArrayList<GetHospitalDetails>();
		int type = 1;
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("type", type);
	 
		try {
			getHospitalDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getAllHospitalByType",
					map, List.class);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while getting hospital details", e);
			throw new RuntimeException("Error while getting hospital details", e);
		}

		return getHospitalDetailsList;
	}

	@RequestMapping(value = "/showConsultinghome", method = RequestMethod.GET)

	public ModelAndView showConsultinghome(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("consulthome");

		return model;
	}

	@RequestMapping(value = "/renewDoctorAccount", method = RequestMethod.GET)

	public ModelAndView renewDoctorAccount(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/renewAccount");

		return model;

	}

	@RequestMapping(value = "/showClinicDelete", method = RequestMethod.GET)

	public ModelAndView showClinicDelete(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/clinicDelete");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<GetHospitalDetails> getHospitalDetailsList = new ArrayList<GetHospitalDetails>();
		List<Country> countryList = new ArrayList<Country>();
		 

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());

		try {
			getHospitalDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalByDoctorId",
					map, List.class);
			System.out.println(getHospitalDetailsList.toString());
		} catch (Exception e) {
			LOGGER.error("Error while feching doctor clinic data in showClinicPage", e);
			throw new RuntimeException("Error while feching doctor clinic data in showClinicPage", e);
		}

		countryList = HomeController.countryList;

		model.addObject("hospitalDetails", getHospitalDetailsList);
		model.addObject("countryList", countryList);

		return model;

	}

	@RequestMapping(value = "/deleteClinicById", method = RequestMethod.GET)

	public @ResponseBody Info deleteClinicById(HttpServletRequest request) {

		// ModelAndView model=new ModelAndView("doctor/renewAccount");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		 
		Info info = new Info();
		int doctorId = doctorDetails.getDoctorId();
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("hospitalId", hospitalId);
		map.add("doctorId", doctorId);
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "deleteClinicById", map, Info.class);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return info;

	}

	@RequestMapping(value = "/deleteDoctorHospitalById", method = RequestMethod.GET)

	public @ResponseBody Info deleteHospitalById(HttpServletRequest request) {

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		 
		Info info = new Info();

		try {

			int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("hospitalId", hospitalId);
			map.add("doctorId", doctorDetails.getDoctorId());

			info = Constant.getRestTemplate().postForObject(Constant.url + "deleteDoctorHospitalById", map, Info.class);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return info;

	}

	@RequestMapping(value = "/showHospitalDelete", method = RequestMethod.GET)

	public ModelAndView showHospitalDelete(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("doctor/hospitalDelete");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<GetHospitalDetails> getHospitalDetailsList = new ArrayList<GetHospitalDetails>();
		List<Country> countryList = new ArrayList<Country>();
		 

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());

		try {
			getHospitalDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalByDoctorId",
					map, List.class);
			System.out.println(getHospitalDetailsList.toString());
		} catch (Exception e) {
			LOGGER.error("Error while feching doctor clinic data in showClinicPage", e);
			throw new RuntimeException("Error while feching doctor clinic data in showClinicPage", e);
		}

		countryList = HomeController.countryList;

		model.addObject("hospitalDetails", getHospitalDetailsList);
		model.addObject("countryList", countryList);

		return model;

	}

	@RequestMapping(value = "/showAddHospital", method = RequestMethod.GET)

	public ModelAndView showAddHospital(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("doctor/addHospital");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<GetHospitalDetails> getHospitalDetailsList = new ArrayList<GetHospitalDetails>();
		List<Country> countryList = new ArrayList<Country>();
		 

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());

		try {
			getHospitalDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalByDoctorId",
					map, List.class);
			System.out.println(getHospitalDetailsList.toString());
		} catch (Exception e) {
			LOGGER.error("Error while feching doctor clinic data in showClinicPage", e);
			throw new RuntimeException("Error while feching doctor clinic data in showClinicPage", e);
		}

		countryList = HomeController.countryList;

		model.addObject("hospitalDetails", getHospitalDetailsList);
		model.addObject("countryList", countryList);

		return model;

	}

	@RequestMapping(value = "/submitDoctorHospital", method = RequestMethod.GET)

	public String submitDoctorHospital(HttpServletRequest request) {
		 
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

	 
		try {

			DoctorHospitalDetails doctorHospitalDetails = new DoctorHospitalDetails();
			doctorHospitalDetails.setDoctorId(doctorDetails.getDoctorId());
			doctorHospitalDetails.setHospitalId(Integer.parseInt(request.getParameter("demo")));
			doctorHospitalDetails.setDelStatus(0);
			doctorHospitalDetails.setInt1(0);
			doctorHospitalDetails.setString1("1");
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctorHospital",
					doctorHospitalDetails, Info.class);

		} catch (Exception e) {
			LOGGER.error("Error while inserting doctor clinic data in submitClinicReg", e);
			throw new RuntimeException("Error while inserting doctor clinic data in submitClinicReg", e);
		}

		return "redirect:/showDoctorHomePage";

	}

	@RequestMapping(value = "/getHospitalByType", method = RequestMethod.GET)
	public @ResponseBody List<GetHospitalDetailsByType> getHospitalByType(HttpServletRequest request) {
		List<GetHospitalDetailsByType> getHospitalDetailsByTypeList = new ArrayList<GetHospitalDetailsByType>();
		int type = 1;
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("type", type);
		 
		try {
			getHospitalDetailsByTypeList = Constant.getRestTemplate().postForObject(Constant.url + "getHospitalByType",
					map, List.class);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while getting hospital details", e);
			throw new RuntimeException("Error while getting hospital details", e);
		}

		return getHospitalDetailsByTypeList;
	}

	@RequestMapping(value = "/getHospitalClinicByDoctorId", method = RequestMethod.GET)
	public @ResponseBody List<GetHospitalClinicByDoctorIdAndAvailDate> getHospitalClinicByDoctorIdAndAvailDate(
			HttpServletRequest request, HttpServletResponse response) {

		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		List<GetHospitalClinicByDoctorIdAndAvailDate> getHospitalClinicByDoctorIdAndAvailDateList = new ArrayList<GetHospitalClinicByDoctorIdAndAvailDate>();
		 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorId);

		try {

			ParameterizedTypeReference<List<GetHospitalClinicByDoctorIdAndAvailDate>> typeRef = new ParameterizedTypeReference<List<GetHospitalClinicByDoctorIdAndAvailDate>>() {
			};
			ResponseEntity<List<GetHospitalClinicByDoctorIdAndAvailDate>> responseEntity = Constant.getRestTemplate()
					.exchange(Constant.url + "getHospitalClinicByDoctorId", HttpMethod.POST,
							new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			getHospitalClinicByDoctorIdAndAvailDateList = responseEntity.getBody();

			LOGGER.info(" getHospitalClinicByDoctorIdAndAvailDateList : "
					+ getHospitalClinicByDoctorIdAndAvailDateList.toString());

			LOGGER.info(" getHospitalClinicByDoctorIdAndAvailDateList : "
					+ getHospitalClinicByDoctorIdAndAvailDateList.toString());

		} catch (Exception e) {
			LOGGER.error("Error while getHospitalClinicByDoctorId.", e);
			throw new RuntimeException("Error while getHospitalClinicByDoctorId.", e);
		}

		return getHospitalClinicByDoctorIdAndAvailDateList;
	}

	@RequestMapping(value = "/getPatientMemberDetails", method = RequestMethod.GET)
	public @ResponseBody List<PatientDetails> getPatientMemberDetails(HttpServletRequest request,
			HttpServletResponse response) {

		 
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		// int patientId=patientDetail.getPatientId();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("familyId", "" + patientDetail.getFamilyId());
		List<PatientDetails> patientDetailList = Constant.getRestTemplate()
				.postForObject(Constant.url + "getPatientFamilyMembersList", map, List.class);
		System.out.println("dcdc" + patientDetailList.toString());
		return patientDetailList;
	}

	@RequestMapping(value = "/showDoctorSuscriptionPage", method = RequestMethod.GET)
	public String showDoctorSuscriptionPage(HttpServletRequest request, Model model) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("userType", 2);
			List<PackageDetails> packageDetailsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getCurrentPackageDetailsByUserType", map, List.class);
			model.addAttribute("packageDetailsList", packageDetailsList);

		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while getting doctor Packge details", e);
			throw new RuntimeException("Error while getting doctor Packge details", e);
		}

		return "doctor/doctorSuscriptionPage";
	}

	@RequestMapping(value = "/doctorSuscriptionCheckoutPage", method = RequestMethod.POST)
	public String submitDoctorSuscription(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails;
		doctorDetails = (DoctorDetails) session.getAttribute("tempDetails");
		
		if(doctorDetails==null) {
			
			session.setAttribute("tempDetails", session.getAttribute("doctorDetails"));
			
			doctorDetails=(DoctorDetails) session.getAttribute("tempDetails");
		}
		
		packageAmt = Float.parseFloat(request.getParameter("packageAmt"));
		offerId = Integer.parseInt(request.getParameter("offerId"));
		amount = Float.parseFloat(request.getParameter("amount"));
		packageId = Integer.parseInt(request.getParameter("packageId"));
		duration = Integer.parseInt(request.getParameter("duration"));
		durationType = Integer.parseInt(request.getParameter("durationType"));

		if (referalDetails != null) {
			amount = amount - Constant.referalAmount;
		}
	/*	try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", doctorDetails.getDoctorId());
			map.add("userType", Constant.DOCTOR_USER_TYPE);
			
			
			
			
			  walletDetails=Constant.getRestTemplate()
					.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);
			TransactionWalletDetails transactionWalletDetails = new TransactionWalletDetails();

			transactionWalletDetails = Constant.getRestTemplate().postForObject(Constant.url + "findByUserId", map1,
					TransactionWalletDetails.class);
		    
			
			 
			  
			}catch(Exception e) {
			
				walletDetails.setWalletAmount(0);
				e.printStackTrace();
			}*/
		
		//amount=amount-walletDetails.getWalletAmount();
		//model.addAttribute("walletAmount", walletDetails.getWalletAmount());
		
		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		model.addAttribute("orderId", orderId);
		
		try {
			
			model.addAttribute("userId", doctorDetails.getDoctorId());
			model.addAttribute("show", 0);
			
		} catch (Exception e) {
			
			
			
			try {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				
				map.add("userType", Constant.DOCTOR_USER_TYPE);
				WalletDetails  walletDetails=Constant.getRestTemplate()
						.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);
				
				if(walletDetails.getWalletAmount()<amount) {
					
					amount=amount-walletDetails.getWalletAmount();
					model.addAttribute("show", 0);
				
					
				}else {
					
					//totalAmt=walletDetails.getWalletAmount()-totalAmt;
					model.addAttribute("show", 1);
					model.addAttribute("walletDetails", walletDetails);
				}
				
				
			} catch (Exception e2) {
				
				e2.printStackTrace();
				
			}
		
		
		}
		
		model.addAttribute("amount", amount);
		
		return "paymentGatway/TxnTest";
	}

	@RequestMapping(value = "/redirect", method = RequestMethod.POST)
	public String redirect(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

// request.setAttribute("responseUrl", "https://securegw.paytm.in/theia/paytmCallback?ORDER_ID="+request.getParameter("ORDER_ID"));
		request.setAttribute("responseUrl", Constant.DOCTOR_SUSCRIPTION_RESPONSE_URL);

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("tempDetails");
		try {
			
			request.setAttribute("mobileNo", doctorDetails.getContactNo());
			request.setAttribute("email", doctorDetails.getEmail());
			
		} catch (Exception e) {
			
		
			
		}
		

		return "paymentGatway/pgRedirect";
	}
//response

	@RequestMapping(value = "/response", method = RequestMethod.POST)
	public String response(Locale locale, Model model) {
		LOGGER.info("rediecting to response");

		return "paymentGatway/pgResponse";
	}

	@RequestMapping(value = "/submitDoctorSuscription", method = RequestMethod.GET)
	public String submitDoctorSuscription(HttpServletRequest request) {
		LOGGER.info("Update the payment info");
		HttpSession session = request.getSession();
		DoctorSubscriptionDetails doctorSubscriptionDetails = new DoctorSubscriptionDetails();
		DoctorDetails doctorDetails;
		
		doctorDetails= (DoctorDetails) session.getAttribute("tempDetails");
	
		session.setAttribute("doctorDetails", (DoctorDetails) session.getAttribute("tempDetails"));
		
		
		
		try {
		
			
			
		doctorSubscriptionDetails.setOfferId(offerId);
		doctorSubscriptionDetails.setPackageAmt(packageAmt);
		doctorSubscriptionDetails.setCreatedDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		doctorSubscriptionDetails.setAmount(Float.parseFloat(request.getParameter("txnAmt")));
		doctorSubscriptionDetails.setPackageId(packageId);
		doctorSubscriptionDetails.setOrderId(request.getParameter("orderId"));
		doctorSubscriptionDetails.setTxnId(request.getParameter("txnId"));
		doctorSubscriptionDetails.setTxnStatus(Integer.parseInt(request.getParameter("txnStatus")));

		if (durationType == 0) {
			doctorSubscriptionDetails.setPackageExpDate(DateConverter.addDaysInDate(new Date(), duration));
		} else {
			doctorSubscriptionDetails.setPackageExpDate(DateConverter.addMonthInDate(new Date(), duration));
		}
		
			doctorSubscriptionDetails.setDoctorId(doctorDetails.getDoctorId());
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	
		
		try {
			Info info = Constant.getRestTemplate().postForObject(
					Constant.url + "doctorSuscription/insertDoctorSuscriptionDetails", doctorSubscriptionDetails,
					Info.class);
		 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			map.add("userId", doctorSubscriptionDetails.getDoctorId());
			map.add("userType", Constant.DOCTOR_USER_TYPE);
			try {
				
			
			if(info!=null) {
				if (DoctorController.referalDetails != null) {
					return "redirect:/updateWalletAndTransactions/"+doctorDetails.getDoctorId()+"/"+0;
				} 
			}	
			
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while getting hospital details", e);
			throw new RuntimeException("Error while getting hospital details", e);
		}
		
		return "redirect:/showDoctorLoginPage";

	}

	@RequestMapping(value = "/checkPromoCode", method = RequestMethod.GET)
	public @ResponseBody GetPromoCodeValidRes checkPromoCode(HttpServletRequest request) {

		GetPromoCodeValidRes getPromoCodeValidRes = new GetPromoCodeValidRes();
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("userType", Integer.parseInt(request.getParameter("userType")));
			map.add("promoCode", request.getParameter("promocode"));

			getPromoCodeValidRes = Constant.getRestTemplate().postForObject(
					Constant.url + "doctorSuscription/checkPromoCodeValidation", map, GetPromoCodeValidRes.class);

		} catch (Exception e) {
			LOGGER.error("Error while checking promo code validation", e);
			throw new RuntimeException("Error while checking promo code validation", e);
		}
		return getPromoCodeValidRes;
	}

	@RequestMapping(value = "/saveDoctorSignature", method = RequestMethod.POST)
	public @ResponseBody String saveDoctorSignature(@RequestBody String sign) {
		System.out.println("inside saveDoctorSignature");
		
		signature=sign;
	
		return signature;
	}

	@RequestMapping(value = "/showDoctorDashBoard", method = RequestMethod.GET)

	public ModelAndView showDoctorDashBoard(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("doctor/docDashboard");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());
		map.add("appDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

		MultiValueMap<String, Object> mapp = new LinkedMultiValueMap<String, Object>();
		mapp.add("doctorId", doctorDetails.getDoctorId());
try {
			
			Info info= Constant.getRestTemplate().postForObject(
					Constant.url + "doctorAvailableTime/getDoctorAvailabledStatusForFirstTime", mapp, Info.class);
			if(info.isError())
			model.addObject("availabledTimeStatus",1);
			else
				model.addObject("availabledTimeStatus",0);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		try {

			DoctorAppointmentCount appointmentCount = Constant.getRestTemplate().postForObject(
					Constant.url + "getDoctorAppointmentCountDetails", map, DoctorAppointmentCount.class);
			DoctorCollectionAndReportDetail dayCollectionAndReportCount = Constant.getRestTemplate().postForObject(
					Constant.url + "getDoctorCollectionAndReportDetails", map, DoctorCollectionAndReportDetail.class);
			 

		 
			
			
			model.addObject("appointmentCount", appointmentCount);
			model.addObject("dayCollectionAndReportCount", dayCollectionAndReportCount);
			model.addObject("dashboardActive", "active");
			
		} catch (Exception e) {
			LOGGER.error("Error while doctor trying to register on app in showDoctorRegProcess", e);
			throw new RuntimeException("Error while doctor trying to register on app in showDoctorRegProcess", e);
		}

		return model;

	}
	
	@RequestMapping(value = "/getDoctorCurrentMonthAppointCount", method = RequestMethod.GET)
	public @ResponseBody List<DoctorAppOfLastThirtyDays> getDoctorCurrentMonthAppointCount(HttpServletRequest request) {
		System.out.println(request.getParameter("appMonth"));
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorDetails.getDoctorId());
		int appMonth=0;
try {
	appMonth=Integer.parseInt(request.getParameter("appMonth"));
		 
}
catch (Exception e) {
	
	appMonth=0;// TODO: handle exception
}
		 Calendar c = Calendar.getInstance(); 
		 c.add(Calendar.MONTH, -appMonth);
		 int month = c.get(Calendar.MONTH) + 1; // beware of month indexing from zero
		 int year  = c.get(Calendar.YEAR);
		 
		map.add("month",month);
		map.add("year",year);
		try {
		List<DoctorAppOfLastThirtyDays> appOfLastThirtyDays = Constant.getRestTemplate()
				.postForObject(Constant.url + "getLastThirtyDaysAppointment", map, List.class);
		return appOfLastThirtyDays;
		}
		catch (Exception e) {LOGGER.error("Error while getDoctorCurrentMonthAppointCount", e);
		throw new RuntimeException("Error while doctor getDoctorCurrentMonthAppointCount", e);// TODO: handle exception
		}
	 
	}
	

	@RequestMapping(value = "/verifyReferal", method = RequestMethod.GET)
	public @ResponseBody Info verifyReferal(HttpServletRequest request) {
		System.out.println("inside saveDoctorSignature");
		Info info = new Info();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		String referal = request.getParameter("referal");
		map.add("referal", referal);

		if (referal != null) {
			try {

				info = Constant.getRestTemplate().postForObject(Constant.url + "isReferalCorrect", map,
						Info.class);
			
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}

		return info;
	}

	@RequestMapping(value = "/updateWalletAndTransactions/{userId}/{userType}", method = RequestMethod.GET)

	public String updateWalletAndTransactions(HttpServletRequest request, @PathVariable("userId") int userId,
			@PathVariable("userType") int userType) {

	//	WalletDetails walletDetails = new WalletDetails();

		try {
			WalletDetails walletDetails=new WalletDetails();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
			map.add("userId", referalDetails.getUserId());
			map.add("userType", referalDetails.getUserType());
			walletDetails = Constant.getRestTemplate().postForObject(Constant.url + "getUserWalletDetails", map,
					WalletDetails.class);
			
			// If user is already wallet id update amount in wallet otherwise give him
			// referal amount
			if (walletDetails == null) {

				walletDetails=new WalletDetails();
				walletDetails.setUserId(referalDetails.getUserId());
				walletDetails.setUserType(referalDetails.getUserType());
				walletDetails.setWalletAmount(Constant.referalAmount);
				

			} else {
			
				walletDetails.setWalletAmount(walletDetails.getWalletAmount() + Constant.referalAmount);
			}

			walletDetails = Constant.getRestTemplate().postForObject(Constant.url + "insertMoneyInWallet",
					walletDetails, WalletDetails.class);

			TransactionWalletDetails transactionWalletDetails = new TransactionWalletDetails();
			transactionWalletDetails.setAmount(Constant.referalAmount);
			// new user
			transactionWalletDetails.setToUserId(userId);

			// existed user

			transactionWalletDetails.setFromUserId(referalDetails.getUserId());

			transactionWalletDetails.setTransactionType(0);
			transactionWalletDetails.setUserType(walletDetails.getUserType());
			transactionWalletDetails.setWalletId(walletDetails.getWalletId());
			transactionWalletDetails.setToUserType(userType);
			
			transactionWalletDetails = Constant.getRestTemplate().postForObject(
					Constant.url + "insertWalletTransaction", transactionWalletDetails, TransactionWalletDetails.class);

			if (transactionWalletDetails.getTransactionId() != 0) {

				
				transactionWalletDetails.setTransactionId(0);
				transactionWalletDetails.setTransactionType(3);
//			transactionWalletDetails.setUserType(userType);
				transactionWalletDetails = Constant.getRestTemplate().postForObject(
						Constant.url + "insertWalletTransaction", transactionWalletDetails,
						TransactionWalletDetails.class);

			}

		} catch (Exception e) {

			e.printStackTrace();
			LOGGER.error("Error while inserting doctor details in submitDoctorRegProcess", e);
			throw new RuntimeException("Error while inserting doctor details in submitDoctorRegProcess", e);

		}
		if (userType == 0) {

			return "redirect:/showDoctorLoginPage";
		} else if (userType == 1) {
			  return "redirect:/showPatientSuscriptionPaymentResponse";
		} else if (userType == 2) {
			return "redirect:/showLabLoginPage";
		} else if (userType == 3) {
			return "redirect:/showPharmacyLoginPage";
		}
		return null;

	}

	@RequestMapping(value = "/showWalletDetails", method = RequestMethod.GET)
	public ModelAndView showWalletDetails(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView model=new ModelAndView("doctor/wallet");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		PatientDetails patientDetails=(PatientDetails) session.getAttribute("patientDetails");
		LabDetails labDetails=(LabDetails)session.getAttribute("labDetails");
		MedicalDetails medicalDetails=(MedicalDetails) session.getAttribute("medicalDetails");
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		if(doctorDetails!=null) {
		map.add("userId", doctorDetails.getDoctorId());
		
		map.add("userType", Constant.DOCTOR_USER_TYPE);
	
		
		}else if(patientDetails!=null) {
			map.add("userId", patientDetails.getPatientId());
			
			map.add("userType", Constant.PATIENT_USER_TYPE);
			
		}else if(labDetails!=null) {
			
			map.add("userId", labDetails.getLabId());
			map.add("userType", Constant.LAB_USER_TYPE);
			
			
		}else if(medicalDetails!=null) {
			
			map.add("userId", medicalDetails.getMedicalId());
			map.add("userType", Constant.PHARMACY_USER_TYPE);
			
			
		}
	
		System.out.println("Inside Wallet Details");
		
	// getWalletTransactionDetailsList=new ArrayList<GetWalletTransactionDetails>();
		
			System.out.println("Inside try");
			
			List<GetWalletTransactionDetails> getWalletTransactionDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "getWalletTransactionDetails", map, List.class);
			
			
			
		    WalletDetails walletDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);

	  
		model.addObject("walletDetails", walletDetails);
		
	   
	    model.addObject("getWalletTransactionDetailsList", getWalletTransactionDetailsList);
		return model;
	}

	@RequestMapping(value = "/updatePatientWalletAndTransactions", method = RequestMethod.GET)

	public void updatePatientWalletAndTransactions(HttpServletRequest request) {

	//	WalletDetails walletDetails = new WalletDetails();
		int userId=Integer.parseInt(request.getParameter("userId"));
		int userType=Integer.parseInt(request.getParameter("userType"));
		try {
			WalletDetails walletDetails=new WalletDetails();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			System.out.println(referalDetails.toString());
			map.add("userId", referalDetails.getUserId());
			map.add("userType", referalDetails.getUserType());
			walletDetails = Constant.getRestTemplate().postForObject(Constant.url + "getUserWalletDetails", map,
					WalletDetails.class);
			
			// If user is already wallet id update amount in wallet otherwise give him
			// referal amount
			if (walletDetails == null) {

				walletDetails=new WalletDetails();
				walletDetails.setUserId(referalDetails.getUserId());
				walletDetails.setUserType(referalDetails.getUserType());
				walletDetails.setWalletAmount(Constant.referalAmount);
				

			} else {
			
				walletDetails.setWalletAmount(walletDetails.getWalletAmount() + Constant.referalAmount);
			}

			walletDetails = Constant.getRestTemplate().postForObject(Constant.url + "insertMoneyInWallet",
					walletDetails, WalletDetails.class);

			TransactionWalletDetails transactionWalletDetails = new TransactionWalletDetails();
			transactionWalletDetails.setAmount(Constant.referalAmount);
			// new user
			transactionWalletDetails.setToUserId(userId);

			// existed user

			transactionWalletDetails.setFromUserId(referalDetails.getUserId());

			transactionWalletDetails.setTransactionType(0);
			transactionWalletDetails.setUserType(walletDetails.getUserType());
			transactionWalletDetails.setWalletId(walletDetails.getWalletId());
			transactionWalletDetails.setToUserType(userType);
			
			transactionWalletDetails = Constant.getRestTemplate().postForObject(
					Constant.url + "insertWalletTransaction", transactionWalletDetails, TransactionWalletDetails.class);

			if (transactionWalletDetails.getTransactionId() != 0) {

				
				transactionWalletDetails.setTransactionId(0);
				transactionWalletDetails.setTransactionType(3);
//			transactionWalletDetails.setUserType(userType);
				transactionWalletDetails = Constant.getRestTemplate().postForObject(
						Constant.url + "insertWalletTransaction", transactionWalletDetails,
						TransactionWalletDetails.class);

			}

		} catch (Exception e) {

			e.printStackTrace();
			LOGGER.error("Error while inserting doctor details in submitDoctorRegProcess", e);
			throw new RuntimeException("Error while inserting doctor details in submitDoctorRegProcess", e);

		}
		
		
	}
	
	@RequestMapping(value = "/showAllWalletDetails", method = RequestMethod.GET)
	public ModelAndView showAllWalletDetails(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView model=new ModelAndView("doctor/wallet");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		PatientDetails patientDetails=(PatientDetails) session.getAttribute("patientDetails");
		LabDetails labDetails=(LabDetails)session.getAttribute("labDetails");
		MedicalDetails medicalDetails=(MedicalDetails) session.getAttribute("medicalDetails");
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		if(doctorDetails!=null) {
		map.add("userId", doctorDetails.getDoctorId());
		
		map.add("userType", Constant.DOCTOR_USER_TYPE);
	
		
		}else if(patientDetails!=null) {
			map.add("userId", patientDetails.getPatientId());
			
			map.add("userType", Constant.PATIENT_USER_TYPE);
			
		}else if(labDetails!=null) {
			
			map.add("userId", labDetails.getLabId());
			map.add("userType", Constant.LAB_USER_TYPE);
			
			
		}else if(medicalDetails!=null) {
			
			map.add("userId", medicalDetails.getMedicalId());
			map.add("userType", Constant.PHARMACY_USER_TYPE);
			
			
		}
		
		List<GetWalletTransactionDetails> getWalletTransactionDetailsList=new ArrayList<GetWalletTransactionDetails>();
	
		try {
		
			getWalletTransactionDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "getAllWalletTransactionDetails", map, List.class);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	    
	    
	    WalletDetails walletDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);

	  
		model.addObject("walletDetails", walletDetails);
		
	    
	    model.addObject("getWalletTransactionDetailsList", getWalletTransactionDetailsList);
		return model;
	}
	
	
	 @RequestMapping(value="/showReferralCode/{userId}/{userType}", method=RequestMethod.GET)
		
		public ModelAndView showReferralCode(HttpServletRequest request,
				HttpServletResponse response,@PathVariable("userId") int userId,@PathVariable("userType") int userType)
		{
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		  
		 
			ModelAndView model=new ModelAndView("referralcode");
			if(userType==0) {
				map.add("doctorId",userId);
			DoctorDetails doctorDetails=Constant.getRestTemplate().postForObject(Constant.url + "getDoctorDetailsById", map, DoctorDetails.class);
			model.addObject("userReferal", doctorDetails.getRefferalCode());
			}else if(userType==1) {
				map.add("patientId",userId);
				PatientDetails patientDetails=Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsById", map, PatientDetails.class);
				
				System.out.println("patient"+patientDetails.toString());
				model.addObject("userReferal", patientDetails.getRefferalCode());
			
			}else if(userType==2) {
				
				map.add("labId", userId);
				LabDetails labDetails=Constant.getRestTemplate().postForObject(Constant.url + "getLabDetailsById", map, LabDetails.class);
				model.addObject("userReferal", labDetails.getString3());
				
			}else if(userType==3){
				map.add("medicalId", userId);
				MedicalDetails medicalDetails=Constant.getRestTemplate().postForObject(Constant.url + "medicalDetailsById", map, MedicalDetails.class);	
				model.addObject("userReferal", medicalDetails.getString3());
			}
			
			return model;
			
		}
	 
	
	 
	 @RequestMapping(value="/sendReferanceMessage", method=RequestMethod.GET)
		
		public @ResponseBody Info sendReferanceMessage(HttpServletRequest request,
				HttpServletResponse response)
		{
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 	Info info=new Info();
			ModelAndView model=new ModelAndView("referralcode");
			String referal =request.getParameter("referal");
		
			int userProfession=Integer.parseInt(request.getParameter("userProfession"));
			try {
		 	String email=request.getParameter("email");
		 	
		 	
		 	
		 	String phoneNo=request.getParameter("phoneNo");
		 
		 	map.add("userProfession", userProfession);
		 	map.add("referal", referal);
		 	if(email == null || email == "") {
		 	
		 		
		 		map.add("phoneNo",phoneNo);
		 		info = Constant.getRestTemplate().postForObject(Constant.url + "sendPhoneOfReferal", map, Info.class);
		
		 	}
		 	else {
			 	
		 		map.add("email", email);
		 		info = Constant.getRestTemplate().postForObject(Constant.url + "sendEmailOfReferal", map, Info.class);
		
		 	}
		 }catch (Exception e) {
			
			 e.printStackTrace();
		
		 }
		
			return info;
			
		}
	 

	
	 
	 
	 @RequestMapping(value="/changeDoctorProfilePassword", method=RequestMethod.POST)
		
		public String changeDoctorProfilePassword(HttpServletRequest request,
				HttpServletResponse response)
		{
		 HttpSession session = request.getSession();
		 DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		 DoctorProfilePassword doctorProfilePassword=new DoctorProfilePassword();
		 doctorProfilePassword.setDoctorId(doctorDetails.getDoctorId());
		 doctorProfilePassword.setPassword(request.getParameter("password"));
		 try {
		 DoctorProfilePassword doctorProfilePasswordRes = Constant.getRestTemplate().postForObject(Constant.url + "updateDoctorProfilePassword", doctorProfilePassword, DoctorProfilePassword.class);
		
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		 return "redirect:/showDoctorHomePage";
		}
	 
	 @RequestMapping(value="/searchDoctorForCircle", method=RequestMethod.GET)
		
		public String searchDoctorForCircle(HttpServletRequest request,
				HttpServletResponse response, Model model)
		{
			SpecializationDetailsList specializationList = Constant.getRestTemplate()
					.getForObject(Constant.url + "/getAllSpecialization", SpecializationDetailsList.class);
			model.addAttribute("specializationList",specializationList.getSpecializationDetailsList());
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			 HttpSession session = request.getSession();
			 DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			map.add("doctorId", doctorDetails.getDoctorId());
			try {
				System.out.println("cityId "+request.getParameter("cityId"));
			int cityId=Integer.parseInt(request.getParameter("cityId"));
			String []testID = request.getParameterValues("specId");
			StringBuilder testIdList=new StringBuilder();
			for(String s:testID)
				testIdList.append(s+",");
			
			map.add("specId", testIdList.substring(0,testIdList.length()-1));
			map.add("cityId",cityId);
			model.addAttribute("specId", new ArrayList<String>(Arrays.asList(testIdList.substring(0,testIdList.length()-1).split(","))));
			}
			catch (Exception e) {
				String specId=""+doctorDetails.getSpecId();
				System.out.println("error "+e.getMessage());
				map.add("specId", specId);
				map.add("cityId", doctorDetails.getCityId());
				model.addAttribute("specId", new ArrayList<String>(Arrays.asList(specId.split(","))));
			}
			
			List<GetDoctorBasicDetails> getDoctorBasicDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "/doctorCircle/getDoctorForCircle", map,List.class);
			model.addAttribute("doctorUrl",Constant.doctorUrl); 
			model.addAttribute("getDoctorBasicDetailsList",getDoctorBasicDetailsList);
			
			model.addAttribute("cityId", doctorDetails.getCityId());
		 return "doctor/searchDoctorForCircle";
		 
		}
	 
	 
	 @RequestMapping(value="/acceptDoctorNetworkCircleRequest", method=RequestMethod.GET)
		
		public @ResponseBody Info acceptDoctorNetworkCircleRequest(HttpServletRequest request,
				HttpServletResponse response, Model model)
		{
		 System.out.println("acceptDoctorNetworkCircleRequest");
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 map.add("fromId", Integer.parseInt(request.getParameter("fromId")));
		 
		 HttpSession session = request.getSession();
		 DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		 map.add("toId", doctorDetails.getDoctorId());
		 map.add("status", 1);
		 try {
		 Info info = Constant.getRestTemplate().postForObject(Constant.url + "/doctorCircle/acceptDoctorNetworkCircleRequest",map, Info.class);
		 
		 return info;
		 }
		 catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		 return null;
		}
	 
	 
	 @RequestMapping(value="/sendCircleRequest", method=RequestMethod.GET)
		
		public @ResponseBody Info sendCircleRequest(HttpServletRequest request,
				HttpServletResponse response, Model model)
		{
		 System.out.println("sendCircleRequest");
		 int doctorId=Integer.parseInt(request.getParameter("doctorId"));
		 
		 
		 DoctorCircle doctorCircle=new DoctorCircle();
		 HttpSession session = request.getSession();
		 DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		 doctorCircle.setToDoctorId(doctorId);
		 doctorCircle.setFromDoctorId(doctorDetails.getDoctorId());
		 doctorCircle.setStatus(0);
		 try {
		 Info info = Constant.getRestTemplate().postForObject(Constant.url + "/doctorCircle/sendDoctorNetworkCircleRequest",doctorCircle, Info.class);
		 
		 return info;
		 }
		 catch (Exception e) {
			 System.out.println(e.getMessage());// TODO: handle exception
		}
		 return null;
		}
	 
	 
	 @RequestMapping(value="/getDoctorCircleList", method=RequestMethod.GET)
		
		public String getDoctorCircleList(HttpServletRequest request,
				HttpServletResponse response, Model model)
		{
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 HttpSession session = request.getSession();
		 DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		map.add("doctorId", doctorDetails.getDoctorId());
		try {
		 List<GetDoctorBasicDetails> getDoctorBasicDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "/doctorCircle/getDoctorCircleByDoctorId", map,List.class);
			model.addAttribute("getDoctorBasicDetailsList",getDoctorBasicDetailsList);
			model.addAttribute("doctorUrl",Constant.doctorUrl); 
			model.addAttribute("url",Constant.VIDEOCALLURL);
			model.addAttribute("mynetwork","active");
			
		}
		catch (Exception e) {
			LOGGER.error("Error while getDoctorCircleByDoctorId", e);
			throw new RuntimeException("Error while getDoctorCircleByDoctorId", e);
		}
		return "doctor/showDoctorCircleList";
		}
	 
	 @RequestMapping(value="/getDoctorCircle", method=RequestMethod.GET)
		
		public @ResponseBody List<GetDoctorBasicDetails> getDoctorCircle(HttpServletRequest request,
				HttpServletResponse response, Model model)
		{
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 HttpSession session = request.getSession();
		 DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		map.add("doctorId", doctorDetails.getDoctorId());
		try {
		 List<GetDoctorBasicDetails> getDoctorBasicDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "/doctorCircle/getDoctorCircleByDoctorId", map,List.class);
		 return getDoctorBasicDetailsList;
		}
		catch (Exception e) {
			LOGGER.error("Error while getDoctorCircleByDoctorId", e);
			throw new RuntimeException("Error while getDoctorCircleByDoctorId", e);
		}
		 
		}
	 
}
