package com.bionische.biocare.lab.model;

public class LabNotification {
	
	private int notificationId;

	String notification;

	int status;

	int labId;

	String dateTime;

	int int1;

	String string1;

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

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
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

	@Override
	public String toString() {
		return "LabNotification [notificationId=" + notificationId + ", notification=" + notification + ", status="
				+ status + ", labId=" + labId + ", dateTime=" + dateTime + ", int1=" + int1 + ", string1=" + string1
				+ "]";
	}
	
	

}
