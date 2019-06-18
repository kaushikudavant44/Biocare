package com.bionische.biocare.lab.model;

import java.util.Date;

public class TransactionDetails {
	
	private int id;
	
	private int userType;

	private int fromUserId;
	
	private int toUserId;
	
	private Date createdDate;
	
	private int amountType;
	
	private int status;
	
	private float amount;
	
	private float discount;
	
	private float totalAmount;
	
	private int int1;
	
	private int int2;
	
	private String string1;

	private int reportId;
	
	private String txnId;
	
	private String orderId;
	
	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	 
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}

	public int getToUserId() {
		return toUserId;
	}

	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getAmountType() {
		return amountType;
	}

	public void setAmountType(int amountType) {
		this.amountType = amountType;
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

	@Override
	public String toString() {
		return "TransactionDetails [id=" + id + ", userType=" + userType + ", fromUserId=" + fromUserId + ", toUserId="
				+ toUserId + ", createdDate=" + createdDate + ", amountType=" + amountType + ", status=" + status
				+ ", amount=" + amount + ", discount=" + discount + ", totalAmount=" + totalAmount + ", int1=" + int1
				+ ", int2=" + int2 + ", string1=" + string1 + ", reportId=" + reportId + ", txnId=" + txnId
				+ ", orderId=" + orderId + "]";
	}

	
	
	
	
	
	
}
