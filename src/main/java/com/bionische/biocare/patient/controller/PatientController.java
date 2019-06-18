
package com.bionische.biocare.patient.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

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
import com.bionische.biocare.doctor.controller.DoctorController;
import com.bionische.biocare.doctor.model.DoctorBankAccountInfo;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.ewallet.model.BankTransferRequest;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.GetLabRatingReview;
import com.bionische.biocare.lab.model.LabBankAccountInfo;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.model.OtpSessionDetails;
import com.bionische.biocare.model.PackageDetails;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.ForgetPwdVerificationCode;
import com.bionische.biocare.patient.model.GetDocAndLabForRating;
import com.bionische.biocare.patient.model.GetPatientContactDetailsById;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PateintReportPaymentDetails;
import com.bionische.biocare.patient.model.PatientAddress;
import com.bionische.biocare.patient.model.PatientBankAccountInfo;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.PatientLogin;
import com.bionische.biocare.patient.model.PatientMemberRelation;
import com.bionische.biocare.patient.model.PatientNotification;
import com.bionische.biocare.patient.model.PatientSuscriptionDetails;
import com.bionische.biocare.patient.model.RatingDetails;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.patient.model.TermsAndConditions;
import com.bionische.biocare.patientdoctor.model.GetAppointmentDetails;
import com.bionische.biocare.patientlab.model.GetLabAppointment;
import com.bionische.biocare.pharmacy.model.MedicalDetails;
import com.bionische.biocare.pharmacy.model.PharmacyBankAccountInfo;



@Scope("session")
@Controller
public class PatientController {

	 
	
	public final Log LOGGER = LogFactory.getLog(PatientController.class);
	// HttpEntity<String> req=new HttpEntity<String>(Constant.getHeaders());
	/* List<Country> countryList; */
	List<City> cityList;
	List<State> stateList;
	PatientDetails patientInfo;
	List<MultipartFile> profilePhotos = null;
	//int packageId;
    float packageAmt;
    int offerId;
    String msg;

	String getHomePageLink;
	PatientAddress patientAddressDetails;

	//public PatientBankAccountInfo patientBankAccountInfo;
	
	static int trial = 0;

	Info frgtPwdPatientDetails = new Info();

	@RequestMapping(value = "/showPatientLoginPage", method = RequestMethod.GET)

	public ModelAndView showPatientLoginPage(HttpServletRequest request) {
		getHomePageLink = request.getParameter("reportId");
		getHomePageLink = request.getParameter("bookId");

		ModelAndView model = new ModelAndView("patient/patientLoginPage");
		model.addObject("msg",msg);
		return model;

	}

	@RequestMapping(value = "/showHomeOrderMedicine", method = RequestMethod.GET)
	public ModelAndView showHomeOrderMedicine(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("order-medicine");

		return model;

	}

	@RequestMapping(value = "/submitPatientInformation", method = RequestMethod.GET)

	public ModelAndView submitPatientInformation(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("patient/patientLoginPage");
		String existingStatus = request.getParameter("existingStatus");
		String getPatientId = request.getParameter("existingId");

		if (getPatientId != null && getPatientId != "") {
			int patientId = Integer.parseInt(getPatientId);
			patientInfo.setPatientId(patientId);
		}

		RestTemplate rest = new RestTemplate();
		PatientDetails patient = new PatientDetails();
		try {
			patient = Constant.getRestTemplate().postForObject(Constant.url + "insertPatientDetails", patientInfo,
					PatientDetails.class);

			model.addObject("patient", patient);

		} catch (Exception e) {
			LOGGER.error("Error while inserting submitPatientInformation.", e);
			throw new RuntimeException("Error while inserting submitPatientInformation.", e);

		}

		return model;

	}

	@RequestMapping(value = "/showPatientRegistrationPage", method = RequestMethod.GET)

	public ModelAndView showPatientRegistrationPage() {
		ModelAndView model = new ModelAndView("patient/patientRegistration");
		RestTemplate rest = new RestTemplate();

		model.addObject("countryList", HomeController.countryList);

		return model;

	}

	// Username Validation
	@RequestMapping(value = "/usernameValidation", method = RequestMethod.GET)

	public @ResponseBody Info usernameValidation(HttpServletRequest request) {
		Info info = new Info();

		String userName = request.getParameter("userName");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "usernameValidation", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while usernameValidation.", e);
			throw new RuntimeException("Error while usernameValidation.", e);
		}
		return info;

	}

	// Username Validation
	@RequestMapping(value = "/passwordValidation", method = RequestMethod.GET)

	public @ResponseBody Info passwordValidation(HttpServletRequest request) {
		Info info = new Info();

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int patientId = patientDetail.getPatientId();

		String password = request.getParameter("password");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);
		map.add("password", password);

		RestTemplate rest = new RestTemplate();

		try {

			info = Constant.getRestTemplate().postForObject(Constant.url + "passwordValidation", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while passwordValidation.", e);
			throw new RuntimeException("Error while passwordValidation.", e);
		}
		return info;

	}

	@RequestMapping(value = "/patientLoginProcess", method = RequestMethod.GET)
	public @ResponseBody Info patientLoginProcess(HttpServletRequest request, HttpServletResponse response) {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String returnUrl = "w";
		Info info1 = new Info();

		HttpSession session = request.getSession();

		PatientLogin patientLogin = new PatientLogin();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);
		map.add("password", password);

		try {
			patientLogin = Constant.getRestTemplate().postForObject(Constant.url + "patientLoginProcess", map,
					PatientLogin.class);

			if (!patientLogin.getInfo().isError()) {
				info1.setMessage("showSelectMemberLogin");

				session.setAttribute("patientDetails", patientLogin.getPatientDetails());
				session.setAttribute("userType",Constant.PATIENT_USER_TYPE);
				/*
				 * if(getHomePageLink.equals("report")){ returnUrl="showPatienReportPage";
				 * info1.setError(false); info1.setMessage("showPatienReportPage"); }else
				 * if(getHomePageLink.equals("booked")){
				 * 
				 * returnUrl="showBookAppointment"; info1.setError(false);
				 * info1.setMessage("showBookAppointment");
				 * 
				 * }
				 */
			} else {
				info1.setError(true);
				info1.setMessage("wrong");

			}

		} catch (Exception e) {

			LOGGER.error("Error while patientLoginProcess.", e);
			throw new RuntimeException("Error while patientLoginProcess.", e);
		}

		return info1;
	}

	

@RequestMapping(value = "/showSelectMemberLogin", method = RequestMethod.GET)

	public ModelAndView showSelectMemberLogin(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("patient/selectMemberForLogin");
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
try {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("familyId", "" + patientDetail.getFamilyId());
		ParameterizedTypeReference<List<PatientDetails>> typeRef = new ParameterizedTypeReference<List<PatientDetails>>() {
		};
		ResponseEntity<List<PatientDetails>> responseEntity = Constant.getRestTemplate().exchange(
				Constant.url + "getPatientFamilyMembersList", HttpMethod.POST,
				new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
		List<PatientDetails> patientDetailList = new ArrayList<PatientDetails>();
		patientDetailList = responseEntity.getBody();
		model.addObject("patientDetailList", patientDetailList);
}
catch (Exception e) {
	LOGGER.error("Error while select menber for login.", e);
	throw new RuntimeException("Error while select menber for login.", e);
}
		return model;

	}
	
	@RequestMapping(value = "/selectMemberLoginProcess", method = RequestMethod.POST)

	public String selectMemberLoginProcess(HttpServletRequest request, Model model) {
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		MultiValueMap<String, Object> mapPatient = new LinkedMultiValueMap<String, Object>();
		mapPatient.add("patientId", "" + patientId);
		mapPatient.add("token", request.getParameter("token"));
		try {
		PatientDetails parentPatientDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getPatientDetailsByIdAndUpdateToken", mapPatient, PatientDetails.class);
		HttpSession session = request.getSession();
		session.setAttribute("patientDetails", parentPatientDetails);
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", parentPatientDetails.getPatientId());
		
		List<GetAppointmentDetails> getAppointmentDetailsList = Constant.getRestTemplate()
				.postForObject(Constant.url + "getAppmtDetailsByPatientId",map,  List.class);
 
		List<GetLabAppointment> getlabAppointmentDetailsList = Constant.getRestTemplate()
				.postForObject(Constant.url + "lab/getLabAppmtDetailsByPatientId",map,  List.class);
		
		if(getlabAppointmentDetailsList!=null || getAppointmentDetailsList!=null) {
		model.addAttribute("getlabAppointmentDetailsList", getlabAppointmentDetailsList);
		model.addAttribute("getAppointmentDetailsList", getAppointmentDetailsList);
		model.addAttribute("appointActive", "active");
		
		return "patient/upcomingAppointments";
		}
		
		
		}
		catch (Exception e) {
			LOGGER.error("Error while select menber for login.", e);
			throw new RuntimeException("Error while select menber for login.", e);
		}
		return "redirect:/showPatientHomePage";
	}

	
	@RequestMapping(value = "/showPatientHomePage", method = RequestMethod.GET)

	public ModelAndView showPatientHomePage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/patientHomePage");

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int patientId = patientDetail.getPatientId();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("familyId", "" + patientDetail.getFamilyId());

		MultiValueMap<String, Object> mapPatient = new LinkedMultiValueMap<String, Object>();
		mapPatient.add("patientId", "" + patientId);

		RestTemplate rest = new RestTemplate();
		List<PatientMemberRelation> patientMemberRelation = new ArrayList();

		try {
			List<PatientDetails> patientDetailList = new ArrayList<PatientDetails>();
			PatientDetails parentPatientDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPatientDetailsById", mapPatient, PatientDetails.class);

			ParameterizedTypeReference<List<PatientDetails>> typeRef = new ParameterizedTypeReference<List<PatientDetails>>() {
			};
			ResponseEntity<List<PatientDetails>> responseEntity = Constant.getRestTemplate().exchange(
					Constant.url + "getPatientFamilyMembersList", HttpMethod.POST,
					new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			patientDetailList = responseEntity.getBody();

			patientMemberRelation = Constant.getRestTemplate().getForObject(Constant.url + "/getAllRelations",
					List.class);

			List<String> relation = new ArrayList<String>();
			for (PatientDetails members : patientDetailList) {
				if (members.getString2().equalsIgnoreCase("mother")
						|| members.getString2().equalsIgnoreCase("father")) {
					relation.add(members.getString2());
				}
			}
			relation.add("self");
			List<PatientMemberRelation> patientRelation = Constant.getRestTemplate()
					.postForObject(Constant.url + "getRelations", relation, List.class);

			if(parentPatientDetails.getProfilePhoto()==null)
			{
				parentPatientDetails.setProfilePhoto(Constant.emptyPhoto);
			
			}
			else
			{
				parentPatientDetails.setProfilePhoto(Constant.patientUrl+parentPatientDetails.getPatientId()+"/"+"profile"+"/"+parentPatientDetails.getProfilePhoto());
			}
			
			try {
				PatientBankAccountInfo patientBankAccountInfo = Constant.getRestTemplate().postForObject(
						Constant.url + "getPatientBankDetails", mapPatient, PatientBankAccountInfo.class);
				model.addObject("patientBankAccountInfo", patientBankAccountInfo);
			} catch (Exception e) {
				LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
			}
			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("userId", patientId);
			map1.add("userType", 1);
			WalletDetails walletDetails = Constant.getRestTemplate().postForObject(Constant.url + "getUserWalletDetails", map1, WalletDetails.class);
			
			model.addObject("walletDetails", walletDetails);
			model.addObject("patientMemberRelation", patientMemberRelation);
			model.addObject("patientDetails", parentPatientDetails);
			model.addObject("patientDetailList", patientDetailList);
			model.addObject("membersLength", patientDetailList.size());
			model.addObject("patientRelation", patientRelation);
			model.addObject("homeActive", "active");

			model.addObject("countryList", HomeController.countryList);

		} catch (Exception e) {

			LOGGER.error("Error while showPatientHomePage.", e);
			throw new RuntimeException("Error while showPatientHomePage.", e);
		}

		return model;

	}

	// Submission of patient registration

	/**
	 * @author Kaushik
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/submitPatientRegProcess", method = RequestMethod.POST)

	public String submitPatientRegProcess(HttpServletRequest request, Model model,@RequestParam("profilePhoto") List<MultipartFile> profilePhoto) {
		System.out.println("sdsbyfb");

		String url = "showPatientLoginPage";

		patientInfo = new PatientDetails();

		PatientDetails patient = new PatientDetails();
		HttpSession session = request.getSession();
		PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");

		if (patientDetails != null) {
			patientInfo.setString2(request.getParameter("relation"));
			patientInfo.setFamilyId(patientDetails.getFamilyId());

			url = "showPatientHomePage";
		} else {
			patientInfo.setString2("self");
			 
			session.setAttribute("patientDetails", patientInfo);
		}

		patientInfo.setfName(request.getParameter("fName"));
		patientInfo.setmName(request.getParameter("mName"));
		patientInfo.setlName(request.getParameter("lName"));
		patientInfo.setUserName(request.getParameter("uName"));
		patientInfo.setPassword(request.getParameter("password"));
		patientInfo.setGender(request.getParameter("gender"));
		patientInfo.setBirthDate(DateConverter.convertToYMD(request.getParameter("birthDate")));
		patientInfo.setCityId(Integer.parseInt(request.getParameter("cityId")));
		patientInfo.setStateId(Integer.parseInt(request.getParameter("stateId")));
		patientInfo.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		patientInfo.setAddress(request.getParameter("address"));
		patientInfo.setBloodGroup(request.getParameter("bloodGroup"));
		patientInfo.setAge(0);
		patientInfo.setRegDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

		patientInfo.setContactNo(request.getParameter("contactNo"));
		patientInfo.setEmail(request.getParameter("email"));
		patientInfo.setQualification(request.getParameter("qualification"));

		patientInfo.setDelStatus(Integer.parseInt("0"));
		patientInfo.setString1("1");
		patientInfo.setString2("self");
		patientInfo.setInt1(0);
		patientInfo.setInt2(Integer.parseInt(request.getParameter("pincode")));
		
		patientInfo.setMotherName(request.getParameter("motherName"));
		
		if(profilePhotos!=null)
		{
		patientInfo.setProfilePhoto(profilePhoto.get(0).getOriginalFilename());
		}
		
		model.addAttribute("backUrl",url);
		model.addAttribute("patientContact",patientInfo.getContactNo());
		model.addAttribute("patientEmail",patientInfo.getEmail());
	
	
	try {
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		
		map.add("userType", 1);
		List<PackageDetails> packageDetailsList=Constant.getRestTemplate().postForObject(Constant.url+"getCurrentPackageDetailsByUserType",map,List.class);
	model.addAttribute("packageDetailsList",packageDetailsList);
	
	} catch (Exception e) {
		// TODO: handle exception
		LOGGER.error("Error while getting patient Packge details",e);
		throw new RuntimeException("Error while getting patient Packge details",e);
	}
	
	
	return "patient/patient_suscription_payment/patientPackageDetails";

	}


	@RequestMapping(value = "/savePatientDetailsAndPayment", method = RequestMethod.GET)
	public @ResponseBody int savePatientDetailsAndPayment(HttpServletRequest request) {
		
		int patientId=0;
		try {
			
			PatientDetails patientDetailss = new PatientDetails();
			
			String orderId = request.getParameter("orderId");
			float txnAmt = Float.parseFloat(request.getParameter("txnAmt"));
			String txnId = request.getParameter("txnId");
			int txnStatus = Integer.parseInt(request.getParameter("txnStatus"));
			int packageId=Integer.parseInt(request.getParameter("packageId"));
			try {
			VpsImageUpload vpsImageUpload=new VpsImageUpload();
			
			Random rand = new Random();

			// Generate random integers in range 0 to 999
			int no = rand.nextInt(10);
			
		    String	profilePhotoName=new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
					+no+ VpsImageUpload.getFileExtension(profilePhotos.get(0));
		   			
		   vpsImageUpload.saveUploadedFiles(profilePhotos,2, profilePhotoName,patientDetailss.getPatientId());
			}catch (Exception e) {
			
			}
			
			patientDetailss = Constant.getRestTemplate().postForObject(Constant.url + "insertPatientDetails",
					patientInfo, PatientDetails.class);
		
			  profilePhotos = null;
			
			PatientSuscriptionDetails patientSuscriptionDetails=new PatientSuscriptionDetails();
			patientSuscriptionDetails.setAmount(txnAmt);
			patientSuscriptionDetails.setOfferId(Integer.parseInt(request.getParameter("offerId")));
			patientSuscriptionDetails.setPackageAmt(Float.parseFloat(request.getParameter("packageAmt")));
			patientSuscriptionDetails.setOrderId(orderId);
			patientSuscriptionDetails.setPackageId(packageId);
			patientSuscriptionDetails.setPatientId(patientDetailss.getPatientId());
			patientSuscriptionDetails.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			patientSuscriptionDetails.setStatus(txnStatus);
			patientSuscriptionDetails.setTxnId(txnId);
			
			PatientSuscriptionDetails patientSuscriptionDetailsRes = Constant.getRestTemplate().postForObject(Constant.url + "insertPatientSuscriptionDetails",
					patientSuscriptionDetails, PatientSuscriptionDetails.class);
			
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
			
			
		 	if(patientInfo.getFamilyId()==0)
			{
				
				if (DoctorController.referalDetails != null) {
					patientId=patientDetailss.getPatientId();
				} 
			}
			if(patientDetail.getPatientId()==0)
			{
				session.setAttribute("patientDetails",patientDetailss);
				 
			}
			
			
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
		
		return patientId;
	
	}
	
	
	
	
	// Submission of patient registration
	/*
	 * @RequestMapping(value="/addFamilyMember", method=RequestMethod.POST)
	 * 
	 * public String addFamilyMember(HttpServletRequest request,HttpServletResponse
	 * response) {
	 * 
	 * ModelAndView model=new ModelAndView("patient/patientHomePage");
	 * 
	 * PatientDetails patient=new PatientDetails(); HttpSession session =
	 * request.getSession(); PatientDetails patientDetails=
	 * (PatientDetails)session.getAttribute("patientDetails"); VpsImageUpload
	 * vpsImageUpload=new VpsImageUpload();
	 * 
	 * patient.setFamilyId(patientDetails.getFamilyId());
	 * patient.setfName(request.getParameter("fName"));
	 * patient.setmName(request.getParameter("mName"));
	 * patient.setlName(request.getParameter("lName"));
	 * 
	 * patient.setGender(request.getParameter("gender"));
	 * patient.setBirthDate(request.getParameter("birthDate"));
	 * patient.setCityId(0); patient.setStateId(0); patient.setCountryId(0);
	 * patient.setAddress("null");
	 * patient.setBloodGroup(request.getParameter("bloodGroup")); patient.setAge(0);
	 * patient.setRegDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	 * 
	 * patient.setContactNo("null"); patient.setEmail("null");
	 * patient.setQualification("null");
	 * 
	 * patient.setDelStatus(Integer.parseInt("0")); patient.setString1("1");
	 * patient.setString2(request.getParameter("relation")); patient.setInt1(0);
	 * patient.setInt2(0);
	 * 
	 * RestTemplate rest=new RestTemplate(); try {
	 * patient=Constant.getRestTemplate().postForObject(Constant.url+
	 * "insertPatientDetails", patient,PatientDetails .class);
	 * model.addObject("patient", patient); } catch (Exception e) {
	 * 
	 * LOGGER.error("Error while addFamilyMember.",e); throw new
	 * RuntimeException("Error while addFamilyMember.",e); }
	 * 
	 * return "redirect:/showPatientHomePage";
	 * 
	 * }
	 */
	@RequestMapping(value = "/showPatientEditPage/{patientId}", method = RequestMethod.GET)

	public ModelAndView showPatientEditPage(@PathVariable("patientId") int patientId, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/editPatientProfile");

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int parentPatientId = patientDetail.getPatientId();

		PatientDetails editPatientDetails = new PatientDetails();

		List<String> bloodGroup = new ArrayList<String>();

		bloodGroup.add("O Positive");
		bloodGroup.add("O Negative");
		bloodGroup.add("AB Positive");
		bloodGroup.add("AB Negative");
		bloodGroup.add("A Positive");
		bloodGroup.add("A Negative");
		bloodGroup.add("B Positive");
		bloodGroup.add("B Negative");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + patientId);

		RestTemplate rest = new RestTemplate();
		List<PatientMemberRelation> patientMemberRelation = new ArrayList();

		try {
			editPatientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsById", map,
					PatientDetails.class);
			System.out.println("editPatientDetails:" + editPatientDetails.toString());

			patientMemberRelation = Constant.getRestTemplate().getForObject(Constant.url + "/getAllRelations",
					List.class);

			MultiValueMap<String, Object> mapState = new LinkedMultiValueMap<String, Object>();
			mapState.add("countryId", editPatientDetails.getCountryId());

			stateList = Constant.getRestTemplate().postForObject(Constant.url + "getAllStateByCountryId", mapState,
					List.class);
			System.out.println("stateListtttt:" + stateList.toString());

			MultiValueMap<String, Object> mapCity = new LinkedMultiValueMap<String, Object>();
			mapCity.add("stateId", editPatientDetails.getStateId());

			cityList = Constant.getRestTemplate().postForObject(Constant.url + "getAllCityByStateId", mapCity,
					List.class);

			model.addObject("patientMemberRelation", patientMemberRelation);
			model.addObject("editPatientDetails", editPatientDetails);
			model.addObject("bloodGroup", bloodGroup);
			model.addObject("countryList", HomeController.countryList);
			model.addObject("stateList", stateList);
			model.addObject("cityList", cityList);
		} catch (Exception e) {
			LOGGER.error("Error while editing showPatientEditPage by patient id.", e);
			throw new RuntimeException("Error while editing showPatientEditPage by patient id.", e);

		}

		return model;

	}

	// Edit Submission of patient registration
	@RequestMapping(value = "/updatePatientEditProcess", method = RequestMethod.POST)

	public String updatePatientEditProcess(HttpServletRequest request, HttpServletResponse response,@RequestParam("profilePhoto") List<MultipartFile> profilePhoto) {
		int patientId = Integer.parseInt(request.getParameter("editPatientId"));

		PatientDetails patient = new PatientDetails();
		PatientDetails patientDetails = new PatientDetails();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + patientId);

		patientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsById", map,
				PatientDetails.class);

		patient.setPatientId(patientId);
		patient.setfName(request.getParameter("fName"));
		patient.setmName(request.getParameter("mName"));
		patient.setlName(request.getParameter("lName"));
		patient.setUserName(patientDetails.getUserName());
		patient.setFamilyId(patientDetails.getFamilyId());
		patient.setPassword(patientDetails.getPassword());
		patient.setGender(request.getParameter("gender"));
		patient.setBirthDate(DateConverter.convertToYMD(request.getParameter("birthDate")));
		patient.setCityId(Integer.parseInt(request.getParameter("cityId")));
		patient.setStateId(Integer.parseInt(request.getParameter("stateId")));
		patient.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		patient.setAddress(request.getParameter("address"));
		patient.setBloodGroup(request.getParameter("bloodGroup"));

		patient.setAge(0);
		patient.setRegDate(DateConverter.convertToYMD(patientDetails.getRegDate()));

		patient.setContactNo(request.getParameter("contactNo"));
		patient.setEmail(request.getParameter("email"));
		patient.setQualification(request.getParameter("qualification"));

		patient.setProfilePhoto(patientDetails.getProfilePhoto());
		patient.setDelStatus(patientDetails.getDelStatus());
		patient.setString1("1");
		patient.setString2(request.getParameter("relation"));
		patient.setInt1(patientDetails.getInt1());
		patient.setInt2(Integer.parseInt(request.getParameter("pincode")));
		patient.setMotherName(request.getParameter("motherName"));
		try {
		if(profilePhoto!=null)
		{
			System.out.println("alllaaa:"+profilePhoto.get(0).getOriginalFilename());
		
		VpsImageUpload vpsImageUpload=new VpsImageUpload();
		String profilePhotoName=new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date()) +patientId+ VpsImageUpload.getFileExtension(profilePhoto.get(0));
		patient.setProfilePhoto(profilePhotoName);
		
		System.out.println("profilePhotoName:"+profilePhotoName);
		
	    vpsImageUpload.saveUploadedFiles(profilePhoto,2, profilePhotoName,patientDetails.getPatientId()); 
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
			
	try {
			patient = Constant.getRestTemplate().postForObject(Constant.url + "insertPatientDetails", patient,
					PatientDetails.class);

		} catch (Exception e) {

			LOGGER.error("Error while updatePatientEditProcess.", e);
			throw new RuntimeException("Error while updatePatientEditProcess.", e);
		}

		return "redirect:/showPatientHomePage";

	}

	@RequestMapping(value = "/sendTextOtp", method = RequestMethod.GET)
	public @ResponseBody Info sendTextOtp(HttpServletRequest request) {
		Info info = new Info();

	 

		 
		int generatedOTP = Integer.parseInt(String.valueOf(Constant.generateOTP(6)));
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(120);
		session.setAttribute("genOTP", generatedOTP);
		String contactNo = request.getParameter("contactNo");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("generatedOTP", generatedOTP);
		map.add("contactNo", contactNo);

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "messageForSendOTP", map, Info.class);
			if (info == null) {
				info.setMessage("Please check your mobile number is correct");
			}
		} catch (Exception e) {
			e.getMessage();
		}

		return info;

	}

	// Feed Back

	@RequestMapping(value = "/getDoctorsAndLabsForRating", method = RequestMethod.GET)

	public @ResponseBody GetDocAndLabForRating getDoctorsAndLabsForRating(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/patientDispaly");
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int familyId = patientDetail.getFamilyId();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("familyId", "" + familyId);

		GetDocAndLabForRating getDocAndLabForRating = new GetDocAndLabForRating();

		RestTemplate rest = new RestTemplate();

		try {
			getDocAndLabForRating = Constant.getRestTemplate().postForObject(Constant.url + "DoctorsAndLabsForRating",
					map, GetDocAndLabForRating.class);

		} catch (Exception e) {

			LOGGER.error("Error while getDoctorsAndLabsForRating.", e);
			throw new RuntimeException("Error while getDoctorsAndLabsForRating.", e);
		}
		return getDocAndLabForRating;

	}

	/* Submission of patient reviews */
	@RequestMapping(value = "/submitDoctorRating", method = RequestMethod.GET)

	public @ResponseBody Info submitDoctorRating(HttpServletRequest request, HttpServletResponse response) {
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", Integer.parseInt(request.getParameter("ratPatientId")));

		PatientDetails patientDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getPatientDetailsByPatientId", map, PatientDetails.class);

		RatingDetails ratingDetails = new RatingDetails();

		ratingDetails.setDoctorId(Integer.parseInt(request.getParameter("ratdoctorId")));
		ratingDetails.setRating(Float.parseFloat(request.getParameter("rating")));
		ratingDetails.setReview(request.getParameter("review"));
		ratingDetails.setPatientName(patientDetails.getfName());
		ratingDetails.setPatientId(Integer.parseInt(request.getParameter("ratPatientId")));
		ratingDetails.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		ratingDetails.setDelStatus(0);
		ratingDetails.setString1("1");
		ratingDetails.setString2("1");
		ratingDetails.setInt1(0);
		ratingDetails.setInt2(0);

		MultiValueMap<String, Object> mapRating = new LinkedMultiValueMap<String, Object>();
		mapRating.add("notificationId", Integer.parseInt(request.getParameter("notificationId")));

		System.out.println("ratingDetails:" + ratingDetails.toString());
		Info info = new Info();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "insertRatingDetails", ratingDetails,
					Info.class);

			if (info.getMessage().equals("success")) {
				System.out.println(
						"updtaeraaaaaaatingnoootificaton:" + Integer.parseInt(request.getParameter("notificationId")));
				Info info1 = Constant.getRestTemplate().postForObject(Constant.url + "updateRatingDoneNotificatiion",
						mapRating, Info.class);
				System.out.println("innnnnnfo:" + info1.toString());

			}

		} catch (Exception e) {

			LOGGER.error("Error while submitDoctorRating.", e);
			throw new RuntimeException("Error while submitDoctorRating.", e);
		}

		return info;

	}

	/* Submission of patient reviews */
	@RequestMapping(value = "/submitLabRating", method = RequestMethod.GET)

	public @ResponseBody Info submitLabRating(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("rattttiinnnggg:"+request.getParameter("ratLPatientId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", Integer.parseInt(request.getParameter("ratLPatientId")));

		PatientDetails patientDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getPatientDetailsByPatientId", map, PatientDetails.class);

		System.out.println("patientDetails:"+patientDetails.toString());
		GetLabRatingReview getLabRatingReview = new GetLabRatingReview();

		getLabRatingReview.setLabId(Integer.parseInt(request.getParameter("ratLlabId")));

		getLabRatingReview.setRating(Float.parseFloat(request.getParameter("rating")));
		getLabRatingReview.setReview(request.getParameter("labReview"));
		getLabRatingReview.setPatientName(patientDetails.getfName());
		getLabRatingReview.setPatientId(Integer.parseInt(request.getParameter("ratLPatientId")));
		getLabRatingReview.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		getLabRatingReview.setDelStatus(0);
		getLabRatingReview.setString1("1");

		getLabRatingReview.setInt1(0);
		getLabRatingReview.setInt2(0);

		System.out.println("getLabRatingReview:" + getLabRatingReview.toString());

		MultiValueMap<String, Object> mapRating = new LinkedMultiValueMap<String, Object>();
		mapRating.add("notificationId", Integer.parseInt(request.getParameter("labnotificationId")));
		Info info = new Info();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "insertLabRatingDetails", getLabRatingReview,
					Info.class);
			if (info.getMessage().equals("success")) {
				Info info1 = Constant.getRestTemplate().postForObject(Constant.url + "updateLabRatingDoneNotificatiion",
						mapRating, Info.class);

			}

		} catch (Exception e) {

			LOGGER.error("Error while submitLabRating.", e);
			throw new RuntimeException("Error while submitLabRating.", e);
		}

		return info;

	}

	@RequestMapping(value = "/showChangePassword", method = RequestMethod.GET)

	public ModelAndView showChangePassword(HttpServletRequest request, HttpServletResponse response) {

		return new ModelAndView("patient/changePassword");

	}

	@RequestMapping(value = "/changePatientPassword", method = RequestMethod.GET)

	public @ResponseBody Info changePatientPassword(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int patientId = patientDetail.getPatientId();

		Info info = new Info();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + patientId);
		map.add("newPassword", "" + newPassword);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "changePatientPassword", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while changePatientPassword.", e);
			throw new RuntimeException("Error while changePatientPassword.", e);
		}
		return info;

	}

	@RequestMapping(value = "/ShowViewPatientOrder", method = RequestMethod.GET)

	public String ShowViewPatientOrder(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/viewOrder");
		model.addObject("orderViewActive", "active");
		return "redirect:/getPatientRecentMedicineOrder";

	}
	/*
	@RequestMapping(value = "/ShowForgotPassword", method = RequestMethod.GET)

	public ModelAndView ShowForgotPassword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/patientLoginPage");
		String userName = request.getParameter("userName");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		RestTemplate rest = new RestTemplate();

		try {

			frgtPwdPatientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getUserNameForForgetPwd",
					map, Info.class);

			System.out.println("frgtPwdPatientDetails:" + frgtPwdPatientDetails.getMessage());

			if (frgtPwdPatientDetails.getMessage().equals("Failed")) {
				model = new ModelAndView("patient/patientLoginPage");
				model.addObject("usrmessage", "please enter valid user name");
			} else

			{
				model = new ModelAndView("patient/forgotpassword");
				model.addObject("email", frgtPwdPatientDetails.getMessage());
				model.addObject("userName", userName);
			}

		} catch (Exception e) {

			LOGGER.error("Error while ShowForgotPassword.", e);
			throw new RuntimeException("Error while ShowForgotPassword.", e);
		}

		return model;

	}

	@RequestMapping(value = "/ShowVerifyForgetPassword", method = RequestMethod.GET)

	public ModelAndView ShowVerifyForgotPassword(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/verifyForgetPwd");

		String email = request.getParameter("emailId");
		String userName = request.getParameter("userName");

		RestTemplate rest = new RestTemplate();
		// create instance of Random class
		Random rand = new Random();

		// Generate random integers in range 0 to 999
		int rand_int1 = rand.nextInt(1000000);

		ForgetPwdVerificationCode forgetPwdVerificationCode = new ForgetPwdVerificationCode();

		forgetPwdVerificationCode.setCode(String.valueOf(rand_int1));
		forgetPwdVerificationCode.setType(1);
		forgetPwdVerificationCode.setUserName(userName);
		;
		model.addObject("userName", userName);

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("email", email);
		map.add("verificationCode", String.valueOf(rand_int1));
		try {
			Info info1 = Constant.getRestTemplate().postForObject(Constant.url + "mailVerificationCode", map,
					Info.class);
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "submitVerificationCode",
					forgetPwdVerificationCode, Info.class);
			if (info1.getMessage().equals("success") && info.getMessage().equals("success")) {
				model = new ModelAndView("patient/verifyForgetPwd");
				model.addObject("message", "Mail Sent Succesfully");
				model.addObject("userName", userName);
				model.addObject("email", email);
			} else {
				model = new ModelAndView("patient/forgotpassword");
				model.addObject("message", "failed to send mail");
				model.addObject("userName", userName);
				model.addObject("email", email);

			}
		} catch (Exception e) {

			LOGGER.error("Error while ShowVerifyForgetPassword.", e);
			throw new RuntimeException("Error while ShowVerifyForgetPassword.", e);
		}

		return model;

	}

	@RequestMapping(value = "/submitVerificationCode", method = RequestMethod.GET)

	public ModelAndView submitVerificationCode(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		String verify = request.getParameter("verify");
		String userName = request.getParameter("userName");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", "" + userName);
		map.add("type", 1);

		RestTemplate rest = new RestTemplate();
		ForgetPwdVerificationCode forgetPwdVerificationCode = new ForgetPwdVerificationCode();
		try {
			forgetPwdVerificationCode = Constant.getRestTemplate().postForObject(
					Constant.url + "getVerificationCodeByUserName", map, ForgetPwdVerificationCode.class);
		} catch (Exception e) {

			LOGGER.error("Error while submitVerificationCode.", e);
			throw new RuntimeException("Error while submitVerificationCode.", e);
		}

		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = format.parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			System.out.println("date:" + date);
			long duration = date.getTime() - forgetPwdVerificationCode.getTime().getTime();
			int time = (int) TimeUnit.MILLISECONDS.toMinutes(duration);
			 trial++; 
			if (time < 2) {

				if (verify.equals(forgetPwdVerificationCode.getCode())) {
					model = new ModelAndView("patient/setNewPwd");
					model.addObject("userName", userName);

				} else {
					model = new ModelAndView("patient/patientLoginPage");
					model.addObject("usrmessage", "invalid code");

				}
			} else {
				model = new ModelAndView("patient/patientLoginPage");
				model.addObject("usrmessage", "code expired");
			}

		} catch (Exception e) {
		}

		return model;

	}

	@RequestMapping(value = "/updtaePatientNewPassword", method = RequestMethod.GET)

	public @ResponseBody Info updtaePatientNewPassword(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");
		String userName = request.getParameter("userName");

		Info info = new Info();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", "" + userName);
		map.add("newPassword", "" + newPassword);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "changePatientPasswordByUserName", map,
					Info.class);
		} catch (Exception e) {

			LOGGER.error("Error while updtaePatientNewPassword.", e);
			throw new RuntimeException("Error updtaePatientNewPassword.", e);
		}
		return info;

	}*/

	@RequestMapping(value = "/ShowForgotPassword", method = RequestMethod.GET)

	public String ShowForgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
 
		model.addAttribute("msg",msg);
		msg="";
		return "patient/forgotpassword";

	}
	 
	@RequestMapping(value = "/searchUserNameForPatientForgotPassword", method = RequestMethod.POST)
	public String searchUserNameForPatientForgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
		String userName = request.getParameter("userName");

	 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		 
String returnString="redirect:/ShowForgotPassword";
		try {
			OtpSessionDetails otpSessionDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientByUserNameForForgotPassword",
					map, OtpSessionDetails.class);

			if (otpSessionDetails != null) {
				returnString = "patient/forgotPasswordOtp";
				 
				HttpSession session = request.getSession();
				 
				Calendar now = Calendar.getInstance();
				now.add(Calendar.MINUTE, 2);
				Date nowDateTime = now.getTime();
			 
				otpSessionDetails.setDate(nowDateTime);
				session.setAttribute("otpSessionDetails", otpSessionDetails);
				
				model.addAttribute("mobileNo",otpSessionDetails.getContactNo());
				
			} else {
				returnString="redirect:/ShowForgotPassword";
msg="User Name not found";
			}

		} catch (Exception e) {
			LOGGER.error("Error while fetching patient details by username in searchUserNameForPatientForgotPassword", e);
			throw new RuntimeException("Error while fetching patient details by username in searchUserNameForPatientForgotPassword",
					e);
		}
		return returnString;
	}
	@RequestMapping(value = "/verifyPatientOpt", method = RequestMethod.POST)
	public String verifyPatientOpt(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
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
						    	  returnString="patient/changePatientForgotPassword";
						    }
						    else
						    {
						    	 returnString="patient/forgotPasswordOtp";
						    	 
						    	 model.addAttribute("msg", "Invalid OTP Please Enter valid OTP");
						    }
						    
						    }
						    else {
						    	 returnString="patient/forgotPasswordOtp";
						    	 model.addAttribute("userName", otpSessionDetails.getUserName());
						    	 model.addAttribute("msg", "Time out");
						    }
						    
						    return returnString;
	}
	
	
	@RequestMapping(value = "/changePatientForgotPassword", method = RequestMethod.POST)

	public String changePatientForgotPassword(HttpServletRequest request, HttpServletResponse response) {

		String password=request.getParameter("password");
		HttpSession session = request.getSession();
		 
		OtpSessionDetails otpSessionDetails=(OtpSessionDetails)session.getAttribute("otpSessionDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + otpSessionDetails.getId());
		map.add("newPassword", "" + password);

		RestTemplate rest = new RestTemplate();

		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "changePatientPassword", map, Info.class);
			msg=info.getMessage();
		} catch (Exception e) {

			LOGGER.error("Error while change patient password in changePatientForgotPassword", e);
			throw new RuntimeException("Error while change patient password in changePatientForgotPassword", e);

		}
		
		return "redirect:/showPatientLoginPage";
	}
	
	@RequestMapping(value = "/userIdValidation", method = RequestMethod.GET)

	public @ResponseBody GetPatientContactDetailsById userIdValidation(HttpServletRequest request) {
		GetPatientContactDetailsById getPatientContactDetailsById = new GetPatientContactDetailsById();

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);

		RestTemplate rest = new RestTemplate();

		try {
			getPatientContactDetailsById = Constant.getRestTemplate().postForObject(
					Constant.url + "getGetPatientContactDetailsById", map, GetPatientContactDetailsById.class);
			System.out.println(getPatientContactDetailsById.toString());
		} catch (Exception e) {

			LOGGER.error("Error while userId.", e);
			throw new RuntimeException("Error while userId.", e);
		}
		return getPatientContactDetailsById;

	}

	@RequestMapping(value = "/sendOtp", method = RequestMethod.GET)

	public @ResponseBody Info sendOtp(HttpServletRequest request) {
		Info info = new Info();

		Random rand = new Random();

		int generatedOTP = rand.nextInt(1000000);

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		String mail = request.getParameter("email");
		map.add("generatedOTP", generatedOTP);
		map.add("mail", mail);
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(20 * 60);
		session.setAttribute("generatedOTP", generatedOTP);
		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "mailForSendOTP", map, Info.class);

		} catch (Exception e) {

			LOGGER.error("Error while userId.", e);
			throw new RuntimeException("Error while userId.", e);
		}
		return info;

	}

	@RequestMapping(value = "/submitOTPandUsernameAndPwd", method = RequestMethod.GET)

	public @ResponseBody Info submitOTPandUsernameAndPwd(HttpServletRequest request) {
		Info info = new Info();
		PatientDetails patientDetails = new PatientDetails();
		RestTemplate rest = new RestTemplate();

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		String username = request.getParameter("username");

		HttpSession session = request.getSession();
		int getOTP = (int) session.getAttribute("genOTP");

		String password = request.getParameter("password");

		int enterOtp = Integer.parseInt(request.getParameter("otp"));

		if (getOTP == enterOtp) {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId", patientId);
			try {
				patientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsByPatientId",
						map, PatientDetails.class);

				patientDetails.setUserName(username);
				patientDetails.setPassword(password);
				patientDetails.setBirthDate(DateConverter.convertToYMD(patientDetails.getBirthDate()));
				patientDetails.setRegDate(DateConverter.convertToYMD(patientDetails.getRegDate()));
				patientDetails.setFamilyId(0);
				info = Constant.getRestTemplate().postForObject(Constant.url + "insertPatientDetails", patientDetails,
						Info.class);

				info.setMessage("Username and Password Generate Successfully.");
			} catch (Exception e) {

				LOGGER.error("Error while userId.", e);
				throw new RuntimeException("Error while userId.", e);
			}

		} else {

			info.setMessage("Incorrect OTP");
		}

		return info;

	}

	@RequestMapping(value = "/verifyRegOTP", method = RequestMethod.GET)
	public @ResponseBody Info verifyRegOTP(HttpServletRequest request) {
		Info info = new Info();

		HttpSession session = request.getSession();
		int generatedOTP = (int) session.getAttribute("genOTP");
		int enteredOTP = Integer.parseInt(request.getParameter("enteredOTP"));
		if (generatedOTP == enteredOTP) {
			info.setError(true);
			info.setMessage("Mobile Number Verified successfully");
		}

		return info;

	}

	@RequestMapping(value = "/showPatientTermsnCondition", method = RequestMethod.GET)

	public ModelAndView ShowTermsnCondition(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/terms&condition");
		List<TermsAndConditions> termsConditionDetailsList = new ArrayList<>();
		int userType = 2;
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userType", userType);
		try {
			termsConditionDetailsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getTermsAndConditionByUserType", map, List.class);
			model.addObject("termsConditionDetailsList", termsConditionDetailsList);
			System.out.println(termsConditionDetailsList.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;

	}

	// Contact Number Validation
	@RequestMapping(value = "/verifyPatientEmail", method = RequestMethod.GET)

	public @ResponseBody Info verifyEmail(HttpServletRequest request) {
		Info info = new Info();

		String email = request.getParameter("email");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("email", email);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "verifyPatientEmail", map, Info.class);
			System.out.println("" + info.getMessage());

		} catch (Exception e) {
			LOGGER.error("Error while validating doctor mobile number in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	/* Doctor Registration form */

	// Contact Number Validation
	@RequestMapping(value = "/verifyPatientContactNumber", method = RequestMethod.GET)

	public @ResponseBody Info verifyContactNumber(HttpServletRequest request) {
		Info info = new Info();

		String contactNo = request.getParameter("contactNo");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("contactNo", contactNo);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "verifyPatientContactNumber", map,
					Info.class);
			System.out.println("" + info.getMessage());

		} catch (Exception e) {
			LOGGER.error("Error while validating doctor mobile number in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	@RequestMapping(value = "/getPatientNotification", method = RequestMethod.GET)
	public @ResponseBody List<PatientNotification> getPatientNotification(HttpServletRequest request) {

		RestTemplate rest = new RestTemplate();
		List<PatientNotification> patientNotificationList = new ArrayList<PatientNotification>();
		try {

			HttpSession session = request.getSession();
			PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("familyId", "" + patientDetails.getFamilyId());
			patientNotificationList = Constant.getRestTemplate().postForObject(Constant.url + "getPatientNotification",
					map, List.class);

		} catch (Exception e) {
			LOGGER.error("Error while fetching Patient Notification", e);
			throw new RuntimeException("Error while fetching Patient Notification", e);
		}
		return patientNotificationList;
	}

	@RequestMapping(value = "/changePatientNotificationStatus", method = RequestMethod.GET)
	public @ResponseBody int changePatientNotificationStatus(HttpServletRequest request) {
		int notificationId = Integer.parseInt(request.getParameter("notificationId"));
		int res = 0;
		try {
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("notificationId", notificationId);
			res = Constant.getRestTemplate().postForObject(Constant.url + "changePatientNotificationStatus", map,
					Integer.class);
		} catch (Exception e) {
			LOGGER.error("Error while Updating Patient Notification status", e);
			throw new RuntimeException("Error while Updating Patient Notification status", e);
		}
		return res;
	}

	@RequestMapping(value = "/showAllPatientNotification", method = RequestMethod.GET)
	public ModelAndView showAllPatientNotification(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("patient/notification");

		RestTemplate rest = new RestTemplate();
		List<PatientNotification> patientNotificationList = new ArrayList<PatientNotification>();
		try {

			HttpSession session = request.getSession();
			PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId", "" + patientDetails.getPatientId());
			patientNotificationList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getAllPatientNotification", map, List.class);

			model.addObject("patientNotificationList", patientNotificationList);
		} catch (Exception e) {
			LOGGER.error("Error while fetching Patient Notification", e);
			throw new RuntimeException("Error while fetching Patient Notification", e);
		}

		return model;

	}

	@RequestMapping(value = "/ShowFeedBack", method = RequestMethod.GET)

	public ModelAndView ShowFeedBack(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/feedback");

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int familyId = patientDetail.getFamilyId();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("familyId", "" + familyId);

		GetDocAndLabForRating getDocAndLabForRating = new GetDocAndLabForRating();

		RestTemplate rest = new RestTemplate();

		try {
			getDocAndLabForRating = Constant.getRestTemplate().postForObject(Constant.url + "DoctorsAndLabsForRating",
					map, GetDocAndLabForRating.class);
			model.addObject("getDocAndLabForRating", getDocAndLabForRating);
		} catch (Exception e) {

			LOGGER.error("Error while ShowFeedBack in patientController.", e);
			throw new RuntimeException("Error while ShowFeedBack in patientController.", e);
		}

		return model;

	}

	@RequestMapping(value = "/showLabInvoice", method = RequestMethod.GET)

	public ModelAndView showLabInvoice(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/lab-invoice");
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientDetail.getPatientId());
		// ReportDetails reportDetails=new ReportDetails();
		List<PateintReportPaymentDetails> pateintReportPaymentDetailsList = Constant.getRestTemplate()
				.postForObject(Constant.url + "getLabPaymentInvoice", map, List.class);

		System.out.println("dsxs" + pateintReportPaymentDetailsList.toString());
		model.addObject("pateintReportPaymentDetailsList", pateintReportPaymentDetailsList);
		return model;

	}
	
	@RequestMapping(value="/updatePatientProfilesPhoto", method=RequestMethod.POST)

	public String updatePatientProfilesPhoto(HttpServletRequest request,HttpServletResponse response,@RequestParam("profilePhoto") List<MultipartFile> profilePhoto)
	{
		String url=null;	
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		
		
		Info info=new Info();
		String profilePhotoName=null;
		
		RestTemplate rest=new RestTemplate();
		try {
			
				VpsImageUpload vpsImageUpload=new VpsImageUpload();
				profilePhotoName=profilePhoto.get(0).getOriginalFilename();
				
			   vpsImageUpload.saveUploadedFiles(profilePhoto,2, profilePhotoName,patientDetail.getPatientId());
				
				 
			    MultiValueMap<String, Object> mapUpload=new LinkedMultiValueMap<String, Object>();
			    mapUpload.add("files",profilePhoto);
			    mapUpload.add("userId",patientDetail.getPatientId());
			    mapUpload.add("imageType",1);
			    mapUpload.add("imageName",profilePhotoName);
			    
			    MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			    map.add("patientId",patientDetail.getPatientId());
			    map.add("profilePhotoName",profilePhotoName);
			   
			  //  info=rest.postForObject(Constant.url+"uploadFile",mapUpload,Info.class);
			    
			    info=Constant.getRestTemplate().postForObject(Constant.url+"updatePatientProfilePic",map,Info.class);
			    
			
		} catch (Exception e) {
			 
			LOGGER.error("Error while update patient profile picture in updatePatientProfilesPhoto",e);
			throw new RuntimeException("Error while update patient profile picture in updatePatientProfilesPhoto",e);
		}
		return "redirect:/showPatientHomePage";
	}
	
	@RequestMapping(value="/showPatientBankDetl", method=RequestMethod.GET)

	 public ModelAndView showPatientBankDetl(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("patient/patientBankDetails");
	 	try {
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId",patientDetail.getPatientId());
			PatientBankAccountInfo patientBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getPatientBankDetails", map,
					PatientBankAccountInfo.class);
			model.addObject("patientBankAccountInfo", patientBankAccountInfo);
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}
	 	
	 	return model;
	 	
	 }
	
	@RequestMapping(value = "/showAddEditPatientBankDetails", method = RequestMethod.GET)
	public ModelAndView showAddEditPatientBankDetails(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("patient/addEditBankDetails");
		try {
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId",patientDetail.getPatientId());
			PatientBankAccountInfo patientBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getPatientBankDetails", map,
					PatientBankAccountInfo.class);
			model.addObject("patientBankAccountInfo", patientBankAccountInfo);
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}

		return model;
	}
	
	@RequestMapping(value = "/submitPatientBankDetails", method = RequestMethod.POST)
	public String submitPatientBankDetails(HttpServletRequest request, Model model) {

		try {
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
			PatientBankAccountInfo patientBankAccountInfo = new PatientBankAccountInfo();
			try {
				patientBankAccountInfo.setId(Integer.parseInt(request.getParameter("id")));
			} catch (Exception e) {
				
			}
			patientBankAccountInfo.setPatientId(patientDetail.getPatientId());
			patientBankAccountInfo.setAccHolderName(request.getParameter("accHolderName"));
			patientBankAccountInfo.setAccountNo(request.getParameter("accountNo"));
			patientBankAccountInfo.setBankBranch(request.getParameter("bankBranch"));
			patientBankAccountInfo.setBankName(request.getParameter("bankName"));
			patientBankAccountInfo.setDelStatus(0);
			patientBankAccountInfo.setGstNo(request.getParameter("gstNo"));
			patientBankAccountInfo.setIfscCode(request.getParameter("ifscCode"));
			patientBankAccountInfo.setPanNo(request.getParameter("panNo"));
			System.out.println("patientBankAccountInfo"+patientBankAccountInfo.toString());
			
			PatientBankAccountInfo patientBankAccountInfoRes = Constant.getRestTemplate().postForObject(
					Constant.url + "insertPatientBankDetails", patientBankAccountInfo, PatientBankAccountInfo.class);
			//model.addAttribute("patientBankAccountInfo", patientBankAccountInfoRes);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
		}

		return "redirect:/showPatientHomePage";
	}
	
	
	
	@RequestMapping(value = "/checkBankDetailsOfPatient", method = RequestMethod.GET)
	public @ResponseBody PatientBankAccountInfo checkBankDetailsOfPatient(HttpServletRequest request) {
		PatientBankAccountInfo patientBankAccountInfo=new PatientBankAccountInfo();
		try {
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId",patientDetail.getPatientId());
			
			
			 patientBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getPatientBankDetails", map,
					PatientBankAccountInfo.class);
			
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}

		return patientBankAccountInfo;
	}
	
	
	@RequestMapping(value = "/checkBankDetailsOfDoctor", method = RequestMethod.GET)
	public @ResponseBody DoctorBankAccountInfo checkBankDetailsOfDoctor(HttpServletRequest request) {
		DoctorBankAccountInfo doctorBankAccountInfo=new DoctorBankAccountInfo();
		try {
			HttpSession session = request.getSession();
			DoctorDetails doctorDetail = (DoctorDetails) session.getAttribute("doctorDetails");
		
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId",doctorDetail.getDoctorId());
			
			
			doctorBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorBankDetails", map,
					DoctorBankAccountInfo.class);
			
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}

		return doctorBankAccountInfo;
	}
	
	@RequestMapping(value = "/checkBankDetailsOfLab", method = RequestMethod.GET)
	public @ResponseBody LabBankAccountInfo checkBankDetailsOfLab(HttpServletRequest request) {
		LabBankAccountInfo labBankAccountInfo=new LabBankAccountInfo();
		try {
			HttpSession session = request.getSession();
			LabDetails labDetail = (LabDetails) session.getAttribute("labDetails");
		
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labId",labDetail.getLabId());
			
			
			labBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getLabBankDetails", map,
					LabBankAccountInfo.class);
			
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}

		return labBankAccountInfo;
	}
	
	@RequestMapping(value = "/checkBankDetailsOfPharmacy", method = RequestMethod.GET)
	public @ResponseBody PharmacyBankAccountInfo checkBankDetailsOfPharmacy(HttpServletRequest request) {
		PharmacyBankAccountInfo pharmacyBankAccountInfo=new PharmacyBankAccountInfo();
		try {
			HttpSession session = request.getSession();
			MedicalDetails medicalDetail = (MedicalDetails) session.getAttribute("medicalDetails");
		
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("medicalId",medicalDetail.getMedicalId());
			
			
			pharmacyBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getPharmacyBankDetails", map,
					PharmacyBankAccountInfo.class);
			
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}

		return pharmacyBankAccountInfo;
	}
	
	@RequestMapping(value = "/addRequestForMoneyTransfer", method = RequestMethod.GET)
	public @ResponseBody BankTransferRequest addRequestForTransfer(HttpServletRequest request) {
	
		BankTransferRequest bankTransferRequest=new BankTransferRequest();
		
		try {
			bankTransferRequest.setUserId(Integer.parseInt(request.getParameter("userId")));
			bankTransferRequest.setRequestAmount(Float.parseFloat(request.getParameter("amount")));
			bankTransferRequest.setEntryBy(0);
			bankTransferRequest.setStatus(0);
			bankTransferRequest.setTransactionId("0");
			bankTransferRequest.setTransactionType(0);
			bankTransferRequest.setUserType(Integer.parseInt(request.getParameter("userType")));
			bankTransferRequest.setWalletId(Integer.parseInt(request.getParameter("wallId")));
			
			System.out.println("bankTransferRequest="+bankTransferRequest.toString());
			
			bankTransferRequest = Constant.getRestTemplate().postForObject(Constant.url + "insertWalletMoneyBankTransferRequest", bankTransferRequest,
					BankTransferRequest.class);
			
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}

		return bankTransferRequest;
	}
	
	
}
