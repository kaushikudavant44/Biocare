package com.bionische.biocare.lab.model;

public class LabCertificateDetails {

	 private int cetrificateId;
	 
	 private String cetrificate;
	 
	 private int labId;
	 
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

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
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

	@Override
	public String toString() {
		return "LabCertificateDetails [cetrificateId=" + cetrificateId + ", cetrificate=" + cetrificate + ", labId="
				+ labId + ", string1=" + string1 + ", delStatus=" + delStatus + ", int1=" + int1 + "]";
	}
	 
	 
}
