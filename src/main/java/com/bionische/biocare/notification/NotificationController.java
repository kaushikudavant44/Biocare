/*package com.bionische.biocare.notification;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.doctor.controller.DoctorController;
@Controller
public class NotificationController {
	 
	
	
	@RequestMapping(value = "/singleSwitchOnOff", method = RequestMethod.GET)
	public ModelAndView singleSwitchOnOff(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model=new ModelAndView("home");
		try {
		MqttMessage message = new MqttMessage();
		String msg ="ganesh"+"status";
		
		message.setPayload(msg.getBytes());

		if (!DoctorController.client.isConnected()) {

			DoctorController.client.connect();

		}
		
		 
		DoctorController.client.publish("ganesh", message);
		 
		
		
		Thread.sleep(5000);
		
		
	}catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
	 
	return model;
	}
	@RequestMapping(value = "/checkMsg", method = RequestMethod.GET)
	public ModelAndView checkMsg(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model=new ModelAndView("editDoc");
		return model;
	}
	
}
*/