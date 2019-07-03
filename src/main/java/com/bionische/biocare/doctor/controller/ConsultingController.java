package com.bionische.biocare.doctor.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.SpecializationDetailsList;
import com.bionische.biocare.lab.model.GetPatientReports;
import com.bionische.biocare.lab.model.LabTestsList;
import com.bionische.biocare.model.SuggestLabTestFromDoctor;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patientdoctor.model.AppointmentDetails;
import com.bionische.biocare.patientdoctor.model.ConsultingDetails;
import com.bionische.biocare.patientdoctor.model.DoctorPatientMeeting;
import com.bionische.biocare.patientdoctor.model.GetConsultingBill;
import com.bionische.biocare.patientdoctor.model.GetPrescription;
import com.bionische.biocare.patientdoctor.model.GetSuggestLabTestFromDoctor;
import com.bionische.biocare.patientdoctor.model.PrescriptionDetails;
import com.bionische.biocare.patienthistory.model.PatientAllPersonalHistory;
import com.bionische.biocare.patientlab.model.GetLabForAppointment;
@Scope("session")
@Controller
public class ConsultingController {

	public List<PrescriptionDetails> prescriptionDetailsList;
	RestTemplate rest = new RestTemplate();

	public final Log LOGGER = LogFactory.getLog(ConsultingController.class);
	List<ConsultingDetails> consultingDetailsList;
	String paymentMessage=null;
	 SuggestLabTestFromDoctor suggestLabTestFromDoctor;
	
	//private HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	
	
	@RequestMapping(value = "/showDoctorConsulting/{patientId}/{appoitId}/{hospitalId}/{virtual}", method = RequestMethod.GET)

	public ModelAndView showDoctorPatientMeeting(@PathVariable("patientId") int patientId,
			@PathVariable("appoitId") int appoitId,@PathVariable("hospitalId") int hospitalId,@PathVariable("virtual")int virtual, HttpServletRequest request, HttpServletResponse response) {

		
		
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		MultiValueMap<String, Object> mapApp = new LinkedMultiValueMap<String, Object>();
		mapApp.add("appoitId", appoitId);
	//	
		
		ModelAndView model;
		
			model = new ModelAndView("doctor/show_offline_consulting");
		
		PatientDetails patientDetails = new PatientDetails();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + patientId);
		try {

			patientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsWithCityNameById", map, PatientDetails.class);
		
			SpecializationDetailsList specializationList=new SpecializationDetailsList();
			specializationList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization", SpecializationDetailsList.class);
			
			
			
			/*SpecializationDetailsList specializationList = Constant.getRestTemplate().getForObject(Constant.url + "getAllSpecialization",
					SpecializationDetailsList.class);
			System.out.println("Specialization=" + specializationList.toString());*/
			
			model.addObject("specializationList", specializationList.getSpecializationDetailsList());
		} catch (Exception e) {
			
			LOGGER.error("Error while fetching showDoctorConsulting details by patient id and appointment id.",e);
			throw new RuntimeException("Error while fetching showDoctorConsulting details by patient id and appointment id.",e);
		}
		try {
		
			
			
		LabTestsList allLabTests=Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",LabTestsList.class);
		model.addObject("labTestsList",allLabTests.getLabTestsList());
		

		}
		catch (Exception e) {
			LOGGER.error("Error while getAllLabTests",e);
		 	throw new RuntimeException("Error while getAllLabTests",e);
		}
		
		
		
		
		model.addObject("virtual",virtual);
		model.addObject("patientDetails", patientDetails);
		prescriptionDetailsList = new ArrayList<PrescriptionDetails>();
		model.addObject("appoitId", appoitId);
		model.addObject("type", "inline");
		model.addObject("reportUrl", Constant.patientUrl);
		model.addObject("patientProfile", Constant.patientProfile);
		model.addObject("openProfile", "active in");
		model.addObject("openHistory", "");
		model.addObject("activeHistory", "");
		model.addObject("appointActive", "active");
		model.addObject("dcmFileUrl",Constant.dmcFileUrl);
		model.addObject("hospitalId",hospitalId);
		model.addObject("url",Constant.VIDEOCALLURL);
		

		return model;

	}

	
	
	
	
	
	
	/**
	 * @author Ganesh
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getPatientHistoryByPatientId", method = RequestMethod.GET)
	public @ResponseBody PatientAllPersonalHistory getPatientHistoryByPatientId(HttpServletRequest request)
	{
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		
		RestTemplate rest = new RestTemplate();
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);
		 
		try {
			 
				PatientAllPersonalHistory patientAllPersonalHistory=Constant.getRestTemplate().postForObject(Constant.url+"getPatientAllHistory",map, PatientAllPersonalHistory.class);
			 return patientAllPersonalHistory;
		}
		catch (Exception e) {
			LOGGER.error("Error while fetching patient history details.", e);
			throw new RuntimeException("Error while fetching patient history details.", e);
		}
	 
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/getPatientHistoryDetails/{patientId}/{appoitId}", method = RequestMethod.GET)
	public ModelAndView getPatientHistoryDetails(@PathVariable("patientId") int patientId,
			@PathVariable("appoitId") int appoitId, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model;
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		if (doctorDetails.getSpecId() == 7) {
			model = new ModelAndView("radiology/show_offline_radiology");
		} else {
			model = new ModelAndView("doctor/show_offline_consulting");
		}
	

		RestTemplate rest = new RestTemplate();

		PatientDetails patientDetails = new PatientDetails();

		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId", patientId);
			patientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsById", map, PatientDetails.class);
			
		} catch (Exception e) {
		
			LOGGER.error("Error while fetching patient history details.", e);
			throw new RuntimeException("Error while fetching patient history details.", e);
	
		}
		try {
			SpecializationDetailsList specializationList=new SpecializationDetailsList();
			specializationList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization",SpecializationDetailsList.class);
		
			
			model.addObject("specializationList", specializationList.getSpecializationDetailsList());
		} catch (Exception e) {
			
			LOGGER.error("Error while fetching patient history details.", e);
			throw new RuntimeException("Error while fetching patient history details.", e);
		
		}

		model.addObject("patientDetails", patientDetails);
		prescriptionDetailsList = new ArrayList<PrescriptionDetails>();
		model.addObject("appoitId", appoitId);
		model.addObject("reportUrl", Constant.doctorUrl);
		model.addObject("patientProfile", Constant.patientProfile);
		model.addObject("openHistory", "active in");
		model.addObject("openProfile", "");
		model.addObject("activeHistory", "active");
		model.addObject("activeProfile", "");
		model.addObject("type", "none");
		model.addObject("appointActive", "active");
		PatientAllPersonalHistory patientAllPersonalHistory = new PatientAllPersonalHistory();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + patientId);

		try {
			patientAllPersonalHistory = Constant.getRestTemplate().postForObject(Constant.url + "getPatientHistory", map,
					PatientAllPersonalHistory.class);
			/*
			 * for(int i=0;i<5;i++) {
			 * System.out.println(patientAllPersonalHistory.getPatientPastHistoryIIlnessList
			 * ().get(i)); } System.out.println("PatientAllPersonalHistoryList " +
			 * patientAllPersonalHistory.toString());
			 */

			model.addObject("menstrualObstetricHistory", patientAllPersonalHistory.getMenstrualObstetricHistory());
			model.addObject("patientFamilyHistory", patientAllPersonalHistory.getPatientFamilyHistory());
			model.addObject("patientHistoryChiefComplaints",
					patientAllPersonalHistory.getPatientHistoryChiefComplaints());
			model.addObject("patientPastHistory", patientAllPersonalHistory.getPatientPastHistory());
			model.addObject("patientPastHistoryIIlness", patientAllPersonalHistory.getPatientPastHistoryIIlness());
			model.addObject("patientPersonalHistory", patientAllPersonalHistory.getPatientPersonalHistory());
			model.addObject("patientPsychologicalHistory", patientAllPersonalHistory.getPatientPsychologicalHistory());
			model.addObject("patientTreatementHistoryp", patientAllPersonalHistory.getPatientTreatementHistoryp());
			model.addObject("patientHistoryIllnessList", patientAllPersonalHistory.getPatientPastHistoryIIlnessList());


		} catch (Exception e) {
			LOGGER.error("Error while fetching patient history details.", e);
			throw new RuntimeException("Error while fetching patient history details.", e);
		}

		return model;
	}

	@RequestMapping(value = "/addMedicineToList", method = RequestMethod.GET)
	public @ResponseBody List<PrescriptionDetails> addMedicineToList(HttpServletRequest request,
			HttpServletResponse response) {
		

		PrescriptionDetails prescriptionDetails = new PrescriptionDetails();

		
		String medicineName = request.getParameter("medicineName");
		
		String medicineQuantity = request.getParameter("medicineQuantity");
		
		String timing = request.getParameter("timing");
		
		String instruction = request.getParameter("instruction");

		
		prescriptionDetails.setMedicineName(medicineName);

		prescriptionDetails.setMedicineQuantity(medicineQuantity);
		prescriptionDetails.setMedicineTiming(timing);
		prescriptionDetails.setMedicineInstruction(instruction);
		prescriptionDetails.setDelstatus(0);
		prescriptionDetails.setString1("1");
		prescriptionDetails.setString2("1");
		prescriptionDetails.setInt1(0);
		prescriptionDetails.setInt2(0);

		
		try {
			prescriptionDetailsList.add(prescriptionDetails);
		
		} catch (Exception e) {
		
			
			LOGGER.error("Error while adding medicine to database in addMedicineToList.", e);
			throw new RuntimeException("Error while adding medicine to database in addMedicineToList.", e);
		}
		return prescriptionDetailsList;
	}

	@RequestMapping(value = "/removeMedicineFromList", method = RequestMethod.GET)
	public void removeMedicineFromList(HttpServletRequest request) {

		prescriptionDetailsList.remove(Integer.parseInt(request.getParameter("key")));
	}

	@RequestMapping(value = "/submitDoctorPatientMeeting", method = RequestMethod.POST)

	public String submitDoctorPatientMeeting(HttpServletRequest request, HttpServletResponse response) {

		
	
		
		DoctorPatientMeeting doctorPatientMeeting = new DoctorPatientMeeting();

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		int doctorId = doctorDetails.getDoctorId();

		doctorPatientMeeting.setPatientId(Integer.parseInt(request.getParameter("patientId")));
		doctorPatientMeeting.setTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
		doctorPatientMeeting.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		doctorPatientMeeting.setDiscussion(request.getParameter("discussion"));
		doctorPatientMeeting.setPatientProblem(request.getParameter("patientProblem"));
		doctorPatientMeeting.setNote(request.getParameter("specInstuction"));
		doctorPatientMeeting.setPrescriptionDetailsList(prescriptionDetailsList);
		doctorPatientMeeting.setDoctorId(doctorId);
		doctorPatientMeeting.setPatientId(patientId);
		doctorPatientMeeting.setString1("1");
		doctorPatientMeeting.setString2("1");
		doctorPatientMeeting.setInt1(Integer.parseInt(request.getParameter("hospitalId")));
		doctorPatientMeeting.setInt2(Integer.parseInt(request.getParameter("appointId"))); //as a appointId
		
		try {

			DoctorPatientMeeting doctorPatientMeetingRes = Constant.getRestTemplate().postForObject(Constant.url + "insertDoctoPatientMeeting", doctorPatientMeeting,
					DoctorPatientMeeting.class);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("appId", request.getParameter("appointId"));
			map.add("status", 4);
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "updateDoctorAppointmentStatus", map, Info.class);
			System.out.println("doctorPatientMeetingRes  "+doctorPatientMeetingRes.toString());
			if(suggestLabTestFromDoctor!=null) {
				System.out.println("suggestLabTestFromDoctor "+suggestLabTestFromDoctor.toString());

				suggestLabTestFromDoctor.setMeetId(doctorPatientMeetingRes.getMeetId());
			SuggestLabTestFromDoctor suggestLabTestFromDoctorRes = Constant.getRestTemplate().postForObject(Constant.url + "lab/saveTestsSuggestionAndRefferal", suggestLabTestFromDoctor, SuggestLabTestFromDoctor.class);
			}	
		
		} catch (Exception e) {
			LOGGER.error("Error while submitting patient doctor meeting data in submitDoctorPatientMeeting.", e);
			throw new RuntimeException("Error while submitting patient doctor meeting data in submitDoctorPatientMeeting.", e);
		}

		prescriptionDetailsList = new ArrayList<PrescriptionDetails>();
		return "redirect:/showViewDoctorAppointment";
		
		
		
		
	}

	@RequestMapping(value = "/getPatientReportByPatientAndDocId", method = RequestMethod.GET)

	public @ResponseBody List<GetPatientReports> getPatientReportByPatientAndDocId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		List<GetPatientReports> getPatientReportsList = new ArrayList<GetPatientReports>();
		String patientId = request.getParameter("patientId");

		int doctorId = doctorDetails.getDoctorId();
	
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);
		map.add("doctorId",doctorId);

		try {
			getPatientReportsList = Constant.getRestTemplate().postForObject(Constant.url + "lab/getPatientReportByPatientAndDocId", map,List.class);
		

		} catch (Exception e) {
			LOGGER.error("Error while fetching reports in getPatientReportByPatientAndDocId.", e);
			throw new RuntimeException("Error while fetching reports in getPatientReportByPatientAndDocId.", e);
		}

		return getPatientReportsList;
	}

	@RequestMapping(value = "/showViewConsultHistory", method = RequestMethod.GET)

	public ModelAndView showViewConsultHistory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("doctor/viewConsultHistory");
		
		String fromDate = DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate = DateConverter.convertToYMD(request.getParameter("toDate"));

		/*if(fromDate.compareTo(toDate)>0) {
			model.addObject("message","Invalid Date Entered");
		}else {*/
		
	

		// int patientId=1;
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		MultiValueMap<String, Object> mapGetTwentyRecords = new LinkedMultiValueMap<String, Object>();
		mapGetTwentyRecords.add("doctorId", doctorDetails.getDoctorId());
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("doctorId", doctorDetails.getDoctorId());
		map.add("startdate", fromDate);
		map.add("enddate", toDate);
		 consultingDetailsList = new ArrayList<ConsultingDetails>();
		try {
			if (fromDate == null) {
				/*fromDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				toDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());*/
				consultingDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getConsultingByDoctorId", mapGetTwentyRecords, List.class);
			}else {
			
			consultingDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getConsultingByDoctorAndDate", map, List.class);
			}
			
			if(consultingDetailsList.isEmpty()) {
			
				model.addObject("message","hh");
			}else {
			
			
					
				System.out.println("consultingDetailsList=s"+consultingDetailsList.toString());
				model.addObject("consultingDetailsList", consultingDetailsList);
				model.addObject("fromDate", DateConverter.convertToDMY(fromDate));
				model.addObject("toDate", DateConverter.convertToDMY(toDate));
				model.addObject("active", "active");
				model.addObject("consultActive", "active");
			}
		
		} catch (Exception e) {
			LOGGER.error("Error while doctor consult history in showViewConsultHistory.", e);
			throw new RuntimeException("Error while doctor consult history in showViewConsultHistory.", e);
		}
		//}
		return model;
	}

	/*@RequestMapping(value = "/getRadioPatientHistoryDetails(${patientDetails.patientId}, ${appoitId})", method = RequestMethod.GET)
	public ModelAndView getRadioPatientHistoryDetails(@PathVariable("patientId") int patientId,
			@PathVariable("appoitId") int appoitId, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("cdcdc");
		ModelAndView model = new ModelAndView("radiology/show_offline_radiology");

		// HttpSession session = request.getSession();
		// PatientDetails
		// patientDetail=(PatientDetails)session.getAttribute("patientDetails");
		// int patientId=patientDetail.getPatientId();

		RestTemplate rest = new RestTemplate();

		PatientDetails patientDetails = new PatientDetails();

		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId", "" + patientId);
			patientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsById", map, PatientDetails.class);

		} catch (Exception e) {
			
			LOGGER.error("Error while doctor radiologist consult history in getRadioPatientHistoryDetails.", e);
			throw new RuntimeException("Error while doctor radiologist consult history in getRadioPatientHistoryDetails.", e);
			
		}
		try {
			SpecializationDetailsList specializationList=new SpecializationDetailsList();
		 specializationList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllSpecialization", SpecializationDetailsList.class);
			
			model.addObject("specializationList", specializationList.getSpecializationDetailsList());
		} catch (Exception e) {
			
			LOGGER.error("Error while doctor radiologist consult history in getRadioPatientHistoryDetails.", e);
			throw new RuntimeException("Error while doctor radiologist consult history in getRadioPatientHistoryDetails.", e);
		
		}

		model.addObject("patientDetails", patientDetails);
		prescriptionDetailsList = new ArrayList<PrescriptionDetails>();
		model.addObject("appoitId", appoitId);
		model.addObject("reportUrl", Constant.doctorUrl);
		model.addObject("patientProfile", Constant.patientProfile);
		model.addObject("openHistory", "active in");
		model.addObject("openProfile", "");
		model.addObject("activeHistory", "active");
		model.addObject("activeProfile", "");
		PatientAllPersonalHistory patientAllPersonalHistory = new PatientAllPersonalHistory();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", "" + patientId);

		try {
			patientAllPersonalHistory = Constant.getRestTemplate().postForObject(Constant.url + "getPatientHistory", map,
					PatientAllPersonalHistory.class);

			model.addObject("menstrualObstetricHistory", patientAllPersonalHistory.getMenstrualObstetricHistory());
			model.addObject("patientFamilyHistory", patientAllPersonalHistory.getPatientFamilyHistory());
			model.addObject("patientHistoryChiefComplaints",
					patientAllPersonalHistory.getPatientHistoryChiefComplaints());
			model.addObject("patientPastHistory", patientAllPersonalHistory.getPatientPastHistory());
			model.addObject("patientPastHistoryIIlness", patientAllPersonalHistory.getPatientPastHistoryIIlness());
			model.addObject("patientPersonalHistory", patientAllPersonalHistory.getPatientPersonalHistory());
			model.addObject("patientPsychologicalHistory", patientAllPersonalHistory.getPatientPsychologicalHistory());
			model.addObject("patientTreatementHistoryp", patientAllPersonalHistory.getPatientTreatementHistoryp());
			model.addObject("patientHistoryIllnessList", patientAllPersonalHistory.getPatientPastHistoryIIlnessList());

			

		} catch (Exception e) {
			LOGGER.error("Error while doctor radiologist consult history in getRadioPatientHistoryDetails.", e);
			throw new RuntimeException("Error while doctor radiologist consult history in getRadioPatientHistoryDetails.", e);
		}

		return model;
	}*/

	@RequestMapping(value = "/getPatientConsultedHistory", method = RequestMethod.GET)
	@ResponseBody
	public List<ConsultingDetails> showDoctorProfile(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

	  consultingDetailsList = new ArrayList<ConsultingDetails>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		
		map.add("patientId",""+patientId);
		map.add("doctorId",""+doctorDetails.getDoctorId());
		try {
			consultingDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getPatientConsultingHistoryToDoctor", map, List.class);

			System.out.println("consultingDetailsList " + consultingDetailsList.toString());
			//TODO
			/*create in web service of getPatientConsultingHistory*/
		} catch (Exception e) {
			
			LOGGER.error("Error while fecting patient consulted history in getPatientConsultedHistory", e);
			throw new RuntimeException("Error while fecting patient consulted history in getPatientConsultedHistory", e);
		
		}
		
		
		return consultingDetailsList;

	}
	
	
	

	@RequestMapping(value = "/getPrescriptionDetaisByMeetingId", method = RequestMethod.GET)
	public @ResponseBody GetPrescription getPrescriptionDetaisByMeetingId(HttpServletRequest request,
			HttpServletResponse response) {
 
		int meetingId = Integer.parseInt(request.getParameter("meetId"));

		List<PrescriptionDetails> prescriptionDetails = new ArrayList<PrescriptionDetails>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("meetingId", meetingId);
		GetPrescription getPrescription=new GetPrescription();
	 
		
		
		try {
			ConsultingDetails consultingDetails = Constant.getRestTemplate().postForObject(Constant.url + "getConsultingByMeetingId",
					map, ConsultingDetails.class);
			getPrescription.setConsultingDetails(consultingDetails);
		 
		} catch (Exception e) {

			LOGGER.error("Error while getConsultingByMeetingId.", e);
			throw new RuntimeException("Error while getConsultingByMeetingId.", e);
		}
		
		try {
			prescriptionDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPrescriptionByMeetingId",
					map, List.class);
			getPrescription.setPrescriptionDetailsList(prescriptionDetails);
		} catch (Exception e) {

			LOGGER.error("Error while getPrescriptionByMeetingId.", e);
			throw new RuntimeException("Error while getPrescriptionByMeetingId.", e);
		}

		return getPrescription;
	}
	
	
	
	@RequestMapping(value = "/checkPaymentStatus", method = RequestMethod.GET)
	public @ResponseBody Info checkPaymentStatus(HttpServletRequest request, HttpServletResponse response) {
		
		
	 
		int appointId=Integer.parseInt(request.getParameter("appointId"));
		MultiValueMap<String, Object> mapApp = new LinkedMultiValueMap<String, Object>();
		
		mapApp.add("appointId", appointId);
		
		Info info1=Constant.getRestTemplate().postForObject(Constant.url + "getPatientPaymentConcultingDetails", mapApp, Info.class);
		
		
		
		return info1;
				
	}
	
	 @RequestMapping(value = "/showConsultBill/{meetId}", method = RequestMethod.GET)
		public ModelAndView showConsultBill(HttpServletRequest request, HttpServletResponse response,@PathVariable("meetId") int meetId) {
		 ModelAndView model = new ModelAndView("doctor/consult_billing");
		
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 AppointmentDetails appointmentDetails=new AppointmentDetails();	
		 map.add("meetId", meetId);
		 ConsultingDetails consultingDetails=Constant.getRestTemplate().postForObject(Constant.url + "getPatientDoctorConsultDetails", map, ConsultingDetails.class);
		 if(consultingDetails!=null) {
			 MultiValueMap<String, Object> mapApp = new LinkedMultiValueMap<String, Object>();
			 mapApp.add("appointId", consultingDetails.getInt2());
			appointmentDetails=Constant.getRestTemplate().postForObject(Constant.url + "getAppointmentDetailsByAppointId", mapApp, AppointmentDetails.class);
		 }
		 
		 System.out.println("aa"+consultingDetails.toString());
		 System.out.println("dcs"+appointmentDetails.toString());
		 
		 model.addObject("consultingDetails", consultingDetails);
		 model.addObject("appointmentDetails", appointmentDetails);
		 return model;
	 
	 
	 }
	 
	 @RequestMapping(value = "/submitConsultingPaymentByDoctor", method = RequestMethod.GET)
		public @ResponseBody Info submitConsultingPaymentByDoctor(HttpServletRequest request) {
			LOGGER.info("Update the payment info");
			 

			 
			float txnAmt = Float.parseFloat(request.getParameter("txnAmt"));
		 
			int appointId = Integer.parseInt(request.getParameter("appointId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("appointId", appointId);
			map.add("paymentStatus", 1);
			map.add("txnId", 0);
			map.add("orderId", 0);
			map.add("amount", txnAmt);
		
			map.add("walletAmount", 0);
			map.add("consultingAmount", txnAmt);
			map.add("walletId", 0);
			  
			try {
				Info info = Constant.getRestTemplate().postForObject(Constant.url + "updateAppointmentPayment", map,
						Info.class);
				return info;
			} catch (Exception e) {
				// TODO: handle exception
				LOGGER.error("Error while updateting patient Appointment payment", e);
				throw new RuntimeException("Error while updateting patient Appointment payment", e);
			}

		}
	 @RequestMapping(value = "/getLabByCityAndTests", method = RequestMethod.GET)
		public @ResponseBody List<GetLabForAppointment> getLabByCityAndTests(HttpServletRequest request) {
			LOGGER.info("getLabByCityAndTests info");
			String []testID = request.getParameterValues("testIdList");
			StringBuilder testIdList=new StringBuilder();
			for(String s:testID)
				testIdList.append(s+",");
			
			 System.out.println("testIdList   "+testIdList);
			try {
				HttpSession session = request.getSession();
				DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("cityId", doctorDetails.getCityId());
				map.add("testIdList",testIdList.substring(0,testIdList.length()-1));
			 
				List<GetLabForAppointment> labDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "lab/getLabsByCityIdAndTestId", map, List.class);
	 return labDetailsList;
			}
			catch (Exception e) {
				LOGGER.error("Error while getLabByCityAndTests", e);
				throw new RuntimeException("Error while getLabByCityAndTests", e);
			}
		 
	 }
	 
	 
	 @RequestMapping(value = "/saveTestsSuggestion", method = RequestMethod.GET)
		public @ResponseBody Info saveTestsSuggestion(HttpServletRequest request) {
		 
		 Info info=new Info();
		   suggestLabTestFromDoctor=new SuggestLabTestFromDoctor();
		 
		 HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			
		 suggestLabTestFromDoctor.setDoctorId(doctorDetails.getDoctorId());
		 suggestLabTestFromDoctor.setLabId(Integer.parseInt(request.getParameter("labId")));
		 suggestLabTestFromDoctor.setPatientId(Integer.parseInt(request.getParameter("patientId")));
		 suggestLabTestFromDoctor.setTestIdList(request.getParameter("testIdList"));
		 
		 info.setMessage("Test Suggestion Request Sent.");
		 
		 return info;
	 }
	 @RequestMapping(value = "/getSuggestLabTestFromDoctor", method = RequestMethod.GET)
		public @ResponseBody GetSuggestLabTestFromDoctor getSuggestLabTestFromDoctor(HttpServletRequest request) {
		 
		 
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("meetId", Integer.parseInt(request.getParameter("meetId")));
		 try {
		 GetSuggestLabTestFromDoctor getSuggestLabTestFromDoctor=Constant.getRestTemplate().postForObject(Constant.url + "lab/getSuggestLabTestFromDoctor", map, GetSuggestLabTestFromDoctor.class);
			return getSuggestLabTestFromDoctor;
		 }
		 catch (Exception e) {
			 LOGGER.error("Error while getSuggestLabTestFromDoctor", e);
				throw new RuntimeException("Error while getSuggestLabTestFromDoctor", e);
		}
		  
	 }
	 
	 
	 @RequestMapping(value = "/showPatientSharedReports", method = RequestMethod.GET)
		public String showPatientSharedReports(HttpServletRequest request, HttpServletResponse response, Model model) {
		 model.addAttribute("reportUrl", Constant.patientUrl);
		 model.addAttribute("patientSharedReports","active");
		 return "doctor/showPatientSharedReports";
	 }
	
	 
	 
	 
	 
	 @RequestMapping(value = "/getConsultingBillByMeetId", method = RequestMethod.GET)
		public @ResponseBody GetConsultingBill getConsultingBillByMeetId(HttpServletRequest request) {
		 
		 
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("meetId", Integer.parseInt(request.getParameter("meetId")));
		 try {
		 return Constant.getRestTemplate().postForObject(Constant.url + "getConsultingBillByMeetId", map, GetConsultingBill.class);
			 
		 }
		 catch (Exception e) {
			 LOGGER.error("Error while getConsultingBillByMeetId", e);
				 
		}
		  return null;
	 }
	 
	 
}
