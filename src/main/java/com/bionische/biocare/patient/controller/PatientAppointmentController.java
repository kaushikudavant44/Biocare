package com.bionische.biocare.patient.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.model.SpecializationDetailsList;
import com.bionische.biocare.lab.model.GetLabRatingReview;
import com.bionische.biocare.lab.model.LabAppointmentDetails;
import com.bionische.biocare.lab.model.LabTests;
import com.bionische.biocare.lab.model.LabTestsList;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.GetHospitalClinicByDoctorIdAndAvailDate;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.RatingDetailsList;
import com.bionische.biocare.patientdoctor.model.AppointmentDetails;
import com.bionische.biocare.patientdoctor.model.AppointmentTime;
import com.bionische.biocare.patientdoctor.model.GetAppointmentDetails;
import com.bionische.biocare.patientdoctor.model.GetDoctorListForAppointment;
import com.bionische.biocare.patientdoctor.model.GetSuggestLabTestFromDoctor;
import com.bionische.biocare.patientlab.model.GetLabAppointment;
import com.bionische.biocare.patientlab.model.GetLabForAppointment;

@Scope("session")
@Controller
public class PatientAppointmentController {
	/* List<Country> countryList; */

	private List<PatientDetails> patientDetailList;
	private SpecializationDetailsList specializationList;

	GetSuggestLabTestFromDoctor getSuggestLabTestFromDoctor;
	// HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	int doctorForReport = 0;
	public final Log LOGGER = LogFactory.getLog(PatientAppointmentController.class);

	@RequestMapping(value = "/showBookAppointment", method = RequestMethod.GET)

	public ModelAndView showBookAppointment(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/bookAppointmentPage");
		List<City> cityList;
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		int patientId = patientDetail.getPatientId();

		/*
		 * int stateId = 1; MultiValueMap<String, Object> map = new
		 * LinkedMultiValueMap<String, Object>(); map.add("stateId", "" + stateId);
		 */

		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + patientDetail.getFamilyId());

		try {

			specializationList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization",
					SpecializationDetailsList.class);

			patientDetailList = Constant.getRestTemplate().postForObject(Constant.url + "getPatientFamilyMembersList",
					mapfam, List.class);

			LabTestsList labTestsList = new LabTestsList();
			labTestsList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",
					LabTestsList.class);

			model.addObject("countryList", HomeController.countryList);
			model.addObject("patientDetailList", patientDetailList);
			model.addObject("memberLength", patientDetailList.size());
			model.addObject("labTestsList", labTestsList.getLabTestsList());
			model.addObject("specializationList", specializationList.getSpecializationDetailsList());
			model.addObject("todayDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
			model.addObject("appointActive", "active");

		} catch (Exception e) {

			LOGGER.error("Error while showBookAppointment.", e);
			throw new RuntimeException("Error while showBookAppointment.", e);
		}

		return model;
	}

	@RequestMapping(value = "/getRadiologistLabTests", method = RequestMethod.GET)
	public @ResponseBody List<LabTests> getRadiologistLabTests(HttpServletRequest request,
			HttpServletResponse response) {
		List<LabTests> labTestsList = new ArrayList<>();
		try {
			labTestsList = Constant.getRestTemplate().getForObject(Constant.url + "/getRadiologistLabTypes",
					List.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return labTestsList;

	}

	@RequestMapping(value = "/getAlldigLabTests", method = RequestMethod.GET)
	public @ResponseBody List<LabTests> getAlldigLabTests(HttpServletRequest request, HttpServletResponse response) {
		LabTestsList labTestsList = new LabTestsList();
		try {
			labTestsList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTest", LabTestsList.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return labTestsList.getLabTestsList();

	}

	// get specialist showBookDoctorAppointment
	@RequestMapping(value = "/showBookDoctorAppointment", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showBookDoctorAppointment(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/bookDoctorAppointment");

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + patientDetail.getFamilyId());

		int consultType = Integer.parseInt(request.getParameter("consultType"));
		int appPatientId = Integer.parseInt(request.getParameter("appPatientId"));
		int specId = Integer.parseInt(request.getParameter("specId"));
		String cityId = request.getParameter("doctorCity");

		System.out.println("cityIdcityId:" + cityId);
		String appDate = DateConverter.convertToYMD(request.getParameter("appDate"));

		String cityName = request.getParameter("currency");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		List<GetDoctorListForAppointment> getDoctorListForAppointmentList = new ArrayList<GetDoctorListForAppointment>();

		try {

			/*
			 * ResponseEntity<SpecializationDetailsList> specializationListResu =
			 * rest.exchange(Constant.url + "/getAllSpecialization", HttpMethod.GET, req,
			 * SpecializationDetailsList.class);
			 * 
			 * specializationList=specializationListResu.getBody(); List<PatientDetails>
			 * patientDetailList=Constant.getRestTemplate().postForObject(Constant.url+
			 * "getPatientFamilyMembersList", mapfam, List.class);
			 */

			map.add("cityId", "" + cityId);
			map.add("specId", "" + specId);
			map.add("date", appDate);

			getDoctorListForAppointmentList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getDoctorsBySpecialistId", map, List.class);

			model.addObject("patientDetailList", patientDetailList);
			model.addObject("specializationList", specializationList.getSpecializationDetailsList());
			model.addObject("getDoctorListForAppointmentList", getDoctorListForAppointmentList);
			model.addObject("consultType", consultType);
			model.addObject("appPatientId", appPatientId);
			model.addObject("appDateApp", request.getParameter("appDate"));
			model.addObject("cityName", cityName);
			model.addObject("cityId", cityId);
			model.addObject("specId", specId);
			model.addObject("countryList", HomeController.countryList);
			model.addObject("appointActive", "active");
			model.addObject("profileUrl", Constant.doctorUrl);

		} catch (Exception e) {

			LOGGER.error("Error while showBookDoctorAppointment.", e);
			throw new RuntimeException("Error while showBookDoctorAppointment.", e);
		}

		return model;
	}

	/*
	 * 
	 * Ganesh getHospital and clinic list
	 */
	@RequestMapping(value = "/getHospitalClinicByDoctorIdAndAvailDate", method = RequestMethod.GET)
	public @ResponseBody List<GetHospitalClinicByDoctorIdAndAvailDate> getHospitalClinicByDoctorIdAndAvailDate(
			HttpServletRequest request, HttpServletResponse response) {

		String date = DateConverter.convertToYMD(request.getParameter("date"));
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		List<GetHospitalClinicByDoctorIdAndAvailDate> getHospitalClinicByDoctorIdAndAvailDateList = new ArrayList<GetHospitalClinicByDoctorIdAndAvailDate>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorId);
		map.add("date", date);
		try {

			ParameterizedTypeReference<List<GetHospitalClinicByDoctorIdAndAvailDate>> typeRef = new ParameterizedTypeReference<List<GetHospitalClinicByDoctorIdAndAvailDate>>() {
			};
			ResponseEntity<List<GetHospitalClinicByDoctorIdAndAvailDate>> responseEntity = Constant.getRestTemplate()
					.exchange(Constant.url + "getHospitalClinicByDoctorIdAndAvailDate", HttpMethod.POST,
							new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			getHospitalClinicByDoctorIdAndAvailDateList = responseEntity.getBody();

			LOGGER.info(" getHospitalClinicByDoctorIdAndAvailDateList : "
					+ getHospitalClinicByDoctorIdAndAvailDateList.toString());

			LOGGER.info(" getHospitalClinicByDoctorIdAndAvailDateList : "
					+ getHospitalClinicByDoctorIdAndAvailDateList.toString());

		} catch (Exception e) {
			LOGGER.error("Error while getHospitalClinicByDoctorIdAndAvailDate.", e);
			throw new RuntimeException("Error while getHospitalClinicByDoctorIdAndAvailDate.", e);
		}

		return getHospitalClinicByDoctorIdAndAvailDateList;
	}

	/*
	 * 
	 * Ganesh getHospital and clinic list with fix schedule
	 */

	@RequestMapping(value = "/getHospitalClinicByDoctorIdWithFixSchedule", method = RequestMethod.GET)
	public @ResponseBody List<GetHospitalClinicByDoctorIdAndAvailDate> getHospitalClinicByDoctorIdWithFixSchedule(
			HttpServletRequest request, HttpServletResponse response) {

		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		int clinicId = Integer.parseInt(request.getParameter("clinicId"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorId);
		map.add("clinicId", clinicId);
		try {

			ParameterizedTypeReference<List<GetHospitalClinicByDoctorIdAndAvailDate>> typeRef = new ParameterizedTypeReference<List<GetHospitalClinicByDoctorIdAndAvailDate>>() {
			};
			ResponseEntity<List<GetHospitalClinicByDoctorIdAndAvailDate>> responseEntity = Constant.getRestTemplate()
					.exchange(Constant.url + "doctorAvailableTime/getHospitalClinicByDoctorIdWithFixSchedule",
							HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			List<GetHospitalClinicByDoctorIdAndAvailDate> getHospitalClinicByDoctorIdAndAvailDateList = responseEntity
					.getBody();

			return getHospitalClinicByDoctorIdAndAvailDateList;
			// LOGGER.info(" getHospitalClinicByDoctorIdAndAvailDateList :
			// "+getHospitalClinicByDoctorIdAndAvailDateList.toString() );

		} catch (Exception e) {
			LOGGER.error("Error while getHospitalClinicByDoctorIdWithFixSchedule.", e);
			throw new RuntimeException("Error while getHospitalClinicByDoctorIdWithFixSchedule.", e);
		}
	}

	@RequestMapping(value = "/getClinicAvailabledTimeForAppointment", method = RequestMethod.GET)
	public @ResponseBody List<AppointmentTime> getClinicAvailabledTimeForAppointment(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println(request.getParameter("date"));
		List<AppointmentTime> appointmentTimeList = new ArrayList<AppointmentTime>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", Integer.parseInt(request.getParameter("doctorId")));
		map.add("date", DateConverter.convertToYMD(request.getParameter("date")));
		map.add("hospitalId", Integer.parseInt(request.getParameter("hospitalId")));
		try {
			if (Integer.parseInt(request.getParameter("scheduleType")) == 0)
				appointmentTimeList = Constant.getRestTemplate().postForObject(
						Constant.url + "doctorAvailableTime/getClinicAvailabledTimeForAppointment", map, List.class);
			else {
				appointmentTimeList = Constant.getRestTemplate().postForObject(
						Constant.url + "doctorAvailableTime/getDoctorAppointmentTimeByDateAndClinicId", map,
						List.class);
			}
		} catch (Exception e) {
			LOGGER.error("Error while getClinicAvailabledTimeForAppointment.", e);
			throw new RuntimeException("Error while getClinicAvailabledTimeForAppointment.", e);
		}
		return appointmentTimeList;
	}

	// doctor review and ratings
	@RequestMapping(value = "/getRatingDetailsByDoctorId", method = RequestMethod.GET)
	public @ResponseBody List<RatingDetailsList> getRatingDetailsByDoctorId(HttpServletRequest request,
			HttpServletResponse response) {

		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		Date date = new Date();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("doctorId", doctorId);
		List<RatingDetailsList> ratingDetailsList = new ArrayList<RatingDetailsList>();

		try {
			ratingDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getRatingDetailsByDoctorId",
					map, List.class);
			SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");

		} catch (Exception e) {

			LOGGER.error("Error while getRatingDetailsByDoctorId.", e);
			throw new RuntimeException("Error while getRatingDetailsByDoctorId.", e);
		}
		return ratingDetailsList;
	}

	/*
	 * //getAppointment time
	 * 
	 * @RequestMapping(value = "/getAppointmentsTime", method = RequestMethod.GET)
	 * 
	 * public @ResponseBody AppointmentTimeList
	 * getAppointmentTime(HttpServletRequest request, HttpServletResponse response)
	 * {
	 * 
	 * 
	 * 
	 * System.out.println("In method"); int doctorId =
	 * Integer.parseInt(request.getParameter("doctorId")); String appDate =
	 * request.getParameter("appointmentDate");
	 * 
	 * System.out.println("In method2");
	 * 
	 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
	 * Object>(); map.add("doctorId", ""+doctorId); map.add("date", appDate);
	 * 
	 * //List<AppointmentTime> appointmentTimeList = new ArrayList<>();
	 * AppointmentTimeList appointmentTimeList=new AppointmentTimeList();
	 * //AppointmentTime appointmentTime=new AppointmentTime();
	 * 
	 * 
	 * 
	 * try { appointmentTimeList
	 * =Constant.getRestTemplate().postForObject(Constant.url + "getAllAppointTime",
	 * map, AppointmentTimeList.class); System.out.println("Res  +" +
	 * appointmentTimeList.toString());
	 * 
	 * } catch (Exception e) { System.out.println(e.getMessage()); }
	 * System.out.println(appointmentTimeList.toString()); return
	 * appointmentTimeList;
	 * 
	 * }
	 */

	// Ganesh
	// Book doctor Appointment
	@RequestMapping(value = "/bookAppointment", method = RequestMethod.GET)
	public @ResponseBody Info bookAppointment(HttpServletRequest request, HttpServletResponse response) {

		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		String appointmentDate = DateConverter.convertToYMD(request.getParameter("appointmentDate"));
		int timeId = Integer.parseInt(request.getParameter("appointmentTime"));
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		int appointmentType = Integer.parseInt(request.getParameter("appointmentType"));

		AppointmentDetails appointmentDetails = new AppointmentDetails();

		HttpSession session = request.getSession();
		PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");

		appointmentDetails.setDate(appointmentDate);
		appointmentDetails.setDelStatus(0);
		appointmentDetails.setDoctorId(doctorId);
		appointmentDetails.setHospitalId(hospitalId);
		appointmentDetails.setInt1(appointmentType);
		appointmentDetails.setInt2(0);
		appointmentDetails.setString1("");
		appointmentDetails.setString2("");
		appointmentDetails.setTime(timeId);
		appointmentDetails.setPatientId(patientId);
		Info info = new Info();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "insertAppointmentDetails",
					appointmentDetails, Info.class);
		} catch (Exception e) {

			LOGGER.error("Error while bookAppointment.", e);
			throw new RuntimeException("Error while bookAppointment.", e);
		}
		return info;
	}

	// Show Appointment to patient
	@RequestMapping(value = "/showViewAppointmentToPatient", method = RequestMethod.GET)

	public ModelAndView showViewAppointmentToPatient(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("patient/viewAppointmentToPatient");

		HttpSession session = request.getSession();
		PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");
		int familyId = patientDetails.getFamilyId();

		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + familyId);

		int patientId = Integer.parseInt(request.getParameter("viewPatientId"));
		String fromDate = DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate = DateConverter.convertToYMD(request.getParameter("toDate"));

		int appointmentType = Integer.parseInt(request.getParameter("viewAppType"));
		try {
			List<PatientDetails> patientDetailList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPatientFamilyMembersList", mapfam, List.class);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", fromDate);
			map.add("toDate", toDate);
			map.add("patientId", "" + patientId);

			if (appointmentType == 0) {
				List<GetAppointmentDetails> getAppointmentDetailsList = Constant.getRestTemplate()
						.postForObject(Constant.url + "getAppmtDetailsByPatientIdAndDate", map, List.class);

				model.addObject("getAppointmentDetailsList", getAppointmentDetailsList);

			} else {
				List<GetLabAppointment> getlabAppointmentDetailsList = Constant.getRestTemplate()
						.postForObject(Constant.url + "lab/getLabAppmtDetailsByPatientIdAndDate", map, List.class);
				model.addObject("getlabAppointmentDetailsList", getlabAppointmentDetailsList);
			}
			model.addObject("patientId", patientId);
			model.addObject("fromDate", DateConverter.convertToDMY(fromDate));
			model.addObject("toDate", DateConverter.convertToDMY(toDate));
			model.addObject("appointmentType", appointmentType);
			model.addObject("patientDetailList", patientDetailList);
			model.addObject("appointActive", "active");
			model.addObject("currentDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		} catch (Exception e) {

			LOGGER.error("Error while showViewAppointmentToPatient.", e);
			throw new RuntimeException("Error while showViewAppointmentToPatient.", e);
		}

		return model;
	}

	@RequestMapping(value = "/consultingPaymentRequest/{appointmentId}", method = RequestMethod.GET)

	public ModelAndView consultingPaymentRequest(@PathVariable("appointmentId") int appointmentId,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/viewAppointmentToPatient");
		HttpSession session = request.getSession();
		PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");
		int familyId = patientDetails.getFamilyId();

		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + familyId);

		try {
			List<PatientDetails> patientDetailList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPatientFamilyMembersList", mapfam, List.class);

		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		try {
			map.add("appointmentId", appointmentId);
			List<GetAppointmentDetails> getAppointmentDetailsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getAppmtDetailsByAppointmentId", map, List.class);
			model.addObject("getAppointmentDetailsList", getAppointmentDetailsList);

		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		model.addObject("patientDetailList", patientDetailList);
		model.addObject("appointActive", "active");
		model.addObject("currentDate",new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		
		return model;
	}

	// Ganesh
	// getLab
	@RequestMapping(value = "/getLabByCityAndTest", method = RequestMethod.GET)
	public @ResponseBody ModelAndView getLabByCityAndTest(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/bookLabAppointment");

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + patientDetail.getFamilyId());

		int patientId = Integer.parseInt(request.getParameter("labAppPatientId"));
		String cityId = request.getParameter("labCity");
		String cityName = request.getParameter("autocomplete1");
		doctorForReport = Integer.parseInt(request.getParameter("doctor_for_report"));
		int refference = 0;
		int labId = 0;
		try {
			refference = Integer.parseInt(request.getParameter("refference"));
			labId = Integer.parseInt(request.getParameter("labId"));

		} catch (Exception e) {
			// TODO: handle exception
		}
		StringBuilder testIdList = new StringBuilder();
		String testId=null;
		String[] testID=null;
		int labType=Integer.parseInt(request.getParameter("labType"));
		if(labType==1) {
		try {
			 testId=request.getParameter("radioTestId");
			 testIdList.append(testId+",");
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
		else if(labType==0) {
		try {
			
			if(testId==null) {
				testID = request.getParameterValues("testId");
			
			
			for (String s : testID)
				testIdList.append(s + ",");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
		

		
		
		String labAppDate = DateConverter.convertToYMD(request.getParameter("labAppDate"));
		// List<String> testIdList = Arrays.asList(testID);
		
		System.out.println("Test List = "+testIdList.substring(0, testIdList.length() - 1));
		List<GetLabForAppointment> labDetailsList = new ArrayList<GetLabForAppointment>();
		List<PatientDetails> patientDetailList = new ArrayList<PatientDetails>();
		LabTestsList labTestsList = new LabTestsList();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("cityId", cityId);
		map.add("testIdList", testIdList.substring(0, testIdList.length() - 1));

		try {
			labDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "lab/getLabsByCityIdAndTestId",
					map, List.class);
		
			if(labType==0) {
			labTestsList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",
					LabTestsList.class);
			}else {
				
				labTestsList = Constant.getRestTemplate().getForObject(Constant.url + "/getRadiologistLabTestTypes",
						LabTestsList.class);
			}
			patientDetailList = Constant.getRestTemplate().postForObject(Constant.url + "getPatientFamilyMembersList",
					mapfam, List.class);

		} catch (Exception e) {

			LOGGER.error("Error while getLabByCityAndTest.", e);
			throw new RuntimeException("Error while getLabByCityAndTest.", e);
		}
		model.addObject("labId", labId);
		model.addObject("patientDetailList", patientDetailList);
		model.addObject("doctorId", doctorForReport);
		model.addObject("labDetailsList", labDetailsList);
		model.addObject("cityId", cityId);
		model.addObject("cityName", cityName);
		model.addObject("labType", labType);
		if(labType==1) {
			model.addObject("testID", testId);
		}	else if(labType==0) {
		model.addObject("testID", testID);
		}
		model.addObject("labTestsList", labTestsList.getLabTestsList());
		model.addObject("patientId", patientId);
		model.addObject("labAppDate", DateConverter.convertToDMY(labAppDate));
		model.addObject("appointActive", "active");
		model.addObject("countryList", HomeController.countryList);
		model.addObject("refference", refference);
		return model;
	}

	// Ganesh
	// getLabReview
	@RequestMapping(value = "/getLabReviewByLabId", method = RequestMethod.GET)
	public @ResponseBody List<GetLabRatingReview> getLabReviewByLabId(HttpServletRequest request,
			HttpServletResponse response) {

		String labId = request.getParameter("labId");

		List<GetLabRatingReview> getLabRatingReviewList = new ArrayList<GetLabRatingReview>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", labId);

		try {
			getLabRatingReviewList = Constant.getRestTemplate().postForObject(Constant.url + "getLabReviewByLabId", map,
					List.class);

		} catch (Exception e) {

			LOGGER.error("Error while getLabReviewByLabId.", e);
			throw new RuntimeException("Error while getLabReviewByLabId.", e);
		}

		return getLabRatingReviewList;
	}

	// Ganesh
	// Book Lab Appointment
	@RequestMapping(value = "/bookLabAppointment", method = RequestMethod.GET)
	public @ResponseBody Info bookLabAppointment(HttpServletRequest request, HttpServletResponse response) {

		int labId = Integer.parseInt(request.getParameter("labId"));
		String appointmentDate = DateConverter.convertToYMD(request.getParameter("appointmentDate"));

		int timeId = Integer.parseInt(request.getParameter("appointmentTime"));
		String labTestId = (request.getParameter("labTestId"));
		System.out.println("labTestId List  " + labTestId);
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		int refference = Integer.parseInt(request.getParameter("refference"));
		int patientId = Integer.parseInt(request.getParameter("patientId"));

		LabAppointmentDetails labAppointmentDetails = new LabAppointmentDetails();
		labAppointmentDetails.setDelStatus(0);
		labAppointmentDetails.setRefference(refference);
		labAppointmentDetails.setDoctorId(doctorId);
		labAppointmentDetails.setLabAppDate(appointmentDate);
		labAppointmentDetails.setLabId(labId);
		labAppointmentDetails.setPatientId(patientId);
		labAppointmentDetails.setStatus(0);
		labAppointmentDetails.setTestIdList(labTestId);
		labAppointmentDetails.setTimeId(timeId);
		Info info = new Info();
		try {
			LabAppointmentDetails labAppointmentDetailsRes = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/insertLabAppointment", labAppointmentDetails, LabAppointmentDetails.class);

			if (labAppointmentDetailsRes != null) {
				info.setError(false);
				info.setMessage("Appointment Booked Successfully");
			} else {
				info.setError(true);
				info.setMessage("Problem in server to  Booked Appointment");

			}
		} catch (Exception e) {
			info.setError(true);
			info.setMessage("Problem in server to  Booked Appointment");
			LOGGER.error("Error while bookLabAppointment.", e);
			throw new RuntimeException("Error while bookLabAppointment.", e);

		}
		return info;
	}

	// cancel Lab Appontment
	@RequestMapping(value = "/deleteLabAppointment", method = RequestMethod.GET)
	public @ResponseBody Info deleteLabAppointment(HttpServletRequest request, HttpServletResponse response) {
		int appId = Integer.parseInt(request.getParameter("appId"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("labAppId", "" + appId);
		map.add("status", 2);

		Info info = new Info();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "lab/updateLabAppointmentStatus", map,
					Info.class);
		} catch (Exception e) {

			LOGGER.error("Error while deleteLabAppointment.", e);
			throw new RuntimeException("Error while deleteLabAppointment.", e);
		}
		return info;
	}

	// ganesh
	// cancel Appontment
	@RequestMapping(value = "/cancelDoctorAppointmentByPatient", method = RequestMethod.GET)
	public @ResponseBody Info cancelDoctorAppointmentByPatient(HttpServletRequest request,
			HttpServletResponse response) {
		int appId = Integer.parseInt(request.getParameter("appId"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("appId", "" + appId);

		Info info = new Info();
		try {
			info = Constant.getRestTemplate().postForObject(Constant.url + "cancelDoctorAppointment", map, Info.class);
		} catch (Exception e) {

			LOGGER.error("Error while cancelDoctorAppointmentByPatient.", e);
			throw new RuntimeException("Error while cancelDoctorAppointmentByPatient.", e);
		}
		return info;
	}

	// ganesh
	// get fix schedule Time
	@RequestMapping(value = "/getDoctorFixSchedule", method = RequestMethod.GET)
	public ModelAndView getDoctorFixSchedule(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("patient/viewAppointmentToPatient");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("doctorId", 2);
		map.add("clinicId", 3);
		Info info = new Info();
		try {
			List<AppointmentTime> appointmentTimeList = Constant.getRestTemplate()
					.postForObject(Constant.url + "doctorAvailableTime/getDoctorFixSchedule", map, List.class);
			System.out.println("getDoctorFixSchedule  " + appointmentTimeList.toString());
			for (int i = 0; i < appointmentTimeList.size(); i++)
				System.out.println("\n" + appointmentTimeList.get(i));
		} catch (Exception e) {

			LOGGER.error("Error while getDoctorFixSchedule.", e);
			throw new RuntimeException("Error while getDoctorFixSchedule.", e);
		}
		return model;
	}

	@RequestMapping(value = "/getLabAppointmentForPayment", method = RequestMethod.GET)
	public @ResponseBody LabAppointmentDetails getLabAppointmentForPayment(HttpServletRequest request,
			HttpServletResponse response) {
		int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

		try {
			MultiValueMap<String, Object> mapAppoint = new LinkedMultiValueMap<String, Object>();
			mapAppoint.add("appointmentId", appointmentId);
			LabAppointmentDetails labAppointmentDetails = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/getLabAppointmentDetailsByAppointmentId", mapAppoint,
					LabAppointmentDetails.class);
			labAppointmentDetails.setLabAppDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

			return labAppointmentDetails;
		} catch (Exception e) {
			LOGGER.error("Error while geting Lab appointment", e);
			// TODO: handle exception
		}
		return null;
	}

	@RequestMapping(value = "/getSuggestLabTestFromDoctorForPatient", method = RequestMethod.GET)
	public @ResponseBody GetSuggestLabTestFromDoctor getSuggestLabTestFromDoctorForPatient(HttpServletRequest request) {

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("meetId", Integer.parseInt(request.getParameter("meetId")));
		try {
			getSuggestLabTestFromDoctor = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/getSuggestLabTestFromDoctor", map, GetSuggestLabTestFromDoctor.class);
			return getSuggestLabTestFromDoctor;
		} catch (Exception e) {
			LOGGER.error("Error while getSuggestLabTestFromDoctor", e);
			throw new RuntimeException("Error while getSuggestLabTestFromDoctor", e);
		}

	}

	@RequestMapping(value = "/showBookLabAppointmentByReferrence", method = RequestMethod.GET)
	public ModelAndView showBookLabAppointmentByReferrence(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/bookLabAppointment");
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + patientDetail.getFamilyId());

		// String cityId = request.getParameter("labCity");
		// String cityName = request.getParameter("autocomplete1");
		// doctorForReport=Integer.parseInt(request.getParameter("doctor_for_report"));

		doctorForReport = getSuggestLabTestFromDoctor.getDoctorId();
		int patientId = getSuggestLabTestFromDoctor.getPatientId();

		String[] testID = getSuggestLabTestFromDoctor.getTestIdList().split(",");

		int refference = 0;
		int labId = 0;
		if (getSuggestLabTestFromDoctor.getLabId() != 0) {
			refference = 1;
		}

		labId = getSuggestLabTestFromDoctor.getLabId();

		// List<String> testIdList = Arrays.asList(testID);
		StringBuilder testIdList = new StringBuilder();
		for (String s : testID)
			testIdList.append(s + ",");

		List<GetLabForAppointment> labDetailsList = new ArrayList<GetLabForAppointment>();
		List<PatientDetails> patientDetailList = new ArrayList<PatientDetails>();
		LabTestsList labTestsList = new LabTestsList();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("cityId", patientDetail.getCityId());
		map.add("testIdList", testIdList.substring(0, testIdList.length() - 1));

		try {
			labDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "lab/getLabsByCityIdAndTestId",
					map, List.class);
			labTestsList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",
					LabTestsList.class);

			patientDetailList = Constant.getRestTemplate().postForObject(Constant.url + "getPatientFamilyMembersList",
					mapfam, List.class);

		} catch (Exception e) {

			LOGGER.error("Error while getLabByCityAndTest.", e);
			throw new RuntimeException("Error while getLabByCityAndTest.", e);
		}
		model.addObject("labId", labId);
		model.addObject("patientDetailList", patientDetailList);
		model.addObject("doctorId", doctorForReport);
		model.addObject("labDetailsList", labDetailsList);
		model.addObject("cityId", patientDetail.getCityId());
		// model.addObject("cityName", cityName);
		model.addObject("testID", testID);
		model.addObject("labTestsList", labTestsList.getLabTestsList());
		model.addObject("patientId", patientId);
		model.addObject("labAppDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		model.addObject("appointActive", "active");
		model.addObject("countryList", HomeController.countryList);
		model.addObject("refference", refference);

		return model;
	}
	
	
	@RequestMapping(value = "/showUpcomingAppointments", method = RequestMethod.GET)

	public String showUpcomingAppointments(HttpServletRequest request, Model model) {
		
		
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientDetail.getPatientId());
		
		List<GetAppointmentDetails> getAppointmentDetailsList = Constant.getRestTemplate()
				.postForObject(Constant.url + "getAppmtDetailsByPatientId",map,  List.class);

		model.addAttribute("getAppointmentDetailsList", getAppointmentDetailsList);

	 
		List<GetLabAppointment> getlabAppointmentDetailsList = Constant.getRestTemplate()
				.postForObject(Constant.url + "lab/getLabAppmtDetailsByPatientId",map,  List.class);
		model.addAttribute("getlabAppointmentDetailsList", getlabAppointmentDetailsList);
		
		model.addAttribute("appointActive", "active");
		
		return "patient/upcomingAppointments";
	}
	
		
}
