package com.bionische.biocare.patient.model;

public class PatientLogin {

	
	
	PatientDetails patientDetails;
	
	Info info;

	public PatientDetails getPatientDetails() {
		return patientDetails;
	}

	public void setPatientDetails(PatientDetails patientDetails) {
		this.patientDetails = patientDetails;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "PatientLogin [patientDetails=" + patientDetails + ", info=" + info + "]";
	}
	
	
}
