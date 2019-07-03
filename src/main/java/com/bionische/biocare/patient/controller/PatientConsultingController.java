package com.bionische.biocare.patient.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
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
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patientdoctor.model.ConsultingDetails;
import com.bionische.biocare.patientdoctor.model.GetPrescriptionDetailsWithDoctorDetailsByMeetId;
import com.bionische.biocare.patientdoctor.model.PrescriptionDetails;

@Scope("session")
@Controller
public class PatientConsultingController {

	// HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	public final Log LOGGER = LogFactory.getLog(PatientConsultingController.class);

	@RequestMapping(value = "/showPatientConsultToPage", method = RequestMethod.GET)
	public ModelAndView showPatientConsultToPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("patient/viewConsultingToPatient");
		RestTemplate rest = new RestTemplate();

		HttpSession session = request.getSession();
		PatientDetails patientDetails = (PatientDetails) session.getAttribute("patientDetails");
		int patientId = patientDetails.getPatientId();
		int familyId = patientDetails.getFamilyId();

		List<DoctorDetails> doctorDetails = new ArrayList<DoctorDetails>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);

		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", "" + patientDetails.getFamilyId());
		/*
		 * doctorDetails=Constant.getRestTemplate().postForObject(Constant.url+
		 * "getDoctorDetailsByPatientId",map,List.class)
		 */;
		try {
			doctorDetails = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorDetailsByPatientId", map,
					List.class);
			List<PatientDetails> patientDetailList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPatientFamilyMembersList", mapfam, List.class);
			model.addObject("patientDetailList", patientDetailList);
			model.addObject("memberLength", patientDetailList.size());
			model.addObject("consultActive", "active");
			model.addObject("doctorDetails", doctorDetails);

		} catch (Exception e) {

			LOGGER.error("Error while showPatientConsultToPage.", e);
			throw new RuntimeException("Error while showPatientConsultToPage.", e);
		}
		List<ConsultingDetails> getConsultingDetailsByDoctorList = new ArrayList<ConsultingDetails>();

		MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();

		map1.add("patientId", patientId);

		try {
			getConsultingDetailsByDoctorList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getLast10ConsultingByPatientId", map1, List.class);

			model.addObject("getConsultingDetailsByDoctorList", getConsultingDetailsByDoctorList);
			model.addObject("patientId", patientId);
		} catch (Exception e) {
			LOGGER.error("Error while getLast10ConsultingByPatientId.", e);
			throw new RuntimeException("Error while getLast10ConsultingByPatientId.", e);
		}
		/* model.addObject("doctorDetails", doctorDetails); */

		return model;

	}

	@RequestMapping(value = "/getDoctorsByPatientId", method = RequestMethod.GET)

	public @ResponseBody List<DoctorDetails> getDoctorsByPatientId(HttpServletRequest request,
			HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		;

		List<DoctorDetails> doctorDetails = new ArrayList<DoctorDetails>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);

		try {
			doctorDetails = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorDetailsByPatientId", map,
					List.class);
		} catch (Exception e) {

			LOGGER.error("Error while getDoctorsByPatientId.", e);
			throw new RuntimeException("Error while getDoctorsByPatientId.", e);
		}

		return doctorDetails;

	}

	@RequestMapping(value = "/getConsultingDetailsByDoctor", method = RequestMethod.GET)
	public @ResponseBody List<ConsultingDetails> getConsultingDetailsByDoctor(HttpServletRequest request,
			HttpServletResponse response) {

		String startdate = DateConverter.convertToYMD(request.getParameter("startdate"));
		String enddate = DateConverter.convertToYMD(request.getParameter("enddate"));
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		int patientId = Integer.parseInt(request.getParameter("patientId"));

		List<ConsultingDetails> getConsultingDetailsByDoctor = new ArrayList<ConsultingDetails>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("doctorId", doctorId);
		map.add("patientId", patientId);
		map.add("startdate", startdate);
		map.add("enddate", enddate);

		try {
			getConsultingDetailsByDoctor = Constant.getRestTemplate()
					.postForObject(Constant.url + "getConsultingByDoctorIdAndDate", map, List.class);

			System.out.println("getConsultingDetailsByDoctor" + getConsultingDetailsByDoctor.toString());

		} catch (Exception e) {

			LOGGER.error("Error while getConsultingDetailsByDoctor.", e);
			throw new RuntimeException("Error while getConsultingDetailsByDoctor.", e);
		}

		return getConsultingDetailsByDoctor;
	}

	@RequestMapping(value = "/getPrescriptionByMeetingId", method = RequestMethod.GET)
	public @ResponseBody List<PrescriptionDetails> getPrescriptionByMeetingId(HttpServletRequest request,
			HttpServletResponse response) {

		int meetingId = Integer.parseInt(request.getParameter("meetId"));

		List<PrescriptionDetails> prescriptionDetails = new ArrayList<PrescriptionDetails>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("meetingId", meetingId);

		try {
			prescriptionDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPrescriptionByMeetingId",
					map, List.class);

		} catch (Exception e) {

			LOGGER.error("Error while getPrescriptionByMeetingId.", e);
			throw new RuntimeException("Error while getPrescriptionByMeetingId.", e);
		}

		return prescriptionDetails;
	}
	
	
	@RequestMapping(value = "/getPrescriptionByMeetId/{meetId}", method = RequestMethod.GET)
	public ModelAndView getPrescriptionByMeetId(@PathVariable ("meetId") int meetId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model=new ModelAndView("patient/prescriptionView");
		
		
		
		List<PrescriptionDetails> prescriptionDetails = new ArrayList<PrescriptionDetails>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("meetId", meetId);

		try {
			
			ConsultingDetails consultingDetails=Constant.getRestTemplate().postForObject(Constant.url + "getPatientDoctorConsultDetails",
					map, ConsultingDetails.class);
			
			System.out.println("consultingDetails= "+consultingDetails.toString());
			
			prescriptionDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPrescriptionByMeetId",map, List.class);
			
			model.addObject("consultingDetails", consultingDetails);
			model.addObject("prescriptionDetails",prescriptionDetails);


		} catch (Exception e) {

			LOGGER.error("Error while getPrescriptionByMeetingId.", e);
			throw new RuntimeException("Error while getPrescriptionByMeetingId.", e);
		}

		return model;
	}
	
	
	

	@RequestMapping(value = "/getConsultingDetailsByDoctorHaveingPresc", method = RequestMethod.GET)
	public @ResponseBody List<ConsultingDetails> getConsultingDetailsByDoctorHaveingPresc(HttpServletRequest request,
			HttpServletResponse response) {

		String startdate = DateConverter.convertToYMD(request.getParameter("startdate"));
		String enddate = DateConverter.convertToYMD(request.getParameter("enddate"));
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		int patientId = Integer.parseInt(request.getParameter("patientId"));

		List<ConsultingDetails> getConsultingDetailsByDoctor = new ArrayList<ConsultingDetails>();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("doctorId", doctorId);
		map.add("patientId", patientId);
		map.add("startdate", startdate);
		map.add("enddate", enddate);

		try {
			getConsultingDetailsByDoctor = Constant.getRestTemplate()
					.postForObject(Constant.url + "getConsultingByDoctorIdAndDatePresc", map, List.class);

		} catch (Exception e) {

			LOGGER.error("Error while getConsultingDetailsByDoctorHaveingPresc.", e);
			throw new RuntimeException("Error while getConsultingDetailsByDoctorHaveingPresc.", e);
		}
		return getConsultingDetailsByDoctor;
	}
	
	
	@RequestMapping(value = "/getPrescriptionWithDoctorByMeetId", method = RequestMethod.GET)
	public @ResponseBody GetPrescriptionDetailsWithDoctorDetailsByMeetId getPrescriptionWithDoctorByMeetId(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("meetId", Integer.parseInt(request.getParameter("meetId")));
			GetPrescriptionDetailsWithDoctorDetailsByMeetId getPrescriptionDetailsWithDoctorDetailsByMeetId= Constant.getRestTemplate()
					.postForObject(Constant.url + "getPrescriptionDetailsAndDoctorDetailsByMeetid", map, GetPrescriptionDetailsWithDoctorDetailsByMeetId.class);
return getPrescriptionDetailsWithDoctorDetailsByMeetId;
		} catch (Exception e) {

			LOGGER.error("Error while getPrescriptionWithDoctorByMeetId.", e);
			throw new RuntimeException("Error while getPrescriptionWithDoctorByMeetId.", e);
		}
		
	}
}
