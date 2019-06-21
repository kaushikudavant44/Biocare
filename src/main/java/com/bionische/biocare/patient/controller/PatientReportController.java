package com.bionische.biocare.patient.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
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
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.common.s3.AmazonS3ClientService;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.lab.model.GetPatientReports;
import com.bionische.biocare.lab.model.LabTestsList;
import com.bionische.biocare.lab.model.PatientReportsDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patientdoctor.model.SharingReportWithDoc;
import com.bionische.biocare.patientlab.model.BabyBornReports;
import com.bionische.biocare.patientlab.model.GetLabAppointment;

@Scope("session")
@Controller
public class PatientReportController {
	
	
	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	String message;
	//HttpEntity<String> req = new HttpEntity<String>(Constant.getHeaders());
	public final Log LOGGER = LogFactory.getLog(PatientReportController.class);

	
	@RequestMapping(value="/showPatienReportPage", method=RequestMethod.GET)

	public ModelAndView showPatienReportPage(HttpServletRequest request)
	{
		ModelAndView model=new ModelAndView("patient/patientReports");
		
		RestTemplate rest=new RestTemplate();
		
		HttpSession session = request.getSession();
		PatientDetails patientDetail=	(PatientDetails)session.getAttribute("patientDetails");
	    int patientId=patientDetail.getPatientId();
		
	    MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("familyId", ""+patientDetail.getFamilyId());
		
		  LabTestsList labTestsList = new LabTestsList(); 
		  labTestsList=Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",LabTestsList.class);
		 System.out.println("lab test"+labTestsList.toString());
		MultiValueMap<String, Object> mapTest=new LinkedMultiValueMap<String, Object>();
		mapTest.add("patientId", patientId);
		LabTestsList labTestsListOfPatient =Constant.getRestTemplate().getForObject(Constant.url + "getAllLabTests", LabTestsList.class);
		try {
			List<PatientDetails> patientDetailList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientFamilyMembersList",map, List.class);		
			
			System.out.println("csca"+patientDetailList.toString());
			
			model.addObject("message", message);
			model.addObject("reportActive", "active");
			model.addObject("patientDetailList", patientDetailList);
			model.addObject("memberLength", patientDetailList.size());
			model.addObject("labTestsList", labTestsList.getLabTestsList());
			model.addObject("labTestsListPatient",labTestsListOfPatient.getLabTestsList());
			message="";
			
		}catch (Exception e) {
			
			LOGGER.error("Error while showPatienReportPage.",e);
			throw new RuntimeException("Error while showPatienReportPage.",e);
		}
		
		
		return model;
		
	}	
	
	
	@RequestMapping(value="/getPatientReportByPatient", method=RequestMethod.GET)

	public @ResponseBody ModelAndView getPatientReportByPatient(HttpServletRequest request)
	{
		ModelAndView model=new ModelAndView("patient/viewPatientReport");
		
	//	GetPatientLabReportAndBornReports getPatientLabReportAndBornReports=new GetPatientLabReportAndBornReports();
		//List<DoctorDetails> doctorDetails=new ArrayList<DoctorDetails>();
		
		String patientId=request.getParameter("patientId") ;
		String fromDate=DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate=DateConverter.convertToYMD(request.getParameter("toDate"));
		/* String testType=request.getParameter("testType") ; */
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("patientId",patientId);
		

		MultiValueMap<String, Object> mapDoc=new LinkedMultiValueMap<String, Object>();
		mapDoc.add("patientId",patientId);
		 
		
		try {
			
				map.add("fromDate",fromDate);
				map.add("toDate",toDate);
				List<GetPatientReports> getPatientReportsList=Constant.getRestTemplate().postForObject(Constant.url+"lab/getPatientReportsByPatientId", map, List.class);
			model.addObject("getPatientReportsList",getPatientReportsList);
			 
			List<DoctorDetails> doctorDetails=Constant.getRestTemplate().postForObject(Constant.url+"getDoctorsByPatientApp",mapDoc,List.class);
			model.addObject("doctorDetails",doctorDetails);
		System.out.println("getPatientReportsList" +getPatientReportsList.toString());
		}
		
		catch (Exception e) {
			
			LOGGER.error("Error while getPatientReportByPatient.",e);
			throw new RuntimeException("Error while getPatientReportByPatient.",e);
		}
		
		 
	
		model.addObject("reportUrl", Constant.patientUrl);
		model.addObject("patientId",patientId);
		model.addObject("reportActive", "active");
		
		model.addObject("dcmFileUrl",Constant.dmcFileUrl);
		System.out.println("dcmFileUrl "+Constant.dmcFileUrl);
		return model;
	}
	
	@RequestMapping(value="/sharePatientReportWithDoc", method=RequestMethod.GET)
	public @ResponseBody Info sharePatientReportWithDoc(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("registration/doctorRegistration");
		
		SharingReportWithDoc sharingReportWithDoc=new SharingReportWithDoc();
		
		sharingReportWithDoc.setPatientId(Integer.parseInt(request.getParameter("patId")));
		sharingReportWithDoc.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
		sharingReportWithDoc.setReportId(request.getParameter("newStr"));
		sharingReportWithDoc.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		sharingReportWithDoc.setDelStatus(Integer.parseInt("0"));
		sharingReportWithDoc.setString1("1");
		sharingReportWithDoc.setString2("1");
		sharingReportWithDoc.setInt1(0);
		sharingReportWithDoc.setInt2(0);
		
		Info info = new Info();
		RestTemplate rest=new RestTemplate();
		try {
			info=Constant.getRestTemplate().postForObject(Constant.url+"submitSharingReportWithDoc",sharingReportWithDoc,Info.class);
		System.out.println("infoinfo:"+info.toString());
		}
catch (Exception e) {
			
			LOGGER.error("Error while sharePatientReportWithDoc.",e);
			throw new RuntimeException("Error while sharePatientReportWithDoc.",e);
		}		
		return info;
		
	}
	
	 @RequestMapping(value="/showpatientUpldReports", method=RequestMethod.GET)
		
		public ModelAndView showpatientUpldReports(HttpServletRequest request,
				HttpServletResponse response)
		{
		    
			RestTemplate rest=new RestTemplate();

			ModelAndView model=new ModelAndView("patient/patientUpldReports");
			
			HttpSession session = request.getSession();
			PatientDetails patientDetail=	(PatientDetails)session.getAttribute("patientDetails");
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
			map.add("familyId", ""+patientDetail.getFamilyId());
		    
			try
			{
			List<PatientDetails> patientDetailList=Constant.getRestTemplate().postForObject(Constant.url+"getPatientFamilyMembersList",map, List.class);
			
			LabTestsList labTestsList = new LabTestsList();
			labTestsList=Constant.getRestTemplate().getForObject(Constant.url + "/getAllLabTests",LabTestsList.class);
	
			model.addObject("patientDetail",patientDetailList);
			model.addObject("labTestsList",labTestsList.getLabTestsList());
			}
			catch (Exception e) {
				
				LOGGER.error("Error while showpatientUpldReports.",e);
				throw new RuntimeException("Error while showpatientUpldReports.",e);
			}
			return model;
			
		}
	 

@RequestMapping(value="/submitOwnReportsByPatient", method=RequestMethod.POST)

public String submitOwnRepotsByPatient(@RequestParam("reportFile") List<MultipartFile> reportFile, HttpServletRequest request,HttpServletResponse response) throws IOException   
{
	 
	int testId =Integer.parseInt(request.getParameter("testId"));
	int patientId=Integer.parseInt(request.getParameter("patientId"));
	 
	 
		  PatientReportsDetails patientReportsDetails=new PatientReportsDetails();
		 
		 
		   try {
		    MultipartFile file = reportFile.get(0);
			String fileName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
					+ testId + VpsImageUpload.getFileExtension(file);
			 
			amazonS3ClientService.uploadFileToS3Bucket(file,fileName,"patient/" + patientId + "/reports/", true);

			patientReportsDetails.setFileName(fileName);
			patientReportsDetails.setLabTestId(testId);
			patientReportsDetails.setAppointmentId(0);
			patientReportsDetails.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			patientReportsDetails.setDelStatus(0);
			patientReportsDetails.setLabId(0);
			patientReportsDetails.setPatientId(patientId);
		 
				patientReportsDetails.setStatus(1);
			 

			if (VpsImageUpload.getFileExtension(file).equalsIgnoreCase(".PDF")) {
				patientReportsDetails.setFileType(0);
			} else if (VpsImageUpload.getFileExtension(file).equalsIgnoreCase(".DCM")) {
				patientReportsDetails.setFileType(2);
			} else {
				patientReportsDetails.setFileType(1);
			}
			
			PatientReportsDetails patientReportsDetailsRes = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/insertPatientReports", patientReportsDetails, PatientReportsDetails.class);
			
			message="Report Upload Successfully";
			     }
			     catch (Exception e) {
			    		message="Failed to Upload Report ";
						LOGGER.error("Error while submitOwnReportsByPatient.",e);
						throw new RuntimeException("Error while submitOwnReportsByPatient.",e);
					}
			    		 

	
	return "redirect:/showPatienReportPage";

}
	

@RequestMapping(value="/labReportPaymentByAppointmentId/{appointmentId}", method=RequestMethod.GET)

public String labReportPaymentByAppointmentId(@PathVariable("appointmentId")int appointmentId, HttpServletRequest request,HttpServletResponse response)  
{
	String url="";
	try {
		
		
		MultiValueMap<String, Object> mapAppoint = new LinkedMultiValueMap<String, Object>();
		mapAppoint.add("appointmentId", appointmentId);
		GetLabAppointment getLabAppointment = Constant.getRestTemplate().postForObject(
				Constant.url + "lab/getLabAppointmentByAppointmentId", mapAppoint, GetLabAppointment.class);
		 
		url="showViewAppointmentToPatient?viewPatientId="+getLabAppointment.getPatientId()+"&fromDate="+getLabAppointment.getDate()+"&toDate="+getLabAppointment.getDate()+"&viewAppType=1";
	} catch (Exception e) {
		LOGGER.error("Error while geting Lab appointment", e);
		// TODO: handle exception
		url="error";
	}
	
	   
	return "redirect:/"+url;
}

@RequestMapping(value="/getBabyReportByReportId", method=RequestMethod.GET)

public @ResponseBody BabyBornReports getBabyReportByPatientId(HttpServletRequest request)
{
	
	 int reportId=Integer.parseInt(request.getParameter("reportId"));
	
	try {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("reportId", reportId);
		BabyBornReports babyBornReports= Constant.getRestTemplate().postForObject(
				Constant.url + "getBabyBornReportsByReportId", map, BabyBornReports.class);
		return babyBornReports;
	}
	
	catch (Exception e) {
		
		LOGGER.error("Error while getPatientReportByPatient.",e);
		throw new RuntimeException("Error while getPatientReportByPatient.",e);
	}
}

}
