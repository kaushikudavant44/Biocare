package com.bionische.biocare.ewallet.model;

public class ReferalDetails {

	private int userId;
	
	private int userType;

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

	@Override
	public String toString() {
		return "ReferalDetails [userId=" + userId + ", userType=" + userType + "]";
	}
	
	
}
