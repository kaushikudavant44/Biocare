package com.bionische.biocare.doctor.model;
 
public class DoctorLeavesDetails {
 
	private int leavId;
	
	private int doctorId;
	
	private String date;

	public int getLeavId() {
		return leavId;
	}

	public void setLeavId(int leavId) {
		this.leavId = leavId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "DoctorLeavesDetails [leavId=" + leavId + ", doctorId=" + doctorId + ", date=" + date + "]";
	}

	 
	
}
