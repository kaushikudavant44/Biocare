package com.bionische.biocare.patientdoctor.model;

public class AppointmentTime {
	private int timeId;
	private String time;
	private int int1;
	private String string1;

	public int getTimeId() {
		return timeId;
	}
	public void setTimeId(int timeId) {
		this.timeId = timeId;
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
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "AppointmentTime [timeId=" + timeId + ", time=" + time + ", int1=" + int1 + ", string1=" + string1 + "]";
	}
	
}
