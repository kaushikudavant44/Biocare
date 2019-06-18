package com.bionische.biocare.stemcell;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.bionische.biocare.doctor.model.HospitalDetails;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.Country;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.stemcell.model.ConfirmDetails;
import com.bionische.biocare.stemcell.model.GetPatientEnrollDetails;
import com.bionische.biocare.stemcell.model.GetStemcellBankDetails;
import com.bionische.biocare.stemcell.model.PatientEnrollDetails;
import com.bionische.biocare.stemcell.model.PlanDetails;
import com.bionische.biocare.stemcell.model.PregnancyCalculator;
import com.bionische.biocare.stemcell.model.StemCellBankDetails;
import com.bionische.biocare.stemcell.model.StemCellBankRatingDetails;


 

@Controller
public class StemCellController { 

	    List<City> cityList;
	    List<State> stateList;
	    List<Country> countryList;
		List<HospitalDetails> hospitalList;
		List<DoctorDetails> doctorList;
		List<StemCellBankDetails> stembankList;
		List<PlanDetails> planList;
		List<GetPatientEnrollDetails> enrollList;
		//List<Stemcellrenewal> stemcellrenewalList;


	

	
	@RequestMapping(value = "/showStemCellBank", method = RequestMethod.GET)
    public ModelAndView showStemCell() {
		    ModelAndView model = new ModelAndView("stemcell/viewStemCellBank");
	        System.out.println("InMethod");
		 RestTemplate rest = new RestTemplate();

		try {
			
			countryList=rest.getForObject(Constant.url+"getAllCountry",List.class);
			
			
			System.out.println("country "+countryList.toString());
			
            System.out.println("ll");
             
			
		    model.addObject("countryList", countryList);

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return model;
	}
	
	
	
@RequestMapping(value = "/getStemCellBank", method = RequestMethod.GET)
	public ModelAndView getStemCellBank(HttpServletRequest request) 
		
		{
	System.out.println("kk");	
		ModelAndView model = new ModelAndView("stemcell/viewStemCellBank");
		
	
	try {
	RestTemplate rest = new RestTemplate();
	
	int cityId = Integer.parseInt(request.getParameter("cityId"));
	
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	System.out.println("mmmmmm");	

	
	map.add("cityId", ""+cityId);
	System.out.println("cityId:"+cityId);

	
	List<GetStemcellBankDetails>  getStemcellBankDetails=rest.postForObject(Constant.url + "getStemcellBankDetailsBycityId", map, List.class);
    System.out.println("banks:"+getStemcellBankDetails.toString());
	model.addObject("getStemcellBankDetails",getStemcellBankDetails);
	model.addObject("cityList", cityList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
	
		return model;
		
	 
		}
	 
	@RequestMapping(value="/showEnrollPatientStemCell", method= RequestMethod.GET)

	public ModelAndView showEnrollPatientStemCell(HttpServletRequest request,HttpServletResponse response)
	{
		  ModelAndView model= new ModelAndView("stemcell/patientEnrollStemCell");
		  int stemCellBankId=1;
		  
		  
		  //int stemCellBankId= Integer.parseInt(request.getParameter("stemCellBankId"));
	     // System.out.println("stemCellBankId:"+stemCellBankId);
	      List<PlanDetails> plandetailsList=new ArrayList<PlanDetails>();
	   
	      RestTemplate rest=new RestTemplate();
	      MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	
	       map.add("stemCellBankId", ""+stemCellBankId);
	      System.out.println("stemId:"+stemCellBankId);  

		      try {
			
			
		    plandetailsList=rest.postForObject(Constant.url + "getStemcellPlansBycompanyId", map, List.class);
		    countryList=rest.getForObject(Constant.url+"getAllCountry",List.class);
		    //stembankList=rest.getForObject(Constant.url+"getAllStemCellBANK",List.class);
		  // planList=rest.getForObject(Constant.url+"getStemcellRenewalBycompanyId",List.class);



		System.out.println("country "+countryList.toString());
	    System.out.println("plandetailsList "+plandetailsList.toString());
	    
	  // System.out.println("stembankList "+stembankList.toString());
	    //System.out.println("planList "+planList.toString());

}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		model.addObject("countryList", countryList);
		model.addObject("plandetailsList",plandetailsList);
		//model.addObject("stembankList",stembankList);
		
			
                   return model;
}



		


		
@RequestMapping(value="/submitPatientStemcellRegProcess",method= RequestMethod.POST)

	public ModelAndView submitStemcellRegProcess(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("stemcell/patientEnrollStemCell");
		
		
	PatientEnrollDetails patientEnrollDetails = new PatientEnrollDetails();
	     
	HttpSession session = request.getSession();
	

	PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");

    int patientId=patientDetail.getPatientId();
    
  //  int patientId=2;
	System.out.println("patientId:"+patientId);

	RestTemplate rest = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	map.add("patientId", patientId);
 

	try {
 
				
		model.addObject("patientEnrollDetails", patientEnrollDetails);
		System.out.println("response "+patientEnrollDetails.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
	int countryId = Integer.parseInt(request.getParameter("countryName"));
	int stateId = Integer.parseInt(request.getParameter("stateName"));
	int cityId = Integer.parseInt(request.getParameter("cityName"));
	int hospitalId = Integer.parseInt(request.getParameter("hospitalName"));
    int stemCellBankId;
    int planId;
    
    
       patientEnrollDetails.setTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));		
		patientEnrollDetails.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	    patientEnrollDetails.setPregnancyType(request.getParameter("pregnancyType"));

	    
		patientEnrollDetails.setExpectedDeliveryDate(request.getParameter("expectedDeliveryDate"));
	   patientEnrollDetails.setCountryId(countryId);
		patientEnrollDetails.setCityId(cityId);
		patientEnrollDetails.setStateId(stateId);
		patientEnrollDetails.setPatientId(patientId);
		patientEnrollDetails.setStemCellBankId(1);
	    patientEnrollDetails.setHospitalId(hospitalId);
        patientEnrollDetails.setPlanId(1);
	    patientEnrollDetails.setInt1(0);
        patientEnrollDetails.setInt1(0);
		patientEnrollDetails.setInt2(0);
		patientEnrollDetails.setString1("");
		patientEnrollDetails.setString2("");
		patientEnrollDetails.setDelStatus(0);
		
		System.out.println("kk");
        System.out.println("response "+patientEnrollDetails.toString());
		
       RestTemplate rest1=new RestTemplate();
	     try {
		Info  info=rest1.postForObject(Constant.url+"insertPatientEnrollDetails", patientEnrollDetails, Info.class);
		System.out.println("jj");

		}
		
		catch (Exception e) {
	    System.out.println(e.getMessage());
		}
				return model;
		
}
	
	
	
	@RequestMapping(value = "/showPregnancyCalculator", method = RequestMethod.GET)

	public ModelAndView showPregnancyCalculator() {
		ModelAndView model = new ModelAndView("stemcell/pregnancy");
		return model;
	}
	
	@RequestMapping(value="/submitPregnancyCalculator",method= RequestMethod.POST)

	public ModelAndView submitDueDate(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("stemcell/pregnancy");
		
	PregnancyCalculator pregnancyCalculator = new PregnancyCalculator();
     HttpSession session = request.getSession();
	

	PatientDetails patientDetails=(PatientDetails)session.getAttribute("patientDetails");
	
	
    int patientId=patientDetails.getPatientId(); 
    System.out.println("patientid:"+patientId);
    
	
		
try {

		
		model.addObject("pregnancyCalculator", pregnancyCalculator);
		System.out.println("response "+pregnancyCalculator.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}

        System.out.println("fd1:"+request.getParameter("fd1"));
		pregnancyCalculator.setFirtilityDate(request.getParameter("fd1"));
		
		pregnancyCalculator.setConceptionDate(request.getParameter("cd"));
		pregnancyCalculator.setFirstTrimisterDate(request.getParameter("fte"));
		pregnancyCalculator.setSecondTrimisterDate(request.getParameter("ste"));
		pregnancyCalculator.setDueDate(request.getParameter("dd"));
		pregnancyCalculator.setToFirtilityDate(request.getParameter("fd2"));
		pregnancyCalculator.setTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));		
		pregnancyCalculator.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        pregnancyCalculator.setInt1(0);
		pregnancyCalculator.setInt2(0);
		pregnancyCalculator.setString1("");
		pregnancyCalculator.setString2("");
		pregnancyCalculator.setDelStatus(0);
		pregnancyCalculator.setPatientId(patientId);



		System.out.println("kk");

		System.out.println("response "+pregnancyCalculator.toString());
		
		RestTemplate rest=new RestTemplate();
		
		try {
		Info  info=rest.postForObject(Constant.url+"insertDueDate", pregnancyCalculator, Info.class);
		System.out.println("jj");

		}
		
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
				return model;
		}

	
	

	@RequestMapping(value = "/showBMIcalculator", method = RequestMethod.GET)

	public ModelAndView showBMIcalculator() {
		ModelAndView model = new ModelAndView("stemcell/bmiCaculator");
		return model;
	}
	
	//komal Gaikwad
	//get stemcellbank reviews
	
	@RequestMapping(value = "/getStemCellReviewBystemcellBankId", method = RequestMethod.GET)
	public @ResponseBody List<StemCellBankRatingDetails> getStemCellReviewBystemcellBankId(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("hi");
		String stemCellBankId = request.getParameter("stemCellBankId");
		System.out.println("stemCellBankId " + stemCellBankId );
	 
		List<StemCellBankRatingDetails> stemCellRatingDetailsList=new ArrayList<StemCellBankRatingDetails>();

        RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("stemCellBankId", stemCellBankId);
	 
		
	 try {
			
			
		stemCellRatingDetailsList = rest.postForObject(Constant.url + "getStemCellReviewByStemcellBankId", map, List.class);

		System.out.println("stemcell bank List " + stemCellRatingDetailsList.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return stemCellRatingDetailsList;
	}
	
	
	
@RequestMapping(value = "/showStemCell", method = RequestMethod.GET)

	public ModelAndView showStemcell() {
		ModelAndView model = new ModelAndView("stemcell/index");
		return model;
	}

	
/*@RequestMapping(value="/displayPatientEnroll", method=RequestMethod.GET)

	public ModelAndView  displayPatientEnroll (HttpServletRequest request,HttpServletResponse response)
	{
		
		
		ModelAndView model=new ModelAndView("stemcell/confirmStemCell");
		
		PatientEnrollDetails patientEnrollDetails=new PatientEnrollDetails();
		
		int countryId = Integer.parseInt(request.getParameter("countryId"));
		int stateId = Integer.parseInt(request.getParameter("stateId"));
		int cityId = Integer.parseInt(request.getParameter("cityId"));
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		
		patientEnrollDetails.setPregnancyType(request.getParameter("pregnancyType"));
		patientEnrollDetails.setExpectedDeliveryDate(request.getParameter("expectedDeliveryDate"));
		patientEnrollDetails.setCountryId(countryId);
		patientEnrollDetails.setCityId(cityId);
		patientEnrollDetails.setStateId(stateId);
		patientEnrollDetails.setHospitalId(hospitalId);
		
		
		System.out.println("details"+patientEnrollDetails.toString());
		model.addObject("patient EnrollDetails", patientEnrollDetails);
		
		return model;
		
	}*/





@RequestMapping(value="/displayPatientEnroll", method=RequestMethod.POST)

public ModelAndView  displayPatientEnroll (HttpServletRequest request,HttpServletResponse response)
{
	
	
	ModelAndView model=new ModelAndView("stemcell/confirmStemCellEnroll");
	
	//Country country=new Country();
	
	ConfirmDetails confirmDetails=new ConfirmDetails();
	
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	int stateId = Integer.parseInt(request.getParameter("stateId"));
	int cityId = Integer.parseInt(request.getParameter("cityId"));
	int hospitalId = Integer.parseInt(request.getParameter("cityId"));
	
    String countryName=request.getParameter("countryName");
    System.out.println("countryName"+countryName);
    
    
    String stateName=request.getParameter("stateName");
    System.out.println("stateName"+stateName);

    String cityName=request.getParameter("cityName");
    System.out.println("cityName"+cityName);

    
    String hospitalName=request.getParameter("hospitalName");
    System.out.println("hospitalName"+hospitalName);

    
    confirmDetails.setCountryName(request.getParameter("countryName"));
	confirmDetails.setCityName(request.getParameter("cityName"));
	confirmDetails.setHospitalName(request.getParameter("HospitalName"));
	confirmDetails.setStateName(request.getParameter("stateName"));
    confirmDetails.setPregnancyType(request.getParameter("pregnancyType"));
	
	confirmDetails.setExpectedDeliveryDate(request.getParameter("expectedDeliveryDate"));
	
	
	confirmDetails.setCountryName(countryName);
	confirmDetails.setStateName(stateName);
   	confirmDetails.setCityName(cityName);
	confirmDetails.setHospitalName(hospitalName);
	
	
	
	
	
	
	

   /* System.out.println("ffs"+confirmDetails.getCityName());
	confirmDetails.setCityName(request.getParameter("cityName"));
    System.out.println(""+request.getParameter("pregnancyType"));*/
	
	

	
	
	confirmDetails.setCountryId(countryId);
	confirmDetails.setStateId(stateId);
	confirmDetails.setCityId(cityId);
confirmDetails.setHospitalId(hospitalId);
	
	
	
	
	model.addObject("confirmDetails", confirmDetails);
    System.out.println("confirmDetails"+confirmDetails);

	return model;
	
}

	
	
@RequestMapping(value = "/showViewStemcellDetails", method = RequestMethod.GET)

        public ModelAndView showViewStemcellDetails(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("stemcell/viewStemCellDetails");

	
		HttpSession session = request.getSession();
		PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
        int familyId=patientDetails.getFamilyId();
		
		    //int familyId=1;
	       try {
	         RestTemplate rest = new RestTemplate();
	         MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	         
	         map.add("familyId", ""+familyId);
	

		
	List<GetPatientEnrollDetails>  getPatientEnrollDetailsList=rest.postForObject(Constant.url + "getEnrollDetailsByPatientId", map, List.class);
			
			
			model.addObject("getPatientEnrollDetailsList",getPatientEnrollDetailsList);
	       		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return model;
	}



	/*@RequestMapping(value = "/getStemCellRenewals", method = RequestMethod.GET)
	public @ResponseBody List<Stemcellrenewal> getStemCellRenewals(HttpServletRequest request,
			HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView("stemcell/patientEnroll");
		
		int stemCellBankId=1;
//		int stemCellBankId = Integer.parseInt(request.getParameter("stemCellBankId"));

		System.out.println("stemCellBankId:"+stemCellBankId);
		
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		map.add("stemCellBankId", ""+stemCellBankId);
		List<Stemcellrenewal>  stemcellrenewalList =new ArrayList<Stemcellrenewal>();

		try {
			
			stemcellrenewalList=rest.postForObject(Constant.url + "getStemcellRenewalBycompanyId", map, List.class);
		System.out.println("List "+stemcellrenewalList.toString());
		model.addObject("stemcellrenewalList",stemcellrenewalList);
		}catch (Exception e) {
		System.out.println(e.getMessage());
		}
		return stemcellrenewalList;
	}*/


@RequestMapping(value="/gethospitalByCityId", method=RequestMethod.GET)

	public @ResponseBody List<HospitalDetails>  getHositalByCityId(HttpServletRequest request,HttpServletResponse response)
	{
		int cityId=Integer.parseInt(request.getParameter("cityId"));
		ModelAndView model=new ModelAndView("stemcell/patientEnrollStemCell");
		HttpSession session = request.getSession();
		

		PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");

	    int patientId=patientDetail.getPatientId();
		
		
		//int patientId=2;
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("cityId",cityId);
		map.add("patientId",patientId);
	    RestTemplate rest=new RestTemplate();
		
	    hospitalList=rest.postForObject(Constant.url+"getAllHospitalsByCityId",map,List.class);
		
		System.out.println("hospitalList:"+hospitalList.toString());

		
		return hospitalList;
		
	}

@RequestMapping(value="/getStemcellPlanByCompanyId", method=RequestMethod.GET)

public @ResponseBody List<PlanDetails>  getStemcellPlanByCompanyId(HttpServletRequest request,HttpServletResponse response)
{
	int stemCellBankId=Integer.parseInt(request.getParameter("stemCellBankId"));
	ModelAndView model=new ModelAndView("stemcell/patientEnrollStemCell");
	
     HttpSession session = request.getSession();
	PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");

    int patientId=patientDetail.getPatientId();
	//int patientId=2;
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("stemCellBankId",stemCellBankId);
	map.add("patientId",patientId);
    RestTemplate rest=new RestTemplate();
	
    planList=rest.postForObject(Constant.url+"getStemcellRenewalBycompanyId",map,List.class);
	
	System.out.println("planList:"+planList.toString());

	
	return planList;
	
}



/*
@RequestMapping(value="/getStemCellEnrollBypatientId", method=RequestMethod.GET)

public @ResponseBody List<PlanDetails>  getStemcellPlanByCompanyId(HttpServletRequest request,HttpServletResponse response)
{
	int stemCellBankId=Integer.parseInt(request.getParameter("stemCellBankId"));
	ModelAndView model=new ModelAndView("stemcell/patientEnrollStemCell");
	
	HttpSession session = request.getSession();
	PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
	int patientId =Integer.parseInt(request.getParameter("patientId"));
	
	int patientId=2;
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("stemCellBankId",stemCellBankId);
	map.add("patientId",patientId);
    RestTemplate rest=new RestTemplate();
	
    planList=rest.postForObject(Constant.url+"getStemcellRenewalBycompanyId",map,List.class);
	
	System.out.println("planList:"+planList.toString());

	
	return planList;
	
}*/






@RequestMapping(value = "/showIndex", method = RequestMethod.GET)

	public ModelAndView showEnroll() {
		ModelAndView model = new ModelAndView("pdf/pdf");
		
		System.out.println("InMethod");
		

		RestTemplate rest = new RestTemplate();

		try {
			
			
             System.out.println("ll");
             
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return model;
	}
@RequestMapping(value="/getConsulthospitalByCityId", method=RequestMethod.GET)

public @ResponseBody List<HospitalDetails>  getConsulthospitalByCityId(HttpServletRequest request,HttpServletResponse response)
{
	int cityId=Integer.parseInt(request.getParameter("cityId"));

	ModelAndView model=new ModelAndView("stemcell/patientEnrollStemCell");
	
	     
	HttpSession session = request.getSession();
	

	PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");

    int patientId=patientDetail.getPatientId();
	
	//int patientId=2;
	MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
	map.add("cityId",cityId);
	map.add("patientId",patientId);
    RestTemplate rest=new RestTemplate();
	
    hospitalList=rest.postForObject(Constant.url+"getAllHospitalsByConsultCityId",map,List.class);
	
	System.out.println("hospitalList:"+hospitalList.toString());

	
	return hospitalList;
	
}


@RequestMapping(value="/showViewPregnancyDate", method= RequestMethod.GET)

public ModelAndView showCal(HttpServletRequest request,HttpServletResponse response)
{
	  ModelAndView model= new ModelAndView("stemcell/viewPregnanacyDates");
	  //int patientId=1;
	  HttpSession session = request.getSession();
		

		PatientDetails patientDetail=(PatientDetails)session.getAttribute("patientDetails");

	    int patientId=patientDetail.getPatientId();
		
		   
     PregnancyCalculator pregnancyCalculator=new PregnancyCalculator();
   
      RestTemplate rest=new RestTemplate();
      MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();

       map.add("patientId", ""+patientId);
      System.out.println("patientId:"+patientId);  

	      try {
	    	  pregnancyCalculator=rest.postForObject(Constant.url + "getPregnancyDateByPatientId",map, PregnancyCalculator.class);
	 System.out.println("list "+pregnancyCalculator.toString());
   }
	catch (Exception e)
	{
		System.out.println(e);
	}
model.addObject("pregnancyCalculator",pregnancyCalculator);
	
 return model;
}



}
	




