package com.bionische.biocare.patient.model;

public class TermsAndConditions {
	
	private int termAndConditionId;
	
	private int userType;
	
	private String termsAndConditions;

	private int delStatus;
	
	private String date;
	
	private String string1;
	
	private String string2;
	
	private int int1;
	
	private int int2;

	

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public String getString2() {
		return string2;
	}

	public void setString2(String string2) {
		this.string2 = string2;
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

	public int getTermAndConditionId() {
		return termAndConditionId;
	}

	public void setTermAndConditionId(int termAndConditionId) {
		this.termAndConditionId = termAndConditionId;
	}

	public String getTermsAndConditions() {
		return termsAndConditions;
	}

	public void setTermsAndConditions(String termsAndConditions) {
		this.termsAndConditions = termsAndConditions;
	}

	@Override
	public String toString() {
		return "TermsAndConditions [termAndConditionId=" + termAndConditionId + ", userType=" + userType
				+ ", termsAndConditions=" + termsAndConditions + ", delStatus=" + delStatus + ", date=" + date
				+ ", string1=" + string1 + ", string2=" + string2 + ", int1=" + int1 + ", int2=" + int2 + "]";
	}

	
	
}
