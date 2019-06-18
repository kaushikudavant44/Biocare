package com.bionische.biocare.patient.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.model.VideoSharing;
import com.bionische.biocare.patient.model.PatientDetails;

@Controller
public class VideoSharedController {

	
	

	@RequestMapping(value = "/viewVideoSharedByDoctor/{videoId}", method = RequestMethod.GET)
	public String showUploadVideo(@PathVariable("videoId")int videoId,HttpServletRequest request, HttpServletResponse response,Model model) {

	 
		
		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<String, Object>();
			
	map.add("videoId",videoId);
	VideoSharing videoSharing=Constant.getRestTemplate().postForObject(Constant.url + "videoSharing/getSharedVideoById", map, VideoSharing.class);

		model.addAttribute("videoLink",Constant.patientUrl+videoSharing.getPatientId()+"/video/"+videoSharing.getVideoFileName());
		model.addAttribute("videoSharing",videoSharing);
	}
		catch (Exception e) {
			// TODO: handle exception
		}
		return "patient/viewSharedVideo";
	}
	
	@RequestMapping(value="/showPreviousSharedVideo", method=RequestMethod.GET)

	 public String showPreviousSharedVideo(HttpServletRequest request,
	 		HttpServletResponse response,Model model)
	 {
		try {
			HttpSession session = request.getSession();
			PatientDetails patientDetail = (PatientDetails) session.getAttribute("patientDetails");
			/*MultiValueMap<String, Object> mapfam = new LinkedMultiValueMap<String, Object>();
			mapfam.add("familyId",patientDetail.getFamilyId());
			List<PatientDetails> patientDetailList = Constant.getRestTemplate().postForObject(Constant.url + "getPatientFamilyMembersList",
					mapfam, List.class);
			model.addAttribute("patientDetailList",patientDetailList);*/
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<String, Object>();
			
	map.add("patientId",patientDetail.getPatientId());
	List<VideoSharing> videoSharingList=Constant.getRestTemplate().postForObject(Constant.url + "videoSharing/getLast10SharedVideo", map, List.class);

		model.addAttribute("videoLink",Constant.patientUrl+patientDetail.getPatientId()+"/video/");
	 
		model.addAttribute("videoSharingList",videoSharingList);
	}
		catch (Exception e) {
			// TODO: handle exception
		}
		 
	 	return "patient/previousVideo";
	 	
	 }
	
}
