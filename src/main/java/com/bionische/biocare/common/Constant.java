package com.bionische.biocare.common;

import java.util.Random;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constant {

	public static final String url = "http://biowebapi.ap-south-1.elasticbeanstalk.com/";
	public static final String BASE_URL = "https://www.bionische.com/";
	public static String S3_URL = "https://elasticbeanstalk-ap-south-1-724717550681.s3.ap-south-1.amazonaws.com/";
	
	public static final String VIDEOCALLURL = BASE_URL + "videoCallWeb";

	// Payment
	public static final String DOCTOR_SUSCRIPTION_RESPONSE_URL = BASE_URL + "response";
	public static final String LABREPORT_PAYMENT_RESPONSE_URL = BASE_URL + "labReportPaymentResponse";
	public static final String PATIENTMEDICINE_PAYMENT_RESPONSE_URL = BASE_URL + "patientMedicinePaymentResponse";
	public static final String CONSULTING_PAYMENT_RESPONSE_URL = BASE_URL + "consultingPaymentResponse";
	public static final String PATIENT_SUSCRIPTION_PAYMENT_RESPONSE_URL = BASE_URL
			+ "patientSuscriptionPaymentResponse";
	public static final String LAB_SUSCRIPTION_PAYMENT_RESPONSE_URL = BASE_URL + "labSuscriptionPaymentResponse";
	public static final String PHARMACY_SUSCRIPTION_PAYMENT_RESPONSE_URL = BASE_URL
			+ "pharmacySuscriptionPaymentResponse";
	// <payment>
//<static images>
	public static String emptyPhoto = BASE_URL + "resources/images/profile-p.jpg";
	public static String patientProfile = BASE_URL + "resources/images/profile-p.jpg";
	public static String labProfileImage = BASE_URL + "resources/images/profile-p.jpg";
	//<static images>
	
	//<Files Url>
	public static String patientUrl = S3_URL + "patient/";
	public static String doctorUrl = S3_URL + "doctor/";
	public static String labUrl = S3_URL + "lab/";
	public static String pharmacyUrl = S3_URL + "pharmacy/";
	public static String dmcFileUrl = S3_URL + "patient/";
	public static final String ADVERTISE = S3_URL + "advertise/";
	public static final String BLOGS = S3_URL + "blogs/";
	
	//<Files Url>
	
//<User Types>
	public static int birthReportId = 1; // Birth report test id
	public static int DOCTOR_USER_TYPE = 0;
	public static int PATIENT_USER_TYPE = 1;
	public static int LAB_USER_TYPE = 2;
	public static int PHARMACY_USER_TYPE = 3;

	//<User Types>
	 

	public static float referalAmount = 25;
	public static boolean isConnected;

	
	
	public static RestTemplate rest = new RestTemplate();

	public static RestTemplate getRestTemplate() {
		rest = new RestTemplate();
		rest.getInterceptors().add(new BasicAuthorizationInterceptor("admin1", "secret1"));
		return rest;

	}
/*<Generate OTP>*/
	public static char[] generateOTP(int length) {
		String numbers = "1234567890";
		System.out.println("OTP Length :" + length);
		Random random = new Random();
		char[] otp = new char[length];

		for (int i = 0; i < length; i++) {
			otp[i] = numbers.charAt(random.nextInt(numbers.length()));
		}
		return otp;
	}
	/*<Generate OTP>*/
}
