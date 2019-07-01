package com.bionische.biocare.pharmacy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patientdoctor.model.PrescriptionDetails;
import com.bionische.biocare.pharmacy.model.GetMedicalOrderDetails;
import com.bionische.biocare.pharmacy.model.GetPrescriptionDetailsForInvoice;
import com.bionische.biocare.pharmacy.model.GetPrescriptionDetailsForOrder;
import com.bionische.biocare.pharmacy.model.GetPrescriptionDetailsWithDoctorDetails;
import com.bionische.biocare.pharmacy.model.GetSelfUploadedPrescriptionToMedical;
import com.bionische.biocare.pharmacy.model.MedicalDetails;
import com.bionische.biocare.pharmacy.model.PrescriptionOrderDetails;
@Scope("session")
@Controller
public class MedicalOrderController {

	private static final Logger logger = LoggerFactory.getLogger(MedicalOrderController.class);

	private List<GetPrescriptionDetailsForOrder> getPrescriptionDetailsForOrderList;
	@RequestMapping(value = "/showViewOrderPharmacy", method = RequestMethod.GET)
	public ModelAndView showViewOrderToPharmacy(HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("pharmacy/viewOrderToPharmacy");
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList1 = new ArrayList<GetMedicalOrderDetails>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", "" + medicalId);
		map.add("status", "" + 0);
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalOrderDetailsByMedicalIdAndStatus",
					map, List.class);
			getMedicalOrderDetailsList1 =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionMedicalOrderDetailsByMedicalIdAndStatus",
					map, List.class);
			
			model.addObject("getMedicalOrderDetailsList1", getMedicalOrderDetailsList1);
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			model.addObject("count", getMedicalOrderDetailsList.size()+getMedicalOrderDetailsList1.size());
			model.addObject("viewOrderActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return model;

	}
	
	
	@RequestMapping(value = "/getPrescriptionDetailsForOrder", method = RequestMethod.GET)
	@ResponseBody public GetPrescriptionDetailsWithDoctorDetails getPrescriptionDetailsForOrder(HttpServletRequest request, HttpServletResponse response) {
		  getPrescriptionDetailsForOrderList=new ArrayList<GetPrescriptionDetailsForOrder>();
	
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestId", requestId);
	 
		
		try {
			
			 
			GetPrescriptionDetailsWithDoctorDetails getPrescriptionDetailsWithDoctorDetails =Constant.getRestTemplate().postForObject(Constant.url + "getPrescriptionDetailsAndDoctorDetails",	map,GetPrescriptionDetailsWithDoctorDetails.class);
			
			getPrescriptionDetailsForOrderList=getPrescriptionDetailsWithDoctorDetails.getGetPrescriptionDetailsForOrderList();
			
			 
			return getPrescriptionDetailsWithDoctorDetails;
		} catch (Exception e) {
			logger.error("Error while Getting Preecsription details by request Id", e);
			throw new RuntimeException("Error while Preecsription details by request Id", e);
		}
		
	
	}
	
	
	
	@RequestMapping(value = "/getPrescriptionDetailsForInvoice", method = RequestMethod.GET)
	@ResponseBody public GetPrescriptionDetailsForInvoice getPrescriptionDetailsForInvoice(HttpServletRequest request, HttpServletResponse response) {
		  getPrescriptionDetailsForOrderList=new ArrayList<GetPrescriptionDetailsForOrder>();
	
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestId", requestId);
	 
		
		try {
		 
			 
			GetPrescriptionDetailsForInvoice getPrescriptionDetailsForInvoice =Constant.getRestTemplate().postForObject(Constant.url + "getPrescriptionDetailsForInvoice",	map,GetPrescriptionDetailsForInvoice.class);
			
			getPrescriptionDetailsForOrderList=getPrescriptionDetailsForInvoice.getGetPrescriptionDetailsForOrderList();
			
			 
			return getPrescriptionDetailsForInvoice;
		} catch (Exception e) {
			logger.error("Error while Getting Preecsription details by request Id", e);
			throw new RuntimeException("Error while Preecsription details by request Id", e);
		}
		
	
	}
	
	
	@RequestMapping(value = "/confirmMedicalOrder", method = RequestMethod.POST)
	public String confirmMedicalOrder(HttpServletRequest request, HttpServletResponse response) {

		 
		List<PrescriptionOrderDetails> prescriptionOrderDetailsList=new ArrayList<PrescriptionOrderDetails>();
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		for(int i=0;i<getPrescriptionDetailsForOrderList.size();i++)
		{
			PrescriptionOrderDetails prescriptionOrderDetails=new PrescriptionOrderDetails();
			prescriptionOrderDetails.setPrescriptionOrderDetailsId(getPrescriptionDetailsForOrderList.get(i).getPrescriptionOrderDetailsId());
			prescriptionOrderDetails.setPrice(Float.parseFloat(request.getParameter(getPrescriptionDetailsForOrderList.get(i).getPrescriptionOrderDetailsId()+"price")));
			prescriptionOrderDetails.setDelStatus(0);
			prescriptionOrderDetails.setPrescriptionId(getPrescriptionDetailsForOrderList.get(i).getPrescriptionId());
			prescriptionOrderDetails.setQuantity(getPrescriptionDetailsForOrderList.get(i).getQuantity());
			prescriptionOrderDetails.setRequestId(requestId);
			prescriptionOrderDetails.setStatus(0);
			prescriptionOrderDetailsList.add(prescriptionOrderDetails);
			
		}
		
		float totAmount=Float.parseFloat(request.getParameter("totAmount"));
		try {
			Info info =Constant.getRestTemplate().postForObject(Constant.url + "updatePrescriptionDetailsForOrder",
					prescriptionOrderDetailsList, Info.class);
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("requestId", requestId);
			map.add("totAmount", totAmount);
			map.add("status", 1);
			  info =Constant.getRestTemplate().postForObject(Constant.url + "updateMedicalOrderStatusAndAmount",
					  map, Info.class);
			
		} catch (Exception e) {
			logger.error("Error while Getting Preecsription details by request Id", e);
			throw new RuntimeException("Error while Preecsription details by request Id", e);
		}
		
		return "redirect:/showViewOrderPharmacy";
	}
	 
	 
	@RequestMapping(value = "/showCompletedOrderPharmacy", method = RequestMethod.GET)
	public ModelAndView showCompletedOrderPharmacy(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pharmacy/completedOrders");
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList1 = new ArrayList<GetMedicalOrderDetails>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", medicalId);
		map.add("status", 1);
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalOrderDetailsByMedicalIdAndStatus",
					map, List.class);
			getMedicalOrderDetailsList1 =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionMedicalOrderDetailsByMedicalIdAndStatus",
					map, List.class);
			model.addObject("getMedicalOrderDetailsList1", getMedicalOrderDetailsList1);
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			model.addObject("completedActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return model;

	}
	

	@RequestMapping(value = "/updatePaidStatus", method = RequestMethod.GET)
	@ResponseBody public Info updatePaidStatus(HttpServletRequest request, HttpServletResponse response) {
	
		Info info=new Info();
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestId", requestId);
		map.add("paidStatus", 1);
		
		try {
			info =Constant.getRestTemplate().postForObject(Constant.url + "updateMedicineOrderPaidStatus",
					map, Info.class);
			 
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return info;
	}
	
	@RequestMapping(value = "/updateDeliveredStatus", method = RequestMethod.GET)
	@ResponseBody public Info updateDeliveredStatus(HttpServletRequest request, HttpServletResponse response) {
		Info info=new Info();
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestId", requestId);
		map.add("status", 2);
		
		try {
			info =Constant.getRestTemplate().postForObject(Constant.url + "updateMedicineOrderDeliveredStatus",
					map, Info.class);
			 
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return info;
	}
	@RequestMapping(value = "/showPharmacyOrderHistory", method = RequestMethod.GET)
	public ModelAndView showPharmacyOrderHistory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pharmacy/ordersHistory");
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList1 = new ArrayList<GetMedicalOrderDetails>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		String fromDate= request.getParameter("fromDate");
		String toDate=request.getParameter("toDate");
		map.add("medicalId", medicalId);
		map.add("status", 2);
		
		if(request.getParameter("fromDate")==null || request.getParameter("fromDate")=="")
		{
			fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			toDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}else {
			fromDate=DateConverter.convertToYMD(fromDate);
			  toDate=DateConverter.convertToYMD(toDate);
		}
		map.add("fromDate", fromDate);
		map.add("toDate", toDate+" 23:59:00");
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalOrderDetailsByMedicalIdAndStatusAndDate",
					map, List.class);
			
			getMedicalOrderDetailsList1 =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionMedicalOrderDetailsByMedicalIdAndStatusAndDate",
					map, List.class);
			model.addObject("getMedicalOrderDetailsList1",getMedicalOrderDetailsList1);
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			model.addObject("fromDate",DateConverter.convertToDMY(fromDate));
			model.addObject("toDate",DateConverter.convertToDMY(toDate));
			model.addObject("historyActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return model;

	}
	

	@RequestMapping(value = "/showCancelledOrderPharmacy", method = RequestMethod.GET)
	public ModelAndView showCancelledOrderPharmacy(HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("pharmacy/cancelledOrders");
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
		List<GetMedicalOrderDetails> getMedicalOrderDetailsList1 = new ArrayList<GetMedicalOrderDetails>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		System.out.println("medicalId:"+medicalId);
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId",medicalId);
		map.add("status",3);
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalCancelledOrderByMedicalIdAndStatus",
					map, List.class);
		
		getMedicalOrderDetailsList1 =Constant.getRestTemplate().postForObject(Constant.url + "getPrescriptionMedicalCancelledOrderByMedicalIdAndStatus",
				map, List.class);
		
		model.addObject("getMedicalOrderDetailsList1", getMedicalOrderDetailsList1);
		
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			
			model.addObject("cancelActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting showCancelledOrderPharmacy by medical Id", e);
			throw new RuntimeException("Error while Getting showCancelledOrderPharmacy by medical Id", e);
		}
		return model;

	}
	
	@RequestMapping(value = "/showMedicineBillToPharmacy/{requestToMedicalId}", method = RequestMethod.GET)
	public ModelAndView showPharmacyBill(HttpServletRequest request, HttpServletResponse response,@PathVariable("requestToMedicalId") int requestToMedicalId) {
		 
		ModelAndView model = new ModelAndView("pharmacy/pharma_billing");
		GetMedicalOrderDetails getMedicalOrderDetails = new GetMedicalOrderDetails();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();															
		map.add("requestId",requestToMedicalId);
		try {
			getMedicalOrderDetails =Constant.getRestTemplate().postForObject(Constant.url + "getPatientOrderDetailsByRequestId",
					map, GetMedicalOrderDetails.class);
			
		} catch (Exception e) {
			
			throw new RuntimeException("Error while cancelOrder in PatientOrderMedicineController", e);
		}
		
		List<PrescriptionDetails> prescriptionDetailsList = new ArrayList<PrescriptionDetails>();

		try {
			
			ParameterizedTypeReference<List<GetPrescriptionDetailsForOrder>> typeRef = new ParameterizedTypeReference<List<GetPrescriptionDetailsForOrder>>() {
			};
			ResponseEntity<List<GetPrescriptionDetailsForOrder>> responseEntity =Constant.getRestTemplate().exchange(Constant.url + "getPrescriptionDetailsForOrder",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			
			getPrescriptionDetailsForOrderList=responseEntity.getBody();
			
			 
			 
		} catch (Exception e) {
			
			throw new RuntimeException("Error while Preecsription details by request Id", e);
		}
		
		
		System.out.println("Bill Details ="+getMedicalOrderDetails.toString());
		System.out.println("Pres Details="+getPrescriptionDetailsForOrderList.toString());
		
		model.addObject("prescriptionDetailsList", getPrescriptionDetailsForOrderList);
		model.addObject("getMedicalOrderDetails", getMedicalOrderDetails);
		return model;

	}	
	
	@RequestMapping(value = "/showUploadedPrescriptionMedicineBillToPharmacy/{requestToMedicalId}", method = RequestMethod.GET)
	public ModelAndView showUploadedPrescriptionMedicineBillToPharmacy(HttpServletRequest request, HttpServletResponse response,@PathVariable("requestToMedicalId") int requestToMedicalId) {
		 
		ModelAndView model = new ModelAndView("pharmacy/uploadedPrescriptionPharmabilling");
		GetMedicalOrderDetails getMedicalOrderDetails = new GetMedicalOrderDetails();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();															
		map.add("requestId",requestToMedicalId);
		try {
			getMedicalOrderDetails =Constant.getRestTemplate().postForObject(Constant.url + "getPatientOrderBillDetailsByRequestId",
					map, GetMedicalOrderDetails.class);
			
		} catch (Exception e) {
			
			throw new RuntimeException("Error while cancelOrder in PatientOrderMedicineController", e);
		}
		
	
		List<String> prescriptions=new ArrayList<>();
		
		String prescriptionName[]=getMedicalOrderDetails.getString1().split(",");
		
		//http://104.238.116.176:8080/images/patient/"+patientId+"/prescription/"+prescription[i];
		
		for(int i=0;i<prescriptionName.length;i++) {
			
			prescriptions.add(Constant.patientUrl+"/"+getMedicalOrderDetails.getPatientId()+"/prescription/"+prescriptionName[i]);
			
		}
		
		System.out.println("Bill Details ="+getMedicalOrderDetails.toString());
		
		
		model.addObject("prescriptions", prescriptions);
		model.addObject("getMedicalOrderDetails", getMedicalOrderDetails);
		return model;

	}	
	
	
/*	 
	@RequestMapping(value = "/showUploadedOrderPharmacy", method = RequestMethod.GET)
	public ModelAndView showUploadedOrderPharmacy(HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("pharmacy/viewOrderToPharmImage");
		List<GetSelfUploadedPrescriptionToMedical> getMedicalOrderDetailsList = new ArrayList<GetSelfUploadedPrescriptionToMedical>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", "" + medicalId);
		map.add("status", "" + 0);
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionMedicalOrderDetailsByMedicalIdAndStatus",
					map, List.class);
			
			System.out.println("getMedicalOrderDetailsList"+getMedicalOrderDetailsList.toString());
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			model.addObject("count", getMedicalOrderDetailsList.size());
			
			model.addObject("viewOrderActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return model;

	}*/
	
	@RequestMapping(value = "/confirmUploadedPrescriptionMedicalOrder", method = RequestMethod.POST)
	public String confirmUploadedPrescriptionMedicalOrder(HttpServletRequest request, HttpServletResponse response) {

		int requestId=Integer.parseInt(request.getParameter("requestId"));
		float totAmount=Float.parseFloat(request.getParameter("totAmount"));
		try {
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("requestId", requestId);
			map.add("totAmount", totAmount);
			map.add("status", 1);
			int updateStatus =Constant.getRestTemplate().postForObject(Constant.url + "updateUploadedPrescriptionMedicalOrderStatusAndAmount",
					  map, Integer.class);
			if(updateStatus==1) {
				
				System.out.println("Order Confirm Successfully");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error while Getting Preecsription details by request Id", e);
			throw new RuntimeException("Error while Preecsription details by request Id", e);
		}
		
		return "redirect:/showViewOrderPharmacy";
	}
	
	@RequestMapping(value = "/showUploadPrescriptionCompletedOrderPharmacy", method = RequestMethod.GET)
	public ModelAndView showUploadPrescriptionCompletedOrderPharmacy(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pharmacy/completedOrdersImage");
		List<GetSelfUploadedPrescriptionToMedical> getMedicalOrderDetailsList = new ArrayList<GetSelfUploadedPrescriptionToMedical>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("medicalId", medicalId);
		map.add("status", 1);
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionMedicalOrderDetailsByMedicalIdAndStatus",
					map, List.class);
			
			System.out.println("getMedicalOrderDetailsList="+getMedicalOrderDetailsList.toString());
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			model.addObject("completedActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return model;

	}
	@RequestMapping(value = "/updateUploadedPrescriptionPaidStatus", method = RequestMethod.GET)
	@ResponseBody public Info updateUploadedPrescriptionPaidStatus(HttpServletRequest request, HttpServletResponse response) {
	
		Info info=new Info();
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestId", requestId);
		map.add("paidStatus", 1);
		
		try {
			int paidStatus =Constant.getRestTemplate().postForObject(Constant.url + "updateUploadedPrescriptionMedicineOrderPaidStatus",
					map, Integer.class);
			
			if(paidStatus==1) {
				System.out.println("Patient Paid Money"); 
				
			}
			 
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return info;
	}
	
	@RequestMapping(value = "/updateUploadedPrescriptionDeliveredStatus", method = RequestMethod.GET)
	@ResponseBody public Info updateUploadedPrescriptionDeliveredStatus(HttpServletRequest request, HttpServletResponse response) {
		Info info=new Info();
		int requestId=Integer.parseInt(request.getParameter("requestId"));
		System.out.println("requestId="+requestId);
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("requestId", requestId);
		map.add("status", 2);
		
		try {
			int deliverStatus =Constant.getRestTemplate().postForObject(Constant.url + "updateUploadedPrescriptionMedicineOrderDeliveredStatus",
					map, Integer.class);
			
			if(deliverStatus==1) {
				System.out.println("Delivery Completed"); 
				
			}
			 
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return info;
	}
	
	@RequestMapping(value = "/showUploadedPrescriptionPharmacyOrderHistory", method = RequestMethod.GET)
	public ModelAndView showUploadedPrescriptionPharmacyOrderHistory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pharmacy/ordersHistory");
		List<GetSelfUploadedPrescriptionToMedical> getMedicalOrderDetailsList = new ArrayList<GetSelfUploadedPrescriptionToMedical>();
		HttpSession session = request.getSession();
		MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
		int medicalId = medicalDetails.getMedicalId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		String fromDate= request.getParameter("fromDate");
		String toDate=request.getParameter("toDate");
		map.add("medicalId", medicalId);
		map.add("status", 2);
		
		if(request.getParameter("fromDate")==null || request.getParameter("fromDate")=="")
		{
			fromDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			toDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}else {
			fromDate=DateConverter.convertToYMD(fromDate);
			  toDate=DateConverter.convertToYMD(toDate);
		}
		map.add("fromDate", fromDate);
		map.add("toDate", toDate+" 23:59:00");
		
		try {
			getMedicalOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionMedicalOrderDetailsByMedicalIdAndStatusAndDate",
					map, List.class);
			model.addObject("getMedicalOrderDetailsList", getMedicalOrderDetailsList);
			model.addObject("fromDate",DateConverter.convertToDMY(fromDate));
			model.addObject("toDate",DateConverter.convertToDMY(toDate));
			model.addObject("historyActive", "active");
		} catch (Exception e) {
			logger.error("Error while Getting Pharmacy Order by medical Id", e);
			throw new RuntimeException("Error while Getting Pharmacy Order by medical Id", e);
		}
		return model;

	}
}
