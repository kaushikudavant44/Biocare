package com.bionische.biocare.ewallet.model;

public class BankTransferRequest {

	private int requestId;
	
	private float requestAmount;
	
	private int walletId;
	
	private int userType;
	
	private int status;
	
	private String transactionId;
	
	private int transactionType;
	
	private int entryBy;
	
	private int userId;
	
	

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public float getRequestAmount() {
		return requestAmount;
	}

	public void setRequestAmount(float requestAmount) {
		this.requestAmount = requestAmount;
	}

	public int getWalletId() {
		return walletId;
	}

	public void setWalletId(int walletId) {
		this.walletId = walletId;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public int getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(int transactionType) {
		this.transactionType = transactionType;
	}

	public int getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(int entryBy) {
		this.entryBy = entryBy;
	}

	@Override
	public String toString() {
		return "BankTransferRequest [requestId=" + requestId + ", requestAmount=" + requestAmount + ", walletId="
				+ walletId + ", userType=" + userType + ", status=" + status + ", transactionId=" + transactionId
				+ ", transactionType=" + transactionType + ", entryBy=" + entryBy + ", userId=" + userId + "]";
	}

	

	
	
	
}
