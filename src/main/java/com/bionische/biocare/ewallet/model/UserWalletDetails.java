package com.bionische.biocare.ewallet.model;

import java.util.Date;

public class UserWalletDetails {

 
	private int userWalletId;
	
 
	private int userId;
	
 	private int userType;
	
 	private float promoBalance;

 	private float balance;
 
	private Date createDate;
	
	 
	private Date lastModifiedDate;
	
 	private int delStatus;
	
	public int getUserWalletId() {
		return userWalletId;
	}

	public void setUserWalletId(int userWalletId) {
		this.userWalletId = userWalletId;
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

	public float getPromoBalance() {
		return promoBalance;
	}

	public void setPromoBalance(float promoBalance) {
		this.promoBalance = promoBalance;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public Date getCreateDate() {
		return createDate;
	}

 

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	 

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "UserWalletDetails [userWalletId=" + userWalletId + ", userId=" + userId + ", userType=" + userType
				+ ", promoBalance=" + promoBalance + ", balance=" + balance + ", createDate=" + createDate
				+ ", lastModifiedDate=" + lastModifiedDate + ", delStatus=" + delStatus + "]";
	}

	 
	
	
}
