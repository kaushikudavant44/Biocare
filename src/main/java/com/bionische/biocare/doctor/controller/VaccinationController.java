package com.bionische.biocare.doctor.controller;

import java.util.ArrayList;
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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.GetDoctorProfile;
import com.bionische.biocare.doctor.model.SavePatientVaccination;
import com.bionische.biocare.doctor.model.VaccinationAgeDetails;
import com.bionische.biocare.doctor.model.VaccinationDetails;
import com.bionische.biocare.doctor.model.VaccinationDisplay;
import com.bionische.biocare.doctor.model.VaccinationPatientDetails;
import com.bionische.biocare.insurance.model.GetboughtInsuranceDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.StateAndCityList;
@Scope("session")
@Controller
public class VaccinationController {
	
	public final Log LOGGER = LogFactory.getLog(VaccinationController.class);
//	HttpEntity<String> req=new HttpEntity<String>(Constant.getHeaders());
	
	 	
	 
	 
	 @RequestMapping(value="/getPatientByPatientId", method=RequestMethod.GET)

		public ModelAndView getPatientByPatientId(HttpServletRequest request)
		{
		 	ModelAndView model=new ModelAndView("doctor/vaccination");
		 
			int patientId=Integer.parseInt(request.getParameter("patientId"));							
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			map.add("patientId", ""+patientId);
			VaccinationPatientDetails vaccinationPatientDetails=new VaccinationPatientDetails();
				
			RestTemplate rest=new RestTemplate();
			
			try {
				 vaccinationPatientDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPatientByPatientId", map, VaccinationPatientDetails.class);
				
				if(vaccinationPatientDetails!=null) {
				model.addObject("vaccinationPatientDetails",vaccinationPatientDetails);
			
			
			
		    
			List<VaccinationDetails> vaccinationDetailsList=new ArrayList<VaccinationDetails>();
			List<VaccinationAgeDetails> vaccinationAgeDetailsList=new ArrayList<VaccinationAgeDetails>();
			List<VaccinationDisplay> vaccinationDisplayList=new ArrayList<VaccinationDisplay>();
			
			
			
			
				ParameterizedTypeReference<List<VaccinationDetails>> typeRef1 = new ParameterizedTypeReference<List<VaccinationDetails>>() {
				};
				ResponseEntity<List<VaccinationDetails>> vaccinationDetailsListResult=Constant.getRestTemplate().exchange(Constant.url+"getAllVaccination", HttpMethod.GET,new HttpEntity<MultiValueMap<String, Object>>(map),typeRef1);
			
				vaccinationDetailsList=vaccinationDetailsListResult.getBody();
			
				ParameterizedTypeReference<List<VaccinationAgeDetails>> typeRef = new ParameterizedTypeReference<List<VaccinationAgeDetails>>() {
				};
				ResponseEntity<List<VaccinationAgeDetails>> vaccinationAgeDetailsListResult=Constant.getRestTemplate().exchange(Constant.url+"getAllVaccinationAge", HttpMethod.GET,new HttpEntity<MultiValueMap<String, Object>>(map),typeRef);
			
				vaccinationAgeDetailsList=vaccinationAgeDetailsListResult.getBody();
				
			
				
				
				List<SavePatientVaccination> savePatientVaccinationList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientVaccination", map, List.class);
			
		
				
				model.addObject("savePatientVaccinationList",savePatientVaccinationList);
				
			
			
			
			VaccinationDetails vaccinationDetails;
				for(int i=0;i<vaccinationAgeDetailsList.size();i++) {
			
				
				 
				List<VaccinationDetails> vaccinationDetailsList1=new ArrayList<VaccinationDetails>();
				VaccinationDisplay vaccinationDisplay=new VaccinationDisplay();
				for(int j=0;j<vaccinationDetailsList.size();j++) {
				
				if(vaccinationDetailsList.get(j).getVaccinationAgeId()==vaccinationAgeDetailsList.get(i).getVaxinationAgeId()) {
					
					vaccinationDisplay.setVaxinationAgeId(vaccinationAgeDetailsList.get(i).getVaxinationAgeId());
					vaccinationDisplay.setVaxinationAgeName(vaccinationAgeDetailsList.get(i).getVaxinationAgeName());
					vaccinationDetails=new VaccinationDetails();
					vaccinationDetails=vaccinationDetailsList.get(j);
					vaccinationDetailsList1.add(vaccinationDetails);
					   
					 
					 
				}
				
				
			}
			vaccinationDisplay.setVaccinationDetailsList(vaccinationDetailsList1); 
			
			vaccinationDisplayList.add(vaccinationDisplay);
			}
				
			model.addObject("vaccinationDisplayList",vaccinationDisplayList);
			model.addObject("patientId",patientId);
		}else {
			model.addObject("patientId",patientId);
			model.addObject("message","Patient id is incorrect");
		}
				
			}	catch(Exception e) {
				
				LOGGER.error("Error while fetching vaccination details", e);
				throw new RuntimeException("Error while fetching vaccination details", e);
				
			}
			
			return model;
			
		}
	 @RequestMapping(value="/showVaccination", method=RequestMethod.GET)
		
		public ModelAndView showVaccination(HttpServletRequest request,
				HttpServletResponse response)
		{
		 
		 ModelAndView model=new ModelAndView("doctor/vaccination");
		 model.addObject("active", "active");
			model.addObject("vaccinationActive", "active");
		 return model;
		 
		}
	 
	 @RequestMapping(value="/insertPatientVaccinationDetails", method=RequestMethod.GET)

		public @ResponseBody SavePatientVaccination insertPatientVaccinationDetails(HttpServletRequest request)
		{
			 
			
			HttpSession session = request.getSession();
			DoctorDetails doctorDetails=(DoctorDetails)session.getAttribute("doctorDetails");
			
			SavePatientVaccination savePatientVaccination=new SavePatientVaccination();
			int doctorId=doctorDetails.getDoctorId();
			savePatientVaccination.setPatientId(Integer.parseInt(request.getParameter("patientId")));
			savePatientVaccination.setDoctorId(doctorId);
			savePatientVaccination.setVacciantionId(Integer.parseInt(request.getParameter("vaccinationId")));
			savePatientVaccination.setString1("1");
			savePatientVaccination.setStatus(1);
			savePatientVaccination.setInt1(0);
			savePatientVaccination.setInt2(0);
			RestTemplate rest=new RestTemplate();
			try {
			savePatientVaccination=Constant.getRestTemplate().postForObject(Constant.url+"insertVaccinationDetails", savePatientVaccination,SavePatientVaccination.class);
			
		
			}catch (Exception e) {
				
				LOGGER.error("Error while inserting vaccination details in insertVaccinationDetails",e);
				throw new RuntimeException("Error while inserting vaccination details in insertVaccinationDetails",e);
				
			}
					
			return savePatientVaccination;
			
		}
	 
		 @RequestMapping(value="/showPatientVaccinationDetailsByPatientId", method=RequestMethod.GET)

			public ModelAndView showPatientVaccinationDetailsByPatientId(HttpServletRequest request)
			{
			 	ModelAndView model=new ModelAndView("patient/vaccination");
			 	int patientId=0;
			 try {
				 patientId=Integer.parseInt(request.getParameter("patientId"));	
				
			 }
			 catch (Exception e) {
				System.out.println(e.getMessage());// TODO: handle exception
			}
				MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
				map.add("patientId", patientId);
				

				RestTemplate rest=new RestTemplate();
				
				try {
					VaccinationPatientDetails vaccinationPatientDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPatientByPatientId", map, VaccinationPatientDetails.class);
				
				
					model.addObject("vaccinationPatientDetails",vaccinationPatientDetails);
				}catch (Exception e) {
					
					LOGGER.error("Error while fetching vaccination patient details", e);
					throw new RuntimeException("Error while fetching vaccination patient details", e);
				
				}
			
				List<VaccinationDetails> vaccinationDetailsList=new ArrayList<VaccinationDetails>();
				List<VaccinationAgeDetails> vaccinationAgeDetailsList=new ArrayList<VaccinationAgeDetails>();
				List<VaccinationDisplay> vaccinationDisplayList=new ArrayList<VaccinationDisplay>();
				try {

					ParameterizedTypeReference<List<VaccinationDetails>> typeRef1 = new ParameterizedTypeReference<List<VaccinationDetails>>() {
					};
					ResponseEntity<List<VaccinationDetails>> vaccinationDetailsListResult=Constant.getRestTemplate().exchange(Constant.url+"getAllVaccination",HttpMethod.GET, new HttpEntity<MultiValueMap<String, Object>>(map),typeRef1);
				
					vaccinationDetailsList=vaccinationDetailsListResult.getBody();
				
					ParameterizedTypeReference<List<VaccinationAgeDetails>> typeRef = new ParameterizedTypeReference<List<VaccinationAgeDetails>>() {
					};
					ResponseEntity<List<VaccinationAgeDetails>> vaccinationAgeDetailsListResult=Constant.getRestTemplate().exchange(Constant.url+"getAllVaccinationAge",HttpMethod.GET, new HttpEntity<MultiValueMap<String, Object>>(map),typeRef);
				   
					vaccinationAgeDetailsList=vaccinationAgeDetailsListResult.getBody();
					
				}catch(Exception e) {
					LOGGER.error("Error while fetching vaccination details", e);
					throw new RuntimeException("Error while fetching vaccination details", e);
				}
				try {
					
					List<SavePatientVaccination> savePatientVaccinationList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientVaccination", map, List.class);
					
					model.addObject("savePatientVaccinationList",savePatientVaccinationList);
					
				}	catch(Exception e) {
					
					LOGGER.error("Error while fetching vaccination details", e);
					throw new RuntimeException("Error while fetching vaccination details", e);
					
				}
					HttpSession session = request.getSession();
					PatientDetails patientDetail=	(PatientDetails)session.getAttribute("patientDetails");
				  
				    MultiValueMap<String, Object> familyIdMap=new LinkedMultiValueMap<>();
				    familyIdMap.add("familyId", ""+patientDetail.getFamilyId());
				try {
					List<PatientDetails> patientMemberDetailList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientFamilyMembersList", familyIdMap, List.class);
					
					model.addObject("patientMemberDetailList",patientMemberDetailList);
				}catch(Exception e) {
					
					LOGGER.error("Error while fetching all family members showPatientVaccinationPage.",e);
					throw new RuntimeException("Error while fetching all family members showPatientVaccinationPage.",e);
					
				}
				
				
				VaccinationDetails vaccinationDetails;
					for(int i=0;i<vaccinationAgeDetailsList.size();i++) {
				
					
					 
					List<VaccinationDetails> vaccinationDetailsList1=new ArrayList<>();
					VaccinationDisplay vaccinationDisplay=new VaccinationDisplay();
					for(int j=0;j<vaccinationDetailsList.size();j++) {
					
					if(vaccinationDetailsList.get(j).getVaccinationAgeId()==vaccinationAgeDetailsList.get(i).getVaxinationAgeId()) {
						
						vaccinationDisplay.setVaxinationAgeId(vaccinationAgeDetailsList.get(i).getVaxinationAgeId());
						vaccinationDisplay.setVaxinationAgeName(vaccinationAgeDetailsList.get(i).getVaxinationAgeName());
						vaccinationDetails=new VaccinationDetails();
						vaccinationDetails=vaccinationDetailsList.get(j);
						vaccinationDetailsList1.add(vaccinationDetails);
						   
						 
						 
					}
					
					
				}
				vaccinationDisplay.setVaccinationDetailsList(vaccinationDetailsList1); 
				
				vaccinationDisplayList.add(vaccinationDisplay);
				}
				
				
				model.addObject("vaccinationDisplayList",vaccinationDisplayList);

				return model;
				
			}
		 
		 @RequestMapping(value="/showPatientVaccinationPage", method=RequestMethod.GET)
			
			public ModelAndView showReferralCode(HttpServletRequest request,
					HttpServletResponse response)
			{
			  
			 ModelAndView model=new ModelAndView("patient/vaccination");
			 RestTemplate rest=new RestTemplate();
			 HttpSession session = request.getSession();
				PatientDetails patientDetail=	(PatientDetails)session.getAttribute("patientDetails");
			    int patientId=patientDetail.getPatientId(); 
			    MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
				map.add("familyId", ""+patientDetail.getFamilyId());
			try {
				List<PatientDetails> patientMemberDetailList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientFamilyMembersList", map, List.class);
				
				model.addObject("patientMemberDetailList",patientMemberDetailList);
				model.addObject("vaccination","active");
			}catch(Exception e) {
				
				LOGGER.error("Error while fetching all family members showPatientVaccinationPage.",e);
				throw new RuntimeException("Error while fetching all family members showPatientVaccinationPage.",e);
				
			}
			 return model;
				
			}
		 
	

}
