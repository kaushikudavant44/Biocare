package com.bionische.biocare.doctor.model;

import java.util.Date;

public class SavePatientVaccination {

	private int id;
	

	
	private int vacciantionId;
	
	private int patientId;
	
	private int doctorId;
	
	private int status;
	
	private int int1;
	
	private int int2;
	
	private String string1;
	
	
	private Date createdDate;
	
	private Date modifiedDate;
	
	
	

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public int getVacciantionId() {
		return vacciantionId;
	}

	public void setVacciantionId(int vacciantionId) {
		this.vacciantionId = vacciantionId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	@Override
	public String toString() {
		return "SavePatientVaccination [id=" + id + ", vacciantionId=" + vacciantionId + ", patientId=" + patientId
				+ ", doctorId=" + doctorId + ", status=" + status + ", int1=" + int1 + ", int2=" + int2 + ", string1="
				+ string1 + ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate + "]";
	}

	

	
	
	
	
	
}
