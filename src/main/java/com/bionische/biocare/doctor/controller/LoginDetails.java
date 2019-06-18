package com.bionische.biocare.doctor.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.DoctorNotification;
import com.bionische.biocare.doctor.model.GetDoctorProfile;


@Controller
public class LoginDetails {

	public final Log LOGGER = LogFactory.getLog(LoginDetails.class);
	
	 
	/*
	@RequestMapping(value = "/doctorLoginProcess2", method = RequestMethod.GET)
	public @ResponseBody Info patientLoginProcess(HttpServletRequest request, HttpServletResponse response) {
     
	 String userName=request.getParameter("userName");
	// String password=request.getParameter("password");
	// String returnUrl="w";
	 Info info1=new Info();
	
	  HttpSession session = request.getSession();
	
	  //DoctorLogin doctorLogin=new DoctorLogin();
		
			//RestTemplate rest=new RestTemplate();
			//MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			try {
			///	System.out.println("userName : "+userName);
				//map.add("userName", userName);
				//map.add("password", password);
				
				//doctorLogin=rest.postForObject(Constant.url+"doctorLoginProcess", map, DoctorLogin.class);
				//System.out.println("vfvd"+doctorLogin.toString());
			
					

					if(session.getAttribute(userName)!=null)
					{
					   response.sendRedirect("/showDoctorLoginPage");
					}
					else {
						response.sendRedirect("/showDoctorHomePage");
						
						
					}
					session.setAttribute("doctorDetails", doctorLogin.getDoctorDetails());
					System.out.println("Khau chi pend"+doctorLogin.getDoctorDetails().getSpecId());
					
					if(doctorLogin.getDoctorDetails().getSpecId()!=0)
					{
						
					 
					
					 if(doctorLogin.getDoctorDetails().getSpecId()==7)
					 {
						
						 returnUrl=new String("showPndtPatientDetails");
						 info1.setError(false);
						 info1.setMessage("gotoradiologisthomepage");
					 }
					 else {
					returnUrl=new String("showDoctorHomePage");
					info1.setError(false);
					info1.setMessage("showDoctorHomePage");
					 
					 }
					}
					else
					{
						
						 returnUrl=new String("showUpadateDoctorProfile");
						 info1.setError(false);
						 info1.setMessage("showUpdateDoctorProfile");
					}
					
				}
				else {
					info1.setError(true);
					info1.setMessage("wrong");				
					}
			 
				
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
	return info1;

	
}*/
}
