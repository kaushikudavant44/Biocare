package com.bionische.biocare.doctor.model;

public class DoctorHospitalDetails {


	private int id;
	
	
	private int doctorId;
	
	
	private int hospitalId;
	
	
	private int delStatus;
	

	private int int1;
	

	private String string1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
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

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	@Override
	public String toString() {
		return "DoctorHospitalDetails [id=" + id + ", doctorId=" + doctorId + ", hospitalId=" + hospitalId
				+ ", delStatus=" + delStatus + ", int1=" + int1 + ", string1=" + string1 + "]";
	}

	
	
	
}
