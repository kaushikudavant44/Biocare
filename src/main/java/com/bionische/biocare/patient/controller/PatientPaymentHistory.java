package com.bionische.biocare.patient.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.model.GetConsultingPaymentDetails;
import com.bionische.biocare.model.GetLabPaymentDetails;
import com.bionische.biocare.model.GetPharmacyPaymentDetails;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.PatientSuscriptionDetails;
@Scope("session")
@Controller
public class PatientPaymentHistory {

	
	@RequestMapping(value = "/showPatientPaymentHistory", method = RequestMethod.GET)

	public String showPatientConsultingPaymentHistory(HttpServletRequest request, Model model) {
		 
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("familyId", "" + patientDetail.getFamilyId());
		ParameterizedTypeReference<List<PatientDetails>> typeRef = new ParameterizedTypeReference<List<PatientDetails>>() {
		};
		ResponseEntity<List<PatientDetails>> responseEntity = Constant.getRestTemplate().exchange(
				Constant.url + "getPatientFamilyMembersList", HttpMethod.POST,
				new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

		List<PatientDetails> patientDetailList = responseEntity.getBody();
		model.addAttribute("patientDetailList",patientDetailList);
		
		return "patient/payment_history/payment_history";

	}
	
	@RequestMapping(value = "/getPatientSubscriptionPaymentDetailsByPatientId", method = RequestMethod.GET)
	public @ResponseBody PatientSuscriptionDetails getPatientSubscriptionPaymentDetailsByPatientId(HttpServletRequest request,
			HttpServletResponse response) {
		
	 
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		PatientSuscriptionDetails patientSuscriptionDetails=new PatientSuscriptionDetails();
try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 
			map.add("patientId", patientId);
			patientSuscriptionDetails	 =Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getPatientSubscriptionPaymentDetailsByPatientId", map, PatientSuscriptionDetails.class);
System.out.println("patientSuscriptionDetails "+patientSuscriptionDetails.toString());
}
catch (Exception e) {
	System.out.println(e.getMessage());// TODO: handle exception
}
return patientSuscriptionDetails;
		
	}
	
	@RequestMapping(value = "/getConsultingPaymentDetailsByPatientId", method = RequestMethod.GET)
	public @ResponseBody List<GetConsultingPaymentDetails> getConsultingPaymentDetailsByPatientId(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		List<GetConsultingPaymentDetails> getConsultingPaymentDetailsList=new ArrayList<GetConsultingPaymentDetails>();
try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", fromDate);
			map.add("toDate", toDate+" 23:59:59");
			map.add("patientId", patientId);
			getConsultingPaymentDetailsList	 =Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getConsultingPaymentDetailsByPatientId", map, List.class);
		 
}

catch (Exception e) {
	System.out.println(e.getMessage());// TODO: handle exception
}
return getConsultingPaymentDetailsList;
		
	}
	
	 
	
	@RequestMapping(value = "/getLabPaymentDetailsByPatientId", method = RequestMethod.GET)
	public @ResponseBody List<GetLabPaymentDetails> getLabPaymentDetailsByPatientId(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		List<GetLabPaymentDetails> getLabPaymentDetailsList=new ArrayList<GetLabPaymentDetails>();
try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", fromDate);
			map.add("toDate", toDate+" 23:59:59");
			map.add("patientId", patientId);
			getLabPaymentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getLabReportsPaymentDetailsByPatientId", map, List.class);
		 System.out.println("getLabPaymentDetailsList "+getLabPaymentDetailsList.toString());
}
catch (Exception e) {
	System.out.println(e.getMessage());// TODO: handle exception
}
return getLabPaymentDetailsList;
		
	}
	
 
	
	
	@RequestMapping(value = "/getPharmacyPaymentDetailsByPatientId", method = RequestMethod.GET)
	public @ResponseBody List<GetPharmacyPaymentDetails> getPharmacyPaymentDetailsByPatientId(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
		int patientId=Integer.parseInt(request.getParameter("patientId"));
		List<GetPharmacyPaymentDetails> getPharmacyPaymentDetails=new ArrayList<GetPharmacyPaymentDetails>();
try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", fromDate);
			map.add("toDate", toDate+" 23:59:59");
			map.add("patientId", patientId);
			getPharmacyPaymentDetails=Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/gePharmacysPaymentDetailsByPatientId", map, List.class);
		 System.out.println("getPharmacyPaymentDetails "+getPharmacyPaymentDetails.toString());
}
catch (Exception e) {
	System.out.println(e.getMessage());// TODO: handle exception
}
return getPharmacyPaymentDetails;
		
	}
	
}
