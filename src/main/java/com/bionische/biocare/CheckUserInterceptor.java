package com.bionische.biocare;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.pharmacy.model.MedicalDetails;

public class CheckUserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {

		HttpSession session = request.getSession();

		String path = request.getRequestURI().substring(request.getContextPath().length());

	//System.out.println("kk"+request.getContextPath());
				//substring(request.getContextPath().length()));
		
		HomeController.getOnLoadData();
		
		if (path.startsWith("/pdf")||path.startsWith("/showBlogsDetailsById")) {
			return true;
		}

		try {
			String resourcesPath = path.substring(1, 4);

			if (resourcesPath.equalsIgnoreCase("res")) {

				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		if (path.equalsIgnoreCase("/sessionTimeOut") || path.equalsIgnoreCase("/")
				|| path.equalsIgnoreCase("/doctorLoginProcess") || path.equalsIgnoreCase("/homePage")
				|| path.equalsIgnoreCase("/showDoctorLoginPage") || path.equalsIgnoreCase("/showPharmacyLoginPage")
				|| path.equalsIgnoreCase("/pharmacyLoginProcess") || path.equalsIgnoreCase("/showPatientLoginPage")
				|| path.equalsIgnoreCase("/patientLoginProcess") || path.equalsIgnoreCase("/showLabLoginPage")
				|| path.equalsIgnoreCase("/labLoginProcess") || path.equalsIgnoreCase("/showLabTest")
				|| path.equalsIgnoreCase("/showOrderMedicine") || path.equalsIgnoreCase("/showConsultinghome")
				|| path.equalsIgnoreCase("/showDoctorList") || path.equalsIgnoreCase("/getRes")
				|| path.equalsIgnoreCase("/getRes1") || path.equalsIgnoreCase("/submitPharmacyRegProcess")
				|| path.equalsIgnoreCase("/showPharmacyRegistrationPage")
				|| path.equalsIgnoreCase("/ShowForgotPassword") || path.equalsIgnoreCase("/ShowVerifyForgetPassword")
				|| path.equalsIgnoreCase("/submitVerificationCode")
				|| path.equalsIgnoreCase("/updtaePatientNewPassword")
				|| path.equalsIgnoreCase("/showPatientRegistrationPage")
				|| path.equalsIgnoreCase("/ShowPharmacyForgotPassword")
				|| path.equalsIgnoreCase("/ShowPharmacyVerifyForgetPassword")
				|| path.equalsIgnoreCase("/submitPharmacyPwdVerificationCode")
				|| path.equalsIgnoreCase("/usernameValidationOfPharmacy")
				|| path.equalsIgnoreCase("/updatepharmacyNewPassword")
				|| path.equalsIgnoreCase("/usernameValidationOfPharmacy")
				|| path.equalsIgnoreCase("/submitDoctorRegProcess")
				|| path.equalsIgnoreCase("/usernameValidationOfDoctor")
				|| path.equalsIgnoreCase("/showDoctorRegProcess")
				|| path.equalsIgnoreCase("/submitDoctorPwdVerificationCode")
				|| path.equalsIgnoreCase("/updtaeDocotrNewPassword")
				|| path.equalsIgnoreCase("/videoCallWeb")
				
				|| path.equalsIgnoreCase("/showLabRegistration") || path.equalsIgnoreCase("/usernameValidationOfLab")
				|| path.equalsIgnoreCase("/submitLabRegProcess") || path.equalsIgnoreCase("/ShowLabForgotPassword")
				|| path.equalsIgnoreCase("/ShowLabVerifyForgetPassword")
				|| path.equalsIgnoreCase("/submitLabPwdVerificationCode")
				|| path.equalsIgnoreCase("/updtaeLabNewPassword")
				|| path.equalsIgnoreCase("/getOnloadDoctorSpecialization")
				|| path.equalsIgnoreCase("/getSpecializationDoctorList")
				|| path.equalsIgnoreCase("/getMaleOrFemaleDoctor")
				|| path.equalsIgnoreCase("/getSortedDoctorsByExperiance")
				|| path.equalsIgnoreCase("/ShowDoctorForgotPassword")
				|| path.equalsIgnoreCase("/ShowDoctorVerifyForgetPassword")
				|| path.equalsIgnoreCase("/getStateByCountryId")
				|| path.equalsIgnoreCase("/getCityByStateId")
				|| path.equalsIgnoreCase("/submitPatientRegProcess")
				|| path.equalsIgnoreCase("/submitPatientInformation")
				|| path.equalsIgnoreCase("/userIdValidation")
				|| path.equalsIgnoreCase("/sendOtp")
				|| path.equalsIgnoreCase("/submitOTPandUsernameAndPwd")
				|| path.equalsIgnoreCase("/usernameValidation")
				|| path.equalsIgnoreCase("/sendTextOtp")
				|| path.equalsIgnoreCase("/ShowTermsnCondition")
				|| path.equalsIgnoreCase("/verifyRegOTP")
				|| path.equalsIgnoreCase("/showPatientTermsnCondition")
				|| path.equalsIgnoreCase("/verifyContactNumber")
				|| path.equalsIgnoreCase("/verifyDoctorEmail")
				|| path.equalsIgnoreCase("/verifyPatientEmail")
				|| path.equalsIgnoreCase("/verifyPatientContactNumber")
				|| path.equalsIgnoreCase("/verifyLabEmail")
				|| path.equalsIgnoreCase("/verifyLabContactNumber")
				|| path.equalsIgnoreCase("/verifyPharmacyEmail")
				|| path.equalsIgnoreCase("/verifyPharmacyContactNumber")
				|| path.equalsIgnoreCase("/showDoctorTermsnCondition")
				|| path.equalsIgnoreCase("/showLabTermsnCondition")
				|| path.equalsIgnoreCase("/showPharmacyTermsnCondition")
				|| path.equalsIgnoreCase("/getRatingDetailsByDoctorId")
				|| path.equalsIgnoreCase("/getHospitalClinicByDoctorId")
				|| path.equalsIgnoreCase("/showHomeOrderMedicine")
				|| path.equalsIgnoreCase("/showMerchantCheckoutPage")
				|| path.equalsIgnoreCase("/showPageRedirect")
				|| path.equalsIgnoreCase("/showPageResponse")
				|| path.equalsIgnoreCase("/patientSuscriptionPaymentResponse")
				|| path.equalsIgnoreCase("/patientSuscriptionPaymentGateway")
				|| path.equalsIgnoreCase("/patientSuscriptionPaymentCheckout")
				|| path.startsWith("/videocall")
				|| path.equalsIgnoreCase("/signaling")
				|| path.equalsIgnoreCase("/doctorSubscriptionReceipt")
				|| path.equalsIgnoreCase("/verifyReferal") 
				|| path.startsWith("/updateWalletAndTransactions")
				|| path.startsWith("/showDcmViewer")
				|| path.startsWith("/getOnloadCityByStateId")
				|| path.startsWith("/getOnloadCity")
				|| path.startsWith("/showAboutUs")
				|| path.startsWith("/searchUserNameForDoctorForgotPassword")
				|| path.startsWith("/verifyDoctorOpt")
				|| path.startsWith("/changeDoctorForgotPassword")
				|| path.startsWith("/verifyLabOpt")
				|| path.startsWith("/changeLabForgotPassword")
				|| path.startsWith("/searchUserNameForLabForgotPassword")
				|| path.startsWith("/verifyPharmacyOpt")
				|| path.startsWith("/changePharmacyForgotPassword")
				|| path.startsWith("/searchUserNameForPharmacyForgotPassword")
				|| path.startsWith("/verifyPatientOpt")
				|| path.startsWith("/changePatientForgotPassword")
				|| path.startsWith("/searchUserNameForPatientForgotPassword")
				|| path.startsWith("/biocare")
				|| path.contains(".html")
				|| path.startsWith("/error")
				
				)
			
			
			
		{

			return true;
		} else {

			PatientDetails patientDetails = null;
			DoctorDetails doctorDetails = null;
			LabDetails labDetail = null;
			
			MedicalDetails medicalDetails = null;

			try {

				medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
				doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
				patientDetails = (PatientDetails) session.getAttribute("patientDetails");
				labDetail = (LabDetails) session.getAttribute("labDetails");

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("path "+path);
				response.sendRedirect(request.getContextPath() + "/sessionTimeOut");
				return false;
			}

			if (medicalDetails == null && doctorDetails == null && patientDetails == null && labDetail == null && session.getAttribute("tempDetails")==null) {
System.out.println("path "+path);
				response.sendRedirect(request.getContextPath() + "/sessionTimeOut");
				return false;
			} 

			else {

				return true;
			}

			/*
			 * try { if(request.getServletPath().equals("/") ||
			 * request.getServletPath().equals("/loginProcess")
			 * ||request.getServletPath().equals("/logout")
			 * ||request.getServletPath().equals("/login")){
			 * //||request.getServletPath().equals("/logout")
			 * System.out.println("Login request"); return true; } else if( userObj == null
			 * ) { System.out.println("Session Expired");
			 * 
			 * // request.setAttribute("emassage", "login failed");
			 * response.sendRedirect(request.getContextPath()+"/sessionTimeOut");
			 * 
			 * return false; }else{ return true; } }catch (Exception e) {
			 * e.printStackTrace();
			 * response.sendRedirect(request.getContextPath()+"/sessionTimeOut");
			 * 
			 * return false; }
			 */

		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		super.postHandle(request, response, handler, modelAndView);
	}

}