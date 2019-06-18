package com.bionische.biocare.doctor.model;

public class FixDoctorAppointSchedule {

	
	int scheduleId;
	int doctorId;
	int clinicId;
	int noOfPatient;
	String timeJson;
	int delStatus;
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public int getClinicId() {
		return clinicId;
	}
	public void setClinicId(int clinicId) {
		this.clinicId = clinicId;
	}
	public String getTimeJson() {
		return timeJson;
	}
	public void setTimeJson(String timeJson) {
		this.timeJson = timeJson;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public int getNoOfPatient() {
		return noOfPatient;
	}
	public void setNoOfPatient(int noOfPatient) {
		this.noOfPatient = noOfPatient;
	}
	@Override
	public String toString() {
		return "FixDoctorAppointSchedule [scheduleId=" + scheduleId + ", doctorId=" + doctorId + ", clinicId="
				+ clinicId + ", noOfPatient=" + noOfPatient + ", timeJson=" + timeJson + ", delStatus=" + delStatus
				+ "]";
	}
	 
	
	
	
}
