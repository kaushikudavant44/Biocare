package com.bionische.biocare.doctor.model;
 
public class DoctorCircle {
 
	private int id;
 
	private int fromDoctorId;
	 
	private int toDoctorId;
	 
	private int status;

	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getFromDoctorId() {
		return fromDoctorId;
	}



	public void setFromDoctorId(int fromDoctorId) {
		this.fromDoctorId = fromDoctorId;
	}



	public int getToDoctorId() {
		return toDoctorId;
	}



	public void setToDoctorId(int toDoctorId) {
		this.toDoctorId = toDoctorId;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "DoctorCircle [id=" + id + ", fromDoctorId=" + fromDoctorId + ", toDoctorId=" + toDoctorId + ", status="
				+ status + "]";
	}
	
	
}
