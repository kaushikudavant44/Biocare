package com.bionische.biocare.lab.controller;

import java.io.IOException;
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

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.common.s3.AmazonS3ClientService;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.GetDoctorRatingReviewCount;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.GetLabRatingReview;
import com.bionische.biocare.lab.model.LabAppOfLastThirtyDays;
import com.bionische.biocare.lab.model.LabAppointmentCount;
import com.bionische.biocare.lab.model.LabBankAccountInfo;
import com.bionische.biocare.lab.model.LabCertificateDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.lab.model.LabLogin;
import com.bionische.biocare.lab.model.LabNotification;
import com.bionische.biocare.lab.model.LabTests;
import com.bionische.biocare.lab.model.LabTestsList;
import com.bionische.biocare.lab.model.RadiologistPndtDetails;
import com.bionische.biocare.lab.model.TestsInLab;
import com.bionische.biocare.model.OtpSessionDetails;
import com.bionische.biocare.model.PackageDetails;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.ForgetPwdVerificationCode;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.patient.model.TermsAndConditions;
import com.bionische.biocare.patientdoctor.model.AppointmentTime;
import com.bionische.biocare.patientdoctor.model.GetRatingCount;
import com.bionische.biocare.pharmacy.model.PharmacyCertificateDetails;
import com.bionische.biocare.radiology.controller.PNDTPatientDetailsController;
import com.bionische.biocare.radiology.model.PNDTPatientDetails;

@Scope("session")
@Controller
public class LabController {
	
	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	List<LabTests> labTestsList = new ArrayList<LabTests>();

	RestTemplate rest = new RestTemplate();
	List<City> cityList;
	List<State> stateList;
	LabDetails labForgetPwdDetails;
	GetDoctorRatingReviewCount getDoctorRatingReviewCount;
	String msg;
	private LabDetails labDetailsRes;
//	private HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	private static final Logger logger = LoggerFactory.getLogger(LabController.class);

	public static String labSubscriptionExpiryDate;

	@RequestMapping(value = "/showLabLoginPage", method = RequestMethod.GET)
	public ModelAndView showLabLoginPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("lab/labLoginPage");
		return model;
	}

	@RequestMapping(value = "/showLabRegistration", method = RequestMethod.GET)
	public ModelAndView showLabRegistration(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("lab/labRegistration");
		return model;
	}

	@RequestMapping(value = "/showPndtUserNamePassword", method = RequestMethod.GET)

	public ModelAndView showPndtUserNamePassword(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		ModelAndView model = new ModelAndView("lab/generateOTP");

		String mobileNumber = labDetails.getContact();

		String mobileLast4Digit = mobileNumber.substring(mobileNumber.length() - 4, mobileNumber.length());

		System.out.println("Mobile Number" + mobileLast4Digit);
		model.addObject("labDetails", labDetails);
		model.addObject("mobileNumber", mobileLast4Digit);
		return model;

	}

	@RequestMapping(value = "/saveRadiologistPndtUsernameAndPassword", method = RequestMethod.POST)

	public String savePndtUserNamePassword(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		ModelAndView model = new ModelAndView("lab/pndtUserDetails");
		RadiologistPndtDetails radiologistPndtDetails = new RadiologistPndtDetails();
		try {
			radiologistPndtDetails.setId(Integer.parseInt(request.getParameter("id")));
		} catch (Exception e) {

		}
		radiologistPndtDetails.setPassword(request.getParameter("password"));
		radiologistPndtDetails.setUserName(request.getParameter("userName"));
		radiologistPndtDetails.setLabId(labDetails.getLabId());
		try {

			radiologistPndtDetails = Constant.getRestTemplate().postForObject(
					Constant.url + "insertRadiologistUserNameAndPassword", radiologistPndtDetails,
					RadiologistPndtDetails.class);

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "redirect:/showPndtUserNamePassword";

	}

	@RequestMapping(value = "/verifyRegisterOTP", method = RequestMethod.POST)
	public ModelAndView verifyRegOTP(HttpServletRequest request) {

		HttpSession session1 = request.getSession();
		LabDetails labDetails = (LabDetails) session1.getAttribute("labDetails");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", labDetails.getLabId());
		RadiologistPndtDetails radiologistPndtDetails = Constant.getRestTemplate().postForObject(
				Constant.url + "getRadiologistUserNameAndPasswordByLabId", map, RadiologistPndtDetails.class);
		ModelAndView model;

		HttpSession session = request.getSession();
		int generatedOTP = (int) session.getAttribute("genOTP");
		int enteredOTP = Integer.parseInt(request.getParameter("otp"));
		if (generatedOTP == enteredOTP) {

			model = new ModelAndView("lab/pndtUserDetails");
			model.addObject("radiologistPndtDetails", radiologistPndtDetails);
		} else {
			String message = "Invalid otp";
			model = new ModelAndView("lab/generateOTP");
			model.addObject("msg", message);
		}

		return model;

	}

	// Username Validation
	@RequestMapping(value = "/usernameValidationOfLab", method = RequestMethod.GET)
	public @ResponseBody Info usernameValidationOfLab(HttpServletRequest request) {
		Info info = new Info();
		String userName = request.getParameter("userName");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);
		RestTemplate rest = new RestTemplate();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "usernameValidationOfLab", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while Validating userName Lab ", e);
			throw new RuntimeException("Error while Validating userName Lab ", e);
		}
		return info;

	}

	@RequestMapping(value = "/submitLabRegProcess", method = RequestMethod.POST)
	public String submitLabRegProcess(HttpServletRequest request) {

		LabDetails labDetails = new LabDetails();

		labDetails.setLabName(request.getParameter("labName"));
		labDetails.setEmail(request.getParameter("email"));
		labDetails.setContact(request.getParameter("contactNo"));
		labDetails.setPassword(request.getParameter("password"));
		labDetails.setUserName(request.getParameter("userName"));
		try {
			labDetails.setIsRadiologist(Integer.parseInt(request.getParameter("isRadiologist")));
		} catch (Exception e) {
			labDetails.setIsRadiologist(0);
		}

		labDetails.setInt1(0);
		labDetails.setInt2(0);
		labDetails.setInt3(0);
		labDetails.setString1("");
		labDetails.setString2("");
		labDetails.setString3("");
		labDetails.setDelStatus(2);
		labDetails.setTeststypes("0");

		HttpSession session = request.getSession();
		session.setAttribute("labDetails", labDetails);

		LabDetails labDetailsRes = new LabDetails();
		RestTemplate rest = new RestTemplate();
		try {
			labDetailsRes = Constant.getRestTemplate().postForObject(Constant.url + "insertLabDetails", labDetails,
					LabDetails.class);
		} catch (Exception e) {
			logger.error("Error while submit Lab Registration Process  ", e);
			throw new RuntimeException("Error while submit Lab Registration Process ", e);
		}
		return "redirect:/showLabLoginPage";

	}

	@RequestMapping(value = "/showEditLabProfile", method = RequestMethod.GET)
	public ModelAndView showEditLabProfile(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("lab/editLabProfile");
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labId", labDetails.getLabId());
			labDetailsRes = Constant.getRestTemplate().postForObject(Constant.url + "getLabDetailsById", map,
					LabDetails.class);

			MultiValueMap<String, Object> mapState = new LinkedMultiValueMap<String, Object>();
			mapState.add("countryId", labDetailsRes.getCountryId());
			/*
			 * MultiValueMap<String, Object> mapLabId = new LinkedMultiValueMap<String,
			 * Object>();
			 */
			LabTestsList labTestList = new LabTestsList();
			stateList = Constant.getRestTemplate().postForObject(Constant.url + "getAllStateByCountryId", mapState,
					List.class);
			MultiValueMap<String, Object> mapCity = new LinkedMultiValueMap<String, Object>();
			mapCity.add("stateId", labDetailsRes.getStateId());
			cityList = Constant.getRestTemplate().postForObject(Constant.url + "getAllCityByStateId", mapCity,
					List.class);
			labTestList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests", LabTestsList.class);
			// LabTestsList labTestList = res.getBody();

			List<AppointmentTime> appointmentTime = Constant.getRestTemplate()
					.getForObject(Constant.url + "/getAllAppointmentTimeList", List.class);
			// List<AppointmentTime> appointmentTime = result.getBody();

			model.addObject("labTestList", labTestList.getLabTestsList());
			model.addObject("countryList", HomeController.countryList);
			model.addObject("stateList", stateList);
			model.addObject("cityList", cityList);

			model.addObject("labName", labDetailsRes.getLabName());
			model.addObject("ownerName", labDetailsRes.getOwner());
			model.addObject("contactNo", labDetailsRes.getContact());
			model.addObject("email", labDetailsRes.getEmail());
			model.addObject("address", labDetailsRes.getAddress());
			model.addObject("cityId", labDetailsRes.getCityId());
			model.addObject("stateId", labDetailsRes.getStateId());
			model.addObject("countryId", labDetailsRes.getCountryId());
			model.addObject("pinCode", labDetailsRes.getInt3());
			model.addObject("licenseNo", labDetailsRes.getLicenceNo());
			model.addObject("fromTime", labDetailsRes.getFromTime());
			model.addObject("toTime", labDetailsRes.getToTime());
			model.addObject("delStatus", labDetailsRes.getDelStatus());
			model.addObject("appointmentTime", appointmentTime);
			model.addObject("labId", labDetailsRes.getLabId());
			model.addObject("signature", labDetailsRes.getString1());

			try {

				LabCertificateDetails labCertificateDetails = Constant.getRestTemplate()
						.postForObject(Constant.url + "/getLabCertificate", map, LabCertificateDetails.class);
				model.addObject("certificate", labCertificateDetails.getCetrificate());
			} catch (Exception e) {
				// TODO: handle exception
			}

			model.addObject("labUrl", Constant.labUrl);
		} catch (Exception e) {
			logger.error("Error while show Edit Lab Profile ", e);
			throw new RuntimeException("Error while  show Edit Lab Profile ", e);
		}
		return model;
	}

	/*
	 * @RequestMapping(value = "/showUpdateLabProfile", method = RequestMethod.GET)
	 * 
	 * public ModelAndView showUpdateLabProfile(HttpServletRequest request) {
	 * 
	 * ModelAndView model = new ModelAndView("lab/updateLabProfile");
	 * 
	 * HttpSession session = request.getSession(); LabDetails labDetails =
	 * (LabDetails) session.getAttribute("labDetails");
	 * 
	 * MultiValueMap<String, Object> mapState = new LinkedMultiValueMap<String,
	 * Object>(); mapState.add("countryId", labDetails.getCountryId());
	 * 
	 * List<Country> countryList = rest.getForObject(Constant.url + "getAllCountry",
	 * List.class); stateList = rest.postForObject(Constant.url +
	 * "getAllStateByCountryId", mapState, List.class);
	 * 
	 * MultiValueMap<String, Object> mapCity = new LinkedMultiValueMap<String,
	 * Object>(); mapCity.add("stateId", labDetails.getStateId());
	 * 
	 * cityList = rest.postForObject(Constant.url + "getAllCityByStateId", mapCity,
	 * List.class);
	 * 
	 * LabTestsList labTestList = rest.getForObject(Constant.url + "getAllLabTests",
	 * LabTestsList.class);
	 * 
	 * model.addObject("labDetails", labDetails); model.addObject("labTestList",
	 * labTestList.getLabTestsList()); model.addObject("countryList", countryList);
	 * model.addObject("stateList", stateList); model.addObject("cityList",
	 * cityList); model.addObject("uName", labDetails.getUserName());
	 * model.addObject("password", labDetails.getPassword());
	 * 
	 * return model;
	 * 
	 * }
	 */
	@RequestMapping(value = "/updateLabProfilesProcess", method = RequestMethod.POST)
	public String updateLabProfilesProcess(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("certificatePhoto") List<MultipartFile> certificatePhoto,
			@RequestParam("signaturePhoto") List<MultipartFile> signaturePhoto) {

		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

		labDetailsRes.setLabName(request.getParameter("labName"));
		labDetailsRes.setOwner(request.getParameter("owner"));
		labDetailsRes.setLicenceNo(request.getParameter("licenceNo"));
		labDetailsRes.setContact(request.getParameter("contact"));
		labDetailsRes.setEmail(request.getParameter("email"));
		labDetailsRes.setLatitude(9);
		labDetailsRes.setLongitude(5);
		labDetailsRes.setCountryId(Integer.parseInt(request.getParameter("countryId")));
		labDetailsRes.setStateId(Integer.parseInt(request.getParameter("stateId")));
		labDetailsRes.setCityId(Integer.parseInt(request.getParameter("cityId")));
		labDetailsRes.setAddress(request.getParameter("address"));
		labDetailsRes.setFromTime(request.getParameter("fromTime"));
		labDetailsRes.setToTime(request.getParameter("toTime"));
		// labDetailsRes.setString1(labDetails.getString1()); //Signature
		labDetailsRes.setString2("1");
		labDetailsRes.setString3("1");
		labDetailsRes.setInt1(0);
		labDetailsRes.setInt2(0);
		labDetailsRes.setInt3(Integer.parseInt(request.getParameter("pincode")));

		String signature = labDetails.getString1();
		try {
			signaturePhoto.get(0).getOriginalFilename();
			signature = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date()) + labDetailsRes.getLabId()
					+ VpsImageUpload.getFileExtension(signaturePhoto.get(0));

		} catch (Exception e) {
			signature = labDetails.getString1();
			// TODO: handle exception
		}
		labDetailsRes.setString1(signature); // Signature

		try {
			labDetailsRes = Constant.getRestTemplate().postForObject(Constant.url + "insertLabDetails", labDetailsRes,
					LabDetails.class);

			session.setAttribute("labDetails", labDetailsRes);
		} catch (Exception e) {
			logger.error("Error while updating Lab Profiles Process", e);
			throw new RuntimeException("Error while updating Lab Profiles Process", e);
		}

		try {
			/*
			 * int status=Integer.parseInt(request.getParameter("uploadCertificateStatus"));
			 */

			LabCertificateDetails labCertificateDetails = new LabCertificateDetails();
			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			String certificatePhotoName = null;
			try {

				certificatePhotoName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
						+ labDetailsRes.getLabId() + VpsImageUpload.getFileExtension(certificatePhoto.get(0));
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				//vpsImageUpload.saveUploadedFiles(certificatePhoto, 11, signature, labDetailsRes.getLabId());

				//amazonS3ClientService.uploadFileToS3Bucket(certificatePhoto.get(0),certificatePhotoName,"lab/" + labDetails.getLabId() + "/signature/", true);
				   
				 			   amazonS3ClientService.uploadFileToS3Bucket(certificatePhoto.get(0),certificatePhotoName,"lab/" + labDetails.getLabId() + "/documents/", true);
					
					 
			} catch (Exception e) {
				// TODO: handle exception
			}
			labCertificateDetails.setCetrificate(certificatePhotoName);
			labCertificateDetails.setLabId(labDetailsRes.getLabId());
			labCertificateDetails.setString1(" ");
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "insertLabCertificateDetails",
					labCertificateDetails, Info.class);

		} catch (Exception e) {

			logger.error("Error while updating lab cirtificate details processing in updateLabProfilesProcess", e);
			throw new RuntimeException("Error while updating doctor details processing in updateLabProfilesProcess", e);

		}

		return "redirect:/showLabHomePage";
	}

	@RequestMapping(value = "/labLoginProcess", method = RequestMethod.GET)
	public @ResponseBody Info patientLoginProcess(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String token = request.getParameter("token");
		String returnUrl = "w";
		Info info1 = new Info();
		HttpSession session = request.getSession();
		LabLogin labLogin = new LabLogin();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("userName", userName);
			map.add("password", password);
			map.add("token", token);
			labLogin = Constant.getRestTemplate().postForObject(Constant.url + "labLoginProcess", map, LabLogin.class);

			if (!labLogin.getInfo().isError()) {
				labSubscriptionExpiryDate = labLogin.getLabSuscriptionInfo().getMessage();

				if (!labLogin.getLabSuscriptionInfo().isError()) {
					session.setAttribute("labDetails", labLogin.getLabDetails());
					session.setAttribute("userType", Constant.LAB_USER_TYPE);
					if (labLogin.getLabDetails().getCityId() != 0) {
						returnUrl = new String("showLabHomePage");
						info1.setError(false);
						info1.setMessage("showLabHomePage");
						if (labLogin.getLabDetails().getDelStatus() != 0) {
							returnUrl = new String("showLabVerificationPendingPage");
							info1.setError(false);
							info1.setMessage("showLabVerificationPendingPage");

							if (labLogin.getLabDetails().getDelStatus() == 3) {
								returnUrl = new String("showLabVerificationRejectPage");
								info1.setError(false);
								info1.setMessage("showLabVerificationRejectPage");

							}
						}

					} else {
						returnUrl = new String("showEditLabProfile");
						info1.setError(false);
						info1.setMessage("showEditLabProfile");
					}
				} else {

					session.setAttribute("tempDetails", labLogin.getLabDetails());
					returnUrl = new String("showLabSuscriptionPage");
					info1.setError(false);
					info1.setMessage("showLabSuscriptionPage");
				}
			} else {
				info1.setError(true);
				info1.setMessage("wrong");
			}
		} catch (Exception e) {
			logger.error("Error while Lab Loging Process", e);
			throw new RuntimeException("Error while  Lab Loging Process", e);
		}
		return info1;
	}

	@RequestMapping(value = "/showLabVerificationPendingPage", method = RequestMethod.GET)
	public String showLabVerificationPendingPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "verificationPending";
		
	}

	@RequestMapping(value = "/showLabVerificationRejectPage", method = RequestMethod.GET)
	public String showLabVerificationRejectPage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("labId", labDetails.getLabId());
		LabCertificateDetails labCertificateDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "/getLastRejectLabCertificate", map, LabCertificateDetails.class);
		model.addAttribute("submitUrl", "uploadLabCertificateProcess");
		model.addAttribute("certificateDetails", labCertificateDetails);
		session.invalidate();
		return "reverification";
	}

	@RequestMapping(value = "/uploadLabCertificateProcess", method = RequestMethod.POST)

	public String uploadLabCertificateProcess(HttpServletRequest request,
			@RequestParam("certificatePhoto") List<MultipartFile> certificatePhoto) {

		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		try {

			LabCertificateDetails labCertificateDetails = new LabCertificateDetails();
			VpsImageUpload vpsImageUpload = new VpsImageUpload();

			String certificatePhotoName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
					+ labDetails.getLabId() + VpsImageUpload.getFileExtension(certificatePhoto.get(0));

			//vpsImageUpload.saveUploadedFiles(certificatePhoto, 8, certificatePhotoName, labDetails.getLabId());

			
			   amazonS3ClientService.uploadFileToS3Bucket(certificatePhoto.get(0),certificatePhotoName,"lab/" + labDetails.getLabId() + "/documents/", true);
				
			   
			labCertificateDetails.setCetrificate(certificatePhotoName);
			labCertificateDetails.setLabId(labDetails.getLabId());
			labCertificateDetails.setString1(" ");
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "insertLabCertificateDetails",
					labCertificateDetails, Info.class);

		} catch (Exception e) {
			logger.error("Error while upload lab Certificate  processing in uploadLabCertificateProcess", e);
			throw new RuntimeException("Error while upload Lab Certificate  processing in uploadLabCertificateProcess",
					e);
		}
		return "redirect:/showLabVerificationPendingPage";
	}

	@RequestMapping(value = "/showLabSuscriptionPage", method = RequestMethod.GET)
	public String showLabSuscriptionPage(HttpServletRequest request, Model model) {

		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("userType", 3);
			List<PackageDetails> packageDetailsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getCurrentPackageDetailsByUserType", map, List.class);
			model.addAttribute("packageDetailsList", packageDetailsList);

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("Error while getting doctor Packge details", e);
			throw new RuntimeException("Error while getting doctor Packge details", e);
		}

		return "lab/lab_suscription_payment/labPackageDetails";
	}

	@RequestMapping(value = "/showLabHomePage", method = RequestMethod.GET)
	public ModelAndView showLabHome(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("lab/labHomePage");
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		LabDetails labDetailsInfo = new LabDetails();
		getDoctorRatingReviewCount = new GetDoctorRatingReviewCount();

		model.addObject("labProfileImage", Constant.labProfileImage);
		List<GetLabRatingReview> getLabRatingReviewList = new ArrayList<GetLabRatingReview>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", "" + labDetails.getLabId());
		try {
			labDetailsInfo = Constant.getRestTemplate().postForObject(Constant.url + "getLabDetailsById", map,
					LabDetails.class);
			if (labDetailsInfo.getDelStatus() != 0) {
				model = new ModelAndView("verificationPending");
				return model;
			}
			getDoctorRatingReviewCount = Constant.getRestTemplate()
					.postForObject(Constant.url + "getLabReviewByLabIdForLab", map, GetDoctorRatingReviewCount.class);

			LabBankAccountInfo labBankAccountInfo = Constant.getRestTemplate()
					.postForObject(Constant.url + "getLabBankDetails", map, LabBankAccountInfo.class);
			model.addObject("labBankAccountInfo", labBankAccountInfo);

			/* int totalPatient=getDoctorRatingReviewCount.getLabRatingDetails().size(); */
			GetRatingCount getRatingCount = Constant.getRestTemplate()
					.postForObject(Constant.url + "getLabRatingByLabId", map, GetRatingCount.class);

			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("userId", labDetails.getLabId());
			map1.add("userType", 2);
			WalletDetails walletDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getUserWalletDetails", map1, WalletDetails.class);

			model.addObject("walletDetails", walletDetails);

			model.addObject("getReviewCount", "3");
			model.addObject("rating", getRatingCount.getRating());
			model.addObject("totalPatient", getRatingCount.getCount());
			model.addObject("getDoctorRatingReviewCount", getDoctorRatingReviewCount);
			model.addObject("ratingReviews", getDoctorRatingReviewCount.getLabRatingDetails());
			model.addObject("labDetails", labDetailsInfo);

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = new Date();
			
			

			Date expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(DateConverter.convertToYMD(labSubscriptionExpiryDate));

			

			Date dateBeforeFiveDays = new Date(expiryDate.getTime() - 5 * 24 * 3600 * 1000);

			if (currentDate.equals(dateBeforeFiveDays) || currentDate.after(dateBeforeFiveDays)) {
				model.addObject("getExpiryDate", labSubscriptionExpiryDate);

				model.addObject("endDate", expiryDate);
				model.addObject("subscriptionAlertStart", "0");

			}

			try {

				LabCertificateDetails labCertificateDetails = Constant.getRestTemplate()
						.postForObject(Constant.url + "/getLabCertificate", map, LabCertificateDetails.class);
				model.addObject("certificate", labCertificateDetails.getCetrificate());
				model.addObject("labUrl", Constant.labUrl);
			} catch (Exception e) {
				// TODO: handle exception
			}

		} catch (Exception e) {
			logger.error("Error while show Lab Home Page", e);
			throw new RuntimeException("Error while show Lab HomePage", e);
		}
		model.addObject("profileActive", "active");
		return model;
	}

	@RequestMapping(value = "/showLabChangePassword", method = RequestMethod.GET)
	public ModelAndView showLabChangePassword(HttpServletRequest request) {
		return new ModelAndView("lab/changePassword");
	}

	@RequestMapping(value = "/labPasswordValidation", method = RequestMethod.GET)
	public @ResponseBody Info passwordValidation(HttpServletRequest request) {
		Info info = new Info();
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		String password = request.getParameter("password");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", "" + labId);
		map.add("password", password);
		RestTemplate rest = new RestTemplate();
		try {

			info = Constant.getRestTemplate().postForObject(Constant.url + "passwordLabValidation", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while lab Password Validation", e);
			throw new RuntimeException("Error lab Password Validation", e);
		}
		return info;
	}

	@RequestMapping(value = "/changeLabPassword", method = RequestMethod.GET)
	public @ResponseBody Info changePatientPassword(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		Info info = new Info();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", "" + labId);
		map.add("newPassword", "" + newPassword);
		RestTemplate rest = new RestTemplate();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "changeLabPassword", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while Changing lab Password ", e);
			throw new RuntimeException("Error Changing lab Password ", e);
		}
		return info;
	}

	/*
	 * @RequestMapping(value = "/ShowLabForgotPassword", method = RequestMethod.GET)
	 * 
	 * public ModelAndView ShowLabForgotPassword(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * ModelAndView model = new ModelAndView("lab/labLoginPage"); String userName =
	 * request.getParameter("userName"); MultiValueMap<String, Object> map = new
	 * LinkedMultiValueMap<String, Object>(); map.add("userName", userName);
	 * RestTemplate rest = new RestTemplate(); try { labForgetPwdDetails =
	 * Constant.getRestTemplate().postForObject(Constant.url +
	 * "getLabDetailsByUsrname", map, LabDetails.class); if (labForgetPwdDetails !=
	 * null) { model = new ModelAndView("lab/forgotpassword");
	 * model.addObject("email", labForgetPwdDetails.getEmail());
	 * model.addObject("userName",userName); } else { model = new
	 * ModelAndView("labLoginPage"); model.addObject("usrmessage",
	 * "please enter user name"); } } catch (Exception e) {
	 * logger.error("Error while show lab Forgot Password ", e); throw new
	 * RuntimeException("Error  show lab Forgot Password ", e); } return model; }
	 * 
	 * @RequestMapping(value = "/ShowLabVerifyForgetPassword", method =
	 * RequestMethod.POST) public ModelAndView
	 * ShowLabVerifyForgetPassword(HttpServletRequest request, HttpServletResponse
	 * response) { String email = request.getParameter("emailId"); String userName =
	 * request.getParameter("userName"); // create instance of Random class Random
	 * rand = new Random(); // Generate random integers in range 0 to 999 int
	 * rand_int1 = rand.nextInt(1000000); RestTemplate rest = new RestTemplate();
	 * ModelAndView model = null; ForgetPwdVerificationCode
	 * forgetPwdVerificationCode= new ForgetPwdVerificationCode();
	 * 
	 * forgetPwdVerificationCode.setCode(String.valueOf(rand_int1));
	 * forgetPwdVerificationCode.setType(4);
	 * forgetPwdVerificationCode.setUserName(userName);;
	 * 
	 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
	 * Object>(); map.add("email", email); map.add("verificationCode",
	 * String.valueOf(rand_int1));
	 * 
	 * try { Info info1=Constant.getRestTemplate().postForObject(Constant.url+
	 * "mailVerificationCode", map, Info.class); Info
	 * info=Constant.getRestTemplate().postForObject(Constant.url+
	 * "submitVerificationCode", forgetPwdVerificationCode, Info.class);
	 * 
	 * if(info1.getMessage().equals("success")&&info.getMessage().equals("success"))
	 * { model = new ModelAndView("lab/verifyForgetPwd"); model.addObject("message",
	 * "Mail Sent Succesfully"); model.addObject("userName",userName); } else {
	 * model = new ModelAndView("lab/forgotpassword"); model.addObject("message",
	 * "failed to send mail");
	 * 
	 * 
	 * }
	 * 
	 * } catch (Exception e) {
	 * 
	 * logger.error("Error while ShowLabVerifyForgetPassword.",e); throw new
	 * RuntimeException("Error while ShowLabVerifyForgetPassword.",e); } return
	 * model; }
	 * 
	 * @RequestMapping(value = "/submitLabPwdVerificationCode", method =
	 * RequestMethod.GET) public ModelAndView
	 * submitLabPwdVerificationCode(HttpServletRequest request, HttpServletResponse
	 * response) { ModelAndView model = null; String verify =
	 * request.getParameter("verify"); RestTemplate rest = new RestTemplate();
	 * String userName=request.getParameter("userName");
	 * 
	 * MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	 * map.add("userName", ""+userName); map.add("type",4);
	 * 
	 * ForgetPwdVerificationCode forgetPwdVerificationCode = new
	 * ForgetPwdVerificationCode(); try {
	 * forgetPwdVerificationCode=Constant.getRestTemplate().postForObject(Constant.
	 * url+"getVerificationCodeByUserName", map, ForgetPwdVerificationCode.class); }
	 * catch (Exception e) {
	 * 
	 * logger.error("Error while submitLabPwdVerificationCode.",e); throw new
	 * RuntimeException("Error while submitLabPwdVerificationCode.",e); }
	 * 
	 * try {
	 * 
	 * SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date
	 * date = format.parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new
	 * Date())); System.out.println("date:"+date); long duration = date.getTime() -
	 * forgetPwdVerificationCode.getTime().getTime(); int time = (int)
	 * TimeUnit.MILLISECONDS.toMinutes(duration);
	 * 
	 * if(time<2) {
	 * 
	 * if(verify.equals(forgetPwdVerificationCode.getCode())) { model = new
	 * ModelAndView("lab/setNewPwd"); model.addObject("userName",userName);
	 * 
	 * } else { model = new ModelAndView("lab/labLoginPage");
	 * model.addObject("usrmessage", "invalid");
	 * 
	 * 
	 * }
	 * 
	 * }
	 * 
	 * else { model = new ModelAndView("lab/labLoginPage");
	 * model.addObject("usrmessage","expired"); }
	 * 
	 * 
	 * }catch (Exception e) {
	 * logger.error("Error while submitLabPwdVerificationCode.",e); throw new
	 * RuntimeException("Error while submitLabPwdVerificationCode.",e); }
	 * 
	 * return model; }
	 * 
	 * @RequestMapping(value = "/updtaeLabNewPassword", method = RequestMethod.GET)
	 * public @ResponseBody Info updtaeLabNewPassword(HttpServletRequest request) {
	 * String newPassword = request.getParameter("newPassword"); String userName =
	 * request.getParameter("userName"); Info info = new Info();
	 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
	 * Object>(); map.add("userName",userName); map.add("newPassword", "" +
	 * newPassword); RestTemplate rest = new RestTemplate(); try { info =
	 * Constant.getRestTemplate().postForObject(Constant.url +
	 * "changeLabPasswordByUserName", map, Info.class); } catch (Exception e) {
	 * logger.error("Error while updating Lab Password", e); throw new
	 * RuntimeException("Error updating Lab Password", e); } return info;
	 * 
	 * }
	 */

	@RequestMapping(value = "/ShowLabForgotPassword", method = RequestMethod.GET)

	public String ShowLabForgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {

		model.addAttribute("msg", msg);
		msg = "";
		return "lab/forgotpassword";

	}

	@RequestMapping(value = "/searchUserNameForLabForgotPassword", method = RequestMethod.POST)
	public String searchUserNameForLabForgotPassword(HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String userName = request.getParameter("userName");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userName", userName);

		String returnString = "redirect:/ShowLabForgotPassword";
		try {
			LabDetails labDetails = Constant.getRestTemplate().postForObject(Constant.url + "getLabDetailsByUsrname",
					map, LabDetails.class);

			if (labDetails != null) {
				returnString = "lab/forgotPasswordOtp";

				HttpSession session = request.getSession();
				OtpSessionDetails otpSessionDetails = new OtpSessionDetails();
				Calendar now = Calendar.getInstance();
				now.add(Calendar.MINUTE, 2);
				Date nowDateTime = now.getTime();
				otpSessionDetails.setUserName(userName);
				otpSessionDetails.setDate(nowDateTime);
				otpSessionDetails.setId(labDetails.getLabId());
				otpSessionDetails.setOtp(labDetails.getPassword());
				session.setAttribute("otpSessionDetails", otpSessionDetails);

				model.addAttribute("mobileNo", labDetails.getContact());

			} else {
				returnString = "redirect:/ShowLabForgotPassword";
				msg = "User Name not found";
			}

		} catch (Exception e) {
			logger.error("Error while fetching doctor details by username in searchUserNameForDoctorForgotPassword", e);
			throw new RuntimeException(
					"Error while fetching doctor details by username in searchUserNameForDoctorForgotPassword", e);
		}
		return returnString;
	}

	@RequestMapping(value = "/verifyLabOpt", method = RequestMethod.POST)
	public String verifyLabOpt(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();

		OtpSessionDetails otpSessionDetails = (OtpSessionDetails) session.getAttribute("otpSessionDetails");
		String returnString = "";
		Calendar now = Calendar.getInstance();
		Date nowDateTime = now.getTime();
		if (otpSessionDetails.getDate().compareTo(nowDateTime) > 0) {
			String otp = request.getParameter("otp");
			System.out.println("otp :" + otp + "  Session : " + otpSessionDetails.getOtp());
			if (otp.equals(otpSessionDetails.getOtp())) {
				returnString = "lab/changeLabForgotPassword";
			} else {
				returnString = "lab/forgotPasswordOtp";

				model.addAttribute("msg", "Invalid OTP Please Enter valid OTP");
			}

		} else {
			returnString = "lab/forgotPasswordOtp";
			model.addAttribute("userName", otpSessionDetails.getUserName());
			model.addAttribute("msg", "Time out");
		}

		return returnString;
	}

	@RequestMapping(value = "/changeLabForgotPassword", method = RequestMethod.POST)

	public String changeLabForgotPassword(HttpServletRequest request, HttpServletResponse response) {

		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		OtpSessionDetails otpSessionDetails = (OtpSessionDetails) session.getAttribute("otpSessionDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", "" + otpSessionDetails.getId());
		map.add("newPassword", "" + password);
		RestTemplate rest = new RestTemplate();
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "changeLabPassword", map, Info.class);
			msg = info.getMessage();
		} catch (Exception e) {

			logger.error("Error while change doctor password in changeLabForgotPassword", e);
			throw new RuntimeException("Error while change doctor password in changeLabForgotPassword", e);

		}

		return "redirect:/showLabLoginPage";
	}

	@RequestMapping(value = "/showLabTestEdit", method = RequestMethod.GET)

	public ModelAndView showLabTestEdit(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("lab/editTests");
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", "" + labId);
		RestTemplate rest = new RestTemplate();
		try {
			// ResponseEntity<LabTestsList> res = rest.exchange(Constant.url +
			// "/getAllLabTests", HttpMethod.GET, req,
			// LabTestsList.class);

			LabTestsList allLabTests = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",
					LabTestsList.class);
			// LabTestsList allLabTests = res.getBody();
			List<LabTests> labTestList = Constant.getRestTemplate().postForObject(Constant.url + "lab/getTestsByLabId",
					map, List.class);
			model.addObject("labTestList", labTestList);
			model.addObject("allLabTests", allLabTests.getLabTestsList());
			model.addObject("testActive", "active");
		} catch (Exception e) {
			logger.error("Error while show Lab Edit", e);
			throw new RuntimeException("Error show Lab Edit", e);
		}
		return model;
	}

	@RequestMapping(value = "/addLabTestsToLab", method = RequestMethod.GET)
	public String addLabTestsToLab(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		String [] testIdList = request.getParameterValues("testId");
for(int i=0;i<testIdList.length;i++) {
		TestsInLab testsInLab = new TestsInLab();
		testsInLab.setDelStatus(0);
		testsInLab.setInstructions("Not Available");
		testsInLab.setLabId(labId);
		testsInLab.setTestId(Integer.parseInt(testIdList[i]));

		System.out.println("testsInLab " + testsInLab.toString());

		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "lab/insertTestsInLab", testsInLab,
					Info.class);
		} catch (Exception e) {
			logger.error("Error while Adding Lab Test", e);
			throw new RuntimeException("Error Adding Lab Test", e);
		}
}
		return "redirect:/showLabTestEdit";
	}

	@RequestMapping(value = "/deleteTestByLabId", method = RequestMethod.GET)
	public @ResponseBody Info deleteTestByLabId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		int testId = Integer.parseInt(request.getParameter("testId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", labId);
		map.add("testId", testId);
		Info info = new Info();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "lab/deleteTestsByLabId", map, Info.class);
		} catch (Exception e) {
			logger.error("Error while Deleting Lab Test", e);
			throw new RuntimeException("Error Deleting Lab Test", e);
		}
		return info;
	}

	@RequestMapping(value = "/updateLabProfilePic", method = RequestMethod.POST)
	public String updateLabProfilePic(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("profilePhoto") List<MultipartFile> profilePhoto) {
		String labId = request.getParameter("labId");
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		Info info = new Info();
		String profilePhotoName = null;
		try {
			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			profilePhotoName = profilePhoto.get(0).getOriginalFilename();
			//vpsImageUpload.saveUploadedFiles(profilePhoto, 4, profilePhotoName, labDetails.getLabId());
			
			
			   amazonS3ClientService.uploadFileToS3Bucket(profilePhoto.get(0),profilePhotoName,"lab/" + labDetails.getLabId() + "/profile/", true);

			   
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labId", labDetails.getLabId());
			map.add("profilePhoto", profilePhotoName);
			info = Constant.getRestTemplate().postForObject(Constant.url + "updateLabProfilePic", map, Info.class);

		} catch (Exception e) {
			logger.error("Error while Updating Lab Profile Picture", e);
			throw new RuntimeException("Error Updating Lab Profile Picture", e);
		}
		return "redirect:/showLabHomePage";
	}

	@RequestMapping(value = "/showLabTermsnCondition", method = RequestMethod.GET)

	public ModelAndView ShowTermsnCondition(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("lab/terms&condition");
		TermsAndConditions termsConditionDetailsList = new TermsAndConditions();
		int userType = 3;
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userType", userType);
		try {
			termsConditionDetailsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getTermsAndConditionByUserType", map, TermsAndConditions.class);
			System.out.println(termsConditionDetailsList.toString());
			model.addObject("termsConditionDetailsList", termsConditionDetailsList);

		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;

	}

	/* Doctor Registration form */

	// Contact Number Validation
	@RequestMapping(value = "/verifyLabContactNumber", method = RequestMethod.GET)

	public @ResponseBody Info verifyContactNumber(HttpServletRequest request) {
		Info info = new Info();

		String contactNo = request.getParameter("contactNo");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("contactNo", contactNo);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "verifyLabContactNumber", map, Info.class);
			System.out.println("" + info.getMessage());

		} catch (Exception e) {
			logger.error("Error while validating doctor mobile number in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	// email Number Validation
	@RequestMapping(value = "/verifyLabEmail", method = RequestMethod.GET)

	public @ResponseBody Info verifyEmail(HttpServletRequest request) {
		Info info = new Info();

		String email = request.getParameter("email");
		System.out.println("" + email);
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("email", email);

		RestTemplate rest = new RestTemplate();

		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "verifyLabEmail", map, Info.class);
			System.out.println("" + info.getMessage());

		} catch (Exception e) {
			logger.error("Error while validating doctor mobile number in usernameValidationOfDoctor", e);
			throw new RuntimeException("Error while validating doctor user name in usernameValidationOfDoctor", e);
		}
		return info;

	}

	@RequestMapping(value = "/showAllLabReviews", method = RequestMethod.GET)

	public ModelAndView showAllLabReviews(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("lab/allReviews");
		model.addObject("ratingReviews", getDoctorRatingReviewCount.getLabRatingDetails());

		return model;

	}

	@RequestMapping(value = "/getLabNotification", method = RequestMethod.GET)
	public @ResponseBody List<LabNotification> getDoctorNotification(HttpServletRequest request) {

		RestTemplate rest = new RestTemplate();
		List<LabNotification> labNotificationList = new ArrayList<LabNotification>();
		try {

			HttpSession session = request.getSession();
			LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labId", "" + labDetails.getLabId());
			labNotificationList = Constant.getRestTemplate().postForObject(Constant.url + "getLabNotification", map,
					List.class);
			System.out.println("labNotificationList:" + labNotificationList.toString());
		} catch (Exception e) {
			logger.error("Error while fetching Lab Notification", e);
			throw new RuntimeException("Error while fetching Lab Notification", e);
		}
		return labNotificationList;
	}

	@RequestMapping(value = "/changeLabNotificationStatus", method = RequestMethod.GET)
	public @ResponseBody int changeLabNotificationStatus(HttpServletRequest request) {
		int notificationId = Integer.parseInt(request.getParameter("notificationId"));
		int res = 0;
		try {
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("notificationId", notificationId);
			res = Constant.getRestTemplate().postForObject(Constant.url + "changeLabNotificationStatus", map,
					Integer.class);
		} catch (Exception e) {
			logger.error("Error while Updating Lab Notification status", e);
			throw new RuntimeException("Error while Updating Lab Notification status", e);
		}
		return res;
	}

	@RequestMapping(value = "/showAllLabNotification", method = RequestMethod.GET)
	public ModelAndView showAllLabNotification(HttpServletRequest request) {

		ModelAndView model = new ModelAndView("lab/labAllNotification");

		RestTemplate rest = new RestTemplate();
		List<LabNotification> labNotificationList = new ArrayList<LabNotification>();
		try {

			HttpSession session = request.getSession();
			LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labId", "" + labDetails.getLabId());
			labNotificationList = Constant.getRestTemplate().postForObject(Constant.url + "getAllLabNotification", map,
					List.class);
			model.addObject("labNotificationList", labNotificationList);
		} catch (Exception e) {
			logger.error("Error while fetching Lab Notification", e);
			throw new RuntimeException("Error while fetching Lab Notification", e);
		}

		return model;

	}

	@RequestMapping(value = "/showLabtest", method = RequestMethod.GET)

	public ModelAndView showLabtest(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("labtests");

		return model;

	}

	@RequestMapping(value = "/showLabDashBoard", method = RequestMethod.GET)

	public ModelAndView showLabDashBoard(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("lab/labDashBoard");

		RestTemplate rest = new RestTemplate();
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", "" + labDetails.getLabId());
		map.add("appDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

		MultiValueMap<String, Object> mapp = new LinkedMultiValueMap<String, Object>();
		mapp.add("labId", labDetails.getLabId());

		try {

			LabAppointmentCount appointmentCount = Constant.getRestTemplate()
					.postForObject(Constant.url + "getLabAppointmentCount", map, LabAppointmentCount.class);
			List<LabAppOfLastThirtyDays> appOfLastThirtyDays = Constant.getRestTemplate()
					.postForObject(Constant.url + "getLastThirtyDaysAppointmentOfLab", mapp, List.class);
			System.out.println("appOfLastThirtyDays:" + appOfLastThirtyDays.toString());
			model.addObject("appOfLastThirtyDays", appOfLastThirtyDays);
			model.addObject("appointmentCount", appointmentCount);

		} catch (Exception e) {
			logger.error("Error while showLabDashBoard", e);
			throw new RuntimeException("Error while showLabDashBoard", e);
		}

		return model;

	}

	@RequestMapping(value = "/getAllLabTests", method = RequestMethod.GET)
	public @ResponseBody List<LabTests> getAllLabTests(HttpServletRequest request) {

		try {
			LabTestsList allLabTests = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",
					LabTestsList.class);

			return allLabTests.getLabTestsList();
		} catch (Exception e) {
			logger.error("Error while getAllLabTests", e);
			throw new RuntimeException("Error while getAllLabTests", e);
		}
	}

	/*
	 * @RequestMapping(value = "/showPndtDetails", method = RequestMethod.GET)
	 * public ModelAndView showPndtDetails(HttpServletRequest request) {
	 * ModelAndView model = new ModelAndView("lab/pndtDetails");
	 * 
	 * PNDTPatientDetails
	 * pndtPatientDetails=Constant.getRestTemplate().postForObject(Constant.url +
	 * "getPndtPatientDetails", map, PNDTPatientDetails.class);
	 * 
	 * 
	 * PNDTPatientDetailsController.indicationsModelList=pndtPatientDetails.
	 * getIndicationsModelList();
	 * 
	 * PNDTPatientDetailsController.childsModelList=pndtPatientDetails.
	 * getChildsModelList();
	 * 
	 * model.addObject("pndtPatientDetails",pndtPatientDetails); return model; }
	 */
}
