package com.bionische.biocare.patient.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.controller.DoctorController;
import com.bionische.biocare.ewallet.model.WalletDetails;
import com.bionische.biocare.lab.model.LabAppointmentDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
@Scope("session")
@Controller
public class PatientPaymentController {

	public final Log LOGGER = LogFactory.getLog(PatientPaymentController.class);
	int txnTableId;
	int reportId;
	int requestToMedicalId;
	int appointId;
	String contactNo;
	String email;
	String backUrl;
	int packageId;
	float packageAmt;
	int offerId;
	float txnAmount;
	
	float totalMedicineAmount;
	
	float consultingAmount;
	public static WalletDetails walletDetails;
	
	LabAppointmentDetails labAppointmentDetails;
	
	@RequestMapping(value = "/labReportPaymentCheckout", method = RequestMethod.POST)

	public String labReportPaymentCheckout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		try {
			
			
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", patientDetail.getPatientId());
			map.add("userType", 1);
			walletDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);
			
			int appointmentId=Integer.parseInt(request.getParameter("appointmentId"));
			MultiValueMap<String, Object> mapAppoint = new LinkedMultiValueMap<String, Object>();
			mapAppoint.add("appointmentId", appointmentId);
			  
			labAppointmentDetails = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/getLabAppointmentDetailsByAppointmentId", mapAppoint, LabAppointmentDetails.class);
			float amount = labAppointmentDetails.getTotalAmount();
		
			if(walletDetails.getWalletAmount()<labAppointmentDetails.getTotalAmount()) {
				
				
				
				amount=labAppointmentDetails.getTotalAmount()-walletDetails.getWalletAmount();
				model.addAttribute("show", 0);
				txnAmount=amount;
				
			}else {
				
				//totalAmt=walletDetails.getWalletAmount()-totalAmt;
				model.addAttribute("show", 1);
				model.addAttribute("walletDetails", walletDetails);
			}
		 
			
			
			model.addAttribute("amount", amount);
			
 
		} catch (Exception e) {
			LOGGER.error("Error while geting Lab appointment", e);
			// TODO: handle exception
		}
		
		 
		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		String orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		model.addAttribute("orderId", orderId);
		 

		return "patient/lab_payment/labReportPaymentCheckout";

	}

	@RequestMapping(value = "/labReportPaymentGateway", method = RequestMethod.POST)
	public String labReportPaymentGateway(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

		// request.setAttribute("responseUrl",
		// "https://securegw.paytm.in/theia/paytmCallback?ORDER_ID="+request.getParameter("ORDER_ID"));
		request.setAttribute("responseUrl", Constant.LABREPORT_PAYMENT_RESPONSE_URL);

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");

		request.setAttribute("mobileNo", patientDetail.getContactNo());
		request.setAttribute("email", patientDetail.getEmail());
		request.setAttribute("txnAmount",  String.format("%.2f", txnAmount));
		return "patient/lab_payment/labReportPaymentRedirect";
	}

	@RequestMapping(value = "/labReportPaymentResponse", method = RequestMethod.POST)
	public String labReportPaymentResponse(Locale locale, Model model) {
		
		LOGGER.info("rediecting to response");
		model.addAttribute("walletAmount", walletDetails.getWalletAmount());
		return "patient/lab_payment/labReportPaymentResponse";
	}

	
	@RequestMapping(value = "/submitLabReportPayment", method = RequestMethod.GET)
	public @ResponseBody Info submitLabReportPayment(HttpServletRequest request) {
		LOGGER.info("Update the payment info");
		HttpSession session = request.getSession();
		
		String orderId = request.getParameter("orderId");
		float txnAmt = Float.parseFloat(request.getParameter("txnAmt"));
		String txnId = request.getParameter("txnId");
		int txnStatus = Integer.parseInt(request.getParameter("txnStatus"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		 
		map.add("txnStatus", txnStatus);
		map.add("txnId", txnId);
		map.add("orderId", orderId);
		map.add("txnAmt", txnAmt);
		map.add("appointmentId", labAppointmentDetails.getLabAppId());
		map.add("walletAmount", walletDetails.getWalletAmount());
		map.add("reportAmount", labAppointmentDetails.getTotalAmount());
		map.add("walletId", walletDetails.getWalletId());

		System.out.println(map.toString());
		System.out.println("txnId "+txnId+" orderId "+orderId);
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "lab/updateLabReportsPayment", map,
					Info.class);
			
			if(txnId.equals("0")) {
				return info;
			}
				
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while updateting lab report payment", e);
			throw new RuntimeException("Error while updateting lab report payment", e);
		}
		return null;
		
	}

	

	@RequestMapping(value = "/patientMedicinePaymentCheckout", method = RequestMethod.POST)

	public String patientMedicinePaymentCheckout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userId", patientDetail.getPatientId());
		map.add("userType", 1);
		walletDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);
		
		float totalAmt = Float.parseFloat(request.getParameter("totalAmt"));
		requestToMedicalId = Integer.parseInt(request.getParameter("requestToMedicalId"));
		
		 totalMedicineAmount=totalAmt;
		if(walletDetails.getWalletAmount()<totalAmt) {
						
			totalAmt=totalAmt-walletDetails.getWalletAmount();
			model.addAttribute("show", 0);
			txnAmount=totalAmt;
		}else {
			
			model.addAttribute("show", 1);
			model.addAttribute("walletDetails", walletDetails);
		}

		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		String orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		model.addAttribute("orderId", orderId);
		model.addAttribute("amount", totalAmt);

		return "patient/pharmacy_payment/patientMedicinePaymentCheckout";

	}

	@RequestMapping(value = "/patientMedicinePaymentGateway", method = RequestMethod.POST)
	public String patientMedicinePaymentGateway(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

		 
		request.setAttribute("responseUrl", Constant.PATIENTMEDICINE_PAYMENT_RESPONSE_URL);

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");

		request.setAttribute("mobileNo", patientDetail.getContactNo());
		request.setAttribute("email", patientDetail.getEmail());
		request.setAttribute("txnAmount",  String.format("%.2f", txnAmount));
		return "patient/pharmacy_payment/patientMedicinePaymentRedirect";
	}
	@RequestMapping(value = "/patientMedicinePaymentResponse", method = RequestMethod.POST)
	public String patientMedicinePaymentResponse(Locale locale, Model model) {
		LOGGER.info("rediecting to response");
		model.addAttribute("walletAmount", walletDetails.getWalletAmount());
		return "patient/pharmacy_payment/patientMedicinePaymentResponse";
	}

	
	@RequestMapping(value = "/submitPatientMedicinePayment", method = RequestMethod.GET)
	public @ResponseBody Info submitPatientMedicinePayment(HttpServletRequest request) {
		LOGGER.info("Update the payment info");
		HttpSession session = request.getSession();

		String orderId = request.getParameter("orderId");
		float txnAmt = Float.parseFloat(request.getParameter("txnAmt"));
		String txnId = request.getParameter("txnId");
		int txnStatus = Integer.parseInt(request.getParameter("txnStatus"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestToMedicalId", requestToMedicalId);
		map.add("txnStatus", txnStatus);
		map.add("txnId", txnId);
		map.add("orderId", orderId);
		map.add("txnAmt", txnAmt);
		map.add("totalMedicineAmount", totalMedicineAmount);
		map.add("walletAmount", walletDetails.getWalletAmount());
		
		map.add("walletId", walletDetails.getWalletId());
		  
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "updatePatientMedicinePayment", map,
					Info.class);
			if(txnId.equals("0")) {
				return info;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while updateting patient Medicine payment", e);
			throw new RuntimeException("Error while updateting patient Medicine payment", e);
		}
		return null;
	}
	
	@RequestMapping(value = "/consultingPaymentCheckout", method = RequestMethod.POST)

	public String consultingPaymentCheckout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("userId", patientDetail.getPatientId());
		map.add("userType", 1);
		walletDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getUserWalletDetails", map, WalletDetails.class);
		
		float totalAmt = Float.parseFloat(request.getParameter("totalAmt"));
		
		consultingAmount=totalAmt;
		
		if(walletDetails.getWalletAmount()<totalAmt) {
			
			totalAmt=totalAmt-walletDetails.getWalletAmount();
			model.addAttribute("show", 0);
			txnAmount=totalAmt;
			
		}else {
			
			//totalAmt=walletDetails.getWalletAmount()-totalAmt;
			model.addAttribute("show", 1);
			model.addAttribute("walletDetails", walletDetails);
		}
		
		appointId = Integer.parseInt(request.getParameter("appointId"));
		 

		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		String orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		
		model.addAttribute("orderId", orderId);
		model.addAttribute("amount", totalAmt);

		return "patient/consulting_payment/consultingPaymentCheckout";

	}

	@RequestMapping(value = "/consultingPaymentGateway", method = RequestMethod.POST)
	public String consultingPaymentGateway(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

		 
		request.setAttribute("responseUrl", Constant.CONSULTING_PAYMENT_RESPONSE_URL);

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");

		request.setAttribute("mobileNo", patientDetail.getContactNo());
		request.setAttribute("email", patientDetail.getEmail());
		request.setAttribute("txnAmount",  String.format("%.2f", txnAmount));
		return "patient/consulting_payment/consultingPaymentRedirect";
	}
	@RequestMapping(value = "/consultingPaymentResponse", method = RequestMethod.POST)
	public String consultingPaymentResponse(Locale locale, Model model) {
		LOGGER.info("rediecting to response");

		return "patient/consulting_payment/consultingPaymentResponse";
	}

	
	@RequestMapping(value = "/submitConsultingPayment", method = RequestMethod.GET)
	public void submitConsultingPayment(HttpServletRequest request) {
		LOGGER.info("Update the payment info");
		 

		String orderId = request.getParameter("orderId");
		float txnAmt = Float.parseFloat(request.getParameter("txnAmt"));
		String txnId = request.getParameter("txnId");
		int txnStatus = Integer.parseInt(request.getParameter("txnStatus"));

		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("appointId", appointId);
		map.add("paymentStatus", txnStatus);
		map.add("txnId", txnId);
		map.add("orderId", orderId);
		map.add("amount", txnAmt);
		map.add("walletAmount", walletDetails.getWalletAmount());
		map.add("consultingAmount", consultingAmount);
		map.add("walletId", walletDetails.getWalletId());
		
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "updateAppointmentPayment", map,
					Info.class);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while updateting patient Appointment payment", e);
			throw new RuntimeException("Error while updateting patient Appointment payment", e);
		}

	}
	
	@RequestMapping(value = "/patientSuscriptionPaymentCheckout", method = RequestMethod.POST)

	public String patientSuscriptionPaymentCheckout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		float totalAmt = Float.parseFloat(request.getParameter("amount"));
		contactNo = request.getParameter("contactNo");
		email = request.getParameter("email");
		backUrl = request.getParameter("backUrl");
		packageId=Integer.parseInt(request.getParameter("packageId"));
		offerId=Integer.parseInt(request.getParameter("offerId"));
		packageAmt=Float.parseFloat(request.getParameter("packageAmt"));
		if(DoctorController.referalDetails!=null) {
			totalAmt=totalAmt-Constant.referalAmount;
		}
		
		Random rand = new Random();
		int n = rand.nextInt(50) + 10;
		String orderId = "" + new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + n;
		model.addAttribute("orderId", orderId);
		model.addAttribute("amount", totalAmt);
		txnAmount=totalAmt;
		
		
		return "patient/patient_suscription_payment/patientPaymentCheckout";

	}

	@RequestMapping(value = "/patientSuscriptionPaymentGateway", method = RequestMethod.POST)
	public String patientSuscriptionPaymentGateway(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediercting......");

		 
		request.setAttribute("responseUrl", Constant.PATIENT_SUSCRIPTION_PAYMENT_RESPONSE_URL);

		HttpSession session = request.getSession();
		PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");

		request.setAttribute("mobileNo", patientDetail.getContactNo());
		request.setAttribute("email", patientDetail.getEmail());
		request.setAttribute("txnAmount",  String.format("%.2f", txnAmount));
		return "patient/patient_suscription_payment/patientPaymentRedirect";
	}
	@RequestMapping(value = "/patientSuscriptionPaymentResponse", method = RequestMethod.POST)
	public String patientSuscriptionPaymentResponse(Locale locale, Model model, HttpServletRequest request) {
		LOGGER.info("rediecting to response");
		
		
		model.addAttribute("backUrl",backUrl);
		model.addAttribute("packageId",packageId);
		model.addAttribute("offerId",offerId);
		model.addAttribute("packageAmt",packageAmt);
		return "patient/patient_suscription_payment/patientPaymentResponse";
	}
	
	/*@RequestMapping(value = "/showPatientSuscriptionPaymentResponse", method = RequestMethod.GET)
	public void showPatientSuscriptionPaymentResponse() {
		LOGGER.info("rediecting to response");
		ModelAndView model=new ModelAndView("patient/patient_suscription_payment/patientPaymentResponse");
		
		model.addObject("backUrl",backUrl);
		model.addObject("packageId",packageId);
		model.addObject("offerId",offerId);
		model.addObject("packageAmt",packageAmt);
	//	return model;
	}*/

	@RequestMapping(value = "/submitConsultingPaymentByWallet", method = RequestMethod.POST)
	public String submitConsultingPaymentByWallet(HttpServletRequest request) {
		LOGGER.info("Update the payment info");
		ModelAndView model=new ModelAndView("patient/viewConsultingToPatient");
		float walletAmount=Float.parseFloat(request.getParameter("walletAmount"));
		float consultingAmount=Float.parseFloat(request.getParameter("consultingAmount"));
		int walletId=Integer.parseInt(request.getParameter("walletId"));
		
		String orderId = "0";
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("appointId", appointId);
		map.add("walletAmount", walletAmount);
		map.add("consultingAmount", consultingAmount);
		map.add("orderId", orderId);
		map.add("walletId", walletId);
		 
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "updateAppointmentPaymentByWallet", map,
					Info.class);
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.error("Error while updateting patient Appointment payment", e);
			throw new RuntimeException("Error while updateting patient Appointment payment", e);
		}
		return "redirect:/showPatientPaymentHistory";

	}
	
}
