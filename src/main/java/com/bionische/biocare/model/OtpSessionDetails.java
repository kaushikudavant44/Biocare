 package com.bionische.biocare.model;

import java.util.Date;

public class OtpSessionDetails {

	
	int id;
	String otp;
	String userName;
	Date date;
	String contactNo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	@Override
	public String toString() {
		return "OtpSessionDetails [id=" + id + ", otp=" + otp + ", userName=" + userName + ", date=" + date
				+ ", contactNo=" + contactNo + "]";
	}
 
	
}
