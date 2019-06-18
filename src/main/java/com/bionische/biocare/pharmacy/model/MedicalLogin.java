package com.bionische.biocare.pharmacy.model;

import com.bionische.biocare.patient.model.Info;

public class MedicalLogin {

	
	MedicalDetails medicalDetails;
	Info info;
	Info pharmacySuscriptionInfo;
	
	public MedicalDetails getMedicalDetails() {
		return medicalDetails;
	}
	public void setMedicalDetails(MedicalDetails medicalDetails) {
		this.medicalDetails = medicalDetails;
	}
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	public Info getPharmacySuscriptionInfo() {
		return pharmacySuscriptionInfo;
	}
	public void setPharmacySuscriptionInfo(Info pharmacySuscriptionInfo) {
		this.pharmacySuscriptionInfo = pharmacySuscriptionInfo;
	}
	@Override
	public String toString() {
		return "MedicalLogin [medicalDetails=" + medicalDetails + ", info=" + info + ", pharmacySuscriptionInfo="
				+ pharmacySuscriptionInfo + "]";
	}
	 
	
	
	
	
}
