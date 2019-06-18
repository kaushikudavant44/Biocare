package com.bionische.biocare.doctor.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.ewallet.model.GetWalletTransactionDetails;
import com.bionische.biocare.ewallet.model.UserWalletDetails;
@Scope("session")
@Controller
public class DoctorWalletController {

	  
	
	RestTemplate rest=new RestTemplate();
	public final Log LOGGER = LogFactory.getLog(DoctorWalletController.class);
	 
	@RequestMapping(value="/showDoctorEWallet", method=RequestMethod.GET)
	public ModelAndView showDoctorEWallet(HttpServletRequest request)
	{
		 
		
		ModelAndView model=new ModelAndView("doctor/wallet");
		
		List<GetWalletTransactionDetails> getWalletTransactionDetailsList=new ArrayList<GetWalletTransactionDetails>();
		UserWalletDetails userWalletDetails=new UserWalletDetails();
		float totalBalance=0;
		try {
			
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			
			HttpSession session = request.getSession();
			DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
			
			map.add("userType", 1);
			map.add("userId", doctorDetails.getDoctorId());
			userWalletDetails=Constant.getRestTemplate().postForObject(Constant.url+"getUserWalletDetails",  map, UserWalletDetails.class);	
			totalBalance=userWalletDetails.getPromoBalance()+userWalletDetails.getBalance();
			getWalletTransactionDetailsList=Constant.getRestTemplate().postForObject(Constant.url+"getUserLatestTransactionDetails", map, List.class);
		
		}
		catch (Exception e) {
			
			LOGGER.error("Error while showing doctor wallet in showDoctorEWallet",e);
			throw new RuntimeException("Error while showing doctor wallet in showDoctorEWallet",e);
			
		}
		
		model.addObject("getWalletTransactionDetailsList", getWalletTransactionDetailsList);
		model.addObject("userWalletDetails", userWalletDetails);
		
		model.addObject("totalBalance", totalBalance);
		
		
		return model;
		
	}	
	
}
