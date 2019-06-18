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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patientdoctor.model.AppointmentTimeList;
import com.bionische.biocare.patientdoctor.model.GetAppointmentDetails;

 
@Scope("session")
@Controller
public class ApoointmentController {

	public final Log LOGGER = LogFactory.getLog(ApoointmentController.class);
	public RestTemplate rest=new RestTemplate(); 
	
	
	@RequestMapping(value = "/showViewDoctorAppointment", method = RequestMethod.GET)
	public ModelAndView showViewDoctorAppointment(HttpServletRequest request) 
		
		{
		
		ModelAndView model = new ModelAndView("doctor/patientAppointDispytoDoc");
		List<GetAppointmentDetails>  getAppointmentDetailsList = new ArrayList<GetAppointmentDetails>();
	//	Constant.getRestTemplate().getInterceptors().add(new BasicAuthorizationInterceptor("admin1", "secret1"));

		
		String fromDate= DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate=DateConverter.convertToYMD(request.getParameter("toDate"));
		String patientId=request.getParameter("patientId");
		String fullName="";
		
  		HttpSession session = request.getSession();
		DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
	 
	
	int doctorId=doctorDetails.getDoctorId();

	try {
	RestTemplate rest = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	
	if(patientId==null||patientId=="")
	{
	if(fromDate!=null && fromDate!="" && toDate!=null && toDate!="")
	{
		
		System.out.println(fromDate +"  "+toDate);
		map.add("fromDate", fromDate);
		map.add("toDate", toDate);
		map.add("doctorId", ""+doctorId);
	    getAppointmentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "getAppmtDetailsByDoctorIdDate", map, List.class);

	}
	
	else {
		
		map.add("fromDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		map.add("toDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		map.add("doctorId", ""+doctorId);
	    getAppointmentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "getAppmtDetailsByDoctorIdDate", map, List.class);

	}}
	else if(patientId!=null && patientId!="")
	{
		
		map.add("doctorId", ""+doctorId);
		map.add("patientId", patientId);
	    getAppointmentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "getAppmtDetailsByDoctorIdPatId", map, List.class);
	}
	 
	model.addObject("fromDate", DateConverter.convertToDMY(fromDate));
	model.addObject("toDate", DateConverter.convertToDMY(toDate));
	 model.addObject("getTempAppointmentList",getAppointmentDetailsList);
		} catch (Exception e) {
			
			LOGGER.error("Error while fecthing doctor appointments baby reports in showViewDoctorAppointment",e);
			throw new RuntimeException("Error while fecthing doctor appointments baby reports in showViewDoctorAppointment",e);
	
		}
	
	if(patientId==null||patientId!="")
	{
	 if(fromDate!=null && fromDate!="" && toDate!=null && toDate!="")
	{
		model.addObject("fromDate", DateConverter.convertToDMY(fromDate));
		model.addObject("toDate", DateConverter.convertToDMY(toDate));
	}
	else {
		model.addObject("fromDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		model.addObject("toDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
	} 
	}
	    model.addObject("appointActive", "active"); 
	    model.addObject("patientId",patientId);
	    model.addObject("currentDate",  new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		return model;
 
}
		
	//Ganesh 
		//getAppointment time
		@RequestMapping(value = "/getAppointmentsTime", method = RequestMethod.GET)

		public @ResponseBody AppointmentTimeList getAppointmentTime(HttpServletRequest request,
				HttpServletResponse response) {

		 

		
			int doctorId = Integer.parseInt(request.getParameter("doctorId"));
			String appDate = DateConverter.convertToYMD(request.getParameter("appointmentDate"));
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", ""+doctorId);
			map.add("date", appDate);
			
			//List<AppointmentTime> appointmentTimeList = new ArrayList<>();
			AppointmentTimeList appointmentTimeList=new AppointmentTimeList();
			//AppointmentTime appointmentTime=new AppointmentTime();
	 
			RestTemplate rest = new RestTemplate();

			try {
				appointmentTimeList = Constant.getRestTemplate().postForObject(Constant.url + "getAllAppointTime", map, AppointmentTimeList.class);
			
	 
			} catch (Exception e) {
				
				LOGGER.error("Error while fecthing doctor appointments time in getAppointmentsTime",e);
				throw new RuntimeException("Error while fecthing doctor appointments time in getAppointmentsTime",e);
			}
			
			return appointmentTimeList;

		}
		
		
		//ganesh
		//cancel Appontment
		@RequestMapping(value = "/deleteDoctorAppointment", method = RequestMethod.GET)
		public @ResponseBody Info deleteDoctorAppointment(HttpServletRequest request,
				HttpServletResponse response)
		{
			int appId=Integer.parseInt(request.getParameter("appId"));
			
		
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 
			map.add("appId", ""+appId);
			map.add("status", ""+3);
			
			Info  info =new Info();
			try {
				info=Constant.getRestTemplate().postForObject(Constant.url + "updateDoctorAppointmentStatus", map, Info.class);
		
			}catch (Exception e) {
				LOGGER.error("Error while cancel doctor appointment in deleteDoctorAppointment",e);
				throw new RuntimeException("Error while cancel doctor appointment in deleteDoctorAppointment",e);
			}
			return info;
		}
		
		
		@RequestMapping(value = "/editPatientAppointmentByDoctor", method = RequestMethod.GET)
		public @ResponseBody Info editPatientAppointmentByDoctor(HttpServletRequest request,
				HttpServletResponse response)
		{
		
			int appId=Integer.parseInt(request.getParameter("appointId"));
			 
			String date=DateConverter.convertToYMD(request.getParameter("appointmentDate"));
			int timeId=Integer.parseInt(request.getParameter("timeId"));
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 
			map.add("appId", ""+appId);
			map.add("timeId", ""+timeId);
			if (date.matches("\\d{4}-\\d{2}-\\d{2}")) {
				 map.add("date",date);
			}
			else
			{
		    	 map.add("date",DateConverter.convertToYMD(date));
			}
		
			Info  info =new Info();
			try {
				info=Constant.getRestTemplate().postForObject(Constant.url + "editDoctorAppointment", map, Info.class);
			
			}catch (Exception e) {
			
				LOGGER.error("Error while edit patient appointment in editPatientAppointmentByDoctor",e);
				throw new RuntimeException("Error while edit patient appointment in editPatientAppointmentByDoctor",e);
				
			}
			return info;
		}
		
		
		
		@RequestMapping(value = "/sendConsultingPaymentRequest", method = RequestMethod.GET)
		public @ResponseBody Info sendConsultingPaymentRequest(HttpServletRequest request,
				HttpServletResponse response)
		{
			
			Info info=new Info();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			 
			map.add("patientId", Integer.parseInt(request.getParameter("patientId")));
			map.add("appointmentId", Integer.parseInt(request.getParameter("appointmentId")));
			try {
				info=Constant.getRestTemplate().postForObject(Constant.url + "sendConsultingPaymentRequest", map, Info.class);
			
			}catch (Exception e) {
			
				LOGGER.error("Error while send payment request to patient in sendConsultingPaymentRequest",e);
				throw new RuntimeException("Error while send payment request to patient in sendConsultingPaymentRequest",e);
				
			}
			
			return info;
			
		}
		
}
