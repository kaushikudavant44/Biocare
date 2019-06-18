package com.bionische.biocare.model;
 

 
public class GetLabPaymentDetails {

 
	private int labAppId;
 
  
	private int patientId;
	 
	private String patientName;
	 
	private int labId;
	
	 
	private String labName;
	  
	private int amountType;
	 
	private int paymentStatus;
	 
	private float amount;
	 
	private float discount;
	 
	private float totalAmount;
	
	private float paidAmount;
 
	 
	private String txnId;
	 
	private String orderId;
	
 
	private String paymentDate;


	public int getLabAppId() {
		return labAppId;
	}


	public void setLabAppId(int labAppId) {
		this.labAppId = labAppId;
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


	public int getLabId() {
		return labId;
	}


	public void setLabId(int labId) {
		this.labId = labId;
	}


	public String getLabName() {
		return labName;
	}


	public void setLabName(String labName) {
		this.labName = labName;
	}


	public int getAmountType() {
		return amountType;
	}


	public void setAmountType(int amountType) {
		this.amountType = amountType;
	}


	public int getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}


	public float getAmount() {
		return amount;
	}


	public void setAmount(float amount) {
		this.amount = amount;
	}


	public float getDiscount() {
		return discount;
	}


	public void setDiscount(float discount) {
		this.discount = discount;
	}


	public float getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
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


	public float getPaidAmount() {
		return paidAmount;
	}


	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}


	@Override
	public String toString() {
		return "GetLabPaymentDetails [labAppId=" + labAppId + ", patientId=" + patientId + ", patientName="
				+ patientName + ", labId=" + labId + ", labName=" + labName + ", amountType=" + amountType
				+ ", paymentStatus=" + paymentStatus + ", amount=" + amount + ", discount=" + discount
				+ ", totalAmount=" + totalAmount + ", paidAmount=" + paidAmount + ", txnId=" + txnId + ", orderId="
				+ orderId + ", paymentDate=" + paymentDate + "]";
	}


	 
 
}

	 