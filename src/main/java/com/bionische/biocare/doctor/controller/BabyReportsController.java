package com.bionische.biocare.doctor.controller;

 
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.model.BirthReportParam;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.GetHospitalDetails;
import com.bionische.biocare.lab.model.PatientReportsDetails;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patientdoctor.model.GetBabyBornReports;
import com.bionische.biocare.patientlab.model.BabyBornReports;
@Scope("session")
@Controller
public class BabyReportsController {

	
	public final Log LOGGER = LogFactory.getLog(BabyReportsController.class);
	String msg="";
	
	@RequestMapping(value = "/showInsertBabyReports", method = RequestMethod.GET)
	public ModelAndView showInsertBabyReports(HttpSession session, HttpServletRequest request) {
		
		ModelAndView model=new ModelAndView("bornBabyReports/bornBabyFirstReport");
		model.addObject("msg",msg);
		msg="";
		return model;
	}
	
	@RequestMapping(value = "/submitBabyReports", method = RequestMethod.POST)
	public String submitBabyReports(HttpSession session, HttpServletRequest request) {
		
		  
		
		
		PatientDetails patient=new PatientDetails();
		
		PatientDetails patientRes=new PatientDetails();
		RestTemplate rest=new RestTemplate();
		 
		 int patientId=Integer.parseInt(request.getParameter("patientId"));
		 PatientDetails patientDetails=new PatientDetails();
		 MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		 map.add("patientId", patientId);
		 patientDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPatientDetailsById", map, PatientDetails.class); 
			 
			 
		patient.setfName("XYZ");
		patient.setmName("Father");
		patient.setlName("Surname");
		patient.setFamilyId(patientDetails.getFamilyId());
		patient.setAge(0);
		patient.setGender(request.getParameter("sex"));
		patient.setBirthDate(request.getParameter("dob"));
		patient.setCityId(patientDetails.getCityId());
		patient.setStateId(patientDetails.getStateId());
		patient.setCountryId(patientDetails.getCountryId());
		patient.setAddress(patientDetails.getAddress());
		patient.setBloodGroup(request.getParameter("bloodGroup"));
		patient.setRegDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		
	//	patient.setContactNo(request.getParameter("contactNo"));
		patient.setContactNo("234");
		patient.setEmail(patientDetails.getEmail());
		patient.setQualification("");
		 		patient.setProfilePhoto("baby.jpeg");
		patient.setDelStatus(0);
		patient.setString1("1");
		patient.setString2("1");
		patient.setInt1(0);
		patient.setInt2(0);
		
		
		
		try {
			  patientRes=Constant.getRestTemplate().postForObject(Constant.url+"insertBornBabyDetails", patient,PatientDetails .class);
		
		
	 
		
		}catch (Exception e) {
		
			LOGGER.error("Error while submitting baby reports in submitBabyReports",e);
			throw new RuntimeException("Error while submitting baby reports in submitBabyReports",e);
			
		}
	
		BabyBornReports babyBornReports =new BabyBornReports();
		
		babyBornReports.setBirthTime(request.getParameter("dobTime"));
		babyBornReports.setBirthWeight(request.getParameter("birthWeight"));
		babyBornReports.setBloodGroup(request.getParameter("bloodGroup"));
		babyBornReports.setDeliveryType(request.getParameter("deliveryType"));
		babyBornReports.setDelStatus(0);
		babyBornReports.setDob(DateConverter.convertToYMD(request.getParameter("dob")));
		
		babyBornReports.setSex(request.getParameter("sex"));
	 	
		//babyBornReports.setHospitalName(request.getParameter("hospitalName"));
		babyBornReports.setHeadCircumference(request.getParameter("headCircumference"));
		  session = request.getSession();
		DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
		
		babyBornReports.setDoctorId(doctorDetails.getDoctorId());                  
		  
		babyBornReports.setPatientId(patientRes.getPatientId());
		
		
		babyBornReports.setFamilyId(patientDetails.getFamilyId());
	
		babyBornReports.setLength(request.getParameter("length"));
		babyBornReports.setMotherName(request.getParameter("motherName"));
		
		
		  
		try {
		
		//	BabyBornReports babyBornReportsRes=Constant.getRestTemplate().postForObject(Constant.url+"insertBabyBornReports", babyBornReports,BabyBornReports .class);
		
		}catch (Exception e) {
			
			LOGGER.error("Error while inserting baby born reports in submitBabyReports",e);
			throw new RuntimeException("Error while inserting baby born reports in submitBabyReports",e);
		
		}
		
		
		/*
		ReportDetails report=new ReportDetails();
		
		report.setString1("Baby Born Reports");
		report.setReportFileName(patientRes.getPatientId()+"");
		report.setInt1(3);
		 report.setPatientId(patientRes.getPatientId()); 
		 
			report.setLabTestId(0);
			
			report.setReportTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));	
			report.setReportDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			report.setLabId(0);
			
			
			report.setString2("1");
			
			report.setInt2(doctorDetails.getDoctorId());
			try {
			Info info=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientReport", report, Info.class);
		System.out.println(info.toString());
		
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}*/
		return "redirect:/showInsertBabyReports";
		
	}
 
	@RequestMapping(value = "/getBabyBornReports", method = RequestMethod.GET)
	public @ResponseBody GetBabyBornReports getBabyBornReports(HttpServletRequest request)
	{
		
	int patientId =Integer.parseInt(request.getParameter("patientid"));

	 MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	 GetBabyBornReports babyBornReportsRes =new GetBabyBornReports();
	 map.add("patientId", patientId);
 
	try {
	  babyBornReportsRes=Constant.getRestTemplate().postForObject(Constant.url+"getBabyBornReports",map,GetBabyBornReports.class);
	
	 
	}
	catch (Exception e) {
	
		LOGGER.error("Error while fecthing baby born reports in getBabyBornReports",e);
		throw new RuntimeException("Error while fecthing baby born reports in getBabyBornReports",e);
		
	}
	return babyBornReportsRes;
	}
	
	@RequestMapping(value = "/getPatientDetailsByPatientId", method = RequestMethod.GET)
	public ModelAndView getPatientDetailsByPatientId(HttpServletRequest request)
	{
		PatientDetails patientDetails=new PatientDetails();
		

		int patientId=Integer.parseInt(request.getParameter("patientId"));							
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("patientId", ""+patientId);
		ModelAndView model=new ModelAndView("bornBabyReports/bornBabyFirstReport");
		try {
			patientDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPatientDetailsByPatientId", map, PatientDetails.class);
			
			if(patientDetails!=null) {
			model.addObject("vaccinationPatientDetails",patientDetails);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		HttpSession session1 = request.getSession();
		//HttpSession session1 = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session1.getAttribute("doctorDetails");
		List<GetHospitalDetails> getHospitalDetailsList=new ArrayList<GetHospitalDetails>();
		MultiValueMap<String, Object> mapRating=new LinkedMultiValueMap<String, Object>();
		mapRating.add("doctorId",""+doctorDetails.getDoctorId());
		model.addObject("patientId", patientId);
		
		try {
			getHospitalDetailsList=Constant.getRestTemplate().postForObject(Constant.url+"getHospitalByDoctorId",mapRating,List.class);
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addObject("getHospitalDetailsList", getHospitalDetailsList);
		return model;
		
	}
	
	@RequestMapping(value = "/generateBabyReports", method = RequestMethod.GET)
	public @ResponseBody BabyBornReports generateBabyReports(HttpSession session, HttpServletRequest request) {
		
		BabyBornReports babyBornReports=new BabyBornReports();
		HttpSession session1 = request.getSession();
		//HttpSession session1 = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session1.getAttribute("doctorDetails");
		babyBornReports.setBirthTime(request.getParameter("dobTime"));
		babyBornReports.setDoctorId(doctorDetails.getDoctorId());
		babyBornReports.setBirthWeight(request.getParameter("birthWeight"));
		babyBornReports.setBloodGroup(request.getParameter("bloodGroup"));
		babyBornReports.setDeliveryType(request.getParameter("deliveryType"));
		babyBornReports.setDob(DateConverter.convertToYMD(request.getParameter("dob")));
		babyBornReports.setHeadCircumference(request.getParameter("headCircumference"));
		babyBornReports.setHospitalId(Integer.parseInt(request.getParameter("hospitalId")));
		babyBornReports.setLength(request.getParameter("length"));
		babyBornReports.setMotherName(request.getParameter("motherName"));
		babyBornReports.setPatientId(Integer.parseInt(request.getParameter("patientId")));
		babyBornReports.setSex(request.getParameter("sex"));
		babyBornReports.setHospitalName(request.getParameter("hospitalName"));
		babyBornReports.setDoctorName(doctorDetails.getfName()+" "+doctorDetails.getlName());
		babyBornReports.setDelStatus(0);
		babyBornReports.setFamilyId(0);
		
		babyBornReports.setInt2(0);
		babyBornReports.setString1("0");
		babyBornReports.setString2("1");
		BabyBornReports babyBornReports1 = Constant.getRestTemplate().postForObject(
				Constant.url + "insertBabyBornReports", babyBornReports, BabyBornReports.class);
		
		System.out.println("dfgn"+babyBornReports1.toString());
		return babyBornReports;
		
		
		
	}
	@RequestMapping(value = "/saveBirthReport", method = RequestMethod.POST)
	public @ResponseBody PatientReportsDetails saveBirthReport(@RequestBody BirthReportParam birthReportParam ,  HttpServletRequest request) {
		
		
		System.out.println("inside saveBirthReport");
		 PatientReportsDetails patientReportsDetails=new PatientReportsDetails();
			 
			  String fileName = birthReportParam.getImg();
				patientReportsDetails.setFileName(fileName);
				patientReportsDetails.setLabTestId(Constant.birthReportId);
				patientReportsDetails.setAppointmentId(0);
				patientReportsDetails.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				patientReportsDetails.setDelStatus(0);
				patientReportsDetails.setLabId(0);
				patientReportsDetails.setPatientId(birthReportParam.getPatientId());
				patientReportsDetails.setStatus(1);
				patientReportsDetails.setFileType(8);
			 
				   try {
				PatientReportsDetails patientReportsDetailsRes = Constant.getRestTemplate().postForObject(
						Constant.url + "lab/insertPatientReports", patientReportsDetails, PatientReportsDetails.class);
				msg="Report Save Successfully";
				return patientReportsDetailsRes;
				   }
				     catch (Exception e) {
							
							LOGGER.error("Error while submitOwnReportsByPatient.",e);
							throw new RuntimeException("Error while submitOwnReportsByPatient.",e);
						}
				     
		 
	}
	
}
