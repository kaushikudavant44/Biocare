package com.bionische.biocare.lab.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.controller.DoctorController;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.ewallet.model.TransactionWalletDetails;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.GetLabBillDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.lab.model.LabSubscriptionDetails;
import com.bionische.biocare.model.GetLabPaymentDetails;
@Scope("session")
@Controller
public class LabPaymentController {

	public final Log LOGGER = LogFactory.getLog(LabPaymentController.class);
	int packageId;
	int duration;
	int durationType;
	 int offerId;
	 float packageAmt;
	 
	@RequestMapping(value = "/labSuscriptionPaymentCheckout", method = RequestMethod.POST)

	public String patientSuscriptionPaymentCheckout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		HttpSession session = request.getSession();
		
		LabDetails labDetails ;
		
		 labDetails = (LabDetails) session.getAttribute("tempDetails");
		
		if(labDetails==null) {
			
			System.out.println("Inside if");
			session.setAttribute("tempDetails",session.getAttribute("labDetails"));
			labDetails = (LabDetails) session.getAttribute("tempDetails");
		}
		
		
		
		MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
		map1.add("userId", labDetails.getLabId());

		TransactionWalletDetails transactionWalletDetails = new TransactionWalletDetails();

		transactionWalletDetails = Constant.getRestTemplate().postForObject(Constant.url + "findByUserId", map1,
				TransactionWalletDetails.class);
		
		float totalAmt = Float.parseFloat(request.getParameter("amount"));
		packageAmt=Float.parseFloat(request.getParameter("packageAmt"));
		offerId=Integer.parseInt(request.getParameter("offerId"));
		packageId=Integer.parseInt(request.getParameter("packageId"));
		duration=Integer.parseInt(request.getParameter("duration"));
		durationType=Integer.parseInt(request.getParameter("durationType"));
		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		String orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		
		if (DoctorController.referalDetails != null) {
			totalAmt = totalAmt - Constant.referalAmount;
		}
		
		model.addAttribute("orderId", orderId);
		model.addAttribute("amount", totalAmt);

		return "lab/lab_suscription_payment/labPaymentCheckout";

	}

	@RequestMapping(value = "/labSuscriptionPaymentGateway", method = RequestMethod.POST)
	public String patientSuscriptionPaymentGateway(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

		 
		request.setAttribute("responseUrl", Constant.LAB_SUSCRIPTION_PAYMENT_RESPONSE_URL);

		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("tempDetails");

		request.setAttribute("mobileNo", labDetails.getContact());
		request.setAttribute("email", labDetails.getEmail());

		return "lab/lab_suscription_payment/labPaymentRedirect";
	}
	@RequestMapping(value = "/labSuscriptionPaymentResponse", method = RequestMethod.POST)
	public String patientSuscriptionPaymentResponse(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediecting to response");
		
		
		
		model.addAttribute("packageId",packageId);
	 
		return "lab/lab_suscription_payment/labPaymentResponse";
	}

	 

@RequestMapping(value = "/saveLabDetailsAndPayment", method = RequestMethod.GET)
public String saveLabDetailsAndPayment(HttpServletRequest request) {
	LOGGER.info("Update the payment info");
	 HttpSession session = request.getSession();
		LabDetails labDetails=	(LabDetails)session.getAttribute("tempDetails");
		session.setAttribute("labDetails", labDetails);
		LabSubscriptionDetails labSuscriptionDetails=new LabSubscriptionDetails();
		
		labSuscriptionDetails.setAmount(Float.parseFloat(request.getParameter("txnAmt")));
		labSuscriptionDetails.setPackageId(packageId);
		labSuscriptionDetails.setLabId(labDetails.getLabId());
		labSuscriptionDetails.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		labSuscriptionDetails.setOrderId(request.getParameter("orderId"));
		labSuscriptionDetails.setTxnId(request.getParameter("txnId"));
		labSuscriptionDetails.setTxnStatus(Integer.parseInt(request.getParameter("txnStatus")));
		labSuscriptionDetails.setOfferId(offerId);
		labSuscriptionDetails.setPackageAmt(packageAmt);
		if(durationType==0)
		{
			labSuscriptionDetails.setPackageExpDate(DateConverter.addDaysInDate(new Date(),duration));
		}else {
			labSuscriptionDetails.setPackageExpDate(DateConverter.addMonthInDate(new Date(),duration));
		}
		
	 
	try {
		LabSubscriptionDetails labSubscriptionDetails=Constant.getRestTemplate().postForObject(Constant.url+"insertLabSuscriptionDetails",labSuscriptionDetails,LabSubscriptionDetails.class);
	
		LabController.labSubscriptionExpiryDate=labSubscriptionDetails.getPackageExpDate();
	
		
		
		
		if(labSubscriptionDetails!=null) {
		if (DoctorController.referalDetails != null) {
			return "redirect:/updateWalletAndTransactions/"+labDetails.getLabId()+"/"+2;
		} 
		}
	} catch (Exception e) {
		// TODO: handle exception
		LOGGER.error("Error while save lab payment details",e);
		throw new RuntimeException("Error while save lab payment details",e);
	}
	return "redirect:/showLabLoginPage";
	
}



@RequestMapping(value = "/showLabPaymentHistory", method = RequestMethod.GET)

public String showLabPaymentHistory(HttpServletRequest request, Model model) {
	 
	
	 
	
	return "lab/lab_payment_history";

}
@RequestMapping(value = "/getLabSubscriptionPaymentDetailsByLabId", method = RequestMethod.GET)
public @ResponseBody List<LabSubscriptionDetails> getLabSubscriptionPaymentDetailsByLabId(HttpServletRequest request,
		HttpServletResponse response) {
	
	String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
	String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));

	HttpSession session = request.getSession();
	LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
	
	
	List<LabSubscriptionDetails> labSubscriptionDetailsList=new ArrayList<LabSubscriptionDetails>();
try {
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("fromDate", fromDate);
		map.add("toDate", toDate+" 23:59:59");
		map.add("labId", labDetails.getLabId());
		labSubscriptionDetailsList	 =Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getLabSubscriptionPaymentDetailsByLabId", map, List.class);
	 System.out.println(labSubscriptionDetailsList.toString());
}
catch (Exception e) {
System.out.println(e.getMessage());// TODO: handle exception
}
return labSubscriptionDetailsList;
	
}

@RequestMapping(value = "/getLabPaymentDetailsByLabId", method = RequestMethod.GET)
public @ResponseBody List<GetLabPaymentDetails> getLabPaymentDetailsByLabId(HttpServletRequest request,
		HttpServletResponse response) {
	
	String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
	String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));

	HttpSession session = request.getSession();
	LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
	
	
	List<GetLabPaymentDetails> getLabPaymentDetailsList=new ArrayList<GetLabPaymentDetails>();
try {
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("fromDate", fromDate);
		map.add("toDate", toDate+" 23:59:59");
		map.add("labId", labDetails.getLabId());
		getLabPaymentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getLabReportsPaymentDetailsByLabId", map, List.class);
	 System.out.println("getLabPaymentDetailsList "+getLabPaymentDetailsList.toString());
}
catch (Exception e) {
System.out.println(e.getMessage());// TODO: handle exception
}
return getLabPaymentDetailsList;
	
}

@RequestMapping(value = "/showLabBill/{id}", method = RequestMethod.GET)
public ModelAndView showLabBill(HttpServletRequest request,
	HttpServletResponse response,@PathVariable("id")int id) {
	ModelAndView model=new ModelAndView("lab/lab_bill");
	GetLabBillDetails getLabBillDetails=new GetLabBillDetails();
	HttpSession session = request.getSession();
	LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
try {
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("id", id);
		/*map.add("labId", labDetails.getLabId());*/
		getLabBillDetails=Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getLabTransactionDetailsById", map, GetLabBillDetails.class);
	 System.out.println("getLabBillDetails "+getLabBillDetails.toString());

	 model.addObject("getLabBillDetails", getLabBillDetails);
}
	catch (Exception e) {
		System.out.println(e.getMessage());// TODO: handle exception
}
	
	return model;

}

}
