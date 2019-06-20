package com.bionische.biocare.doctor.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.common.s3.AmazonS3ClientService;
import com.bionische.biocare.doctor.model.DoctorCertificateDetails;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.model.VideoSharing;
import com.bionische.biocare.patient.model.PatientDetails;

@Controller
@Scope("session")
public class VideoUploadController {

	String msg;
	
	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	
	@RequestMapping(value = "/showUploadVideo", method = RequestMethod.GET)
	public String showUploadVideo(HttpServletRequest request, HttpServletResponse response,Model model) {

		model.addAttribute("msg",msg);
		msg="";
		return "doctor/videoUpload";
	}
	
	
	@RequestMapping(value = "/getPatientDetailsById", method = RequestMethod.GET)
	public @ResponseBody PatientDetails getPatientDetailsById(HttpServletRequest request, HttpServletResponse response) {

		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<String, Object>();
			
	map.add("patientId",Integer.parseInt(request.getParameter("patientId")));
	PatientDetails patientDetails=Constant.getRestTemplate().postForObject(Constant.url + "getPatientDetailsById", map, PatientDetails.class);
	return patientDetails;
	
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	@RequestMapping(value = "/uploadVideo", method = RequestMethod.POST)
	public String uploadVideo(@RequestParam("file") List<MultipartFile> file,HttpServletRequest request, HttpServletResponse response) {

		int patientId=Integer.parseInt(request.getParameter("patientId"));
		
		VideoSharing videoSharing =new VideoSharing();
		 
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		videoSharing.setTitle(request.getParameter("title"));
		videoSharing.setDelStatus(0);
		videoSharing.setDoctorId(doctorDetails.getDoctorId());
		videoSharing.setPatientId(patientId);
		
		String fileName= new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())
				+patientId + VpsImageUpload.getFileExtension(file.get(0));
		VpsImageUpload vpsImageUpload=new VpsImageUpload();
		try {
		//	vpsImageUpload.saveUploadedFiles(file, 13, fileName, patientId);
			
			
			amazonS3ClientService.uploadFileToS3Bucket(file.get(0),fileName,"patient/" + patientId + "/video/", true);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		videoSharing.setVideoFileName(fileName);
		try {
		VideoSharing videoSharingRes=Constant.getRestTemplate().postForObject(Constant.url + "videoSharing/uploadVideo", videoSharing, VideoSharing.class);
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/showUploadVideo";
	}
	
}
