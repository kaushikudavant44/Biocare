package com.bionische.biocare.patient.controller;

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
import com.bionische.biocare.ewallet.model.GetWalletTransactionDetails;
import com.bionische.biocare.ewallet.model.UserWalletDetails;
import com.bionische.biocare.patient.model.PatientDetails;
@Scope("session")
@Controller
public class PatientWalletController {

	public final Log LOGGER = LogFactory.getLog(PatientWalletController.class);
	
	RestTemplate rest=new RestTemplate();
	
	
	@RequestMapping(value="/showPatientEWallet", method=RequestMethod.GET)
	public ModelAndView showPatientEWallet(HttpServletRequest request)
	{
		 
		
		ModelAndView model=new ModelAndView("patient/wallet");
		
		List<GetWalletTransactionDetails> getWalletTransactionDetailsList=new ArrayList<GetWalletTransactionDetails>();
		UserWalletDetails userWalletDetails=new UserWalletDetails();
		float totalBalance=0;
		try {
			
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
			
			HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			
			map.add("userType", 2);
			map.add("userId", patientDetails.getPatientId());
			userWalletDetails=rest.postForObject(Constant.url+"getUserWalletDetails",  map, UserWalletDetails.class);	
			totalBalance=userWalletDetails.getPromoBalance()+userWalletDetails.getBalance();
			getWalletTransactionDetailsList=rest.postForObject(Constant.url+"getUserLatestTransactionDetails", map, List.class);
		}
catch (Exception e) {
			
			LOGGER.error("Error showPatientEWallet.",e);
			throw new RuntimeException("Error while showPatientEWallet.",e);
		}
		
		
		model.addObject("getWalletTransactionDetailsList", getWalletTransactionDetailsList);
		model.addObject("userWalletDetails", userWalletDetails);		
		model.addObject("totalBalance", totalBalance);
			
		return model;
		
	}	
	
}
