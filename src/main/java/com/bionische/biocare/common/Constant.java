package com.bionische.biocare.common;

import java.util.Arrays;
import java.util.Random;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;
public class Constant {

//public static final String url="http://104.238.116.176:8080/bioWebApi/";
 public static final String VIDEOCALLURL="https://www.bionische.com/biocare/videoCallWeb";
 //public static final String VIDEOCALLURL="http://localhost:8082/biocare/videoCallWeb";
public static final String url="http://localhost:8054/";

/*   public static final String DOCTOR_SUSCRIPTION_RESPONSE_URL="http://localhost:8085/biocare/response";
public static final String LABREPORT_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/labReportPaymentResponse";
public static final String PATIENTMEDICINE_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/patientMedicinePaymentResponse";
public static final String CONSULTING_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/consultingPaymentResponse";
public static final String PATIENT_SUSCRIPTION_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/patientSuscriptionPaymentResponse";
public static final String LAB_SUSCRIPTION_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/labSuscriptionPaymentResponse";
public static final String PHARMACY_SUSCRIPTION_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/pharmacySuscriptionPaymentResponse";
 */
//public static final String PATIENT_SUSCRIPTION_PAYMENT_RESPONSE_URL = "http://localhost:8025/biocare/patientSuscriptionPaymentResponse";

//public static final String CONSULTING_PAYMENT_RESPONSE_URL = "http://localhost:8085/biocare/consultingPaymentResponse";
//public static final String PATIENT_SUSCRIPTION_PAYMENT_RESPONSE_URL = "http://localhost:8082/biocare/patientSuscriptionPaymentResponse";

 public static final String DOCTOR_SUSCRIPTION_RESPONSE_URL="https://www.bionische.com/biocare/response";
public static final String LABREPORT_PAYMENT_RESPONSE_URL = "https://www.bionische.com/biocare/labReportPaymentResponse";
 
public static final String PATIENTMEDICINE_PAYMENT_RESPONSE_URL = "https://www.bionische.com/biocare/patientMedicinePaymentResponse";
public static final String CONSULTING_PAYMENT_RESPONSE_URL = "https://www.bionische.com/biocare/consultingPaymentResponse";
public static final String PATIENT_SUSCRIPTION_PAYMENT_RESPONSE_URL = "https://www.bionische.com/biocare/patientSuscriptionPaymentResponse";
public static final String LAB_SUSCRIPTION_PAYMENT_RESPONSE_URL = "https://www.bionische.com/biocare/labSuscriptionPaymentResponse";
public static final String PHARMACY_SUSCRIPTION_PAYMENT_RESPONSE_URL = "https://www.bionische.com/biocare/pharmacySuscriptionPaymentResponse";
 

public static final String ReportURL = "https://www.bionische.com/";
//public static final String ReportURL = "http://localhost:8085/biocare/";
public static final String PDF_PATH = "E:\\ss\\ordermemo221.pdf";
  public static boolean isConnected;
	
	//public static  final String reportsImage="\\\\192.168.0.110\\reports\\";

	public static String patientUrl="https://www.bionische.com/images/patient/";
	public static String doctorUrl="https://www.bionische.com/images/doctor/";
	public static String labUrl="https://www.bionische.com/images/lab/";
	public static String pharmacyUrl="https://www.bionische.com/images/pharmacy/";
	public static String emptyPhoto="https://www.bionische.com/biocare/resources/images/profile-p.jpg";;
	public static String dmcFileUrl="https://www.bionische.com/images/patient/";
	public static final String ADVERTISE="https://www.bionische.com/images/advertise/";
	public static final String BLOGS="https://www.bionische.com/images/blogs/";
	
	public static int birthReportId=1;  //Birth report test id 
	  public static int DOCTOR_USER_TYPE=0;
	  public static int PATIENT_USER_TYPE=1;
	  public static int LAB_USER_TYPE=2;
	  public static int PHARMACY_USER_TYPE=3;
	
   // public static String reportsImage="images/";
  
	//public static String reportUrl="\\192.168.0.109\\images\\";
	
	
	public static String patientProfile="https://www.bionische.com/biocare/resources/images/profile-p.jpg";


	public static String labProfileImage="https://www.bionische.com/biocare/resources/images/profile-p.jpg";

	//For security
	public static RestTemplate rest=new RestTemplate();

	public static float referalAmount=25;
	
	

	//public static String reportUrl="\\\\192.168.0.110\\reports\\";
	
	 
		/*  public static HttpHeaders getHeaders() {
			String plainCredentials = "admin:admin";
			String base64Credentials = new String(Base64.encodeBase64(plainCredentials.getBytes()));

			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "Basic " + base64Credentials);
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			return headers;
		} */
	
		public static RestTemplate getRestTemplate() {
			rest=new RestTemplate();
			rest.getInterceptors().add(new BasicAuthorizationInterceptor("admin1", "secret1"));
			return rest;

			}
		public static char[] generateOTP(int length) {
		      String numbers = "1234567890";
		      System.out.println("OTP Length :"+length);
		      Random random = new Random();
		      char[] otp = new char[length];

		      for(int i = 0; i< length ; i++) {
		         otp[i] = numbers.charAt(random.nextInt(numbers.length()));
		      }
		      return otp;
		   }
}
