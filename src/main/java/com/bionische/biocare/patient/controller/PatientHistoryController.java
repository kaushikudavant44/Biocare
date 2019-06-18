package com.bionische.biocare.patient.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patienthistory.model.MenstrualObstetricHistory;
import com.bionische.biocare.patienthistory.model.PatientAllPersonalHistory;
import com.bionische.biocare.patienthistory.model.PatientFamilyHistory;
import com.bionische.biocare.patienthistory.model.PatientHistoryChiefComplaints;
import com.bionische.biocare.patienthistory.model.PatientHistoryIllnessList;
import com.bionische.biocare.patienthistory.model.PatientPastHistory;
import com.bionische.biocare.patienthistory.model.PatientPastHistoryIIlness;
import com.bionische.biocare.patienthistory.model.PatientPersonalHistory;
import com.bionische.biocare.patienthistory.model.PatientPsychologicalHistory;
import com.bionische.biocare.patienthistory.model.PatientTreatementHistory;
@Scope("session")
@Controller
public class PatientHistoryController {
	
	public final Log LOGGER = LogFactory.getLog(PatientHistoryController.class);

@RequestMapping(value="/showPatientHistoryPage/{patientId}", method=RequestMethod.GET)
	
	public ModelAndView showPatientHistoryPage(@PathVariable("patientId") int patientId,HttpServletRequest request,
			HttpServletResponse response)
	{ 
	  
		ModelAndView model=new ModelAndView("patient/patientHistory");
		
		model.addObject("patientId",patientId);
		
		return model;
		
	}	
 
	@RequestMapping(value="/submitPatientPersonalHistoryRegProcess", method=RequestMethod.POST)

	public ModelAndView submitPatientPersonalHistoryRegProcess(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("");
		
		try {
		
	    int patientId=Integer.parseInt(request.getParameter("patientId")); 
			
		PatientAllPersonalHistory patientAllPersonalHistory=new PatientAllPersonalHistory();
		
		PatientPersonalHistory patientPersonalHistory=new PatientPersonalHistory();
		PatientPastHistoryIIlness patientPastHistoryIIlness=new PatientPastHistoryIIlness();
		PatientPastHistory patientPastHistory=new PatientPastHistory();		
		PatientHistoryChiefComplaints patientHistoryChiefComplaints=new PatientHistoryChiefComplaints();
		MenstrualObstetricHistory menstrualObstetricHistory=new MenstrualObstetricHistory();
		PatientFamilyHistory patientFamilyHistory=new PatientFamilyHistory();
		PatientPsychologicalHistory patientPsychologicalHistory=new PatientPsychologicalHistory();
		PatientTreatementHistory patientTreatementHistory=new PatientTreatementHistory();
		 
	
		 
		
		//PatientHistoryChiefComplaints
		patientHistoryChiefComplaints.setComplaints(request.getParameter("Chief"));
		    
		patientHistoryChiefComplaints.setPatientId(patientId);
		
	 
		     //PatientPastHistory
		 
		 String[] illness=request.getParameterValues("illness");
		StringBuffer sb=new StringBuffer();
		 for(int i=0;i<illness.length;i++)
		 {
			 sb.append(illness[i]+",");
		 }
		 String illnessIdString=sb.substring(0, sb.length()-1);
		  
		    patientPastHistory.setPatientId(patientId);
		    patientPastHistory.setString1("1");
		    patientPastHistory.setString2("1");
		    patientPastHistory.setInt1(0);
		    patientPastHistory.setInt2(0);
		    patientPastHistory.setPastHistoryIllnessId(illnessIdString);
		    
		    String Maritalstatus= request.getParameter("test");
		  
		     if(Maritalstatus.equals("NO"))
		     {
		    	 patientPersonalHistory.setMaritalStatus(request.getParameter("test")); 
		     }
		     else
		     {
		    	 patientPersonalHistory.setMaritalStatus(request.getParameter("Maritalstatus")); 
		     }
		    
		  
		    patientPersonalHistory.setPatientId(patientId);
		    patientPersonalHistory.setOccupation(request.getParameter("Occupation"));
		    patientPersonalHistory.setAnualIncome(request.getParameter("Income"));
		    patientPersonalHistory.setAddiction(request.getParameter("Addiction"));
		    patientPersonalHistory.setDietaryHabits(request.getParameter("Dietary"));
		    patientPersonalHistory.setHistoryOfConterception(request.getParameter("Contraception"));
		    patientPersonalHistory.setHighRiskBehaviour(request.getParameter("HighRiskbehaviour"));
		    patientPersonalHistory.setString1("1");
		    patientPersonalHistory.setString2("1");
		    patientPersonalHistory.setString3("1");
		    patientPersonalHistory.setString4("1");
		    patientPersonalHistory.setInt1(0);
		
		    
		   //PatientFamilyHistory
		    patientFamilyHistory.setFamilyHistory(request.getParameter("FamilyHistory"));
		    patientFamilyHistory.setPatientId(patientId);
		    patientFamilyHistory.setString1("1");
		    patientFamilyHistory.setString2("1");
		    
		    
		    //PatientTreatementHistory
		    
		     String check= request.getParameter("test1");
		     
		     if(check.equals("NO"))
		     {
		    	 patientTreatementHistory.setTreatmentReceived(request.getParameter("test1")); 
		     }
		     else
		     {
		    	 patientTreatementHistory.setTreatmentReceived(request.getParameter("Treatment")); 
		     }
		     
		     
		     
		     String drugallergy= request.getParameter("test2");
		   
		     if(drugallergy.equals("NO"))
		     {
		    	 patientTreatementHistory.setAllergyReactions(request.getParameter("test2")); 
		     }
		     else
		     {
		    	 patientTreatementHistory.setAllergyReactions(request.getParameter("drugallergy")); 
		     }
		     
		     String surgicalintervention= request.getParameter("test3");
			   
		     if(surgicalintervention.equals("NO"))
		     {
		    	 patientTreatementHistory.setSurgicalIntervention(request.getParameter("test3")); 
		     }
		     else
		     {
		    	 patientTreatementHistory.setSurgicalIntervention(request.getParameter("surgicalintervention")); 
		     }
		     
		     String contraceptives= request.getParameter("test4");
			   
		     if(contraceptives.equals("NO"))
		     {
		    	 patientTreatementHistory.setUseOralContraceptives(request.getParameter("test4")); 
		     }
		     else
		     {
		    	 patientTreatementHistory.setUseOralContraceptives(request.getParameter("contraceptives")); 
		     }
		     
		  
		
		    patientTreatementHistory.setBloodTransfusion(request.getParameter("Bloodtransfusion"));
		    patientTreatementHistory.setIntakeNsaid(request.getParameter("Intake"));
		    patientTreatementHistory.setRegularUsezoralContraceptives(request.getParameter("contraceptives1"));
		    patientTreatementHistory.setPatientId(patientId);
		    patientTreatementHistory.setString1("1");
		    patientTreatementHistory.setString2("1");
		    
		    
		    //PatientPsychologicalHistory
		    patientPsychologicalHistory.setPsychologicalHistory(request.getParameter("PsychologicalHistory"));
		    patientPsychologicalHistory.setPatientId(patientId);
		    patientPsychologicalHistory.setString1("1");
		    patientPsychologicalHistory.setString2("1");
		    
		    
		    
		    //menstrualObstetricHistory
		    menstrualObstetricHistory.setMenarche(request.getParameter("Menarche"));
		    menstrualObstetricHistory.setDurationOfPeriod(request.getParameter("durationperoid"));	  
		    menstrualObstetricHistory.setMenstrualErregularities(request.getParameter("Dysmenorrhoea"));
		    menstrualObstetricHistory.setDateOfLastPeriod(request.getParameter("menstrual"));
		    menstrualObstetricHistory.setMenopause(request.getParameter("Menopause"));
		    menstrualObstetricHistory.setOutcomeOfPregnancies(request.getParameter("Outcomepregnancies"));
		    
		    String Complicationspregnancy= request.getParameter("test5");
			   
		     if(Complicationspregnancy.equals("NO"))
		     {
		    	 menstrualObstetricHistory.setComplicationsDuringPregnancies(request.getParameter("test5")); 
		     }
		     else
		     {
		    	 menstrualObstetricHistory.setComplicationsDuringPregnancies(request.getParameter("Complicationspregnancy")); 
		     }
		    menstrualObstetricHistory.setMade_of_delivery(request.getParameter("Modedelivery"));
		    menstrualObstetricHistory.setLast_child_birth(request.getParameter("Lastbirth"));
		    menstrualObstetricHistory.setNoOfPregnancies(request.getParameter("pregnancies"));
		    menstrualObstetricHistory.setQtyOfBloodLoss(request.getParameter("bloodloss"));
		   // menstrualObstetricHistory.setNoOfPregnancies(Integer.parseInt(request.getParameter("pregnancies")));
		  //  menstrualObstetricHistory.setQtyOfBloodLoss(Integer.parseInt(request.getParameter("bloodloss")));    
		    menstrualObstetricHistory.setPatientId(patientId);
		    menstrualObstetricHistory.setString1("1");
		    menstrualObstetricHistory.setString2("1");
		    menstrualObstetricHistory.setString3("1");
		    
		    
		    
		    
			patientAllPersonalHistory.setMenstrualObstetricHistory(menstrualObstetricHistory);
			patientAllPersonalHistory.setPatientFamilyHistory(patientFamilyHistory);
			patientAllPersonalHistory.setPatientHistoryChiefComplaints(patientHistoryChiefComplaints);
			patientAllPersonalHistory.setPatientPastHistory(patientPastHistory);
			patientAllPersonalHistory.setPatientPersonalHistory(patientPersonalHistory);
			patientAllPersonalHistory.setPatientPsychologicalHistory(patientPsychologicalHistory);
			patientAllPersonalHistory.setPatientTreatementHistoryp(patientTreatementHistory);
			
		RestTemplate rest=new RestTemplate();
		try {
			patientAllPersonalHistory=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientPersonalDetails", patientAllPersonalHistory,PatientAllPersonalHistory.class);
			
			model.addObject("patientPersonalHistory", patientPersonalHistory);
			model.addObject("patientPastHistoryIIlness", patientPastHistoryIIlness);
			model.addObject("patientPastHistory", patientPastHistory);
			model.addObject("patientHistoryChiefComplaints", patientHistoryChiefComplaints);
			model.addObject("menstrualObstetricHistory", menstrualObstetricHistory);
			model.addObject("patientFamilyHistory", patientFamilyHistory);
			model.addObject("patientPsychologicalHistory", patientPsychologicalHistory);
			model.addObject("patientTreatementHistory", patientTreatementHistory);
			model.addObject("patientTreatementHistory", patientTreatementHistory);
		
			
			
			System.out.println("patientTreatementHistory"+patientTreatementHistory.toString());
		}catch (Exception e) {
			
			LOGGER.error("Error while submitPatientPersonalHistoryRegProcess.",e);
			throw new RuntimeException("Error while submitPatientPersonalHistoryRegProcess.",e);
		}
				
		//return model;
	
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
		return new ModelAndView("redirect:/showPatientHomePage");
	
	}
	
	//Get PatientHistory
	@RequestMapping(value = "/getPatientHistoryDetails/{patientId}", method = RequestMethod.GET)
	public ModelAndView getPatientHistoryDetails(@PathVariable("patientId") int patientId, HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model=new ModelAndView("doctor/show_offline_consulting");
		
		// HttpSession session = request.getSession();
		//	PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");
		//    int patientId=patientDetail.getPatientId(); 
		    
		PatientAllPersonalHistory patientAllPersonalHistory = new PatientAllPersonalHistory();
 
		PatientHistoryIllnessList patientHistoryIllnessList =new PatientHistoryIllnessList();
		
		
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);
		 
		
	 
		try {
			patientAllPersonalHistory =Constant.getRestTemplate().postForObject(Constant.url + "getPatientHistory", map, PatientAllPersonalHistory.class);
			
			model.addObject("menstrualObstetricHistory",patientAllPersonalHistory.getMenstrualObstetricHistory());
			model.addObject("patientFamilyHistory",patientAllPersonalHistory.getPatientFamilyHistory());
			model.addObject("patientHistoryChiefComplaints",patientAllPersonalHistory.getPatientHistoryChiefComplaints());
			model.addObject("patientPastHistory",patientAllPersonalHistory.getPatientPastHistory());
			model.addObject("patientPastHistoryIIlness",patientAllPersonalHistory.getPatientPastHistoryIIlness());
			model.addObject("patientPersonalHistory",patientAllPersonalHistory.getPatientPersonalHistory());
			model.addObject("patientPsychologicalHistory",patientAllPersonalHistory.getPatientPsychologicalHistory());
			model.addObject("patientTreatementHistoryp",patientAllPersonalHistory.getPatientTreatementHistoryp());
			model.addObject("patientHistoryIllnessList",patientAllPersonalHistory.getPatientPastHistoryIIlnessList());		
					
		} catch (Exception e) {
			
			LOGGER.error("Error while getPatientHistoryDetails by patient id.",e);
			throw new RuntimeException("Error while getPatientHistoryDetails by patient id.",e);
		}

		return model;
	}
	
	//Get PatientHistory
		@RequestMapping(value = "/getViewPatientHistoryDetails/{patientId}", method = RequestMethod.GET)
		public ModelAndView getViewPatientHistoryDetails(@PathVariable("patientId") int patientId, HttpServletRequest request,
				HttpServletResponse response) {
			
			ModelAndView model=new ModelAndView("patient/viewpatientHistory");
			
			// HttpSession session = request.getSession();
			//	PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");
			//    int patientId=patientDetail.getPatientId(); 
			    
			PatientAllPersonalHistory patientAllPersonalHistory = new PatientAllPersonalHistory();
	 
			PatientHistoryIllnessList patientHistoryIllnessList =new PatientHistoryIllnessList();
			
			
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId", ""+patientId);
			 
			
		 
			try {
				patientAllPersonalHistory =Constant.getRestTemplate().postForObject(Constant.url + "getPatientHistory", map, PatientAllPersonalHistory.class);
				
				
				
				model.addObject("menstrualObstetricHistory",patientAllPersonalHistory.getMenstrualObstetricHistory());
				model.addObject("patientFamilyHistory",patientAllPersonalHistory.getPatientFamilyHistory());
				model.addObject("patientHistoryChiefComplaints",patientAllPersonalHistory.getPatientHistoryChiefComplaints());
				model.addObject("patientPastHistory",patientAllPersonalHistory.getPatientPastHistory());
				model.addObject("patientPastHistoryIIlness",patientAllPersonalHistory.getPatientPastHistoryIIlness());
				model.addObject("patientPersonalHistory",patientAllPersonalHistory.getPatientPersonalHistory());
				model.addObject("patientPsychologicalHistory",patientAllPersonalHistory.getPatientPsychologicalHistory());
				model.addObject("patientTreatementHistoryp",patientAllPersonalHistory.getPatientTreatementHistoryp());
				model.addObject("patientHistoryIllnessList",patientAllPersonalHistory.getPatientPastHistoryIIlnessList());
				
				
			} catch (Exception e) {
				
				LOGGER.error("Error while getViewPatientHistoryDetails by patient id.",e);
				throw new RuntimeException("Error while getViewPatientHistoryDetails by patient id.",e);
			}

			return model;
		}
		 
		@RequestMapping(value = "/getEditPatientHistoryDetails/{patientId}", method = RequestMethod.GET)
		public ModelAndView getEditPatientHistoryDetails(@PathVariable("patientId") int patientId, HttpServletRequest request,
				HttpServletResponse response) {
			
			ModelAndView model=new ModelAndView("patient/EditPatientHistory");
			//int patientId=Integer.parseInt(request.getParameter("patientId")); 
			// HttpSession session = request.getSession();
			//	PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");
			//    int patientId=patientDetail.getPatientId(); 
			    
			
			
			
			PatientAllPersonalHistory patientAllPersonalHistory = new PatientAllPersonalHistory();
	 
			PatientHistoryIllnessList patientHistoryIllnessList =new PatientHistoryIllnessList();
			
			
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId", ""+patientId);
			 
			
		 
			try {
				patientAllPersonalHistory =Constant.getRestTemplate().postForObject(Constant.url + "getPatientHistory", map, PatientAllPersonalHistory.class);
				
				
				
				model.addObject("menstrualObstetricHistory",patientAllPersonalHistory.getMenstrualObstetricHistory());
				model.addObject("patientFamilyHistory",patientAllPersonalHistory.getPatientFamilyHistory());
				model.addObject("patientHistoryChiefComplaints",patientAllPersonalHistory.getPatientHistoryChiefComplaints());
				model.addObject("patientPastHistory",patientAllPersonalHistory.getPatientPastHistory());
				model.addObject("patientPastHistoryIIlness",patientAllPersonalHistory.getPatientPastHistoryIIlness());
				model.addObject("patientPersonalHistory",patientAllPersonalHistory.getPatientPersonalHistory());
				model.addObject("patientPsychologicalHistory",patientAllPersonalHistory.getPatientPsychologicalHistory());
				model.addObject("patientTreatementHistoryp",patientAllPersonalHistory.getPatientTreatementHistoryp());
				model.addObject("patientHistoryIllnessList",patientAllPersonalHistory.getPatientPastHistoryIIlnessList());
				
				
			} catch (Exception e) {
				
				LOGGER.error("Error while getViewPatientHistoryDetails by patient id.",e);
				throw new RuntimeException("Error while getViewPatientHistoryDetails by patient id.",e);
			}

			return model;
		}
		 
		
		
		
		
		
		@RequestMapping(value="/updatePatientPersonalHistoryRegProcess", method=RequestMethod.POST)

		public String updatePatientPersonalHistoryRegProcess(HttpServletRequest request,HttpServletResponse response)
		{
			//ModelAndView model=new ModelAndView("patient/patientHomePage");
			
		     int patientId=Integer.parseInt(request.getParameter("patientId")); 
		     
		     System.out.println(+patientId);
				//int  patientId=1;
				RestTemplate rest=new RestTemplate();
				MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
				map.add("patientId", ""+patientId);
			PatientAllPersonalHistory patientAllPersonalHistory=new PatientAllPersonalHistory();
			
			PatientPersonalHistory patientPersonalHistory=new PatientPersonalHistory();
			PatientPastHistoryIIlness patientPastHistoryIIlness=new PatientPastHistoryIIlness();
			PatientPastHistory patientPastHistory=new PatientPastHistory();		
			PatientHistoryChiefComplaints patientHistoryChiefComplaints=new PatientHistoryChiefComplaints();
			MenstrualObstetricHistory menstrualObstetricHistory=new MenstrualObstetricHistory();
			PatientFamilyHistory patientFamilyHistory=new PatientFamilyHistory();
			PatientPsychologicalHistory patientPsychologicalHistory=new PatientPsychologicalHistory();
			PatientTreatementHistory patientTreatementHistory=new PatientTreatementHistory();
			 
		
			 
			
			//PatientHistoryChiefComplaints
			patientHistoryChiefComplaints.setComplaints(request.getParameter("Chief"));
			    
			patientHistoryChiefComplaints.setPatientId(patientId);
			
		 
			     //PatientPastHistory
			
			 String[] illness=request.getParameterValues("illness");
				StringBuffer sb=new StringBuffer();
				 for(int i=0;i<illness.length;i++)
				 {
					 sb.append(illness[i]+",");
				 }
			
			 String illnessIdString=sb.substring(0, sb.length()-1);
			    patientPastHistory.setPatientId(patientId);
			    patientPastHistory.setString1("1");
			    patientPastHistory.setString2("1");
			    patientPastHistory.setInt1(0);
			    patientPastHistory.setInt2(0);
			    patientPastHistory.setPastHistoryIllnessId(illnessIdString);
			    
			    String Maritalstatus= request.getParameter("test");
				  
			    if(Maritalstatus!=null) {
			     if(Maritalstatus.equals("NO"))
			     {
			    	 patientPersonalHistory.setMaritalStatus(request.getParameter("test")); 
			     }
			     else
			     {
			    	 patientPersonalHistory.setMaritalStatus(request.getParameter("Maritalstatus")); 
			     }
			    }else
			    {
			    	 patientPersonalHistory.setMaritalStatus(request.getParameter("test")); 
				   	 patientPersonalHistory.setMaritalStatus(request.getParameter("Maritalstatus")); 
			    }
			   
			    patientPersonalHistory.setPatientId(patientId);
			    patientPersonalHistory.setOccupation(request.getParameter("Occupation"));
			    patientPersonalHistory.setAnualIncome(request.getParameter("Income"));
			    patientPersonalHistory.setAddiction(request.getParameter("Addiction"));
			    patientPersonalHistory.setDietaryHabits(request.getParameter("Dietary"));
			    patientPersonalHistory.setHistoryOfConterception(request.getParameter("Contraception"));
			    patientPersonalHistory.setHighRiskBehaviour(request.getParameter("HighRiskbehaviour"));
			    patientPersonalHistory.setString1("1");
			    patientPersonalHistory.setString2("1");
			    patientPersonalHistory.setString3("1");
			    patientPersonalHistory.setString4("1");
			    patientPersonalHistory.setInt1(0);
			
			    
			   //PatientFamilyHistory
			    patientFamilyHistory.setFamilyHistory(request.getParameter("FamilyHistory"));
			    patientFamilyHistory.setPatientId(patientId);
			    patientFamilyHistory.setString1("1");
			    patientFamilyHistory.setString2("1");
			    
			    
			    //PatientTreatementHistory
			    String check= request.getParameter("test1");
			    if(check!=null) {
			     if(check.equals("NO"))
			     {
			    	 patientTreatementHistory.setTreatmentReceived(request.getParameter("test1")); 
			     }
			     else
			     {
			    	 patientTreatementHistory.setTreatmentReceived(request.getParameter("Treatment")); 
			     }
			     
			    }else {
			    	patientTreatementHistory.setTreatmentReceived(request.getParameter("test1")); 
			    	patientTreatementHistory.setTreatmentReceived(request.getParameter("Treatment")); 
			     
			     }
			     
			     
			     
			     String drugallergy= request.getParameter("test2");
			   
			     if(drugallergy!=null) {
			     
			     
			     if(drugallergy.equals("NO"))
			     {
			    	 patientTreatementHistory.setAllergyReactions(request.getParameter("test2")); 
			     }
			     else
			     {
			    	 patientTreatementHistory.setAllergyReactions(request.getParameter("drugallergy")); 
			     }
			     
			     }else
			     {
			    	 patientTreatementHistory.setAllergyReactions(request.getParameter("test2"));
			    	 patientTreatementHistory.setAllergyReactions(request.getParameter("drugallergy"));
			     }
			     
			     
			     
			     String surgicalintervention= request.getParameter("test3");
				   
			     if(surgicalintervention!=null) {
				  
			     if(surgicalintervention.equals("NO"))
			     {
			    	 patientTreatementHistory.setSurgicalIntervention(request.getParameter("test3")); 
			     }
			     else
			     {
			    	 patientTreatementHistory.setSurgicalIntervention(request.getParameter("surgicalintervention")); 
			     }
			     
			     }else
			     {
			    	 patientTreatementHistory.setSurgicalIntervention(request.getParameter("test3"));
			    	 patientTreatementHistory.setSurgicalIntervention(request.getParameter("surgicalintervention")); 
			    	 
			     }
			     
			     
			     String contraceptives= request.getParameter("test4");
				   
			     if(contraceptives!=null) {
			     
			     
			     if(contraceptives.equals("NO"))
			     {
			    	 patientTreatementHistory.setUseOralContraceptives(request.getParameter("test4")); 
			     }
			     else
			     {
			    	 patientTreatementHistory.setUseOralContraceptives(request.getParameter("contraceptives")); 
			     }
			     
			     }else
			     {
			    	 patientTreatementHistory.setUseOralContraceptives(request.getParameter("test4")); 
			    	 patientTreatementHistory.setUseOralContraceptives(request.getParameter("contraceptives")); 
			    	 
			     }
			     
			    patientTreatementHistory.setBloodTransfusion(request.getParameter("Bloodtransfusion"));
			    patientTreatementHistory.setIntakeNsaid(request.getParameter("Intake"));
			    patientTreatementHistory.setRegularUsezoralContraceptives(request.getParameter("contraceptives"));
			    patientTreatementHistory.setPatientId(patientId);
			    patientTreatementHistory.setString1("1");
			    patientTreatementHistory.setString2("1");
			    
			    
			    //PatientPsychologicalHistory
			    patientPsychologicalHistory.setPsychologicalHistory(request.getParameter("PsychologicalHistory"));
			    patientPsychologicalHistory.setPatientId(patientId);
			    patientPsychologicalHistory.setString1("1");
			    patientPsychologicalHistory.setString2("1");
			    
			    
			    
			    //menstrualObstetricHistory
			    menstrualObstetricHistory.setMenarche(request.getParameter("Menarche"));
			    menstrualObstetricHistory.setDurationOfPeriod(request.getParameter("durationperoid"));	  
			    menstrualObstetricHistory.setMenstrualErregularities(request.getParameter("Dysmenorrhoea"));
			    menstrualObstetricHistory.setDateOfLastPeriod(request.getParameter("menstrual"));
			    menstrualObstetricHistory.setMenopause(request.getParameter("Menopause"));
			    menstrualObstetricHistory.setOutcomeOfPregnancies(request.getParameter("Outcomepregnancies"));
			    
		        String Complicationspregnancy= request.getParameter("test5");
				 
		        if(Complicationspregnancy!=null) {
		        
		        
			     if(Complicationspregnancy.equals("NO"))
			     {
			    	 menstrualObstetricHistory.setComplicationsDuringPregnancies(request.getParameter("test5")); 
			     }
			     else
			     {
			    	 menstrualObstetricHistory.setComplicationsDuringPregnancies(request.getParameter("Complicationspregnancy")); 
			     }
			     
		        }else {
			    	 
		        	 menstrualObstetricHistory.setComplicationsDuringPregnancies(request.getParameter("test5")); 
		        	 menstrualObstetricHistory.setComplicationsDuringPregnancies(request.getParameter("Complicationspregnancy"));
			     }
			     
			     
			    menstrualObstetricHistory.setMade_of_delivery(request.getParameter("Modedelivery"));
			    menstrualObstetricHistory.setLast_child_birth(request.getParameter("Lastbirth"));
			    menstrualObstetricHistory.setNoOfPregnancies(request.getParameter("pregnancies"));
			    menstrualObstetricHistory.setQtyOfBloodLoss(request.getParameter("bloodloss"));
			   // menstrualObstetricHistory.setNoOfPregnancies(Integer.parseInt(request.getParameter("pregnancies")));
			  //  menstrualObstetricHistory.setQtyOfBloodLoss(Integer.parseInt(request.getParameter("bloodloss")));    
			    menstrualObstetricHistory.setPatientId(patientId);
			    menstrualObstetricHistory.setString1("1");
			    menstrualObstetricHistory.setString2("1");
			    menstrualObstetricHistory.setString3("1");
			    
			    
			    
			    
				patientAllPersonalHistory.setMenstrualObstetricHistory(menstrualObstetricHistory);
				patientAllPersonalHistory.setPatientFamilyHistory(patientFamilyHistory);
				patientAllPersonalHistory.setPatientHistoryChiefComplaints(patientHistoryChiefComplaints);
				patientAllPersonalHistory.setPatientPastHistory(patientPastHistory);
				patientAllPersonalHistory.setPatientPersonalHistory(patientPersonalHistory);
				patientAllPersonalHistory.setPatientPsychologicalHistory(patientPsychologicalHistory);
				patientAllPersonalHistory.setPatientTreatementHistoryp(patientTreatementHistory);
				
			
			try {
				patientAllPersonalHistory=Constant.getRestTemplate().postForObject(Constant.url+"updatePatientPersonalDetails", patientAllPersonalHistory,PatientAllPersonalHistory.class);
			 
			}catch (Exception e) {
				
				LOGGER.error("Error while submitPatientPersonalHistoryRegProcess.",e);
				throw new RuntimeException("Error while submitPatientPersonalHistoryRegProcess.",e);
			}
					
			return "redirect:/showPatientHomePage";
			
		}
			
		@RequestMapping(value="/showPatientHistory/{patientId}", method=RequestMethod.GET)

		public String showPatientHistory(HttpServletRequest request,@PathVariable("patientId") int patientId, Model model)
		{
			 
			try {
				MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
				map.add("patientId", patientId);
				PatientAllPersonalHistory patientAllPersonalHistory=Constant.getRestTemplate().postForObject(Constant.url+"getPatientAllHistory",map, PatientAllPersonalHistory.class);
			 
				
				model.addAttribute("patientPersonalHistory",patientAllPersonalHistory.getPatientPersonalHistory());
				model.addAttribute("patientPastHistory",patientAllPersonalHistory.getPatientPastHistoryIIlnessList());
				model.addAttribute("patientHistoryChiefComplaints",patientAllPersonalHistory.getPatientHistoryChiefComplaints());
				model.addAttribute("menstrualObstetricHistory",patientAllPersonalHistory.getMenstrualObstetricHistory());
				model.addAttribute("patientFamilyHistory",patientAllPersonalHistory.getPatientFamilyHistory());
				model.addAttribute("patientPsychologicalHistory",patientAllPersonalHistory.getPatientPsychologicalHistory());
				model.addAttribute("patientTreatementHistory",patientAllPersonalHistory.getPatientTreatementHistoryp());
				
			}
			catch (Exception e) {
				LOGGER.error("Error while getPatientAllHistory.",e);
				throw new RuntimeException("Error while getPatientAllHistory.",e);
			}
			return "patient/showPatientHistory";
			
		}
		
		
		 
		@PostMapping (value="/submitChiefComplaintsHistory")
		 
		 public @ResponseBody Info submitChiefComplaintsHistory(HttpServletRequest request, @ModelAttribute PatientHistoryChiefComplaints patientHistoryChiefComplaints) {
		 
		 System.out.println(patientHistoryChiefComplaints.toString());
		 Info info=new Info();
		 try {
			 PatientHistoryChiefComplaints patientHistoryChiefComplaintsRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientHistoryChiefComplaints", patientHistoryChiefComplaints,PatientHistoryChiefComplaints.class);
				if(patientHistoryChiefComplaintsRes!=null)
					 info.setMessage("Update History Successfully");
			}catch (Exception e) {
				 info.setMessage("Failed to Update History ");
				LOGGER.error("Error while submitChiefComplaintsHistory.",e);
				throw new RuntimeException("Error while submitChiefComplaintsHistory.",e);
			}
		 
		 return new Info();
		}
		
		 
			@PostMapping (value="/submitPastHistory")
			 
			 public  @ResponseBody Info submitPastHistory(HttpServletRequest request, @ModelAttribute PatientPastHistory patientPastHistory) {
			 
			 System.out.println(patientPastHistory.toString());
			 
			 Info info=new Info();
			 try {
				 PatientPastHistory patientPastHistoryRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientPastHistory", patientPastHistory,PatientPastHistory.class);
					if(patientPastHistoryRes!=null)
						 info.setMessage("Update History Successfully");
				}catch (Exception e) {
					 info.setMessage("Failed to Update History ");
					LOGGER.error("Error while submitPastHistory.",e);
					throw new RuntimeException("Error while submitPastHistory.",e);
				}
			 
			 return new Info();
			}
			
			@PostMapping (value="/submitPersonalHistory")
			 
			 public @ResponseBody Info submitPersonalHistory(HttpServletRequest request, @ModelAttribute PatientPersonalHistory patientPersonalHistory) {
			 
			 System.out.println(patientPersonalHistory.toString());
			 Info info=new Info();
			 try {
				 PatientPersonalHistory patientPersonalHistoryRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPersonalHistoryDetails", patientPersonalHistory,PatientPersonalHistory.class);
					if(patientPersonalHistoryRes!=null)
						 info.setMessage("Update History Successfully");
				}catch (Exception e) {
					 info.setMessage("Failed to Update History ");
					LOGGER.error("Error while submitPersonalHistory.",e);
					throw new RuntimeException("Error while submitPersonalHistory.",e);
				}
			 
			 return new Info();
			}
			@PostMapping (value="/submitFamilyHistory")
			 
			  public @ResponseBody Info submitFamilyHistory(HttpServletRequest request, @ModelAttribute PatientFamilyHistory patientFamilyHistory) {
			 
			 System.out.println(patientFamilyHistory.toString());
			 Info info=new Info();
			 try {
				 PatientFamilyHistory patientFamilyHistoryRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientFamilyHistory", patientFamilyHistory,PatientFamilyHistory.class);
					if(patientFamilyHistoryRes!=null)
						 info.setMessage("Update History Successfully");
				}catch (Exception e) {
					 info.setMessage("Failed to Update History ");
					LOGGER.error("Error while submitFamilyHistory.",e);
					throw new RuntimeException("Error while submitFamilyHistory.",e);
				}
			 
			 return new Info();
			}
			
			@PostMapping (value="/submitTreatmentHistory")
			 public @ResponseBody Info submitTreatmentHistory(HttpServletRequest request, @ModelAttribute PatientTreatementHistory patientTreatementHistory) {
				 Info info=new Info();
				 System.out.println("submitTreatmentHistory");
			 System.out.println(patientTreatementHistory.toString());
			 
			 try {
				 PatientTreatementHistory patientTreatementHistoryRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientTreatementHistory", patientTreatementHistory,PatientTreatementHistory.class);
					if(patientTreatementHistoryRes!=null)
						 info.setMessage("Update History Successfully");
				}catch (Exception e) {
					 info.setMessage("Failed to Update History ");
					LOGGER.error("Error while submitTreatmentHistory.",e);
					throw new RuntimeException("Error while submitTreatmentHistory.",e);
				}
			 
			 return new Info();
			}
			@PostMapping (value="/submitPsychologicalHistory")
			 
			 public @ResponseBody Info submitPsychologicalHistory(HttpServletRequest request, @ModelAttribute PatientPsychologicalHistory patientPsychologicalHistory) {
				 Info info=new Info();
			 System.out.println(patientPsychologicalHistory.toString());
			 
			 try {
				 PatientPsychologicalHistory patientPsychologicalHistoryRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPatientPsychologicalHistory", patientPsychologicalHistory,PatientPsychologicalHistory.class);
				 if(patientPsychologicalHistoryRes!=null)
							 info.setMessage("Update History Successfully");
				}catch (Exception e) {
					 info.setMessage("Failed to Update History ");
					LOGGER.error("Error while submitPsychologicalHistory.",e);
					throw new RuntimeException("Error while submitPsychologicalHistory.",e);
				}
			 
			 return new Info();
			}
			@PostMapping (value="/submitMenstrualHistory")
			 public @ResponseBody Info submitMenstrualHistory(HttpServletRequest request, @ModelAttribute MenstrualObstetricHistory menstrualObstetricHistory) {
			 
			 System.out.println(menstrualObstetricHistory.toString());
			 Info info=new Info();
			 info.setError(true);
			 try {
			
				 MenstrualObstetricHistory menstrualObstetricHistoryRes=Constant.getRestTemplate().postForObject(Constant.url+"insertMenstrualObstetricHistory", menstrualObstetricHistory,MenstrualObstetricHistory.class);
				
				 if(menstrualObstetricHistoryRes!=null)
				 info.setMessage("Update History Successfully");
				 info.setError(false);
				}catch (Exception e) {
					 info.setMessage("Failed to Update History ");
					 info.setError(true); 
					LOGGER.error("Error while submitMenstrualHistory.",e);
					throw new RuntimeException("Error while submitMenstrualHistory.",e);
					
				}
			 return info;
			  
			}
}
