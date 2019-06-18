package com.bionische.biocare.patientdoctor.model;

import java.util.List;

public class AppointmentTimeList {

	
	private List<AppointmentTime> appointmentTimeList;
	private List<AppointmentTime> allAppointmentTimeList;
	public List<AppointmentTime> getAppointmentTimeList() {
		return appointmentTimeList;
	}
	public void setAppointmentTimeList(List<AppointmentTime> appointmentTimeList) {
		this.appointmentTimeList = appointmentTimeList;
	}
	public List<AppointmentTime> getAllAppointmentTimeList() {
		return allAppointmentTimeList;
	}
	public void setAllAppointmentTimeList(List<AppointmentTime> allAppointmentTimeList) {
		this.allAppointmentTimeList = allAppointmentTimeList;
	}
	@Override
	public String toString() {
		return "AppointmentTimeList [appointmentTimeList=" + appointmentTimeList + ", allAppointmentTimeList="
				+ allAppointmentTimeList + "]";
	}
	
	
	 
}
