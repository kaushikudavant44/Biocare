package com.bionische.biocare.lab.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.common.s3.AmazonS3ClientService;
import com.bionische.biocare.lab.model.GetPatientReports;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.lab.model.LabTests;
import com.bionische.biocare.lab.model.PatientReportsDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patientdoctor.model.SharingReportWithDoc;
import com.bionische.biocare.patientlab.model.GetLabAppointment;
import com.bionische.biocare.radiology.controller.PNDTPatientDetailsController;
import com.bionische.biocare.radiology.model.PNDTPatientDetails;

@Scope("session")
@Controller
public class LabReportsController {

	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	RestTemplate rest = new RestTemplate();
	Info info = new Info();
	String msg = "";
	List<LabTests> labTestsList;
	/* List<LabTests> labTestsList = new ArrayList<>(); */
	private static final Logger logger = LoggerFactory.getLogger(LabReportsController.class);

	@RequestMapping(value = "/showUploadLabRepots/{patientId}/{appoitId}", method = RequestMethod.GET)
	public ModelAndView showSploadLabRepots(@PathVariable("patientId") int patientId,
			@PathVariable("appoitId") int appoitId, HttpServletRequest request, HttpServletResponse response) {

		PatientDetails patientDetails = new PatientDetails();
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		ModelAndView model = new ModelAndView("lab/submitLabReport");
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("appointmentId", appoitId);
		MultiValueMap<String, Object> mapPatientId = new LinkedMultiValueMap<String, Object>();
		mapPatientId.add("patientId", patientId);
		try {
			patientDetails = Constant.getRestTemplate().postForObject(
					Constant.url + "getPatientDetailsWithCityNameById", mapPatientId, PatientDetails.class);

			ParameterizedTypeReference<List<LabTests>> typeRef = new ParameterizedTypeReference<List<LabTests>>() {
			};
			ResponseEntity<List<LabTests>> responseEntity = Constant.getRestTemplate().exchange(
					Constant.url + "lab/getLabTestByAppointmentId", HttpMethod.POST,
					new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			labTestsList = responseEntity.getBody();
			model.addObject("labTestsList", labTestsList);
		} catch (Exception e) {
			logger.error("Error while Show Upload Lab Reports", e);
			throw new RuntimeException("Error while Show Upload Lab Reports", e);
		}
		// model.addObject("labTestId", labTestId);
		
		
		model.addObject("patientDetails", patientDetails);
		model.addObject("appoitId", appoitId);
		model.addObject("appointActive", "active");
		return model;
	}

	@RequestMapping(value = "/submitLabReports", method = RequestMethod.POST)
	public String submitLabRepots(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int appointmentId = Integer.parseInt(request.getParameter("appoitId"));
		int paymentStstus = 0;
		String reportIdForShare="";
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		GetLabAppointment getLabAppointment=new GetLabAppointment();
		try {
			MultiValueMap<String, Object> mapAppoint = new LinkedMultiValueMap<String, Object>();
			mapAppoint.add("appointmentId", appointmentId);
			  getLabAppointment = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/getLabAppointmentByAppointmentId", mapAppoint, GetLabAppointment.class);
			if (getLabAppointment.getPaymentStatus() == 1)
				paymentStstus = 1;

		} catch (Exception e) {
			logger.error("Error while geting Lab appointment", e);
			// TODO: handle exception
		}
		final MultipartHttpServletRequest mfr = (MultipartHttpServletRequest) request;
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		StringBuilder fileNameList = new StringBuilder();
		if(labDetails.getIsRadiologist()==1) {
			
			   List<MultipartFile> files = mfr.getFiles("radiologistFiles");
			   System.out.println("Size of file is= "+files.get(0).getOriginalFilename());
			   int labTestId=Integer.parseInt(request.getParameter("labTestId"));
			   PatientReportsDetails patientReportsDetails = new PatientReportsDetails();
			   String fileName = null;
			   for(int i=0;i<files.size();i++) {
				   fileName= new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
						+ i + VpsImageUpload.getFileExtension(files.get(i));
				fileNameList.append(fileName+",");
				
				if(files.size()>1) {
				if (VpsImageUpload.getFileExtension(files.get(i)).equalsIgnoreCase(".PDF")) {
					patientReportsDetails.setFileType(0);
				} else if (VpsImageUpload.getFileExtension(files.get(i)).equalsIgnoreCase(".DCM")) {
					patientReportsDetails.setFileType(3);
				} else {
					patientReportsDetails.setFileType(1);
				}
				}else {
					if (VpsImageUpload.getFileExtension(files.get(i)).equalsIgnoreCase(".PDF")) {
						patientReportsDetails.setFileType(0);
					} else if (VpsImageUpload.getFileExtension(files.get(i)).equalsIgnoreCase(".DCM")) {
						patientReportsDetails.setFileType(2);
					} else {
						patientReportsDetails.setFileType(1);
					}
				
				}
			 
				
				amazonS3ClientService.uploadFileToS3Bucket(files.get(i),fileName,"patient/" + patientId + "/reports/", true);
			   }
				System.out.println("fileNameList= "+fileNameList.toString());
				patientReportsDetails.setFileName(fileNameList.substring(0, fileNameList.length() - 1));
				patientReportsDetails.setLabTestId(labTestId);
				patientReportsDetails.setAppointmentId(appointmentId);
				patientReportsDetails.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				patientReportsDetails.setDelStatus(0);
				patientReportsDetails.setLabId(labId);
				patientReportsDetails.setPatientId(patientId);
				if (paymentStstus == 1)
					patientReportsDetails.setStatus(1);
				else
					patientReportsDetails.setStatus(0);

			

				PatientReportsDetails patientReportsDetailsRes = Constant.getRestTemplate().postForObject(
						Constant.url + "lab/insertPatientReports", patientReportsDetails, PatientReportsDetails.class);

				if(getLabAppointment.getDoctorId()!=0) {
					
						reportIdForShare=patientReportsDetailsRes.getReportId()+"";
					
				}
			
			   
			
		}else {

		for (int i = 0; i < labTestsList.size(); i++) {
			MultipartFile file = mfr.getFile("reportFile" + labTestsList.get(i).getLabTestId());
			
			
			String fileName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
					+ labTestsList.get(i).getLabTestId() + VpsImageUpload.getFileExtension(file);

			System.out.println("filename"+fileName);
			 
			
			amazonS3ClientService.uploadFileToS3Bucket(file,fileName,"patient/" + patientId + "/reports/", true);
			
			PatientReportsDetails patientReportsDetails = new PatientReportsDetails();

			patientReportsDetails.setFileName(fileName);
			patientReportsDetails.setLabTestId(labTestsList.get(i).getLabTestId());
			patientReportsDetails.setAppointmentId(appointmentId);
			patientReportsDetails.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			patientReportsDetails.setDelStatus(0);
			patientReportsDetails.setLabId(labId);
			patientReportsDetails.setPatientId(patientId);
			if (paymentStstus == 1)
				patientReportsDetails.setStatus(1);
			else
				patientReportsDetails.setStatus(0);

			if (VpsImageUpload.getFileExtension(file).equalsIgnoreCase(".PDF")) {
				patientReportsDetails.setFileType(0);
			} else if (VpsImageUpload.getFileExtension(file).equalsIgnoreCase(".DCM")) {
				patientReportsDetails.setFileType(2);
			} else {
				patientReportsDetails.setFileType(1);
			}

			PatientReportsDetails patientReportsDetailsRes = Constant.getRestTemplate().postForObject(
					Constant.url + "lab/insertPatientReports", patientReportsDetails, PatientReportsDetails.class);

			if(getLabAppointment.getDoctorId()!=0) {
				if(i==0)
					reportIdForShare=patientReportsDetailsRes.getReportId()+"";
				else
				{
					reportIdForShare+=","+patientReportsDetailsRes.getReportId();
				}
			}
		}
		}
		if(getLabAppointment.getDoctorId()!=0) {
		SharingReportWithDoc sharingReportWithDoc=new SharingReportWithDoc();
		
		sharingReportWithDoc.setPatientId(patientId);
		sharingReportWithDoc.setDoctorId(getLabAppointment.getDoctorId());
		sharingReportWithDoc.setReportId(reportIdForShare);
		sharingReportWithDoc.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		sharingReportWithDoc.setDelStatus(0);
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
			
	logger.error("Error while sharePatientReportWithDoc.",e);
			throw new RuntimeException("Error while sharePatientReportWithDoc.",e);
		}
		}
		
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labAppId", appointmentId);
			map.add("status", 5);
			info = Constant.getRestTemplate().postForObject(Constant.url + "lab/updateLabAppointmentStatus", map,
					Info.class);
			msg = "Report Upload Successfully";
		} catch (Exception e) {
			logger.error("Error while Uploading Lab Reports", e);
			msg = "Report Upload Failed";
			throw new RuntimeException("Error while Uploading Lab Reports", e);
		}
		return "redirect:/showViewLabAppointment?status=" + msg;
	}

	@RequestMapping(value = "/showLabHistory", method = RequestMethod.GET)
	public ModelAndView showLabHistory(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("lab/labHistory");
		RestTemplate rest = new RestTemplate();
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		int labId = labDetails.getLabId();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		String fromDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String toDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		if (request.getParameter("startdate") != null) {
			fromDate = DateConverter.convertToYMD(request.getParameter("startdate"));
			toDate = DateConverter.convertToYMD(request.getParameter("enddate"));
		}
		map.add("labId", labId);
		map.add("fromDate", fromDate);
		map.add("toDate", toDate);

		try {
			List<GetPatientReports> getPatientReportsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "lab/getPatientReportsByLabId", map, List.class);
			model.addObject("getPatientReportsList", getPatientReportsList);
			model.addObject("size", getPatientReportsList.size());
			if (getPatientReportsList.isEmpty()) {
				model.addObject("message", "message");
			}
		} catch (Exception e) {
			logger.error("Error while Lab Reports history", e);

		}
		model.addObject("reportUrl", Constant.patientUrl);
		model.addObject("fromDate", DateConverter.convertToDMY(fromDate));
		model.addObject("toDate", DateConverter.convertToDMY(toDate));
		model.addObject("historyActive", "active");
		return model;
	}

	// completed orders
	/*
	 * @RequestMapping(value = "/getLabHistory", method = RequestMethod.GET) public
	 * ModelAndView getLabHistory(HttpServletRequest request, HttpServletResponse
	 * response) { ModelAndView model = new ModelAndView("lab/labHistory"); String
	 * fromDate = request.getParameter("startdate"); String toDate =
	 * request.getParameter("enddate"); int testId =
	 * Integer.parseInt(request.getParameter("testId")); RestTemplate rest = new
	 * RestTemplate(); HttpSession session = request.getSession(); LabDetails
	 * labDetails = (LabDetails) session.getAttribute("labDetails"); int labId =
	 * labDetails.getLabId(); List<GetReportDetailsForLab> labHistory = new
	 * ArrayList<GetReportDetailsForLab>(); MultiValueMap<String, Object> map = new
	 * LinkedMultiValueMap<String, Object>();
	 * 
	 * map.add("labId", labId); map.add("testId", testId); map.add("fromDate",
	 * fromDate); map.add("toDate", toDate);
	 * 
	 * 
	 * model.addObject("reportUrl", Constant.patientUrl);
	 * 
	 * model.addObject("testId",testId); labHistory =
	 * Constant.getRestTemplate().postForObject(Constant.url +
	 * "getReportDetailsForLab", map, List.class); model.addObject("fromDate",
	 * fromDate); model.addObject("toDate", toDate); model.addObject("labHistory",
	 * labHistory); model.addObject("size", labHistory.size());
	 * model.addObject("historyActive", "active"); if(labHistory.isEmpty()) {
	 * model.addObject("message","message"); }
	 * 
	 * 
	 * return model; }
	 */

}
