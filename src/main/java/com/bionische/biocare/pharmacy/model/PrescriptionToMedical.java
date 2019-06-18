package com.bionische.biocare.pharmacy.model;

import java.util.Date;
import java.util.List;

public class PrescriptionToMedical {
		
	private int patientRequestToMedicalId;
	
	private int meetId;
	
	private Date orderDate;
	
	private Date lastModifiedDate;
	
    private int patientId;
	
	private int doctorId;
	
	private int deliveryType;
	
	private int pincode;
	
	private String patientContact;
	
	private String email;
	
	private int medicalId;
	
	private int paymentStatus;
	
	private int int1;
		
	private int int2;
	
	private String string1;
	
	private String string2;
	
	private int delStatus;
	
	private int status;
	
	private String address;
	
	private float totalAmt;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPatientRequestToMedicalId() {
		return patientRequestToMedicalId;
	}

	public void setPatientRequestToMedicalId(int patientRequestToMedicalId) {
		this.patientRequestToMedicalId = patientRequestToMedicalId;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
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

	public int getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(int deliveryType) {
		this.deliveryType = deliveryType;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getPatientContact() {
		return patientContact;
	}

	public void setPatientContact(String patientContact) {
		this.patientContact = patientContact;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public float getTotalAmt() {
		return totalAmt;
	}

	public void setTotalAmt(float totalAmt) {
		this.totalAmt = totalAmt;
	}

	@Override
	public String toString() {
		return "PrescriptionToMedical [patientRequestToMedicalId=" + patientRequestToMedicalId + ", meetId=" + meetId
				+ ", orderDate=" + orderDate + ", lastModifiedDate=" + lastModifiedDate + ", patientId=" + patientId
				+ ", doctorId=" + doctorId + ", deliveryType=" + deliveryType + ", pincode=" + pincode
				+ ", patientContact=" + patientContact + ", email=" + email + ", medicalId=" + medicalId
				+ ", paymentStatus=" + paymentStatus + ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1
				+ ", string2=" + string2 + ", delStatus=" + delStatus + ", status=" + status + ", address=" + address
				+ ", totalAmt=" + totalAmt + "]";
	}

	
	
}
