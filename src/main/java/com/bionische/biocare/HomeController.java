package com.bionische.biocare;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
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
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.model.AdvertiseDetails;
import com.bionische.biocare.model.GetBlogs;
import com.bionische.biocare.model.GetUsersCount;
import com.bionische.biocare.model.UserQueryDetails;
import com.bionische.biocare.patient.model.City;
import com.bionische.biocare.patient.model.Country;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.patient.model.StateAndCityList;
import com.bionische.biocare.pharmacy.model.MedicalDetails;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	public static List<Country> countryList;
	List<City> cityList; 
	List<State> stateList;
	public String currentLocation;
	public static List<StateAndCityList> stateAndCityList;
	static GetUsersCount getUsersCount;
	static int countryId=8;  //*****Hardcoded Country India  ==1
	String message;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	public static void getOnLoadData()
	{
		if(countryList==null || countryList.isEmpty())
		{
			countryList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllCountry",List.class);
			
			if(stateAndCityList==null || stateAndCityList.isEmpty())
			{
				MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
				map.add("countryId", countryId);
				ParameterizedTypeReference<List<StateAndCityList>> typeRef = new ParameterizedTypeReference<List<StateAndCityList>>() {
				};
				ResponseEntity<List<StateAndCityList>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getStatesAndCityByCountryId",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
				
			stateAndCityList = responseEntity.getBody();
			}
			
		}
	}
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String  webSite() {
		 
		return "home_redirect";
	}
	@RequestMapping(value = "/biocare", method = RequestMethod.GET)
	public String  biocare() {
		 
		
		 
		RestTemplate rest=new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("countryId", countryId);
		try {
			
if(stateAndCityList==null) {
			ParameterizedTypeReference<List<StateAndCityList>> typeRef = new ParameterizedTypeReference<List<StateAndCityList>>() {
			};
			ResponseEntity<List<StateAndCityList>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getStatesAndCityByCountryId",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			
		stateAndCityList = responseEntity.getBody();
}
	
		//HttpEntity<String> request = new HttpEntity<String>(Constant.getHeaders());
	 if(countryList==null)
		countryList = Constant.getRestTemplate().getForObject(Constant.url + "/getAllCountry",List.class);

		//System.out.println("Ganesh   " + response.getBody());
		//countryList=response.getBody();
		
		System.out.println("countryList"+countryList.toString());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return "redirect:/homePage";
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public ModelAndView  home(Locale locale, Model model) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		RestTemplate rest=new RestTemplate();
		ModelAndView modelHome=new ModelAndView("homePage");
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		try {
	//	HttpEntity<String> request = new HttpEntity<String>(Constant.getHeaders());
			if(getUsersCount==null)
		  getUsersCount = Constant.getRestTemplate().getForObject(Constant.url + "/getUserCounts", GetUsersCount.class);

		modelHome.addObject("getUsersCount", getUsersCount);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
       // countryList=Constant.getRestTemplate().getForObject(Constant.url+"getAllCountry",List.class);
		try{
			
	
		List<GetBlogs> getBlogsList = Constant.getRestTemplate().getForObject(Constant.url + "/blogs/getBlogsList", List.class);
	model.addAttribute("getBlogsList",getBlogsList);
	model.addAttribute("blogsUrl",Constant.BLOGS);
	List<AdvertiseDetails> advertiseDetailsList=  Constant.getRestTemplate().getForObject(Constant.url + "advertisement/getRandom10Ads", List.class);
	model.addAttribute("advertiseDetailsList",advertiseDetailsList);
	
	model.addAttribute("advertiseUrl",Constant.ADVERTISE);
		}
		catch (Exception e) {
			logger.error("/blogs/getBlogsList",e );
		}
		String formattedDate = dateFormat.format(date);
		model.addAttribute("message",message);
		model.addAttribute("serverTime", formattedDate );
		modelHome.addObject("countryList", countryList);
	//	System.out.println("chdcuyd"+stateAndCityList.toString());
		return modelHome;
	}
	 
	@RequestMapping(value = "/getOnloadCityByStateId", method = RequestMethod.GET)
	public @ResponseBody List<City> getOnloadCityByStateId(HttpServletRequest request,
			HttpServletResponse response)
	{
	 System.out.println("getOnloadCityByStateId");
	 try {
		List<City> cityList=new ArrayList<City>();
		 
		HttpSession session = request.getSession();
		PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		int stateId=patientDetails.getStateId();
		 
		/* 
		if(stateAndCityList==null) {
			stateAndCityList=new ArrayList<StateAndCityList>();
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			map.add("countryId", countryId);
			ParameterizedTypeReference<List<StateAndCityList>> typeRef = new ParameterizedTypeReference<List<StateAndCityList>>() {
			};
			ResponseEntity<List<StateAndCityList>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getStatesAndCityByCountryId",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			
		stateAndCityList = responseEntity.getBody();
		 
}
		
		
		for(int i=0;i<stateAndCityList.size();i++)
		{
			 
				if(stateAndCityList.get(i).getStateId()==stateId)
				{
				cityList=stateAndCityList.get(i).getCityList();
				}
				 
			
		}*/
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("stateId",stateId);
	   
	    cityList=Constant.getRestTemplate().postForObject(Constant.url+"getAllCityByStateId",map,List.class);
	 }
	 catch (Exception e) {
		System.out.println(e.getMessage());// TODO: handle exception
		e.printStackTrace();
	}
		return cityList;
	}

	@RequestMapping(value = "/getOnloadCity", method = RequestMethod.GET)
	public @ResponseBody List<City> getOnloadCity(HttpServletRequest request,
			HttpServletResponse response)
	{
	 System.out.println("getOnloadCity");
	 List<City> cityList=new ArrayList<City>();
	 try {
		
		  
		 
	 
		if(stateAndCityList==null) {
			stateAndCityList=new ArrayList<StateAndCityList>();
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			map.add("countryId", countryId);
			ParameterizedTypeReference<List<StateAndCityList>> typeRef = new ParameterizedTypeReference<List<StateAndCityList>>() {
			};
			ResponseEntity<List<StateAndCityList>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getStatesAndCityByCountryId",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			
		stateAndCityList = responseEntity.getBody();
		System.out.println("stateAndCityList  "+stateAndCityList.toString());
		 
}
		
		
		for(int i=0;i<stateAndCityList.size();i++)
		{
			 
			cityList.addAll(stateAndCityList.get(i).getCityList());
			 
				 
				 
			
		}
	 }
	 catch (Exception e) {
		System.out.println(e.getMessage());// TODO: handle exception
		 
		e.printStackTrace();
	}
	 System.out.println("cityList  "+cityList.toString());
		return cityList;
	}
	
	/*get all City by stateId*/

	@RequestMapping(value="/getCityByStateId", method=RequestMethod.GET)

	public @ResponseBody List getCityByStateId(HttpServletRequest request,HttpServletResponse response)
	{
		int stateId=Integer.parseInt(request.getParameter("stateId"));
		ModelAndView model=new ModelAndView("registration/doctorRegistration");
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("stateId",stateId);
	    RestTemplate rest=new RestTemplate();
		
	    cityList=Constant.getRestTemplate().postForObject(Constant.url+"getAllCityByStateId",map,List.class);
		
		System.out.println("cityList:"+cityList.toString());

		
		return cityList;
		
	}	


	/*retrieve state and country*/

	@RequestMapping(value="/getStateByCountryId", method=RequestMethod.GET)

	public @ResponseBody List getStateByCountryId(HttpServletRequest request,HttpServletResponse response) {

	int countryId=Integer.parseInt(request.getParameter("countryId"));
	System.out.println("countryId:"+countryId);

	RestTemplate rest=new RestTemplate();

	try {
		System.out.println("fgfyhasujik");
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("countryId",countryId);
		
		stateList=Constant.getRestTemplate().postForObject(Constant.url+"getAllStateByCountryId",map,List.class);
		
		System.out.println(stateList.toString());
		
	}
	catch (Exception e)
	{
		System.out.println(e);
	}

		return stateList;
		
}	 
	
	 @RequestMapping(value="/showProfilePasswordLogin", method=RequestMethod.GET)
		
		public String showProfilePasswordLogin(HttpServletRequest request,
				HttpServletResponse response)
		{
		 
		 return "profilePassword";
		}
	 
	 
	 @RequestMapping(value="/loginProfileProcess", method=RequestMethod.POST)
		
		public String loginProfileProcess(HttpServletRequest request,
				HttpServletResponse response, Model model)
		{
		 HttpSession session = request.getSession();
		 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 String password=request.getParameter("password");
		 String redirectUrl=request.getParameter("redirectUrl");
		 int userType=Integer.parseInt(request.getParameter("userType"));
		 if(userType==1) {
			 
		 }
		 else if(userType==2) {
			
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			 map.add("doctorId", doctorDetails.getDoctorId());
			 map.add("password",password);
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorProfilePassword", map, Info.class);
			if(info.isError()) {
			model.addAttribute("redirectUrl", "showDoctorHomePage");
			model.addAttribute("msg",info.getMessage());
				return "profilePassword";
			}
			else {
				info.setError(true);
				session.setAttribute("profilePassword", info);
			 return "redirect:/"+redirectUrl;
			}
		 }
		 
		 
		 model.addAttribute("msg","Failed to Profile Login");
		 return "profilePassword";
		}
	 
	 @RequestMapping(value="/exitProfile", method=RequestMethod.GET)
		
		public String exitProfile(HttpServletRequest request,
				HttpServletResponse response)
		{
		 HttpSession session = request.getSession();
		 session.removeAttribute("profilePassword");
		 return "redirect:/showViewDoctorAppointment";
		}
	@RequestMapping(value = "/logout/{userType}", method = RequestMethod.GET)
	public String logout(HttpSession session, @PathVariable("userType") int userType) {
		System.out.println("User Logout");

		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("userType", userType);
		if(userType==1)
		{
			DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
			map.add("userId", doctorDetails.getDoctorId());
		}
		else if(userType==2) {
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		map.add("userId", patientDetails.getPatientId());
		}
		else if(userType==3) {
		
		LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
		map.add("userId", labDetails.getLabId());
		}
		else if(userType==4) {
			MedicalDetails medicalDetails=	(MedicalDetails)session.getAttribute("medicalDetails");
			map.add("userId", medicalDetails.getMedicalId());
		}
		
		try {
			Info info=Constant.getRestTemplate().postForObject(Constant.url+"updateWebToken",map,Info.class);
		 
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		session.invalidate();
		return "redirect:/homePage";
	}
	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public String sessionTimeOut(HttpSession session) {
		System.out.println("User sessionTimeOut");
message="Your session timeout";
		session.invalidate();
		return "redirect:/homePage";
	}

	@RequestMapping(value = "/showAboutUs", method = RequestMethod.GET)
    public ModelAndView showAboutUs(HttpServletRequest request) {
        ModelAndView model=new ModelAndView("aboutus");
        
     
        return model;
    }
	
	
	@RequestMapping(value = "/submitContactUs", method = RequestMethod.GET)
    public @ResponseBody String submitContactUs(HttpServletRequest request) {
       
		String fullname =request.getParameter("fullname");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String message =request.getParameter("message");
		UserQueryDetails userQueryDetails=new UserQueryDetails();
		userQueryDetails.setEmail(email);
		userQueryDetails.setMessage(message);
		userQueryDetails.setName(fullname);
		userQueryDetails.setPhone(phone);
		userQueryDetails.setStatus(0);
		userQueryDetails.setGeneratedDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		try {
		Info info=Constant.getRestTemplate().postForObject(Constant.url+"insertUserQuery",userQueryDetails,Info.class);
		 return info.getMessage();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
        return "Problem in Server";
    }
	
	

	@RequestMapping(value = "/screenSharing", method = RequestMethod.GET)
    public ModelAndView screenSharing(HttpServletRequest request) {
        ModelAndView model=new ModelAndView("screensharing");
        
    
        return model;
    }
	
	
	
}
