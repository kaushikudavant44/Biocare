/*package com.bionische.biocare.notification;



import java.util.List;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONObject;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.controller.DoctorController;



public class MqttStatus implements MqttCallback {

	 
private  String authKey="";

 
public MqttStatus(String authKey) {
	this.authKey=authKey;
}


public void setupMQTT() {
    try {
    	DoctorController.client = new MqttClient("tcp://132.148.16.132:1883", "1dlsf43");
    	DoctorController.client.connect();
    	DoctorController.client.setCallback(this);
        Constant.isConnected=true;
       
      
    } catch (MqttException e) {
        e.printStackTrace();
    }
}
public void subscribeToTopics() {
	
	 try {
		 DoctorController.client.subscribe("ganesh");
		} catch (MqttException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	 
	
	 
        
}

 
public void getCurrentStatus() {
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
	 
} 

@Override
public void connectionLost(Throwable cause) {
    // TODO Auto-generated method stub
	 System.out.println("connection lost due to "+cause);   
     Constant.isConnected=false;

}

public void disconnect() {
	
	try {
		DoctorController.client.disconnect();
	} catch (MqttException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

@Override
public void messageArrived(String topic, MqttMessage message)
        throws Exception {
 try {
  
 System.out.println("\n"+message.toString());  

 
  
 
  
 

 
 }catch (Exception e) {
	e.getLocalizedMessage();
	e.printStackTrace();
}
}

@Override
public void deliveryComplete(IMqttDeliveryToken token) {
   
	 try {
		 
		System.out.println("message delivered "+token.getMessage()+"  token.getResponse()"+token.getResponse());
	} catch (MqttException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}   

}

}*/