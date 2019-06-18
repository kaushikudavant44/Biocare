package com.bionische.biocare.lab.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patientdoctor.model.AppointmentTimeList;
import com.bionische.biocare.patientlab.model.GetLabAppointment;
 
@Scope("session")
@Controller
public class LabAppointController {

	private static final Logger logger = LoggerFactory.getLogger(LabAppointController.class);
	
	@RequestMapping(value = "/showViewLabAppointment", method = RequestMethod.GET)
	public ModelAndView showViewLabAppointment(HttpServletRequest request)
		{
		ModelAndView model = new ModelAndView("lab/patientAppointDispytoLab");
		String fromDate= DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate=DateConverter.convertToYMD(request.getParameter("toDate"));
		String patientId=request.getParameter("patientId");
		HttpSession session = request.getSession();
		LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
	 int labId=labDetails.getLabId();
try {
	RestTemplate rest = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	 
	boolean flag=false;
	
	if(patientId==null||patientId=="") {
	if(fromDate!=null && fromDate!="" && toDate!=null && toDate!="")
	{
		flag=true;
		map.add("fromDate", fromDate);
		map.add("toDate", toDate);
	}
	else {
		map.add("fromDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		map.add("toDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		toDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}
	}
	else
	 {
		 int labPatId=Integer.parseInt(patientId);
		 map.add("patientId", ""+labPatId);
	 }
	map.add("labId", ""+labId);
	if(patientId==null||patientId=="")
	 {
	if(flag)
	{	
		model.addObject("fromDate", DateConverter.convertToDMY(fromDate));
		model.addObject("toDate", DateConverter.convertToDMY(toDate));
	}
	else {
			model.addObject("fromDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
			model.addObject("toDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
	}
	 }
	 if(patientId==null||patientId=="")
	 {	
		 List<GetLabAppointment> getAppointmentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "lab/getLabAppointmentByLabId", map, List.class);
	model.addObject("getAppointmentDetailsList",getAppointmentDetailsList);
	 }
	 else
	 {
		 List<GetLabAppointment> getAppointmentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "lab/getLabAppointmentByLabAndPatientId", map, List.class); 
		 if(getAppointmentDetailsList.isEmpty() && patientId!=null) {
			 model.addObject("message","Patient Id is incorrect");
		 }
		 model.addObject("getAppointmentDetailsList",getAppointmentDetailsList);
	 }
	 
	model.addObject("currentDate", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
	
	model.addObject("fromTime", labDetails.getFromTime());
	model.addObject("toTime", labDetails.getToTime());
	model.addObject("appointActive","active");
	
	
		} catch (Exception e) {
			logger.error("Error while show View LabAppointment", e);
			throw new RuntimeException("Error while show View Lab Appointment", e);
		}
String msg=request.getParameter("status");
if(msg!=null)
model.addObject("msg",msg);
		return model;
		}
	
	
	//edit lab appointment lab by lab
			@RequestMapping(value = "/editLabAppointmentByLab", method = RequestMethod.GET)
			public  @ResponseBody Info editLabAppointmentByLab(HttpServletRequest request,
					HttpServletResponse response) {
			Info info=new Info();
				int appId = Integer.parseInt(request.getParameter("appId"));
				String date = DateConverter.convertToYMD(request.getParameter("date"));
				int time = Integer.parseInt(request.getParameter("appTimesList"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("appId", ""+appId);
				map.add("date", date);
				map.add("timeId", ""+time);
				map.add("status",1);
				RestTemplate rest = new RestTemplate();
				try {
					 info = Constant.getRestTemplate().postForObject(Constant.url + "lab/editLabAppointmentByLab", map, Info.class);
				} catch (Exception e) {
					logger.error("Error while edit Lab Appointment By Lab", e);
					throw new RuntimeException("Error while edit Lab Appointment By Lab", e);
				}
				return info;
			}
			//Ganesh 
			//get labAppointment  Time
			@RequestMapping(value = "/getLabAppointmentsTime", method = RequestMethod.GET)
			public @ResponseBody AppointmentTimeList getLabAppointmentTime(HttpServletRequest request,
					HttpServletResponse response) {
				int labId = Integer.parseInt(request.getParameter("labId"));System.out.println("labId  "+labId);
			 
				String appDate = DateConverter.convertToYMD(request.getParameter("appointmentDate"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("labId", ""+labId);
				 
				map.add("date", appDate);
				AppointmentTimeList appointmentTimeList=new AppointmentTimeList();
				RestTemplate rest = new RestTemplate();
				try {
					appointmentTimeList = Constant.getRestTemplate().postForObject(Constant.url + "getLabAppointmentTime", map, AppointmentTimeList.class);
				 	} catch (Exception e) {
				 		logger.error("Error while getting Lab Appointments Time", e);
						throw new RuntimeException("Error  getting Lab Appointments Time", e);
				}
				return appointmentTimeList;
				}
			
			//cancel appointment by lab
			@RequestMapping(value = "/cancelLabAppointmentByLab", method = RequestMethod.GET)
			public  @ResponseBody Info cancelLabAppointmentByLab(HttpServletRequest request,
					HttpServletResponse response) {
			Info info=new Info();
				int appId = Integer.parseInt(request.getParameter("appId"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("labAppId", appId);
				map.add("status", 3);
				RestTemplate rest = new RestTemplate();
				try {
					 info = Constant.getRestTemplate().postForObject(Constant.url + "lab/updateLabAppointmentStatus", map, Info.class);
				} catch (Exception e) {
					logger.error("Error while cancelling Lab Appointment By Lab", e);
					throw new RuntimeException("Error cancelling Lab Appointment By Lab", e);
				}
				return info;
				}
			
			
			@RequestMapping(value = "/collectSampleWithPaymentDetails", method = RequestMethod.GET)
			public  @ResponseBody Info collectLabTestSample(HttpServletRequest request,
					HttpServletResponse response) {
			Info info=new Info();
				int appId = Integer.parseInt(request.getParameter("appId"));
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				
				
				
				int paymentStatus=Integer.parseInt(request.getParameter("paymentStatus"));
				float totalAmount=Float.parseFloat(request.getParameter("totalAmount"));
				float discount=Float.parseFloat(request.getParameter("discount"));
				float amount=Float.parseFloat(request.getParameter("amount"));
				if(paymentStatus==1) {
					map.add("paidAmount",totalAmount);
				map.add("amountType", 0);    //cash payment
			}
				else
				{
					map.add("paidAmount",0);
					map.add("amountType", 1);   //Online payment
				}
				map.add("labAppId",appId);
				map.add("status", 4);
				map.add("paymentStatus", paymentStatus);
				map.add("discount", discount);
				map.add("amount", amount);
				map.add("totalAmount", totalAmount);
				 
				try {
					   
					 info = Constant.getRestTemplate().postForObject(Constant.url + "lab/collectSampleWithPaymentDetails", map, Info.class);
				} catch (Exception e) {
					logger.error("Error while cancelling Lab Appointment By Lab", e);
					throw new RuntimeException("Error cancelling Lab Appointment By Lab", e);
				}
				return info;
				}
}
