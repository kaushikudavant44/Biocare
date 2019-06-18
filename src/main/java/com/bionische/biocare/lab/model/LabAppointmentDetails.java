package com.bionische.biocare.lab.model;
 
public class LabAppointmentDetails {

	 
	private int labAppId;
	 
    private String testIdList;
	 
	private int labId;
	 
	private int patientId;
	 
	private String labAppDate;
	
	 
	private int timeId;
	 
	private int delStatus;
	 
	private int status;
	 
	private int amountType;
	 
	private float amount;
	 
	private int paymentStatus;
	
	private float discount;
	 
	private float totalAmount;
	
	private String txnId;
	
	private float paidAmount;
	
	private String orderId;
	
	private String paymentDate;
	
	private int refference;
	
	private int doctorId;
	
	private int paymentClearReceiptNo;
	
	private int ratingStatus;
	
	private int isWalletPayment;
	
	private float paidByWallet;

	
	
	
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

	public int getLabAppId() {
		return labAppId;
	}

	public void setLabAppId(int labAppId) {
		this.labAppId = labAppId;
	}

	 

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getLabAppDate() {
		return labAppDate;
	}

	public void setLabAppDate(String labAppDate) {
		this.labAppDate = labAppDate;
	}

	public int getTimeId() {
		return timeId;
	}

	public void setTimeId(int timeId) {
		this.timeId = timeId;
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

	public int getAmountType() {
		return amountType;
	}

	public void setAmountType(int amountType) {
		this.amountType = amountType;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
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

	public float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
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

	public String getTestIdList() {
		return testIdList;
	}

	public void setTestIdList(String testIdList) {
		this.testIdList = testIdList;
	}

	public int getRefference() {
		return refference;
	}

	public void setRefference(int refference) {
		this.refference = refference;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPaymentClearReceiptNo() {
		return paymentClearReceiptNo;
	}

	public void setPaymentClearReceiptNo(int paymentClearReceiptNo) {
		this.paymentClearReceiptNo = paymentClearReceiptNo;
	}

	public int getRatingStatus() {
		return ratingStatus;
	}

	public void setRatingStatus(int ratingStatus) {
		this.ratingStatus = ratingStatus;
	}

	@Override
	public String toString() {
		return "LabAppointmentDetails [labAppId=" + labAppId + ", testIdList=" + testIdList + ", labId=" + labId
				+ ", patientId=" + patientId + ", labAppDate=" + labAppDate + ", timeId=" + timeId + ", delStatus="
				+ delStatus + ", status=" + status + ", amountType=" + amountType + ", amount=" + amount
				+ ", paymentStatus=" + paymentStatus + ", discount=" + discount + ", totalAmount=" + totalAmount
				+ ", txnId=" + txnId + ", paidAmount=" + paidAmount + ", orderId=" + orderId + ", paymentDate="
				+ paymentDate + ", refference=" + refference + ", doctorId=" + doctorId + ", paymentClearReceiptNo="
				+ paymentClearReceiptNo + ", ratingStatus=" + ratingStatus + ", isWalletPayment=" + isWalletPayment
				+ ", paidByWallet=" + paidByWallet + "]";
	}

	

 
	
}
