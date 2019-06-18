package com.bionische.biocare.patient.model;
 
public class PatientSuscriptionDetails {

	 
	private int suscriptionId;
	 
	private int patientId;
	 
	private int packageId;
	 
	private int status; 
	private float amount;
	 
	private String txnId;
	 
	private String orderId;
	 
	private String paymentDate;
	
	private int offerId; 
	private float packageAmt;
	

	public int getSuscriptionId() {
		return suscriptionId;
	}

	public void setSuscriptionId(int suscriptionId) {
		this.suscriptionId = suscriptionId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getPackageId() {
		return packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
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
		return "PatientSuscriptionDetails [suscriptionId=" + suscriptionId + ", patientId=" + patientId + ", packageId="
				+ packageId + ", status=" + status + ", amount=" + amount + ", txnId=" + txnId + ", orderId=" + orderId
				+ ", paymentDate=" + paymentDate + ", offerId=" + offerId + ", packageAmt=" + packageAmt + "]";
	}

	 
	
	
}
