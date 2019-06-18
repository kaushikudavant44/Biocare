package com.bionische.biocare.lab.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.ewallet.model.TransactionWalletDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.radiology.controller.PNDTPatientDetailsController;
import com.bionische.biocare.radiology.model.PNDTPatientDetails;

@Scope("session")
@Controller
public class PndtAutoLoginAndFillForm7 {

	
	
	
	
	@RequestMapping(value = "/getPndtPatientDetailsForUploadData/{patientId}", method = RequestMethod.GET)
	public ModelAndView getPndtPatientDetailsForUploadData(HttpServletRequest request,@PathVariable("patientId") int patientId) throws InterruptedException {
	
		ModelAndView model=new ModelAndView("lab/pndtPage");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientId);

		PNDTPatientDetails pndtPatientDetails = new PNDTPatientDetails();

		pndtPatientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPndtPatientDetails", map,
				PNDTPatientDetails.class);
		
		//new UploadPndtDataOnGovSite().uploadData(pndtPatientDetails);
		
		model.addObject("pndtPatientDetails",pndtPatientDetails);
		
		return model;
		
		
	}
	
	
}
