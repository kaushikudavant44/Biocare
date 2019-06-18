package com.bionische.biocare.radiology.model;

import java.util.Date;

public class PndtPatients {

	private int pndtId;

	private String patientName;

	private int pndtPatientId;

	private String state;

	private String nameOfDoctor;

	private String createdDate;

	private int status;
	
	private int dateStatus;
	
	

	public int getDateStatus() {
		return dateStatus;
	}

	public void setDateStatus(int dateStatus) {
		this.dateStatus = dateStatus;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPndtPatientId() {
		return pndtPatientId;
	}

	public void setPndtPatientId(int pndtPatientId) {
		this.pndtPatientId = pndtPatientId;
	}

	

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getPndtId() {
		return pndtId;
	}

	public void setPndtId(int pndtId) {
		this.pndtId = pndtId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getNameOfDoctor() {
		return nameOfDoctor;
	}

	public void setNameOfDoctor(String nameOfDoctor) {
		this.nameOfDoctor = nameOfDoctor;
	}

	@Override
	public String toString() {
		return "PndtPatients [pndtId=" + pndtId + ", patientName=" + patientName + ", pndtPatientId=" + pndtPatientId
				+ ", state=" + state + ", nameOfDoctor=" + nameOfDoctor + ", createdDate=" + createdDate + ", status="
				+ status + ", dateStatus=" + dateStatus + "]";
	}

	

}
