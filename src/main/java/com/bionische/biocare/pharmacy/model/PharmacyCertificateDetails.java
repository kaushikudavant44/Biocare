package com.bionische.biocare.pharmacy.model;

public class PharmacyCertificateDetails {
	
	 private int cetrificateId;
	 
	 private String cetrificate;
	 
	 private int medicalId;
	 
	 private String string1;
		
	 private int delStatus;
	 
	 private int int1;

	public int getCetrificateId() {
		return cetrificateId;
	}

	public void setCetrificateId(int cetrificateId) {
		this.cetrificateId = cetrificateId;
	}

	public String getCetrificate() {
		return cetrificate;
	}

	public void setCetrificate(String cetrificate) {
		this.cetrificate = cetrificate;
	}

	 

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}

	@Override
	public String toString() {
		return "PharmacyCertificateDetails [cetrificateId=" + cetrificateId + ", cetrificate=" + cetrificate
				+ ", medicalId=" + medicalId + ", string1=" + string1 + ", delStatus=" + delStatus + ", int1=" + int1
				+ "]";
	}

	 
	 
	 

}
