package com.bionische.biocare.ewallet.model;

import java.util.Date;



public class WalletDetails {

int walletId;
	


	int userId;
	
	//0=doctor;
	//1=patient;
	//2=lab;
	//3=pharmacy


	int userType;
	


	float walletAmount;
	


	private Date createDate;
	


	private String lastModifiedDate;
	

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	

	public int getWalletId() {
		return walletId;
	}

	public void setWalletId(int walletId) {
		this.walletId = walletId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public float getWalletAmount() {
		return walletAmount;
	}

	public void setWalletAmount(float walletAmount) {
		this.walletAmount = walletAmount;
	}

	public String getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	@Override
	public String toString() {
		return "WalletDetails [walletId=" + walletId + ", userId=" + userId + ", userType=" + userType
				+ ", walletAmount=" + walletAmount + ", createDate=" + createDate + ", lastModifiedDate="
				+ lastModifiedDate + "]";
	}

	
	


	
	
}
