package com.bionische.biocare.doctor.model;

import java.util.Date;

public class DoctorNotification {

	private int notificationId;

	String notification;

	int status;

	int doctorId;

	String dateTime;

	int int1;

	String string1;

	String fcmNo;
 

	public int getNotificationId() {
		return notificationId;
	}


	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}


	public String getNotification() {
		return notification;
	}


	public void setNotification(String notification) {
		this.notification = notification;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}


	 


	 

	public String getDateTime() {
		return dateTime;
	}


	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}


	public int getInt1() {
		return int1;
	}


	public void setInt1(int int1) {
		this.int1 = int1;
	}


	public String getString1() {
		return string1;
	}


	public void setString1(String string1) {
		this.string1 = string1;
	}


	public String getFcmNo() {
		return fcmNo;
	}


	public void setFcmNo(String fcmNo) {
		this.fcmNo = fcmNo;
	}


	@Override
	public String toString() {
		return "DoctorNotification [notificationId=" + notificationId + ", notification=" + notification + ", status="
				+ status + ", doctorId=" + doctorId + ", dateTime=" + dateTime + ", int1=" + int1 + ", string1="
				+ string1 + ", fcmNo=" + fcmNo + "]";
	}

}
