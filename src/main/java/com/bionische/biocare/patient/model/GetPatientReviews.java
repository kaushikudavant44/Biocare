package com.bionische.biocare.patient.model;

import java.util.Date;
import java.util.List;

public class GetPatientReviews {
	
	private int patientId;
	
    private String patientName;
	
	private String reviews;
	
	private String createDate;

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getReviews() {
		return reviews;
	}

	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	@Override
	public String toString() {
		return "GetPatientReviews [patientId=" + patientId + ", patientName=" + patientName + ", reviews=" + reviews
				+ ", createDate=" + createDate + "]";
	}

	

}
