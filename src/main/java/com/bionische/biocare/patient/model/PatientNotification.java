package com.bionische.biocare.patient.model;

public class PatientNotification {
	
	private int notificationId;

	String notification;

	int status;

	int patientId;

	String dateTime;

	int int1;

	String string1;
	
	String string2;

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

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
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

	public String getString2() {
		return string2;
	}

	public void setString2(String string2) {
		this.string2 = string2;
	}

	@Override
	public String toString() {
		return "PatientNotification [notificationId=" + notificationId + ", notification=" + notification + ", status="
				+ status + ", patientId=" + patientId + ", dateTime=" + dateTime + ", int1=" + int1 + ", string1="
				+ string1 + ", string2=" + string2 + "]";
	}

	

}
