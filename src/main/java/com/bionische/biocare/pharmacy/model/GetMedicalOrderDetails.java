package com.bionische.biocare.pharmacy.model;

 
public class GetMedicalOrderDetails {

 
	private int requestToMedicalId;
	 
	private int meetId;
	 
	private int medicalId;
	 
	private String lastModifiedDate;
	 
	private String orderDate;
	 
	private String medicalName;
	 
	private int patientId;
	 
	private String patientName;
	 
	private int doctorId;
	 
	private String doctorName;
	 
	private String doctorContact;
	 
	private int deliveryType;
	 
	private float totalAmt;
	 
	private int pincode;
	 
	private String patientContact;
	 
	private int paymentStatus;
 
	private int delStatus;
 
	private int status;
	 
	private String address;
	 
	private String email;
	
	private String contact;
	
	private String paymentDate;
	
	private String string1;
	
	

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getRequestToMedicalId() {
		return requestToMedicalId;
	}

	public void setRequestToMedicalId(int requestToMedicalId) {
		this.requestToMedicalId = requestToMedicalId;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}

	public String getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getMedicalName() {
		return medicalName;
	}

	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
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

	 

	 

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDoctorContact() {
		return doctorContact;
	}

	public void setDoctorContact(String doctorContact) {
		this.doctorContact = doctorContact;
	}

	public int getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(int deliveryType) {
		this.deliveryType = deliveryType;
	}

	public float getTotalAmt() {
		return totalAmt;
	}

	public void setTotalAmt(float totalAmt) {
		this.totalAmt = totalAmt;
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

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "GetMedicalOrderDetails [requestToMedicalId=" + requestToMedicalId + ", meetId=" + meetId
				+ ", medicalId=" + medicalId + ", lastModifiedDate=" + lastModifiedDate + ", orderDate=" + orderDate
				+ ", medicalName=" + medicalName + ", patientId=" + patientId + ", patientName=" + patientName
				+ ", doctorId=" + doctorId + ", doctorName=" + doctorName + ", doctorContact=" + doctorContact
				+ ", deliveryType=" + deliveryType + ", totalAmt=" + totalAmt + ", pincode=" + pincode
				+ ", patientContact=" + patientContact + ", paymentStatus=" + paymentStatus + ", delStatus=" + delStatus
				+ ", status=" + status + ", address=" + address + ", email=" + email + ", contact=" + contact
				+ ", paymentDate=" + paymentDate + ", string1=" + string1 + "]";
	}

	



	
	
	
}
