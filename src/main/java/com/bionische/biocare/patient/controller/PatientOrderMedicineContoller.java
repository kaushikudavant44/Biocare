package com.bionische.biocare.patient.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.common.s3.AmazonS3ClientService;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.patient.model.GetCartProducts;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientAddress;
import com.bionische.biocare.patient.model.PatientAddressList;
import com.bionische.biocare.patient.model.PatientBankAccountInfo;
import com.bionische.biocare.patient.model.PatientCart;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patient.model.SelfUploadedPrescriptionToMedical;
import com.bionische.biocare.patientdoctor.model.ConsultingDetails;
import com.bionische.biocare.patientdoctor.model.PrescriptionDetails;
import com.bionische.biocare.pharmacy.model.GetMedicalOrderDetails;
import com.bionische.biocare.pharmacy.model.GetPrescriptionDetailsForOrder;
import com.bionische.biocare.pharmacy.model.GetSelfUploadedPrescriptionToMedical;
import com.bionische.biocare.pharmacy.model.MedicalDetails;
import com.bionische.biocare.pharmacy.model.PrescriptionToMedical;
@Scope("session")
@Controller
public class PatientOrderMedicineContoller {
	
	
	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	 
	public final Log LOGGER = LogFactory.getLog(PatientController.class);
	//HttpEntity<String> req=new HttpEntity<String>(Constant.getHeaders());
	public List<PatientAddressList> allPatientAddressList;
	public PatientAddress patientAddressDetails;
	public List<GetCartProducts> getCartProductDetails;
	String[] cartId;
	private List<GetPrescriptionDetailsForOrder> getPrescriptionDetailsForOrderList;
	int message=0;
	@RequestMapping(value="/showOrderMedicinePage", method=RequestMethod.GET)

	public ModelAndView showOrderMedicinePage(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("patient/addToCart");
		
		RestTemplate rest=new RestTemplate(); 
		HttpSession session = request.getSession();
		PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
	    patientAddressDetails = new PatientAddress();
		List<MedicalDetails> medicalDetailsList = new ArrayList<MedicalDetails>();
		allPatientAddressList = new ArrayList<PatientAddressList>();
		
		List<DoctorDetails> doctorDetails=new ArrayList<DoctorDetails>();
		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", ""+patientDetails.getFamilyId());
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId",+patientDetails.getPatientId());
		
									
		try {
			
			doctorDetails=Constant.getRestTemplate().postForObject(Constant.url+"getDoctorDetailsByPatientId",map,List.class);

		List<PatientDetails> patientDetailList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientFamilyMembersList", mapfam, List.class);
		patientAddressDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPatientAddressDetails", map, PatientAddress.class);
		medicalDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalsByPatientId", map, List.class);
		
		ParameterizedTypeReference<List<PatientAddressList>> typeRef = new ParameterizedTypeReference<List<PatientAddressList>>() {
		};
		ResponseEntity<List<PatientAddressList>> responseEntity =Constant.getRestTemplate().exchange(
				Constant.url + "getAddressListOfPatient", HttpMethod.POST,
				new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
				
		allPatientAddressList = responseEntity.getBody();
		  	  
		model.addObject("medicalDetailsList", medicalDetailsList);
		model.addObject("patientDetailList", patientDetailList);
		model.addObject("memberLength", patientDetailList.size());
		model.addObject("patientAddressDetails", patientAddressDetails);
		model.addObject("name", patientDetails.getfName()+" "+patientDetails.getlName());
		model.addObject("orderActive", "active");
		model.addObject("message", message);
		model.addObject("allPatientAddressList", allPatientAddressList);
		model.addObject("doctorDetails", doctorDetails);

		message=0;
		
		}
		catch (Exception e) {
			
			LOGGER.error("Error while showOrderMedicinePage in PatientOrderMedicineController.",e);
			throw new RuntimeException("Error while showOrderMedicinePage in PatientOrderMedicineController.",e);
		}
		
		
		return model;
		
	}	
	
	
	

@RequestMapping(value = "/getLast10ConsultingDeatils", method = RequestMethod.GET)
public @ResponseBody List<ConsultingDetails> getLast10ConsultingDeatils(HttpServletRequest request,
		HttpServletResponse response) {
	 
	int patientId = Integer.parseInt(request.getParameter("patientId"));
	
	List<ConsultingDetails> getConsultingDetailsByDoctor = new ArrayList<ConsultingDetails>();

	
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	
	 
		map.add("patientId", patientId);
		 
	 
	
	try {
		getConsultingDetailsByDoctor =Constant.getRestTemplate().postForObject(Constant.url + "getLast10ConsultingDeatils", map, List.class);

	} catch (Exception e) {
		
		LOGGER.error("Error while getConsultingDetailsByDoctorHaveingPresc.",e);
		throw new RuntimeException("Error while getConsultingDetailsByDoctorHaveingPresc.",e);
	}
	return getConsultingDetailsByDoctor;
}
	

	 @RequestMapping(value="/showmyCart", method=RequestMethod.GET)
		
		public ModelAndView showmyCart(HttpServletRequest request,
				HttpServletResponse response)
		{		  
			ModelAndView model=new ModelAndView("patient/myCart");
			
			HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		    getCartProductDetails = new ArrayList<GetCartProducts>();
			
			System.out.println("familyId:"+patientDetails.getFamilyId());
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();			
		    map.add("familyId", patientDetails.getFamilyId());
						
			try {
				
				ParameterizedTypeReference<List<GetCartProducts>> typeRef = new ParameterizedTypeReference<List<GetCartProducts>>() {
				};
				ResponseEntity<List<GetCartProducts>> responseEntity =Constant.getRestTemplate().exchange(
						Constant.url + "getAllCartProductsOfPatient", HttpMethod.POST,
						new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
						
				getCartProductDetails = responseEntity.getBody();
				
				model.addObject("getCartProductDetails",getCartProductDetails);
			} catch (Exception e) {
				
				LOGGER.error("Error while showmyCart in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while showmyCart in PatientOrderMedicineController.",e);
			}
			
			return model;
			
		}

	
	 @RequestMapping(value="/getPatientCartCount", method=RequestMethod.GET)
		
		public @ResponseBody int getPatientCartCount(HttpServletRequest request,
				HttpServletResponse response)
		{
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			
			int count=0;
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("familyId", patientDetails.getFamilyId());
			try {
				count =Constant.getRestTemplate().postForObject(Constant.url + "getPatientCartCount", map, Integer.class);

			} catch (Exception e) {
				
				LOGGER.error("Error while getPatientCartCount in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while getPatientCartCount in PatientOrderMedicineController.",e);
			}
			
			return count;
			
		}
	 
	 @RequestMapping(value="/addProductToCart", method=RequestMethod.GET)
		
		public @ResponseBody int addProductToCart(HttpServletRequest request,
				HttpServletResponse response)
		{
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			
			int meetId = Integer.parseInt(request.getParameter("meetId"));
			
			int count=0;
			
			PatientCart patientCart = new PatientCart();
			patientCart.setMeetId(meetId);
			patientCart.setInt1(0);
			patientCart.setStatus(0);
			patientCart.setString1("1");
			patientCart.setPatientId(Integer.parseInt(request.getParameter("patientId")));
			try {
				count =Constant.getRestTemplate().postForObject(Constant.url + "addToCartAndGetCartCount", patientCart, Integer.class);

			} catch (Exception e) {
				
				LOGGER.error("Error while addProductToCart in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while addProductToCart.",e);
			}
			
			return count;
			
		}
	/* 
	 @RequestMapping(value = "/getPharmacyByPatientId", method = RequestMethod.GET)
		public @ResponseBody List<MedicalDetails> getPharmacyByPatientId(HttpServletRequest request,
				HttpServletResponse response) {
			int patientId = Integer.parseInt(request.getParameter("patientId"));
			HttpSession session = request.getSession();
			List<MedicalDetails> medicalDetailsList = new ArrayList<MedicalDetails>();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			try {
				map.add("patientId", patientId);
				medicalDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalsByPatientId", map, List.class);
			} catch (Exception e) {
				LOGGER.error("Error while geting Pharmacy By PatientId ", e);
				throw new RuntimeException("Error while geting Pharmacy By PatientId", e);
			}
			return medicalDetailsList;
		}*/
	 
	 @RequestMapping(value="/saveAndGetPatientAddress", method=RequestMethod.GET)
		
		public @ResponseBody List<PatientAddressList> saveAndGetPatientAddress(HttpServletRequest request,
				HttpServletResponse response)
		{
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			Info info = new Info();
			
			int id=Integer.parseInt(request.getParameter("id"));
			
			allPatientAddressList = new ArrayList<PatientAddressList>();
			PatientAddressList patientAddressList= new PatientAddressList();
			
			if(id!=0)
			{
				patientAddressList.setPatientAddressListId(id);
			}
			patientAddressList.setCity(request.getParameter("city"));
			patientAddressList.setContactNo(request.getParameter("contact"));
			patientAddressList.setCountry(request.getParameter("country"));
			patientAddressList.setFullName(request.getParameter("fullName"));
			patientAddressList.setHouse(request.getParameter("house"));
			patientAddressList.setLocality(request.getParameter("locality"));
			patientAddressList.setPatientId(patientDetails.getPatientId());
			patientAddressList.setPincode(Integer.parseInt(request.getParameter("pincode")));
			patientAddressList.setState(request.getParameter("state"));
			patientAddressList.setStreet(request.getParameter("street"));
		
			
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			try {
				
				ParameterizedTypeReference<List<PatientAddressList>> typeRef = new ParameterizedTypeReference<List<PatientAddressList>>() {
				};
						
				HttpEntity entity = new HttpEntity(patientAddressList,headers);

				ResponseEntity<List<PatientAddressList>> responseEntity =Constant.getRestTemplate().exchange(
						Constant.url + "addAddressToPatientAddressList", HttpMethod.POST,
						entity, typeRef);
						
				allPatientAddressList = responseEntity.getBody();
				
			} catch (Exception e) {
				
				LOGGER.error("Error while getPatientAddressList in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while getPatientAddressList in PatientOrderMedicineController.",e);
			}
			
			return allPatientAddressList;
			
		}
	 
	 @RequestMapping(value="/deletePatientAddress", method=RequestMethod.GET)
	 public @ResponseBody List<PatientAddressList> deletePatientAddress(HttpServletRequest request,
				HttpServletResponse response)
		{
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			Info info = new Info();
			
			allPatientAddressList = new ArrayList<PatientAddressList>();
			int addressId = Integer.parseInt(request.getParameter("addressId"));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("addressId",addressId);
			map.add("patientId",patientDetails.getPatientId());
			
			try {
				allPatientAddressList =Constant.getRestTemplate().postForObject(Constant.url + "deletePatientAddressList", map, List.class);

			} catch (Exception e) {
				
				LOGGER.error("Error while deletePatientAddress in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while deletePatientAddress in PatientOrderMedicineController.",e);
			}
			
			return allPatientAddressList;
			
		}
	 
	 @RequestMapping(value="/deleteCartItem", method=RequestMethod.GET)
	 public @ResponseBody Info deleteCartItem(HttpServletRequest request,
				HttpServletResponse response)
		{
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			Info info = new Info();
			
			int cartId = Integer.parseInt(request.getParameter("cartId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("cartId",cartId);
			
			
			try {
				info =Constant.getRestTemplate().postForObject(Constant.url + "deleteCartItem", map, Info.class);

			} catch (Exception e) {
				
				LOGGER.error("Error while deleteCartItem in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while deleteCartItem in PatientOrderMedicineController.",e);
			}
			
			return info;
			
		}
	 
	 @RequestMapping(value="/orderMedicine", method=RequestMethod.GET)
		
		public  String orderMedicine(HttpServletRequest request,
				HttpServletResponse response)
		{
		 ModelAndView model=new ModelAndView("patient/addToCart");
		 
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			
			PrescriptionToMedical prescriptionToMedical = new PrescriptionToMedical();
			
			int meetId = Integer.parseInt(request.getParameter("orderMeetId"));
			int doctorId = Integer.parseInt(request.getParameter("orderDoctorId"));
		
			int patientId = Integer.parseInt(request.getParameter("patientId"));
			int deliveryType = Integer.parseInt(request.getParameter("cars"));
			int medicalId = Integer.parseInt(request.getParameter("selectedMedical"));
			
			if(deliveryType==0)
			{
				int address = Integer.parseInt(request.getParameter("address"));
				System.out.println("address:"+address);
				if(address==0)
				{
					prescriptionToMedical.setAddress(patientAddressDetails.getAddress()+","+patientAddressDetails.getCityName()+","+patientAddressDetails.getStateName());
					prescriptionToMedical.setDeliveryType(deliveryType);
					prescriptionToMedical.setPincode(patientAddressDetails.getPincode());
					prescriptionToMedical.setPatientContact(patientAddressDetails.getContact());
				}
				else
				{
					for (PatientAddressList orders : allPatientAddressList)
					{
						if(orders.getPatientAddressListId()==address)
						{
							prescriptionToMedical.setAddress(orders.getLocality()+","+orders.getHouse()+","+orders.getCity()+" "+orders.getPincode()+","+orders.getState());
							prescriptionToMedical.setDeliveryType(deliveryType);
							prescriptionToMedical.setPincode(orders.getPincode());
							prescriptionToMedical.setPatientContact(orders.getContactNo());
							
						}
					}
					
				}
				
				
			}	
			
			else
			{
				prescriptionToMedical.setAddress("store");
				prescriptionToMedical.setDeliveryType(deliveryType);
				prescriptionToMedical.setPincode(0);
				prescriptionToMedical.setPatientContact("store");
				
			}
			prescriptionToMedical.setDelStatus(0);
			prescriptionToMedical.setDoctorId(doctorId);
			prescriptionToMedical.setEmail("email");
			prescriptionToMedical.setInt1(0);
			prescriptionToMedical.setInt2(0);
			prescriptionToMedical.setMedicalId(medicalId);
			prescriptionToMedical.setMeetId(meetId);
			prescriptionToMedical.setPatientId(patientId);
			prescriptionToMedical.setPaymentStatus(0);
			prescriptionToMedical.setStatus(0);
			prescriptionToMedical.setString1("1");
			prescriptionToMedical.setString2("1");
			prescriptionToMedical.setTotalAmt(0);
			
			
			
			try {
				PrescriptionToMedical prescriptionToMedicalRes =Constant.getRestTemplate().postForObject(Constant.url + "insertOrderPrescription", prescriptionToMedical, PrescriptionToMedical.class);

				if(prescriptionToMedicalRes!=null)
				{
					message=1;	
				}
				else
				{
					message=2;	
				}
			} catch (Exception e) {
				
				LOGGER.error("Error while orderMedicine in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while orderMedicine in PatientOrderMedicineController.",e);
			}
			
			return "redirect:/showOrderMedicinePage";
			
		}
	 
	 
	 
	 
	 @RequestMapping(value="/orderUploadedPrescription", method=RequestMethod.POST)
		
		public  String orderUploadedPrescription(HttpServletRequest request,
				HttpServletResponse response)
		{
		 ModelAndView model=new ModelAndView("patient/selfUploadedPrescriptionOrder");
		 
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			
			PrescriptionToMedical prescriptionToMedical = new PrescriptionToMedical();
			int meetId = 0;
			int doctorId = 0;
			String	fileName=null;
			StringBuilder fileNameList = new StringBuilder();
			try {
				MultipartHttpServletRequest mfr = (MultipartHttpServletRequest) request;
				  List<MultipartFile> files = mfr.getFiles("file");
				
				System.out.println(files.get(0));
				 for(int i=0;i<files.size();i++) {
					 fileName=  new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
						+ i + VpsImageUpload.getFileExtension(files.get(i));
					 fileNameList.append(fileName+",");
					 
					 amazonS3ClientService.uploadFileToS3Bucket(files.get(i),fileName,"patient/" + patientDetails.getPatientId() + "/prescription/", true);
			}
				 
			  
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			int deliveryType = Integer.parseInt(request.getParameter("cars"));
			int medicalId = Integer.parseInt(request.getParameter("selectedMedical"));
			
			if(deliveryType==0)
			{
				int address = Integer.parseInt(request.getParameter("address"));
				System.out.println("address:"+address);
				if(address==0)
				{
					prescriptionToMedical.setAddress(patientAddressDetails.getAddress()+","+patientAddressDetails.getCityName()+","+patientAddressDetails.getStateName());
					prescriptionToMedical.setDeliveryType(deliveryType);
					prescriptionToMedical.setPincode(patientAddressDetails.getPincode());
					prescriptionToMedical.setPatientContact(patientAddressDetails.getContact());
				}
				else
				{
					for (PatientAddressList orders : allPatientAddressList)
					{
						if(orders.getPatientAddressListId()==address)
						{
							prescriptionToMedical.setAddress(orders.getLocality()+","+orders.getHouse()+","+orders.getCity()+" "+orders.getPincode()+","+orders.getState());
							prescriptionToMedical.setDeliveryType(deliveryType);
							prescriptionToMedical.setPincode(orders.getPincode());
							prescriptionToMedical.setPatientContact(orders.getContactNo());
							
						}
					}
					
				}
				
				
			}	
			
			else
			{
				prescriptionToMedical.setAddress("store");
				prescriptionToMedical.setDeliveryType(deliveryType);
				prescriptionToMedical.setPincode(0);
				prescriptionToMedical.setPatientContact("store");
				
			}
			prescriptionToMedical.setDelStatus(0);
			prescriptionToMedical.setMedicalId(medicalId);
			prescriptionToMedical.setPatientId(patientDetails.getPatientId());
			prescriptionToMedical.setPaymentStatus(0);
			prescriptionToMedical.setTotalAmt(0);
			prescriptionToMedical.setString1(fileNameList.substring(0, fileNameList.length() - 1));
			prescriptionToMedical.setInt2(1);
			prescriptionToMedical.setString2("1");
			
			
			try {
				PrescriptionToMedical prescriptionToMedicalRes =Constant.getRestTemplate().postForObject(Constant.url + "insertOrderPrescription", prescriptionToMedical, PrescriptionToMedical.class);

				if(prescriptionToMedicalRes!=null)
				{
					message=1;	
				}
				else
				{
					message=2;	
				}
			} catch (Exception e) {
				
				LOGGER.error("Error while orderMedicine in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while orderMedicine in PatientOrderMedicineController.",e);
			}
			
			return "redirect:/showOrderMedicinePage";
			
		}
	 
	/* @RequestMapping(value="/showReviewOrder", method=RequestMethod.GET)
		
		public ModelAndView showReviewOrder(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/review-order");
			cartId = request.getParameterValues("orderReview");
			
			model.addObject("cartId",cartId);
			model.addObject("getCartProductDetails",getCartProductDetails);
						
			return model;
			
		}*/
	 
	 @RequestMapping(value="/showDeliverAddress", method=RequestMethod.GET)
		
		public ModelAndView showDeliverAddress(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/deliverAddress");
			
			cartId = request.getParameterValues("orderReview");
			
			RestTemplate rest=new RestTemplate(); 
			HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		    patientAddressDetails = new PatientAddress();
			
			allPatientAddressList = new ArrayList<PatientAddressList>();
			
			MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
			mapfam.add("familyId", ""+patientDetails.getFamilyId());
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("patientId",+patientDetails.getPatientId());
			
			try {
				patientAddressDetails=Constant.getRestTemplate().postForObject(Constant.url+"getPatientAddressDetails", map, PatientAddress.class);

				ParameterizedTypeReference<List<PatientAddressList>> typeRef = new ParameterizedTypeReference<List<PatientAddressList>>() {
				};
				ResponseEntity<List<PatientAddressList>> responseEntity =Constant.getRestTemplate().exchange(
				Constant.url + "getAddressListOfPatient", HttpMethod.POST,
				new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

				allPatientAddressList = responseEntity.getBody();
			
				model.addObject("patientAddressDetails", patientAddressDetails);
				model.addObject("allPatientAddressList", allPatientAddressList);
				
				System.out.println("patient address list "+allPatientAddressList.toString());

				}
				catch (Exception e) {

				LOGGER.error("Error while showDeliverAddress in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while showDeliverAddress in PatientOrderMedicineController.",e);
				}

			
			return model;
			
		}
	 
	 
	 
	 @RequestMapping(value="/showSelectMedical", method=RequestMethod.GET)
		
		public ModelAndView showSelectMedical(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/selectMedical");
			HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			List<MedicalDetails> medicalDetailsList = new ArrayList<MedicalDetails>();
			
			int deliveryType = Integer.parseInt(request.getParameter("deliveryType"));
			
			if(deliveryType==0)
			{
				int address = Integer.parseInt(request.getParameter("address"));
				model.addObject("address",address);
			}
             
            MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
     		map.add("patientId",+patientDetails.getPatientId());
			
			try {
				medicalDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalsByPatientId", map, List.class);

			} catch (Exception e) {
				
				LOGGER.error("Error while showSelectMedical in PatientOrderMedicineController.",e);
				throw new RuntimeException("Error while showSelectMedical in PatientOrderMedicineController.",e);
			}
			
			model.addObject("deliveryType",deliveryType);
			model.addObject("medicalDetailsList",medicalDetailsList);
						
			return model;
			
		}

	 @RequestMapping(value="/orderMedicineFromCart", method=RequestMethod.GET)
		
		public  String orderMedicineFromCart(HttpServletRequest request,
				HttpServletResponse response)
		{
		 ModelAndView model=new ModelAndView("patient/addToCart");
		 
		    HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			
			PrescriptionToMedical info = null;
		    
			int deliveryType = Integer.parseInt(request.getParameter("deliveryType"));
			int medicalId = Integer.parseInt(request.getParameter("medicalId"));
			
			int[] itemsId = Arrays.stream(cartId).mapToInt(Integer::parseInt).toArray();
			
			System.out.println("itemsid:"+itemsId.toString());
			
			for (int productsId : itemsId)				
			{
				for (GetCartProducts products : getCartProductDetails)	
				{
					if(products.getCartId()==productsId)
					{   
						PrescriptionToMedical prescriptionToMedical = new PrescriptionToMedical();
						
						System.out.println("getCartProductDetails:"+products.toString());
			if(deliveryType==0)
			{
				int address = Integer.parseInt(request.getParameter("address"));
				System.out.println("address:"+address);
				if(address==0)
				{
					prescriptionToMedical.setAddress(patientAddressDetails.getAddress()+","+patientAddressDetails.getCityName()+","+patientAddressDetails.getStateName());
					prescriptionToMedical.setDeliveryType(deliveryType);
					prescriptionToMedical.setPincode(patientAddressDetails.getPincode());
					prescriptionToMedical.setPatientContact(patientAddressDetails.getContact());
				}
				else
				{
					for (PatientAddressList orders : allPatientAddressList)
					{
						if(orders.getPatientAddressListId()==address)
						{
							prescriptionToMedical.setAddress(orders.getLocality()+","+orders.getHouse()+","+orders.getCity()+" "+orders.getPincode()+","+orders.getState());
							prescriptionToMedical.setDeliveryType(deliveryType);
							prescriptionToMedical.setPincode(patientAddressDetails.getPincode());
							prescriptionToMedical.setPatientContact(patientAddressDetails.getContact());
							
						}
					}
					
				}
				
				
			}	
			
			else
			{
				prescriptionToMedical.setAddress("store");
				prescriptionToMedical.setDeliveryType(deliveryType);
				prescriptionToMedical.setPincode(0);
				prescriptionToMedical.setPatientContact("store");
				
			}
			prescriptionToMedical.setDelStatus(0);
			prescriptionToMedical.setDoctorId(products.getDoctorId());
			prescriptionToMedical.setEmail("email");
			prescriptionToMedical.setInt1(0);
			prescriptionToMedical.setInt2(0);
			prescriptionToMedical.setMedicalId(medicalId);
			System.out.println("products.getMeetId():"+products.getMeetId());
			prescriptionToMedical.setMeetId(products.getMeetId());
			prescriptionToMedical.setPatientId(products.getPatintId());
			prescriptionToMedical.setPaymentStatus(0);
			prescriptionToMedical.setStatus(0);
			prescriptionToMedical.setString1("1");
			prescriptionToMedical.setString2("1");
			prescriptionToMedical.setTotalAmt(0);
				
			System.out.println("first:"+prescriptionToMedical.toString());
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
     		map.add("cartId",productsId);
		
			 info =Constant.getRestTemplate().postForObject(Constant.url + "insertOrderPrescription", prescriptionToMedical, PrescriptionToMedical.class);
			 Info info1 =Constant.getRestTemplate().postForObject(Constant.url + "deleteCartItem", map, Info.class);
			 
			 
			
			if(info==null)
			{
				message=2;
				return "redirect:/showOrderMedicinePage";
			}
				}
					
			}
			
			}		
				
				if(info!=null)
				{
					message=1;
				}
				
				
			
				 return "redirect:/showOrderMedicinePage";
			
		}
	 
	 @RequestMapping(value = "/showMyOder", method = RequestMethod.GET)
		public ModelAndView showMyOder(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = new ModelAndView("patient/myOrder");
			List<GetMedicalOrderDetails> getPatientOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
			List<GetMedicalOrderDetails> getPatientUploadPriscriptionOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
			List<PatientDetails> patientDetailList = new ArrayList<PatientDetails>();
			HttpSession session = request.getSession();
			PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
			mapfam.add("familyId", "" + patientDetails.getFamilyId());
			
			String patientId = request.getParameter("patientId");
			String month = request.getParameter("month");
			
			if(patientId!=null)
			{
			map.add("patientId",Integer.parseInt(patientId));
			map.add("month",Integer.parseInt(month));
			}
			else
			{
			map.add("patientId",patientDetails.getPatientId());
			map.add("month",1);
			}
			
			try {
				patientDetailList =Constant.getRestTemplate().postForObject(Constant.url + "getPatientFamilyMembersList",
						mapfam, List.class);
				
						
				getPatientOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getPatientOrderDetailsByPatientIdAndDate",
						map, List.class);
			
				getPatientUploadPriscriptionOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPrescriptionPatientOrderDetailsByPatientIdAndDate",
						map, List.class);
				
				System.out.println("getPatientOrderDetailsList:"+getPatientUploadPriscriptionOrderDetailsList.toString());
				
				
				model.addObject("PatientOrderDetailsList1", getPatientUploadPriscriptionOrderDetailsList);
				model.addObject("PatientOrderDetailsList", getPatientOrderDetailsList);
				model.addObject("orderViewActive", "active");
				model.addObject("patientDetailList",patientDetailList);
				model.addObject("patientId",patientId);
				model.addObject("month",month);
			} catch (Exception e) {
				e.printStackTrace();
				LOGGER.error("Error while Getting showMyOder in PatientOrderMedicineController", e);
				throw new RuntimeException("Error while Getting showMyOder in PatientOrderMedicineController", e);
			}
			return model;

		}
		
	 @RequestMapping(value = "/showMyAllOder", method = RequestMethod.GET)
		public @ResponseBody List<GetMedicalOrderDetails> showMyAllOder(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = new ModelAndView("patient/myOrder");
			List<GetMedicalOrderDetails> getPatientOrderDetailsList = new ArrayList<GetMedicalOrderDetails>();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
											
			String patientId = request.getParameter("patientId");
				
			map.add("patientId",Integer.parseInt(patientId));
			
			
			try {
				getPatientOrderDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getPatientAllOrderDetailsByPatientId",
						map, List.class);
				
			} catch (Exception e) {
				LOGGER.error("Error while Getting showMyAllOder in PatientOrderMedicineControllerr", e);
				throw new RuntimeException("Error while Getting showMyAllOder in PatientOrderMedicineController", e);
			}
			return getPatientOrderDetailsList;

		}
	 
	 @RequestMapping(value = "/cancelOrder", method = RequestMethod.GET)
		public @ResponseBody Info cancelOrder(HttpServletRequest request, HttpServletResponse response) {

		    int requestId = Integer.parseInt(request.getParameter("requestId"));
		 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();											
				
			map.add("medicalRequestId",requestId);
			Info info = new Info();
			
			
			try {
				info =Constant.getRestTemplate().postForObject(Constant.url + "cancelOrder",
						map, Info.class);
				
			} catch (Exception e) {
				LOGGER.error("Error whilecancelOrder in PatientOrderMedicineController", e);
				throw new RuntimeException("Error while cancelOrder in PatientOrderMedicineController", e);
			}
			return info;

		}
	 
	 @RequestMapping(value = "/cancelUploadedPrescriptionOrder", method = RequestMethod.GET)
		public @ResponseBody Info cancelUploadedPrescriptionOrder(HttpServletRequest request, HttpServletResponse response) {

		    int requestId = Integer.parseInt(request.getParameter("requestId"));
		 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();											
				
			map.add("medicalRequestId",requestId);
			Info info = new Info();
			
			
			try {
				info =Constant.getRestTemplate().postForObject(Constant.url + "cancelUploadedPrescriptionOrder",
						map, Info.class);
				
			} catch (Exception e) {
				LOGGER.error("Error whilecancelOrder in PatientOrderMedicineController", e);
				throw new RuntimeException("Error while cancelOrder in PatientOrderMedicineController", e);
			}
			return info;

		}
	 
	 
	 @RequestMapping(value = "/getOrederDetailsByRequetId", method = RequestMethod.GET)
		public  ModelAndView getOrederDetailsByRequetId(HttpServletRequest request, HttpServletResponse response) {

		 ModelAndView model=new ModelAndView("patient/orderdetails");
		 
		    int requestId = Integer.parseInt(request.getParameter("requestId"));
		 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();															
			map.add("requestId",requestId);
			
			GetMedicalOrderDetails getMedicalOrderDetails = new GetMedicalOrderDetails();
			
			
			try {
				getMedicalOrderDetails =Constant.getRestTemplate().postForObject(Constant.url + "getPatientOrderDetailsByRequestId",
						map, GetMedicalOrderDetails.class);
				
			} catch (Exception e) {
				LOGGER.error("Error whilecancelOrder in PatientOrderMedicineController", e);
				throw new RuntimeException("Error while cancelOrder in PatientOrderMedicineController", e);
			}
			model.addObject("getMedicalOrderDetails", getMedicalOrderDetails);
			return model;

		}
	 
	 @RequestMapping(value = "/getUploadedOrderDetailsByRequestId", method = RequestMethod.GET)
		public  ModelAndView getUploadedOrderDetailsByRequestId(HttpServletRequest request, HttpServletResponse response) {

		 ModelAndView model=new ModelAndView("patient/orderdetails");
		 
		    int requestId = Integer.parseInt(request.getParameter("requestId"));
		 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();															
			map.add("requestId",requestId);
			
			GetMedicalOrderDetails getMedicalOrderDetails = new GetMedicalOrderDetails();
			
			
			try {
				getMedicalOrderDetails =Constant.getRestTemplate().postForObject(Constant.url + "getUploadedPresPatientOrderDetailsByRequestId",
						map, GetMedicalOrderDetails.class);
				
				System.out.println("getMedicalOrderDetails="+getMedicalOrderDetails.toString());
			} catch (Exception e) {
				LOGGER.error("Error whilecancelOrder in PatientOrderMedicineController", e);
				throw new RuntimeException("Error while cancelOrder in PatientOrderMedicineController", e);
			}
			model.addObject("getMedicalOrderDetails", getMedicalOrderDetails);
			return model;

		}

	 @RequestMapping(value = "/showPharmacyBill/{requestToMedicalId}/{meetId}", method = RequestMethod.GET)
		public ModelAndView showPharmacyBill(HttpServletRequest request, HttpServletResponse response,@PathVariable("requestToMedicalId") int requestToMedicalId,@PathVariable("meetId") int meetId) {
			 
			ModelAndView model = new ModelAndView("pharmacy/pharma_billing");
			GetMedicalOrderDetails getMedicalOrderDetails = new GetMedicalOrderDetails();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();															
			map.add("requestId",requestToMedicalId);
			try {
				getMedicalOrderDetails =Constant.getRestTemplate().postForObject(Constant.url + "getPatientOrderDetailsByRequestId",
						map, GetMedicalOrderDetails.class);
				
			} catch (Exception e) {
				LOGGER.error("Error whilecancelOrder in PatientOrderMedicineController", e);
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
	 
	 
	 @RequestMapping(value="/showSelfUploadedPrescriptionOrderPage", method=RequestMethod.GET)

	 public ModelAndView showPatientBankDetl(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("patient/selfUploadedPrescriptionOrder");
	 	
	 	HttpSession session = request.getSession();
		PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("patientId",+patientDetails.getPatientId());
	 	
		MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
		mapfam.add("familyId", ""+patientDetails.getFamilyId());
		
	 	try {
	 		List<MedicalDetails> medicalDetailsList = new ArrayList<MedicalDetails>();
	 		medicalDetailsList =Constant.getRestTemplate().postForObject(Constant.url + "getMedicalsByPatientId", map, List.class);
	 		
	 	
	 		List<PatientDetails> patientDetailList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientFamilyMembersList", mapfam, List.class);
	 		
	 		
	 		
	 		
	 		model.addObject("medicalDetailsList", medicalDetailsList);
			model.addObject("patientDetailList", patientDetailList);
			model.addObject("memberLength", patientDetailList.size());
			model.addObject("patientAddressDetails", patientAddressDetails);
			model.addObject("name", patientDetails.getfName()+" "+patientDetails.getlName());
			model.addObject("orderActive", "active");
			model.addObject("message", message);
			model.addObject("allPatientAddressList", allPatientAddressList);
	 		
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditPatientBankDetails", e);
		}
	 	
	 	return model;
	 	
	 }
}
