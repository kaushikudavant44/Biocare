package com.bionische.biocare.patientdoctor.model;

import java.util.List;

public class GetPrescriptionDetailsWithDoctorDetailsByMeetId {

 
	private int doctorId;
	
	private String doctorName;
	  
	private String hospitalName;
	
	private String patientName;
 
	private String contact;
	 
	private String signature;
	
 
	List<PrescriptionDetails> PrescriptionDetailsList;

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	 
	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	 

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public List<PrescriptionDetails> getPrescriptionDetailsList() {
		return PrescriptionDetailsList;
	}

	public void setPrescriptionDetailsList(List<PrescriptionDetails> prescriptionDetailsList) {
		PrescriptionDetailsList = prescriptionDetailsList;
	}

	@Override
	public String toString() {
		return "GetPrescriptionDetailsWithDoctorDetailsByMeetId [doctorId=" + doctorId + ", doctorName=" + doctorName
				+ ", hospitalName=" + hospitalName + ", patientName=" + patientName + ", contact=" + contact
				+ ", signature=" + signature + ", PrescriptionDetailsList=" + PrescriptionDetailsList + "]";
	}

	 
	 
	 
	
}
