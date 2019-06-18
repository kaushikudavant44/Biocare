package com.bionische.biocare.ewallet.model;

import java.util.Date;

public class TransactionWalletDetails {

	int transactionId;
	
	int fromUserId;
	
	int userType;
	
	int walletId;
	
	int transactionType;
	
	float amount;
	
	int toUserId;
	
	private Date createDate;
	
	 
	private Date lastModifiedDate;
	
	private int toUserType;
	
	

	public int getToUserType() {
		return toUserType;
	}

	public void setToUserType(int toUserType) {
		this.toUserType = toUserType;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public int getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getWalletId() {
		return walletId;
	}

	public void setWalletId(int walletId) {
		this.walletId = walletId;
	}

	public int getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(int transactionType) {
		this.transactionType = transactionType;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getToUserId() {
		return toUserId;
	}

	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}

	@Override
	public String toString() {
		return "TransactionWalletDetails [transactionId=" + transactionId + ", fromUserId=" + fromUserId + ", userType="
				+ userType + ", walletId=" + walletId + ", transactionType=" + transactionType + ", amount=" + amount
				+ ", toUserId=" + toUserId + ", createDate=" + createDate + ", lastModifiedDate=" + lastModifiedDate
				+ ", toUserType=" + toUserType + "]";
	}

	

	
	
	
}
