package com.bionische.biocare.doctor.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.DoctorSubscriptionDetails;
import com.bionische.biocare.model.GetConsultingPaymentDetails;
@Scope("session")
@Controller
public class DoctorPaymentHistory {

	
	@RequestMapping(value = "/showDoctorPaymentHistory", method = RequestMethod.GET)

	public String showDoctorPaymentHistory(HttpServletRequest request, Model model) {
		 
		
		 
		
		return "doctor/doctor_payment_history";


	}
	
	@RequestMapping(value = "/getDoctorSubscriptionPaymentDetailsByDoctorId", method = RequestMethod.GET)
	public @ResponseBody List<DoctorSubscriptionDetails> getDoctorSubscriptionPaymentDetailsByDoctorId(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		List<DoctorSubscriptionDetails> doctorSubscriptionDetailsList=new ArrayList<DoctorSubscriptionDetails>();
try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", fromDate);
			map.add("toDate", toDate+" 23:59:59");
			map.add("doctorId",  doctorDetails.getDoctorId());
			doctorSubscriptionDetailsList	 =Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getDoctorSubscriptionPaymentDetailsByDoctorId", map, List.class);
		 
}
catch (Exception e) {
	System.out.println(e.getMessage());// TODO: handle exception
}
return doctorSubscriptionDetailsList;
		
	}
	
	@RequestMapping(value = "/getConsultingPaymentDetailsByDoctorId", method = RequestMethod.GET)
	public @ResponseBody List<GetConsultingPaymentDetails> getConsultingPaymentDetailsByDoctorId(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		List<GetConsultingPaymentDetails> getConsultingPaymentDetailsList=new ArrayList<GetConsultingPaymentDetails>();
try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", fromDate);
			map.add("toDate", toDate+" 23:59:59");
			map.add("doctorId", doctorDetails.getDoctorId());
			getConsultingPaymentDetailsList	 =Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getConsultingPaymentDetailsByDoctorId", map, List.class);
		 
}
catch (Exception e) {
	System.out.println(e.getMessage());// TODO: handle exception
}
return getConsultingPaymentDetailsList;
		
	}
	
}
