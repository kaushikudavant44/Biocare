package com.bionische.biocare.pharmacy.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.doctor.controller.DoctorController;
import com.bionische.biocare.ewallet.model.TransactionWalletDetails;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.model.GetPharmacyPaymentDetails;
import com.bionische.biocare.pharmacy.model.MedicalDetails;
import com.bionische.biocare.pharmacy.model.PharmacySubscriptionDetails;
@Scope("session")
@Controller
public class PharmacyPaymentController {

	public final Log LOGGER = LogFactory.getLog(PharmacyPaymentController.class);
	int packageId;
	int durationType;
	int duration;
	int offerId;
	float packageAmt;
	@RequestMapping(value = "/pharmacySuscriptionPaymentCheckout", method = RequestMethod.POST)

	public String patientSuscriptionPaymentCheckout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		HttpSession session = request.getSession();
		
		MedicalDetails medicalDetails;
		
		medicalDetails = (MedicalDetails) session.getAttribute("tempDetails");
	
		
		if(medicalDetails==null) {

			session.setAttribute("tempDetails",session.getAttribute("medicalDetails"));
			medicalDetails = (MedicalDetails) session.getAttribute("tempDetails");
		
		}
	
		
		
		MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
		map1.add("userId", medicalDetails.getMedicalId());

		TransactionWalletDetails transactionWalletDetails = new TransactionWalletDetails();

		transactionWalletDetails = Constant.getRestTemplate().postForObject(Constant.url + "findByUserId", map1,
				TransactionWalletDetails.class);
		
		packageAmt = Float.parseFloat(request.getParameter("packageAmt"));
		offerId=Integer.parseInt(request.getParameter("offerId"));
		float totalAmt = Float.parseFloat(request.getParameter("amount"));
		duration=Integer.parseInt(request.getParameter("duration"));
		durationType=Integer.parseInt(request.getParameter("durationType"));
		packageId=Integer.parseInt(request.getParameter("packageId"));
		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		String orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		
		if (DoctorController.referalDetails != null) {
			totalAmt = totalAmt - Constant.referalAmount;
		}
		
		model.addAttribute("orderId", orderId);
		model.addAttribute("amount", totalAmt);

		return "pharmacy/pharmacy_suscription_payment/pharmacyPaymentCheckout";

	}

	@RequestMapping(value = "/pharmacySuscriptionPaymentGateway", method = RequestMethod.POST)
	public String patientSuscriptionPaymentGateway(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

		 
		request.setAttribute("responseUrl", Constant.PHARMACY_SUSCRIPTION_PAYMENT_RESPONSE_URL);

		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("tempDetails");

		request.setAttribute("mobileNo", medicalDetails.getContact());
		request.setAttribute("email", medicalDetails.getEmail());

		return "pharmacy/pharmacy_suscription_payment/pharmacyPaymentRedirect";
	}
	@RequestMapping(value = "/pharmacySuscriptionPaymentResponse", method = RequestMethod.POST)
	public String patientSuscriptionPaymentResponse(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediecting to response");
		
		
		
		model.addAttribute("packageId",packageId);
	 
		return "pharmacy/pharmacy_suscription_payment/pharmacyPaymentResponse";
	}

	

@RequestMapping(value = "/savePharmacyDetailsAndPayment", method = RequestMethod.GET)
public String savePharmacyDetailsAndPayment(HttpServletRequest request) {
	LOGGER.info("Update the payment info");
	 HttpSession session = request.getSession();
		MedicalDetails medicalDetails=	(MedicalDetails)session.getAttribute("tempDetails");
		session.setAttribute("medicalDetails",medicalDetails);
		PharmacySubscriptionDetails pharmacySubscriptionDetails=new PharmacySubscriptionDetails();
		
		pharmacySubscriptionDetails.setAmount(Float.parseFloat(request.getParameter("txnAmt")));
		pharmacySubscriptionDetails.setPackageId(packageId);
		pharmacySubscriptionDetails.setMedicalId(medicalDetails.getMedicalId());
		pharmacySubscriptionDetails.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pharmacySubscriptionDetails.setOrderId(request.getParameter("orderId"));
		pharmacySubscriptionDetails.setTxnId(request.getParameter("txnId"));
		pharmacySubscriptionDetails.setTxnStatus(Integer.parseInt(request.getParameter("txnStatus")));
		pharmacySubscriptionDetails.setOfferId(offerId);
		pharmacySubscriptionDetails.setPackageAmt(packageAmt);
		if(durationType==0)
		{
			pharmacySubscriptionDetails.setPackageExpDate(DateConverter.addDaysInDate(new Date(),duration));
		}else {
			pharmacySubscriptionDetails.setPackageExpDate(DateConverter.addMonthInDate(new Date(),duration));
		}
		
	try {
		
		
		
		PharmacySubscriptionDetails pharmacySubscriptionDetailsRes=Constant.getRestTemplate().postForObject(Constant.url+"insertPharmacySuscriptionDetails",pharmacySubscriptionDetails,PharmacySubscriptionDetails.class);
		
		PharmacyController.pharmacySubscriptionExpiryDate=pharmacySubscriptionDetailsRes.getPackageExpDate();
		
		
		
		if(pharmacySubscriptionDetailsRes!=null) {
			if (DoctorController.referalDetails != null) {
				return "redirect:/updateWalletAndTransactions/"+medicalDetails.getMedicalId()+"/"+3;
			}
		}
		
	
	} catch (Exception e) {
		// TODO: handle exception
		LOGGER.error("Error while save Pharmacy payment details",e);
		throw new RuntimeException("Error while save Pharmacy payment details",e);
	}
	return "redirect:/showPharmacyLoginPage";
	
}
@RequestMapping(value = "/showPharmacyPaymentHistory", method = RequestMethod.GET)

public String showPharmacyPaymentHistory(HttpServletRequest request, Model model) {
	 
	return "pharmacy/pharmacy_payment_history";

}

@RequestMapping(value = "/getPharmacySubscriptionPaymentDetailsByMedicalId", method = RequestMethod.GET)
public @ResponseBody List<PharmacySubscriptionDetails> getPharmacySubscriptionPaymentDetailsByMedicalId(HttpServletRequest request,
		HttpServletResponse response) {
	
	String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
	String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
	 
	 HttpSession session = request.getSession();
		MedicalDetails medicalDetails=	(MedicalDetails)session.getAttribute("medicalDetails");

		
	List<PharmacySubscriptionDetails> pharmacySubscriptionDetailsList=new ArrayList<PharmacySubscriptionDetails>();
try {
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("fromDate", fromDate);
		map.add("toDate", toDate+" 23:59:59");
		map.add("medicalId", medicalDetails.getMedicalId());
		pharmacySubscriptionDetailsList	 =Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/getPharmacySubscriptionPaymentDetailsByMedicalId", map, List.class);
	 
}
catch (Exception e) {
System.out.println(e.getMessage());// TODO: handle exception
}
return pharmacySubscriptionDetailsList;
	
}

@RequestMapping(value = "/getPharmacyPaymentDetailsByMedicalId", method = RequestMethod.GET)
public @ResponseBody List<GetPharmacyPaymentDetails> getPharmacyPaymentDetailsByMedicalId(HttpServletRequest request,
		HttpServletResponse response) {
	
	String fromDate =DateConverter.convertToYMD(request.getParameter("fromDate"));
	String toDate =DateConverter.convertToYMD(request.getParameter("toDate"));
 
	
	 HttpSession session = request.getSession();
		MedicalDetails medicalDetails=	(MedicalDetails)session.getAttribute("medicalDetails");

		
	List<GetPharmacyPaymentDetails> getPharmacyPaymentDetailsList=new ArrayList<GetPharmacyPaymentDetails>();
try {
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("fromDate", fromDate);
		map.add("toDate", toDate+" 23:59:59");
		map.add("medicalId", medicalDetails.getMedicalId());
		getPharmacyPaymentDetailsList=Constant.getRestTemplate().postForObject(Constant.url + "paymentDetails/gePharmacysPaymentDetailsByMedicalId", map, List.class);
	 System.out.println("getPharmacyPaymentDetailsList "+getPharmacyPaymentDetailsList.toString());
}
catch (Exception e) {
System.out.println(e.getMessage());// TODO: handle exception
}
return getPharmacyPaymentDetailsList;
	
}

}
