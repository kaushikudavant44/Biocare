package com.bionische.biocare.insurance.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.Line.Info;

import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.insurance.model.AdultMember;
import com.bionische.biocare.insurance.model.BuyDetails;
import com.bionische.biocare.insurance.model.ChildMemberDetails;
import com.bionische.biocare.insurance.model.CompaniesOnAge;
import com.bionische.biocare.insurance.model.GetCompareInsuranceComapny;
import com.bionische.biocare.insurance.model.GetCompareInsuranceComapnyList;
import com.bionische.biocare.insurance.model.GetboughtInsuranceDetails;
import com.bionische.biocare.insurance.model.InsuranceReview;
import com.bionische.biocare.insurance.model.MakePayment;
import com.bionische.biocare.insurance.model.ProposerDetails;
import com.bionische.biocare.patient.model.Country;
import com.bionische.biocare.patient.model.PatientDetails;


@Scope("session")
@Controller
public class InsuranceDetailsController {

	int cover1;
	ProposerDetails proposerDetails;
	AdultMember adultMember;
	ChildMemberDetails childMemberDetails;
	
	List<AdultMember> adultMemberList;
	
    String companyName;
	List<ChildMemberDetails> childMemberDetailsList;
	
//	HttpEntity<String> req=new HttpEntity<String>(Constant.getHeaders());
	
	/** show insurance home page**/
	
	@RequestMapping(value="/showCompanies", method=RequestMethod.GET)
		
		public ModelAndView showCompanies(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("insurance/insurancecompanies");
			
			return model;
			
		}
	
	
	/*get insurance companies*/

	
	@RequestMapping(value="/showHealthInsuranceEnquiry", method=RequestMethod.GET)

	public @ResponseBody ModelAndView showHealthInsuranceEnquiry(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("insurance/healthInsuranceEnquiry");
		return model;
		
	}
	
	
	
	@RequestMapping(value="/getInsurancePremium", method=RequestMethod.POST)
	public ModelAndView getInsurancePremium(HttpServletRequest request,HttpServletResponse response)
	{
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		List<CompaniesOnAge> companyList=new ArrayList<CompaniesOnAge>();
		
		String selectedCountry=request.getParameter("selectedCountry");
		System.out.println("selectedCountry "+selectedCountry);

		int ageAdult1=Integer.parseInt(request.getParameter("ageAdult1"));
		
		System.out.println("Ageeeegfghjkl  "+ageAdult1);
		//ageAdult1=31;
		
		int no_of_adult=Integer.parseInt(request.getParameter("no_of_adult"));
		int no_of_child=Integer.parseInt(request.getParameter("no_of_child"));
		
		
		String membersType=null;
		if(no_of_adult==1)
		{
			
			
			if(no_of_child>0)
			{
			membersType="1A"+no_of_child+"C";
			}
			else
			{
			membersType="1A";
			}
			String age=String.valueOf(ageAdult1);
			map.add("age",age);
			map.add("membersType",membersType);
					
		}
		else
		{
			System.out.println("came1");
			
			if(no_of_child>0)
			{
				System.out.println("came2");
			membersType="2A"+"+"+no_of_child+"C";
			System.out.println("membersType:"+membersType);
			
			}
			else
			{
			membersType="2A";
			}
					
				String age=String.valueOf(ageAdult1);
				map.add("age",age);
		
			map.add("membersType",membersType);
		
		}
		
		RestTemplate rest=new RestTemplate();
		try {
	     companyList=Constant.getRestTemplate().postForObject(Constant.url+"/getInsuranceCompanies",map,List.class);
		
		System.out.println("companyList:"+companyList.toString());
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}

		System.out.println("Age "+ageAdult1);
		ModelAndView model=new ModelAndView("insurance/insurancecompanies");
		model.addObject("companyList", companyList);
 		return model;
	}

	@RequestMapping(value="/getPremiumByCover", method=RequestMethod.GET)

	public @ResponseBody int getPremiumByCover(HttpServletRequest request,HttpServletResponse response)
	{
		int cover=Integer.parseInt(request.getParameter("cover"));
		 cover1=Integer.parseInt(request.getParameter("cover1"));
		 int premium=0;
		System.out.println("jeendn"+cover);
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("cover",cover);
		
	    RestTemplate rest=new RestTemplate();
		try {
	     premium=Constant.getRestTemplate().postForObject(Constant.url+"/getPremiumByCover",map,Integer.class);
		
		System.out.println("premium:"+premium);
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return premium;
		
	}

	
	@RequestMapping(value="/getReviewByCompanyId", method=RequestMethod.POST)

	public @ResponseBody List<InsuranceReview> getReviewByCompanyId(HttpServletRequest request,HttpServletResponse response)
	{
		int companyId=Integer.parseInt(request.getParameter("companyId"));
		 int premium=0;
		 List<InsuranceReview> reviews=new ArrayList<InsuranceReview>();
		System.out.println("jeendn"+companyId);
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("companyId",companyId);
		
	    RestTemplate rest=new RestTemplate();
		try {
			reviews=Constant.getRestTemplate().postForObject(Constant.url+"/getReviewByCompanyId",map,List.class);
		
		System.out.println("reviews:"+reviews);
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return reviews;
		
	}	
	
	

	@RequestMapping(value="/getPolicyBuyDetails", method=RequestMethod.GET)
		
		public @ResponseBody ModelAndView getPolicyBuyDetails(HttpServletRequest request,
				HttpServletResponse response)
		{
		RestTemplate rest=new RestTemplate();
		BuyDetails buyDetails=new BuyDetails();
		
		
		/*ResponseEntity<List> result = Constant.getRestTemplate().exchange(Constant.url + "/getAllCountry",
				HttpMethod.GET, req, List.class);*/
		List<Country> countryList=HomeController.countryList;
		
		
		    String family=request.getParameter("family");
		    System.out.println("faily:"+family);
		    String[] res = family.split("\\+");
		    String adult=res[0];
		    String child=res[1];
		    companyName=request.getParameter("companyName");
		    cover1=Integer.parseInt(request.getParameter("cover1"));
		    System.out.println("Ganesh Cover "+cover1);
			buyDetails.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
			buyDetails.setAge(request.getParameter("age"));
			buyDetails.setAdult(adult);
			buyDetails.setChild(child);
			buyDetails.setCover(cover1);
			System.out.println("fcghb:"+request.getParameter("premium"));
			buyDetails.setPremium(Integer.parseInt(request.getParameter("premium")));
			
			int noOfAdult=Integer.parseInt(adult.substring(0, 1));
				
			int noOfChild=0;
		
			if(child!=null) {
				
				noOfChild=Integer.parseInt(child.substring(0, 1));
				
			}
			buyDetails.setNoOfAdult(noOfAdult);
			buyDetails.setNoOfChild(noOfChild);
			
			System.out.println("buyDetails:"+buyDetails.toString());
			ModelAndView model=new ModelAndView("insurance/buy");
			model.addObject("buyDetails", buyDetails);
			model.addObject("countryList", countryList);
				
			return model;
			
		}
	
	@RequestMapping(value="/submitInsuranceReg", method=RequestMethod.GET)
	
	public @ResponseBody ModelAndView submitInsuranceReg(HttpServletRequest request,
			HttpServletResponse response)
	{
		proposerDetails=new ProposerDetails();
		
		adultMemberList=new ArrayList<AdultMember>();
		
		childMemberDetailsList=new ArrayList<ChildMemberDetails>();
		
	    int noOfAdult=(Integer.parseInt(request.getParameter("noOfAdult")));
	    int noOfChild=(Integer.parseInt(request.getParameter("noOfChild")));
	    HttpSession session = request.getSession();
		PatientDetails patientDetail=	(PatientDetails)session.getAttribute("patientDetails");
	    int familyId=patientDetail.getFamilyId(); 
	    
	    //Proposer  
	    proposerDetails.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
	    proposerDetails.setFamilyId(familyId);
	    proposerDetails.setNoOfAdult(noOfAdult);
	    proposerDetails.setNoOfChildren(noOfChild);
	    proposerDetails.setEldestMemberAge(Integer.parseInt(request.getParameter("age")));
	    proposerDetails.setCover(Integer.parseInt(request.getParameter("cover")));
	    proposerDetails.setPremium(Integer.parseInt(request.getParameter("premium")));
	   
	    proposerDetails.setProposerAnualIncome(Integer.parseInt(request.getParameter("proposerAnualIncome")));
	    
	    proposerDetails.setProposerCountryId(Integer.parseInt(request.getParameter("proposerCountryId")));
	    
	    proposerDetails.setProposerStateId(Integer.parseInt(request.getParameter("proposerStateId")));
	    
	    proposerDetails.setProposerCityId(Integer.parseInt(request.getParameter("proposerCityId")));
    
	    proposerDetails.setProposerPincode(Integer.parseInt(request.getParameter("proposerPincode")));
	    proposerDetails.setNoOfYears(1);
	    proposerDetails.setAppStatus(0);
	    proposerDetails.setInt1(0);
	    proposerDetails.setInt2(0);
	    proposerDetails.setString1("1");
	    proposerDetails.setString2("1");
	    proposerDetails.setDelStatus(0);
	    
	    proposerDetails.setProposerContactNo(request.getParameter("proposerContactNo"));
	    proposerDetails.setProposerPanNo(request.getParameter("proposerPanNo"));
	    proposerDetails.setProposerMiddleName(request.getParameter("proposerMiddleName"));
	    proposerDetails.setProposerEmailId(request.getParameter("proposerEmailId"));
	    proposerDetails.setProposerFirstName(request.getParameter("proposerFirstName"));
	    proposerDetails.setProposerLastName(request.getParameter("proposerLastName"));
	    proposerDetails.setProposerDob(request.getParameter("proposerDob"));
	    proposerDetails.setProposerAdharNo(request.getParameter("proposerAdharNo"));
	    proposerDetails.setProposerTempAddress(request.getParameter("proposerTempAddress"));
	    String verify=request.getParameter("verifyAddress");
	    System.out.println("verifyyyyyyyyyyyyyyyyyyyyyyyyyyyyy:"+verify);
	    System.out.println("verif:"+request.getParameter("verify"));
	   
	    if(verify.equals("yes"))
	    {
	    	proposerDetails.setProposerPermanentAddress(request.getParameter("proposerTempAddress"));
	    	proposerDetails.setProposerPermanentStateId(Integer.parseInt(request.getParameter("proposerStateId")));
	 	    proposerDetails.setProposerPermanentCityId(Integer.parseInt(request.getParameter("proposerCityId")));
	 	    proposerDetails.setProposerPermanentPinCode(Integer.parseInt(request.getParameter("proposerPincode")));
	    }else {
	    proposerDetails.setProposerPermanentAddress(request.getParameter("proposerPermanentAddress"));
	    proposerDetails.setProposerPermanentStateId(Integer.parseInt(request.getParameter("proposerPermanentStateId")));
	    proposerDetails.setProposerPermanentCityId(Integer.parseInt(request.getParameter("proposerPermanentCityId")));
	    proposerDetails.setProposerPermanentPinCode(Integer.parseInt(request.getParameter("proposerPermanentPinCode")));
	    }
	    proposerDetails.setRegDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));


	    Calendar cal = Calendar.getInstance();
	    Date today = cal.getTime();
	    cal.add(Calendar.YEAR, 1); // to get previous year add -1
	    Date nextYear = cal.getTime();
	    System.out.println("Due date   "+nextYear);
	    proposerDetails.setDueDate(new SimpleDateFormat("yyyy-MM-dd").format(nextYear));
	 
		for(int i=1;i<=noOfAdult;i++)
		{
			adultMember=new AdultMember();
			adultMember.setAdultHeight(Integer.parseInt(request.getParameter(i+"adultHeight")));
			adultMember.setAdultWeight(Integer.parseInt(request.getParameter(i+"adultWeight")));
			adultMember.setAdultFirstName(request.getParameter(i+"adultFirstName"));
			adultMember.setAdultMiddleName(request.getParameter(i+"adultMiddleName"));
			adultMember.setAdultLastName(request.getParameter(i+"adultLastName"));
			adultMember.setAdultGender(request.getParameter(i+"adultGender"));
			adultMember.setProposerRelation(request.getParameter(i+"proposerRelation"));
			adultMember.setAdultOccupation(request.getParameter(i+"adultOccupation"));
			adultMember.setAdultDob(request.getParameter(i+"adultDob"));
			adultMember.setInsuRegistrationId(0);
			adultMember.setInt1(Integer.parseInt(request.getParameter(i+"status")));//socialstatus
			adultMember.setInt2(0);
			adultMember.setString1("1");
			adultMember.setString2("1");
			adultMember.setDelStatus(0);
			adultMember.setPolicyNo(0);
		    adultMemberList.add(adultMember);	
		}
		
		
		
		if(noOfChild>0) {
			
			for(int i=1;i<=noOfChild;i++)
			{
				childMemberDetails=new ChildMemberDetails();
				childMemberDetails.setHeight(Integer.parseInt(request.getParameter(i+"height")));
				childMemberDetails.setWeight(Integer.parseInt(request.getParameter(i+"weight")));
				
				childMemberDetails.setChildFname(request.getParameter(i+"childFname"));
				childMemberDetails.setChildMname(request.getParameter(i+"childMname"));
				childMemberDetails.setChildLname(request.getParameter(i+"childLname"));
				childMemberDetails.setGender(request.getParameter(i+"gender"));
				
				childMemberDetails.setRelationWithProposer(request.getParameter(i+"relationWithProposer"));
				childMemberDetails.setDob(request.getParameter(i+"dob"));
				childMemberDetails.setInsuRegId(0);
				childMemberDetails.setInt1(Integer.parseInt(request.getParameter(i+"status")));//socialstatus
				
				childMemberDetails.setInt2(0);
				childMemberDetails.setString1("1");
				childMemberDetails.setString2("1");
				childMemberDetails.setDelStatus(0);
				childMemberDetails.setPolicyNo(0);
				childMemberDetailsList.add(childMemberDetails);	
			}
			
			
		}
		
		ModelAndView model = new ModelAndView("insurance/confirmPage");

		model.addObject("proposerDetails",proposerDetails);
		
		
		model.addObject("adultMemberList",adultMemberList);
		
		model.addObject("childMemberDetailsList",childMemberDetailsList);
		
		return model;
		
	}
	/*@RequestMapping(value = "/showConfirmPage", method = RequestMethod.GET)

	public ModelAndView showConfirmPage(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView model = new ModelAndView("insurance/confirmPage");

		model.addObject("proposerDetails",proposerDetails);
		
		
		model.addObject("adultMemberList",adultMemberList);
		
		model.addObject("childMemberDetailsList",childMemberDetailsList);
		
		return model;
	}*/
	
	@RequestMapping(value = "/showCheckOutpage", method = RequestMethod.POST)

	public ModelAndView showCheckOutpage() {
		
		
MakePayment makePayment=new MakePayment();
		
		System.out.println("Responseeeeeeeeeeee  ");
		 RestTemplate rest=new RestTemplate();
		// proposerDetails.setAdultMemberList(adultMemberList);
		 //proposerDetails.setChildMemberDetailsList(childMemberDetailsList);
		 System.out.println("fhbrhfc:"+proposerDetails.toString());
		 
		 
		 makePayment.setCompanyName(companyName);
		 makePayment.setCover(proposerDetails.getCompanyId());
		 makePayment.setPremium(proposerDetails.getPremium());
		 
		 ModelAndView model = new ModelAndView("insurance/makePayment");
		 model.addObject("makePayment",makePayment);
			 
		return model;
		
		
		
	}
		
		
		@RequestMapping(value = "/submitInsuranceRegistrationDetails", method = RequestMethod.POST)

		public String submitInsuranceRegistrationDetails() {
		
		MakePayment makePayment=new MakePayment();
		
		System.out.println("Responseeeeeeeeeeee  ");
		 RestTemplate rest=new RestTemplate();
		 proposerDetails.setAdultMemberList(adultMemberList);
		 proposerDetails.setChildMemberDetailsList(childMemberDetailsList);
		 System.out.println("fhbrhfc:"+proposerDetails.toString());
		 makePayment= Constant.getRestTemplate().postForObject(Constant.url+"insertInsuranceRegistrationDetails", proposerDetails, MakePayment.class);
		 System.out.println("Response  "+makePayment.toString());
		 ModelAndView model = new ModelAndView("insurance/makePayment");
		 model.addObject("makePayment",makePayment);
			 
		return "redirect:/showBoughtInsuDetails";
		
	}
	
	@RequestMapping(value = "/showBoughtInsuDetails", method = RequestMethod.GET)

	public ModelAndView showBoughtInsuDetails(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("insurance/boughtInsuDetails");
		RestTemplate rest=new RestTemplate();
		List<MakePayment> makePaymentList=new ArrayList<MakePayment>();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		
		  HttpSession session = request.getSession();
			PatientDetails patientDetail=	(PatientDetails)session.getAttribute("patientDetails");
		    int familyId=patientDetail.getFamilyId(); 
		    map.add("familyId",familyId);
		makePaymentList= Constant.getRestTemplate().postForObject(Constant.url+"getBoughtInsuDetails",map,List.class);
		System.out.println("makePaymentList "+makePaymentList.toString());
		model.addObject("makePaymentList",makePaymentList);
		
		return model;
	}
	

	@RequestMapping(value="/showInsuranceDetailsAfterBuy/{insuRegId}", method=RequestMethod.GET)

	public @ResponseBody ModelAndView showInsuranceDetailsAfterBuy(@PathVariable("insuRegId") int insuRegId, HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("insurance/insuranceDetails");
		
	   /*int insuRegId = Integer.parseInt(request.getParameter("insuRegId"));*/
		//int insuRegId=1;
		RestTemplate rest=new RestTemplate();	
		GetboughtInsuranceDetails getInsuranceDetailsPolicyAfterBuy=new GetboughtInsuranceDetails();		
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("insuRegId",insuRegId);
			
		try {
			getInsuranceDetailsPolicyAfterBuy=Constant.getRestTemplate().postForObject(Constant.url+"/getBoughtInsuDetailsByAppId",map,GetboughtInsuranceDetails.class);
		
		System.out.println("GetInsuranceDetailsPolicyAfterBuyList:"+getInsuranceDetailsPolicyAfterBuy.toString());
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
		model.addObject("getInsuranceDetailsPolicyAfterBuy", getInsuranceDetailsPolicyAfterBuy);
		
 		return model;
	}
		
GetCompareInsuranceComapnyList getCompareInsuranceComapnyList=new GetCompareInsuranceComapnyList();
	
	@RequestMapping(value = "/getComparePolicy", method = RequestMethod.GET)
	public @ResponseBody List<GetCompareInsuranceComapny>getComparePolicy(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("In Ajax");
		
		  String  cover=request.getParameter("cover");
		 String companyId=request.getParameter("companyId");
		 String premium=request.getParameter("premium");
	 
		  
		 cover=cover.substring(1, cover.length()-1);
		 cover=cover.replaceAll("\"", "");
		 
		 companyId=companyId.substring(1, companyId.length()-1);
		 companyId=companyId.replaceAll("\"", "");
		 
		 premium=premium.substring(1, premium.length()-1);
		 premium=premium.replaceAll("\"", "");
		  
			List<GetCompareInsuranceComapny> getCompareInsuranceComapnyList=new ArrayList<>();
		  
		  System.out.println(cover);
		  System.out.println(companyId);
		 
	//	GetCompareInsuranceComapny getCompareInsuranceComapny=new GetCompareInsuranceComapny();
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();		 
		 map.add("companyId", companyId); 
		map.add("cover",cover);
		map.add("premium",premium);
		
		System.out.println("sucess");	
		
		
		try {
			RestTemplate rest=new RestTemplate();
			 
			getCompareInsuranceComapnyList = Constant.getRestTemplate().postForObject(Constant.url + "/getAllCompareInsuranceComapny", map, List.class);
			
			System.out.println("sucess1");
			System.out.println(getCompareInsuranceComapnyList.toString());
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return getCompareInsuranceComapnyList;
		
		
		
	}
}
