package com.bionische.biocare.doctor.model;

public class DocAvailableTime {
	
	private int docAvailableId;
	
	private int doctorId;
	
	private String date;
	
	private int hospitalId;
	
	private int delStatus;

	private String availableTime;
	
	private int noOfPatient;

	public int getDocAvailableId() {
		return docAvailableId;
	}

	public void setDocAvailableId(int docAvailableId) {
		this.docAvailableId = docAvailableId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getAvailableTime() {
		return availableTime;
	}

	public void setAvailableTime(String availableTime) {
		this.availableTime = availableTime;
	}

	public int getNoOfPatient() {
		return noOfPatient;
	}

	public void setNoOfPatient(int noOfPatient) {
		this.noOfPatient = noOfPatient;
	}

	@Override
	public String toString() {
		return "DocAvailableTime [docAvailableId=" + docAvailableId + ", doctorId=" + doctorId + ", date=" + date
				+ ", hospitalId=" + hospitalId + ", delStatus=" + delStatus + ", availableTime=" + availableTime
				+ ", noOfPatient=" + noOfPatient + "]";
	}

	 
	
	 
	 
	

}
