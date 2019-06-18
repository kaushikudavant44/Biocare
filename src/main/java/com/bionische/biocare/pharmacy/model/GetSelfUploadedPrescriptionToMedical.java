package com.bionische.biocare.pharmacy.model;

public class GetSelfUploadedPrescriptionToMedical {

	
	
	private int requestToMedicalId;
		
	
	private int medicalId;
	
	private String orderDate;
	
	
	private String medicalName;
	
	
	private int patientId;
	
	
	private String patientName;
	
	
	private int deliveryType;
	
	
	private float totalAmt;
	
	
	private int pincode;
	
	
	private String patientContact;
	
	
	private int paymentStatus;

	
	private int delStatus;

	
	private int status;
	
	
	private String address;
	
	

	
	
	private String paymentDate;
	
	
	private String prescriptionName;
	
	
	private String medicalEmail;
	
	
	private String medicalContact;

	
	
	
	public String getMedicalEmail() {
		return medicalEmail;
	}

	public void setMedicalEmail(String medicalEmail) {
		this.medicalEmail = medicalEmail;
	}

	public String getMedicalContact() {
		return medicalContact;
	}

	public void setMedicalContact(String medicalContact) {
		this.medicalContact = medicalContact;
	}

	public int getRequestToMedicalId() {
		return requestToMedicalId;
	}

	public void setRequestToMedicalId(int requestToMedicalId) {
		this.requestToMedicalId = requestToMedicalId;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
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

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
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

	

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPrescriptionName() {
		return prescriptionName;
	}

	public void setPrescriptionName(String prescriptionName) {
		this.prescriptionName = prescriptionName;
	}

	@Override
	public String toString() {
		return "GetSelfUploadedPrescriptionToMedical [requestToMedicalId=" + requestToMedicalId + ", medicalId="
				+ medicalId + ", orderDate=" + orderDate + ", medicalName=" + medicalName + ", patientId=" + patientId
				+ ", patientName=" + patientName + ", deliveryType=" + deliveryType + ", totalAmt=" + totalAmt
				+ ", pincode=" + pincode + ", patientContact=" + patientContact + ", paymentStatus=" + paymentStatus
				+ ", delStatus=" + delStatus + ", status=" + status + ", address=" + address + ", paymentDate="
				+ paymentDate + ", prescriptionName=" + prescriptionName + ", medicalEmail=" + medicalEmail
				+ ", medicalContact=" + medicalContact + "]";
	}

	

	

	
	
	
	
	
	
}
