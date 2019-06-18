package com.bionische.biocare.videocall;

 

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.PatientDetails;
import com.bionische.biocare.patientdoctor.model.Data;
import com.bionische.biocare.patientdoctor.model.FcmNotification;
import com.bionische.biocare.patientdoctor.model.Notification;
import com.bionische.biocare.patientdoctor.model.PatientCallDetails;
@Scope("session")
@Controller
public class VideoCallController {

	
	@RequestMapping(value = "/videocall", method = RequestMethod.GET)
	public String videocall( Locale locale, Model model) {
	  
		return "home";
	}
	
	@RequestMapping(value = "/videoCallWeb", method = RequestMethod.GET)
	public String videoCallWeb( Locale locale, Model model) {
	  
		return "videocall2";
	}
	
	
	@RequestMapping(value = "/apprtc", method = RequestMethod.GET)
	public String apprtc( Locale locale, Model model) {
	  
		return "apprtc";
	}
	
	
	@RequestMapping(value = "/sendMessageToDoctor", method = RequestMethod.GET)
	public @ResponseBody Info sendMessageToDoctor(HttpServletRequest request) {
	  
		
		String message=request.getParameter("message");
		String toToken=request.getParameter("toToken");	
		String fromToken =request.getParameter("fromToken");
		
		int toDeviceType=Integer.parseInt(request.getParameter("toDeviceType"));
		int fromDeviceType=Integer.parseInt(request.getParameter("fromDeviceType"));
		
		FcmNotification fcmNotification=new FcmNotification();
		fcmNotification.setTo(toToken);
		Notification notification=new Notification();
				notification.setBody(message);
				 HttpSession session = request.getSession();
					PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
				notification.setTitle(patientDetails.getfName()+" "+patientDetails.getlName());
				
				notification.setIcon(Constant.patientUrl+""+ patientDetails.getPatientId() + "/profile/"+patientDetails.getProfilePhoto());
		fcmNotification.setNotification(notification);
		Data notificationData=new Data();
		
		notificationData.setFromFcm(fromToken);
		notificationData.setFromDeviceType(fromDeviceType);
		notificationData.setToDeviceType(toDeviceType);
		notificationData.setType(3+"");
		fcmNotification.setData(notificationData);
		try {
		Info info = Constant.getRestTemplate().postForObject(Constant.url + "sendMessageToDoctor", fcmNotification,
				Info.class);
		return info;
		
		}
		catch (Exception e) {
			
			// TODO: handle exception
		}
		return null;
	}
	
	@RequestMapping(value = "/sendMessageToPatient", method = RequestMethod.GET)
	public @ResponseBody Info sendMessageToPatient(HttpServletRequest request) {
	  
		
		String message=request.getParameter("message");
		String toToken=request.getParameter("toToken");	
		String fromToken =request.getParameter("fromToken");
		
		int id=Integer.parseInt(request.getParameter("id"));
		int toDeviceType=Integer.parseInt(request.getParameter("toDeviceType"));
		int fromDeviceType=Integer.parseInt(request.getParameter("fromDeviceType"));
		
		FcmNotification fcmNotification=new FcmNotification();
		fcmNotification.setTo(toToken);
		Notification notification=new Notification();
				notification.setBody(message);
				HttpSession session = request.getSession();
				DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
				notification.setTitle(doctorDetails.getfName()+" "+doctorDetails.getlName());
				
				notification.setIcon(Constant.doctorUrl+""+ doctorDetails.getDoctorId() + "/profile/"+doctorDetails.getProfilePhoto());
		fcmNotification.setNotification(notification);
		Data notificationData=new Data();
		
		notificationData.setFromFcm(fromToken);
		notificationData.setFromDeviceType(fromDeviceType);
		notificationData.setToDeviceType(toDeviceType);
		notificationData.setId(id);
		notificationData.setType(3+"");
		fcmNotification.setData(notificationData);
		try {
		Info info = Constant.getRestTemplate().postForObject(Constant.url + "sendMessageToPatient", fcmNotification,
				Info.class);
		return info;
		
		}
		catch (Exception e) {
			
			// TODO: handle exception
		}
		return null;
	}
	
	@RequestMapping(value = "/sendVideoCallToPatient", method = RequestMethod.GET)
	public @ResponseBody Info sendVideoCallToPatient(HttpServletRequest request) {
		System.out.println("fromToken  ");
		String videoCallUrl=request.getParameter("videoCallUrl");
		String toToken=request.getParameter("toToken");	
		String fromToken =request.getParameter("fromToken");
		
		int id=Integer.parseInt(request.getParameter("id"));
		int toDeviceType=Integer.parseInt(request.getParameter("toDeviceType"));
		int fromDeviceType=Integer.parseInt(request.getParameter("fromDeviceType"));
		
		FcmNotification fcmNotification=new FcmNotification();
		fcmNotification.setTo(toToken);
		Notification notification=new Notification();
				
				HttpSession session = request.getSession();
				DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
				notification.setBody("Dr. "+doctorDetails.getfName()+" "+doctorDetails.getlName()+" is Calling");
				notification.setTitle("Video Call");
				notification.setClick_action(videoCallUrl);
				notification.setIcon(Constant.doctorUrl+""+ doctorDetails.getDoctorId() + "/profile/"+doctorDetails.getProfilePhoto());
		fcmNotification.setNotification(notification);
		Data data=new Data();
		data.setFromId(doctorDetails.getDoctorId());
		data.setFromFcm(fromToken);
		data.setFromDeviceType(fromDeviceType);
		data.setToDeviceType(toDeviceType);
		data.setId(id);
		data.setType(2+"");
		fcmNotification.setData(data);
		try {
		Info info = Constant.getRestTemplate().postForObject(Constant.url + "sendMessageToPatient", fcmNotification,
				Info.class);
		return info;
		
		}
		catch (Exception e) {
			
			// TODO: handle exception
		}
		return null;
		
	}
	
	
	@RequestMapping(value = "/sendVideoCallToDoctor", method = RequestMethod.GET)
	public @ResponseBody Info sendVideoCallToDoctor(HttpServletRequest request) {
		System.out.println("fromToken  ");
		String videoCallUrl=request.getParameter("videoCallUrl");
		 
		String fromToken =request.getParameter("fromToken");
		
		int doctorId=Integer.parseInt(request.getParameter("doctorId"));
		 
		int fromDeviceType=Integer.parseInt(request.getParameter("fromDeviceType"));
		
		FcmNotification fcmNotification=new FcmNotification();
	 
		Notification notification=new Notification();
				
				HttpSession session = request.getSession();
				DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
				notification.setBody("Dr. "+doctorDetails.getfName()+" "+doctorDetails.getlName()+" is Calling");
				notification.setTitle("Video Call");
				notification.setClick_action(videoCallUrl);
				notification.setIcon(Constant.doctorUrl+""+ doctorDetails.getDoctorId() + "/profile/"+doctorDetails.getProfilePhoto());
		fcmNotification.setNotification(notification);
		Data data=new Data();
		
		data.setFromFcm(fromToken);
		data.setFromDeviceType(fromDeviceType);
		 
		data.setId(doctorId);
		data.setType(2+"");
		fcmNotification.setData(data);
		try {
		Info info = Constant.getRestTemplate().postForObject(Constant.url + "sendVideoCallToDoctor", fcmNotification,
				Info.class);
		return info;
		
		}
		catch (Exception e) {
			
			// TODO: handle exception
		}
		return null;
		
	}
	
	
	@RequestMapping(value = "/updateVideoCallStatus", method = RequestMethod.GET)
	public @ResponseBody void updateVideoCallStatus(HttpServletRequest request) {
		
		int status=Integer.parseInt(request.getParameter("status"));
		 
		int id=Integer.parseInt(request.getParameter("id"));
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("id", id);
		map.add("status", status);
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "videoCall/updatePatientCallStatus", map,
					Info.class);
		 
			
			}
			catch (Exception e) {
			 
			}
	}
	
	

	@RequestMapping(value = "/getPatientMissCallDetails", method = RequestMethod.GET)
	public @ResponseBody List<PatientCallDetails> getPatientMissCallDetails(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("patientId", patientDetails.getPatientId());
		try {
		List<PatientCallDetails> patientCallDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "videoCall/getPatientMissCallDetails", map,
				List.class);
	 return patientCallDetailsList;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@RequestMapping(value = "/updateSeenPatientMissCallStatus", method = RequestMethod.GET)
	public @ResponseBody void updateSeenPatientMissCallStatus(HttpServletRequest request) {
		
		 
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		HttpSession session = request.getSession();
		PatientDetails patientDetails=	(PatientDetails)session.getAttribute("patientDetails");
		map.add("patientId", patientDetails.getPatientId());
		map.add("status", 3);
		try {
			Info info = Constant.getRestTemplate().postForObject(Constant.url + "videoCall/updateSeenPatientMissCallStatus", map,
					Info.class);
		 
			
			} 
			catch (Exception e) {
			 
			}
	}
}
