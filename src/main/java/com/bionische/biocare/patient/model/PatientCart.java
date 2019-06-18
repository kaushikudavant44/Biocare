package com.bionische.biocare.patient.model;

public class PatientCart {
	
	private int cartId;
	
	private int patientId;
	
	private String dateTime;
	
	private int meetId;
	
	private int status;
	
	private int int1;
	
	private String string1;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
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

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	@Override
	public String toString() {
		return "PatientCart [cartId=" + cartId + ", patientId=" + patientId + ", dateTime=" + dateTime + ", meetId="
				+ meetId + ", status=" + status + ", int1=" + int1 + ", string1=" + string1 + "]";
	}
	
	
	
	

}
