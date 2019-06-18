package com.bionische.biocare.patient.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class YogitaController {
	 @RequestMapping(value="/showAppLink", method=RequestMethod.GET)
		
		public ModelAndView showAppLink(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("applink");
			
			
			return model;
			
		} 
	@RequestMapping(value="/showMyOrders", method=RequestMethod.GET)
	
	public ModelAndView showMyOrders(HttpServletRequest request,
			HttpServletResponse response)
	{
	  
		ModelAndView model=new ModelAndView("patient/myOrder");
		
		
		return model;
		
	}
	 @RequestMapping(value="/showReferralCode", method=RequestMethod.GET)
		
		public ModelAndView showReferralCode(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("referralcode");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showAddToCart", method=RequestMethod.GET)
		
		public ModelAndView showAddToCart(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/addToCart");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showDocRegistration", method=RequestMethod.GET)

	 public ModelAndView showDocRegistration(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("doctor/registor-doc");
	 	
	 	
	 	return model;
	 	
	 }
	 
	 @RequestMapping(value="/showPatient1Registration", method=RequestMethod.GET)

	 public ModelAndView showPatientRegistration(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("patient/registor-patient");
	 	
	 	
	 	return model;
	 	
	 }
	 
	 @RequestMapping(value="/showLab1Registration", method=RequestMethod.GET)

	 public ModelAndView showLabRegistration(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("lab/registor-lab");
	 	
	 	
	 	return model;
	 	
	 }
	 
	 @RequestMapping(value="/showSessionTimeOut", method=RequestMethod.GET)

	 public ModelAndView showSessionTimeOut(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("sessiontimeout");
	 	
	 	
	 	return model;
	 	
	 }
	 
	 @RequestMapping(value="/showErrorPage", method=RequestMethod.GET)

	 public ModelAndView showErrorPage(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("errorpage");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showExistPage", method=RequestMethod.GET)

	 public ModelAndView showExistPage(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("patient/existPage");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showExistDetail", method=RequestMethod.GET)

	 public ModelAndView showExistDetail(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("patient/existDetail");
	 	
	 	
	 	return model;
	 	
	 }
	 
	 @RequestMapping(value="/showReverification", method=RequestMethod.GET)

	 public ModelAndView showReverification(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("doctor/reverification");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showViewOrderPharmImage", method=RequestMethod.GET)

	 public ModelAndView showViewOrderPharmImage(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("pharmacy/viewOrderToPharmImage");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showPreviousVideo", method=RequestMethod.GET)

	 public ModelAndView showPreviousVideo(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("patient/previousVideo");
	 	
	 	
	 	return model;
	 	
	 }
	
	 @RequestMapping(value="/showblogPg", method=RequestMethod.GET)

	 public ModelAndView showblogPg(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("blogPg");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showExamTablet", method=RequestMethod.GET)

	 public ModelAndView showExamTablet(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("examTablet");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showWaitingPoster", method=RequestMethod.GET)

	 public ModelAndView showWaitingPoster(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("waitingPoster");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showWaitingRoom", method=RequestMethod.GET)

	 public ModelAndView showWaitingRoom(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("waitingRoom");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showInfusionTablet", method=RequestMethod.GET)

	 public ModelAndView showInfusionTablet(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("infusionTablet");
	 	
	 	
	 	return model;
	 	
	 }
	 @RequestMapping(value="/showWallboard", method=RequestMethod.GET)

	 public ModelAndView showWallboard(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("wallboard");
	 	
	 	
	 	return model;
	 	
	 }
	
	
	
	 
	 /* @RequestMapping(value="/showlabHistory", method=RequestMethod.GET)
		
		public ModelAndView showlabHistory(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("lab/labHistory");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showOnlineConsult", method=RequestMethod.GET)
		
		public ModelAndView showOnlineConsult(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("doctor/show_online_consulting");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showPatientReports2", method=RequestMethod.GET)
		
		public ModelAndView showPatientReports2(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("patient/patientReports2");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showWallet", method=RequestMethod.GET)
		
		public ModelAndView showWallet(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("wallet");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showWallet2", method=RequestMethod.GET)
		
		public ModelAndView showWallet2(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("wallet2");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showDocAvailable", method=RequestMethod.GET)
		
		public ModelAndView showDocAvailable(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("docAvailable");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showLabtest", method=RequestMethod.GET)
		
		public ModelAndView showLabtest(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("labtests");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showOrderMedicine", method=RequestMethod.GET)
		
		public ModelAndView showOrderMedicine(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("order-medicine");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showConsultinghome", method=RequestMethod.GET)
		
		public ModelAndView showConsultinghome(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("consulthome"); 
			
			
			return model;
			
			
		}
	 @RequestMapping(value="/showEditLabProfile", method=RequestMethod.GET)
		
		public ModelAndView showEditLabProfile(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("lab/editLabProfile");
			
			
			return model;
			
		}
	 @RequestMapping(value="/ShowViewPatientOrder", method=RequestMethod.GET)
		
		public ModelAndView ShowViewPatientOrder(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("patient/viewOrder");
			
			
			return model; 
			
		}
	 @RequestMapping(value="/ShowContactUs", method=RequestMethod.GET)
		
		public ModelAndView ShowContactUs(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("contactus");
			
			
			return model; 
			
		}
	
	 
	
	
	 
	 @RequestMapping(value="/showHealthInsurance", method=RequestMethod.GET)
		
		public ModelAndView showHealthInsurance(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("insurance/healthInsuranceEnquiry2");
			
			
			return model; 
			
		}
	 @RequestMapping(value="/showotpPage", method=RequestMethod.GET) 
		
		public ModelAndView showotpPage(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("otpPage");
			
			
			return model; 
			
		}
	 @RequestMapping(value="/showAllReviews", method=RequestMethod.GET) 
		
		public ModelAndView showAllReviews(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("doctor/allReviews");
			
			
			return model; 
			
		}
	 @RequestMapping(value="/showLabReviews", method=RequestMethod.GET) 
		
		public ModelAndView showLabReviews(HttpServletRequest request,
				HttpServletResponse response)
		{
		   
			ModelAndView model=new ModelAndView("lab/allReviews");
			
			
			return model; 
			
		}
	
	 @RequestMapping(value="/showNotification", method=RequestMethod.GET)
		
		public ModelAndView showNotification(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/notification");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showClinic", method=RequestMethod.GET)
		
		public ModelAndView showClinic(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("doctor/addnewclinic");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showmyCart", method=RequestMethod.GET)
		
		public ModelAndView showmyCart(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/myCart");
			
			
			return model;
			
		}
	 @RequestMapping(value="/showrevieworder", method=RequestMethod.GET)
		
		public ModelAndView showrevieworder(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("patient/review-order");
			
			
			return model;
			
		}
	 

@RequestMapping(value="/showbookdrapp", method=RequestMethod.GET)
	
	public ModelAndView showbookdrapp(HttpServletRequest request,
			HttpServletResponse response)
	{
	  
		ModelAndView model=new ModelAndView("patient/bookDoctorAppointment");
		
		
		return model;
		
	}
@RequestMapping(value="/showOrderHistory", method=RequestMethod.GET)

public ModelAndView showOrderHistory(HttpServletRequest request,
		HttpServletResponse response)
{
  
	ModelAndView model=new ModelAndView("pharmacy/ordersHistory");
	
	
	return model;
	
}
@RequestMapping(value="/showViewOrderPharm", method=RequestMethod.GET)

public ModelAndView showViewOrderPharm(HttpServletRequest request,
		HttpServletResponse response)
{
  
	ModelAndView model=new ModelAndView("pharmacy/viewOrderToPharmacy");
	
	
	return model;
	
}


@RequestMapping(value="/showcompletedOrders", method=RequestMethod.GET)

public ModelAndView showcompletedOrders(HttpServletRequest request,
		HttpServletResponse response)
{
  
	ModelAndView model=new ModelAndView("pharmacy/completedOrders");
	
	
	return model;
	
}
@RequestMapping(value="/showAddHospital", method=RequestMethod.GET)

public ModelAndView showAddHospital(HttpServletRequest request,
		HttpServletResponse response)
{
  
	ModelAndView model=new ModelAndView("doctor/addHospital");
	
	
	return model;
	
}
@RequestMapping(value="/showEditHospital", method=RequestMethod.GET)

public ModelAndView showEditHospital(HttpServletRequest request,
		HttpServletResponse response)
{
  
	ModelAndView model=new ModelAndView("doctor/editHospital");
	
	
	return model;
	
}*/
	 @RequestMapping(value="/showPrescription", method=RequestMethod.GET)
		
		public ModelAndView showPrescription(HttpServletRequest request,
				HttpServletResponse response)
		{
		  
			ModelAndView model=new ModelAndView("doctor/prescription");
			
			
			return model;
			
		} 

}


