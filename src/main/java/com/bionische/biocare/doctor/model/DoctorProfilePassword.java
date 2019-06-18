package com.bionische.biocare.doctor.model;

public class DoctorProfilePassword {

	
	private int id;
	 
	private int doctorId;
	 
	private String password;

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

	 

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "DoctorProfilePasswordDetails [id=" + id + ", doctorId=" + doctorId + ", password=" + password + "]";
	}

	 
	
}
