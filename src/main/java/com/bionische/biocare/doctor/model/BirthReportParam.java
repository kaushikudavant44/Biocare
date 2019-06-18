package com.bionische.biocare.doctor.model;

public class BirthReportParam {

	String img;
	
	int patientId;
	
	int doctorId;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	@Override
	public String toString() {
		return "BirthReportParam [img=" + img + ", patientId=" + patientId + ", doctorId=" + doctorId + "]";
	}
	
	
	
}
