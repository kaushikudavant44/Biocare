package com.bionische.biocare.patientdoctor.model;

public class AppointmentDetails {

	private int doctorId;
	
 	private int time;
	private String date;
	private int int1; // status
	private int int2;
	
	private int status;
	private String string1;
	private String string2;
	private int delStatus;
	private int hospitalId;
	private int patientId;

	 private float amount;

	 
	 
	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	 
	 

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getString2() {
		return string2;
	}

	public void setString2(String string2) {
		this.string2 = string2;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AppointmentDetails [doctorId=" + doctorId + ", time=" + time + ", date=" + date + ", int1=" + int1
				+ ", int2=" + int2 + ", status=" + status + ", string1=" + string1 + ", string2=" + string2
				+ ", delStatus=" + delStatus + ", hospitalId=" + hospitalId + ", patientId=" + patientId + ", amount="
				+ amount + "]";
	}

	

	 
	 
	

	 

}
