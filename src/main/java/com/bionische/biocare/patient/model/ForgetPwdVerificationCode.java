package com.bionische.biocare.patient.model;

import java.util.Date;

public class ForgetPwdVerificationCode {
	
	private int verificationCodeId;
	
	private int type;
	
	private String userName;
	
	private Date time;
	
	private String code;

	public int getVerificationCodeId() {
		return verificationCodeId;
	}

	public void setVerificationCodeId(int verificationCodeId) {
		this.verificationCodeId = verificationCodeId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "ForgetPwdVerificationCode [verificationCodeId=" + verificationCodeId + ", type=" + type + ", userName="
				+ userName + ", time=" + time + ", code=" + code + "]";
	}

	
	

}
