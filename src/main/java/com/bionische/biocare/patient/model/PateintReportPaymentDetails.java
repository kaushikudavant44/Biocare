package com.bionische.biocare.patient.model;

public class PateintReportPaymentDetails {

	
	private int reportId;
	
	private int txnTableId;
	
	private String reportDate;
	
	
	private String labName;
	
	
	private String reportFileName;
	

	private int paymentStatus;
	
	
	private String labTestName;

	
	private int labTestId;
	

	private String createdDate;
	
	
	private int amountType;

	private float amount;
	
	
	private int discount;
	
	
	private float totalAmount;
	
	


	public int getTxnTableId() {
		return txnTableId;
	}


	public void setTxnTableId(int txnTableId) {
		this.txnTableId = txnTableId;
	}


	public int getReportId() {
		return reportId;
	}


	public void setReportId(int reportId) {
		this.reportId = reportId;
	}


	public String getReportDate() {
		return reportDate;
	}


	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}


	public String getLabName() {
		return labName;
	}


	public void setLabName(String labName) {
		this.labName = labName;
	}


	public String getReportFileName() {
		return reportFileName;
	}


	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
	}


	public int getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}


	public String getLabTestName() {
		return labTestName;
	}


	public void setLabTestName(String labTestName) {
		this.labTestName = labTestName;
	}


	public int getLabTestId() {
		return labTestId;
	}


	public void setLabTestId(int labTestId) {
		this.labTestId = labTestId;
	}


	public String getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
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


	public int getDiscount() {
		return discount;
	}


	public void setDiscount(int discount) {
		this.discount = discount;
	}


	public float getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}


	@Override
	public String toString() {
		return "PateintReportPaymentDetails [reportId=" + reportId + ", txnTableId=" + txnTableId + ", reportDate="
				+ reportDate + ", labName=" + labName + ", reportFileName=" + reportFileName + ", paymentStatus="
				+ paymentStatus + ", labTestName=" + labTestName + ", labTestId=" + labTestId + ", createdDate="
				+ createdDate + ", amountType=" + amountType + ", amount=" + amount + ", discount=" + discount
				+ ", totalAmount=" + totalAmount + "]";
	}
	
	
	
}
