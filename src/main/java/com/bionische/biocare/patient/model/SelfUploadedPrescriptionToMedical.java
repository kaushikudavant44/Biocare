package com.bionische.biocare.patient.model;

import java.util.Date;

public class SelfUploadedPrescriptionToMedical {

	private int medicalRequestId;
	
	private int patientId;
	
	private int medicalId;
	
	private String address;
	
	private int pincode;
	
	private float totalAmt;
	
	private int paymentStatus;
	
	private String paymentDate;
	
	private int paymentType;
	
	private Date orderDate;
	
	private String orderId;
	
	private String txnId;
	
	private int deliveryType;
	
	private int isWalletPayment;
	
	private float paidByWallet;
	
	private float paidByBank;
	
	private int delStatus;
	
	private String patientContact;
	
	private String prescriptionName;
	
	
	

	public String getPatientContact() {
		return patientContact;
	}

	public void setPatientContact(String patientContact) {
		this.patientContact = patientContact;
	}

	public String getPrescriptionName() {
		return prescriptionName;
	}

	public void setPrescriptionName(String prescriptionName) {
		this.prescriptionName = prescriptionName;
	}

	public int getMedicalRequestId() {
		return medicalRequestId;
	}

	public void setMedicalRequestId(int medicalRequestId) {
		this.medicalRequestId = medicalRequestId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
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

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(int paymentType) {
		this.paymentType = paymentType;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public int getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(int deliveryType) {
		this.deliveryType = deliveryType;
	}

	public int getIsWalletPayment() {
		return isWalletPayment;
	}

	public void setIsWalletPayment(int isWalletPayment) {
		this.isWalletPayment = isWalletPayment;
	}

	public float getPaidByWallet() {
		return paidByWallet;
	}

	public void setPaidByWallet(float paidByWallet) {
		this.paidByWallet = paidByWallet;
	}

	public float getPaidByBank() {
		return paidByBank;
	}

	public void setPaidByBank(float paidByBank) {
		this.paidByBank = paidByBank;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "SelfUploadedPrescriptionToMedical [medicalRequestId=" + medicalRequestId + ", patientId=" + patientId
				+ ", medicalId=" + medicalId + ", address=" + address + ", pincode=" + pincode + ", totalAmt="
				+ totalAmt + ", paymentStatus=" + paymentStatus + ", paymentDate=" + paymentDate + ", paymentType="
				+ paymentType + ", orderDate=" + orderDate + ", orderId=" + orderId + ", txnId=" + txnId
				+ ", deliveryType=" + deliveryType + ", isWalletPayment=" + isWalletPayment + ", paidByWallet="
				+ paidByWallet + ", paidByBank=" + paidByBank + ", delStatus=" + delStatus + ", patientContact="
				+ patientContact + ", prescriptionName=" + prescriptionName + "]";
	}



	
	
	
	
	
}
