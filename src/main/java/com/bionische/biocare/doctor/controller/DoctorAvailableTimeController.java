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
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.model.DocAvailableTime;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.DoctorLeavesDetails;
import com.bionische.biocare.doctor.model.FixDocAvailableTimeTime;
import com.bionische.biocare.doctor.model.FixDoctorAppointSchedule;
import com.bionische.biocare.doctor.model.GetDoctorHospitalDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patientdoctor.model.AppointmentTime;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
@Scope("session")
@RequestMapping(value="/doctorAvailableTime")
public class DoctorAvailableTimeController {

	public final Log LOGGER = LogFactory.getLog(DoctorAvailableTimeController.class);
	List<FixDoctorAppointSchedule> fixDoctorAppointScheduleList;
//	private HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	private List<AppointmentTime> timeList=new ArrayList<AppointmentTime>();


	
	
@RequestMapping(value="/showAvailableTimePage", method=RequestMethod.GET)

public ModelAndView showAvailableTimePage(HttpServletRequest request,
		HttpServletResponse response)
{
	RestTemplate rest=new RestTemplate();
	ModelAndView model=new ModelAndView("doctor/docAvailable");
	HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	 
	String date=DateConverter.convertToYMD(request.getParameter("date"));
	if(date=="" || date==null)
		date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	 
		String hospitalId=request.getParameter("hospitalId");
	 
	
	 timeList = new ArrayList<AppointmentTime>();
	
	 
	try {
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("doctorId",doctorDetails.getDoctorId());
		map.add("date",date);
		
	ParameterizedTypeReference<List<AppointmentTime>> typeRef = new ParameterizedTypeReference<List<AppointmentTime>>() {
	};
	ResponseEntity<List<AppointmentTime>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "doctorAvailableTime/getAvailableDocTimeDetailsWithHospital",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
	
	timeList=responseEntity.getBody();
model.addObject("timeList", timeList);
model.addObject("hospitalId",hospitalId);
model.addObject("date",DateConverter.convertToDMY(date));
	
	}catch (Exception e) {
		LOGGER.error("Error while getting doctor available time by date",e);
		throw new RuntimeException("Error while getting doctor available time by date",e);
	}
	
	 
	List<DocAvailableTime> docAvailableTimeList = new ArrayList<DocAvailableTime>(); 
	
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("doctorId",doctorDetails.getDoctorId());
	
	try {
		
		
		
		
		ParameterizedTypeReference<List<GetDoctorHospitalDetails>> typeRef = new ParameterizedTypeReference<List<GetDoctorHospitalDetails>>() {
		};
		ResponseEntity<List<GetDoctorHospitalDetails>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "doctorAvailableTime/getDoctorHospitalDetails",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
		
		List<GetDoctorHospitalDetails> getDoctorHospitalDetailsList=responseEntity.getBody();
	
		model.addObject("getDoctorHospitalDetailsList", getDoctorHospitalDetailsList);
		
		model.addObject("timeAvailableActive","active");
		
		
	/*	
		 ParameterizedTypeReference<List<DocAvailableTime>> typeRef = new ParameterizedTypeReference<List<DocAvailableTime>>() {
		};
		ResponseEntity<List<DocAvailableTime>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getAvailableDoctorTimeList",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
		
		docAvailableTimeList=responseEntity.getBody();
	
		ParameterizedTypeReference<List<AppointmentTime>> resAppointmentTimeList = new ParameterizedTypeReference<List<AppointmentTime>>() {
		}; 
		
		ResponseEntity<List<AppointmentTime>> timeListResult = Constant.getRestTemplate().exchange(Constant.url + "/getAllAppointmentTimeList",
				HttpMethod.GET, req, resAppointmentTimeList);
		
		timeList=timeListResult.getBody();
		
		System.out.println("cdcdcdcdcdc"+docAvailableTimeList+"cdscds"+timeList);
		
		for(int i=0;i<docAvailableTimeList.size();i++)
		{if(docAvailableTimeList.get(i).getUnavailableTime()!=null)
		{
			List<String>unavailableTimeList=new ArrayList<String>();
			
			unavailableTimeList = Arrays.asList(docAvailableTimeList.get(i).getUnavailableTime().split(","));
			StringBuilder unavailableTime=new StringBuilder();
			for(int j=0;j<timeList.size();j++)
			{
				for(int k=0;k<unavailableTimeList.size();k++) {
					if(Integer.parseInt(unavailableTimeList.get(k))==timeList.get(j).getTimeId())
						unavailableTime = unavailableTime.append(timeList.get(j).getTime()+",  ");
				}
				
			}
			 
			docAvailableTimeList.get(i).setUnavailableTime(unavailableTime.substring(0, unavailableTime.length() - 3));
		}
			

		}*/
	}
	catch (Exception e)
	{
		LOGGER.error("Error while showing doctor available time in showAvailableTimePage",e);
		throw new RuntimeException("Error while showing doctor available time in showAvailableTimePage",e);
	}
			
	 
	 
	
	
	return model;
	
}


@RequestMapping(value="/getAppointTimeByDateAndClinic", method=RequestMethod.GET)
public @ResponseBody List<AppointmentTime> getAppointTimeByDateAndClinic(HttpServletRequest request,HttpServletResponse response)
{
	
	
 RestTemplate rest=new RestTemplate();
    
    
    HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	try {
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("doctorId",doctorDetails.getDoctorId());
		map.add("date",DateConverter.convertToYMD(request.getParameter("date")));
		
	ParameterizedTypeReference<List<AppointmentTime>> typeRef = new ParameterizedTypeReference<List<AppointmentTime>>() {
	};
	ResponseEntity<List<AppointmentTime>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "doctorAvailableTime/getAvailableDocTimeDetailsWithHospital",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
	
	timeList=responseEntity.getBody();

	
	}catch (Exception e) {
		LOGGER.error("Error while getting doctor available time by date",e);
		throw new RuntimeException("Error while getting doctor available time by date",e);
	}
	
   return timeList;
}



@RequestMapping(value="/submitDoctorAvailableTime", method=RequestMethod.POST)

public  String submitDoctorAvailableTime(HttpServletRequest request,HttpServletResponse response)
{
    RestTemplate rest=new RestTemplate();
    HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	
	String []timeIdList=request.getParameterValues("timeId");
	String date=DateConverter.convertToYMD(request.getParameter("date"));
	int hospital=Integer.parseInt(request.getParameter("hospital"));
	int noOfPatient=Integer.parseInt(request.getParameter("noOfPatient"));
	
	StringBuilder stringBuilder = new StringBuilder();
	String availableTimeId;
	for (int i = 0; i < timeIdList.length; i++) {
		availableTimeId = (timeIdList[i]) + ",";
		stringBuilder.append(availableTimeId);
	}
	availableTimeId = stringBuilder.substring(0, stringBuilder.length() - 1);
	
 
	DocAvailableTime docAvailableTime=new DocAvailableTime();

	docAvailableTime.setAvailableTime(availableTimeId);
	docAvailableTime.setDoctorId(doctorDetails.getDoctorId());
	docAvailableTime.setHospitalId(hospital);
	docAvailableTime.setDate(date);
	docAvailableTime.setNoOfPatient(noOfPatient);
	 
	
	
	
	Info info = new Info();
	try {
		info=Constant.getRestTemplate().postForObject(Constant.url + "doctorAvailableTime/insertAvailableDocTimeDetails", docAvailableTime, Info.class);
		LOGGER.info("Response :"+info.toString());
		 
	
	}
	catch (Exception e)
	{
		LOGGER.error("Error while inserting doctor available time in submitDoctorAvailableTime",e);
		throw new RuntimeException("Error while inserting doctor available time in submitDoctorAvailableTime",e);
	}
	
	return "redirect:/doctorAvailableTime/showAvailableTimePage";
	
}


 

@RequestMapping(value="/showFixAvailableTimePage", method=RequestMethod.GET)

public ModelAndView showFixAvailableTimePage(HttpServletRequest request,
		HttpServletResponse response)
{
	ModelAndView model=new ModelAndView("doctor/fixDocAvailable");
	
	fixDoctorAppointScheduleList=new ArrayList<FixDoctorAppointSchedule>();
	HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("doctorId",doctorDetails.getDoctorId());
	
	try {
		
		
		
		
		ParameterizedTypeReference<List<GetDoctorHospitalDetails>> typeRef = new ParameterizedTypeReference<List<GetDoctorHospitalDetails>>() {
		};
		ResponseEntity<List<GetDoctorHospitalDetails>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "doctorAvailableTime/getDoctorHospitalDetails",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
		
		List<GetDoctorHospitalDetails> getDoctorHospitalDetailsList=responseEntity.getBody();
	
		model.addObject("getDoctorHospitalDetailsList", getDoctorHospitalDetailsList);
		
		model.addObject("timeAvailableActive","active");
		
		ParameterizedTypeReference<List<AppointmentTime>> typeTimeRef = new ParameterizedTypeReference<List<AppointmentTime>>() {
		};
		ResponseEntity<List<AppointmentTime>> responseTimeEntity=Constant.getRestTemplate().exchange(Constant.url + "getAllAppointmentTimeList",HttpMethod.GET,null,typeTimeRef);
		model.addObject("timeList",responseTimeEntity.getBody());
		 
	}
	catch (Exception e)
	{
		LOGGER.error("Error while showing doctor available time in showAvailableTimePage",e);
		throw new RuntimeException("Error while showing doctor available time in showAvailableTimePage",e);
	}
		
	
	return model;
}


@PostMapping (value="/submitFixScheduleToList")

public String  submitFixScheduleToList(HttpServletRequest request, @ModelAttribute FixDocAvailableTimeTime fixDocAvailableTimeTime) {
	addFixScheduleToList1(request,fixDocAvailableTimeTime);
	if(!fixDoctorAppointScheduleList.isEmpty()) {
	try {
		
	Info info=Constant.getRestTemplate().postForObject(Constant.url+"doctorAvailableTime/insertDoctorFixSchedule",fixDoctorAppointScheduleList,Info.class);
	}catch (Exception e) {
		LOGGER.error("Error while showing doctor available time fix schedule in submitFixScheduleToList",e);
		throw new RuntimeException("Error while showing doctor available time fix schedule in submitFixScheduleToList",e);
	}
	}
	return "redirect:/doctorAvailableTime/showDoctorFixSchedule";
}


@PostMapping (value="/addFixScheduleToList")
 
@ResponseBody public Info addFixScheduleToList1(HttpServletRequest request, @ModelAttribute FixDocAvailableTimeTime fixDocAvailableTimeTime) {
	
	
	System.out.println("Ganesh  "+fixDocAvailableTimeTime.toString());
	List<AppointmentTime> appointmentTimeList=new ArrayList<AppointmentTime>();
	String timeIdList[]=fixDocAvailableTimeTime.getTimeId();
 boolean flag=false;
 if(timeIdList!=null)
	for(int i=0;i<timeIdList.length;i++)
	{
		flag=true;
		String []timeSplit=timeIdList[i].split("_", 2);
		
		int timeId=Integer.parseInt(timeSplit[0]);
		String time=timeSplit[1];
		System.out.println("timeId  "+timeId+" Time"+time);
		AppointmentTime appointmentTime=new AppointmentTime();
		appointmentTime.setTime(time);
		appointmentTime.setTimeId(timeId);
		appointmentTime.setString1(fixDocAvailableTimeTime.getClinicName());
		appointmentTime.setInt1(0);
		appointmentTimeList.add(appointmentTime);
		
	}
 
	 
	  ObjectMapper mapper = new ObjectMapper();
	  Info info=new Info();
	  if(flag) {
		  FixDoctorAppointSchedule fixDoctorAppointSchedule=new FixDoctorAppointSchedule();
     String jsonNames="";
	try {
		jsonNames = mapper.writeValueAsString(appointmentTimeList);
	} catch (JsonProcessingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	info.setMessage("Added to List");
	System.out.println("jsonNames "+jsonNames);
	fixDoctorAppointSchedule.setTimeJson(jsonNames);
	fixDoctorAppointSchedule.setClinicId(fixDocAvailableTimeTime.getClinicId());
	 HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	fixDoctorAppointSchedule.setDelStatus(0);
	fixDoctorAppointSchedule.setDoctorId(doctorDetails.getDoctorId());
	fixDoctorAppointSchedule.setNoOfPatient(fixDocAvailableTimeTime.getNoOfPatient());
	fixDoctorAppointScheduleList.add(fixDoctorAppointSchedule);
	System.out.println(fixDoctorAppointScheduleList.toString());
	  }
	return info;
	
}



@RequestMapping(value="/showDoctorFixSchedule", method=RequestMethod.GET)
 
public  String showDoctorFixSchedule(HttpServletRequest request,HttpServletResponse response, Model model)
{
	HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("doctorId",doctorDetails.getDoctorId());
	List<AppointmentTime> appointmentTimeList=Constant.getRestTemplate().postForObject(Constant.url+"doctorAvailableTime/getDoctorFixScheduleByDoctorId",map,List.class);
model.addAttribute("timeList", appointmentTimeList);
	return "doctor/viewFixDocAvailable";
}


@RequestMapping(value="/showDoctorLeavePage", method=RequestMethod.GET)
public  String showDoctorLeavePage(HttpServletRequest request,HttpServletResponse response, Model model)
{
try {
	HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("doctorId",doctorDetails.getDoctorId());
	map.add("date", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	List<DoctorLeavesDetails> doctorLeavesDetailsList=Constant.getRestTemplate().postForObject(Constant.url+"doctorAvailableTime/getDoctorLeaves",map,List.class);
	model.addAttribute("doctorLeavesDetailsList",doctorLeavesDetailsList);
	model.addAttribute("date",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
}
catch (Exception e) {
	LOGGER.error("Error while showing doctor showDoctorLeavePage",e);
}
return "doctor/showDoctorLeavePage";
}
@RequestMapping(value="/insertDoctorLeave", method=RequestMethod.POST)
public  String insertDoctorLeave(HttpServletRequest request,HttpServletResponse response, Model model)
{
try {
	HttpSession session = request.getSession();
	DoctorDetails doctorDetails = (DoctorDetails)session.getAttribute("doctorDetails");
	DoctorLeavesDetails doctorLeavesDetails=new DoctorLeavesDetails();
	doctorLeavesDetails.setDate(DateConverter.convertToYMD(request.getParameter("date")));
	doctorLeavesDetails.setDoctorId(doctorDetails.getDoctorId());
	 DoctorLeavesDetails doctorLeavesDetailsRes=Constant.getRestTemplate().postForObject(Constant.url+"doctorAvailableTime/insertDoctorLeave",doctorLeavesDetails,DoctorLeavesDetails.class);
} 
catch (Exception e) {
	LOGGER.error("Error while showing doctor showDoctorLeavePage",e);
}
return "redirect:/doctorAvailableTime/showDoctorLeavePage";
}

@RequestMapping(value="/deleteDoctorLeave", method=RequestMethod.GET)
public @ResponseBody Info deleteDoctorLeave(HttpServletRequest request,HttpServletResponse response, Model model)
{
try {
 
	 
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("leaveId",Integer.parseInt(request.getParameter("leaveId")));
	
	Info info =Constant.getRestTemplate().postForObject(Constant.url+"doctorAvailableTime/deleteDoctorLeave",map,Info.class);
	return info;
} 
catch (Exception e) {
	LOGGER.error("Error while showing doctor deleteDoctorLeave",e);
}
 return null;
}

}
