package com.bionische.biocare.model;
 
public class GetPharmacyPaymentDetails {

	 
	private int requestToMedicalId;
	 
	private int meetId;
	 
	private String orderDate;
	 
	private int medicalId;
	 
	private int patientId;
	 
	private String patientName;
 
	private String medicalName;
	  
	private int deliveryType;
	 
	private float totalAmt;

	private int paymentStatus;
	 
	private String txnId;
 
	private String orderId;
 
	private String paymentDate;
	
	private int offerId;
	 
	private float packageAmt;

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

	 

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
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

	public String getMedicalName() {
		return medicalName;
	}

	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
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

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getOfferId() {
		return offerId;
	}

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}

	public float getPackageAmt() {
		return packageAmt;
	}

	public void setPackageAmt(float packageAmt) {
		this.packageAmt = packageAmt;
	}

	@Override
	public String toString() {
		return "GetPharmacyPaymentDetails [requestToMedicalId=" + requestToMedicalId + ", meetId=" + meetId
				+ ", orderDate=" + orderDate + ", medicalId=" + medicalId + ", patientId=" + patientId
				+ ", patientName=" + patientName + ", medicalName=" + medicalName + ", deliveryType=" + deliveryType
				+ ", totalAmt=" + totalAmt + ", paymentStatus=" + paymentStatus + ", txnId=" + txnId + ", orderId="
				+ orderId + ", paymentDate=" + paymentDate + ", offerId=" + offerId + ", packageAmt=" + packageAmt
				+ "]";
	}

 
	
}
