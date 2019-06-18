package com.bionische.biocare.insurance.model;

public class AdultMember {

	private int adultMemberId;
	private int insuRegistrationId;
	private String adultFirstName;
	private String adultMiddleName;
	private String adultLastName;
	private String adultGender;
	private String proposerRelation;
	private String adultOccupation;
	private String adultDob;
	private float adultHeight;
	private float adultWeight;
	private int int1;
	private int int2;
	private int policyNo;
	private int delStatus;
	private String string1;
	private String string2;
	
	public int getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(int policyNo) {
		this.policyNo = policyNo;
	}
	public int getAdultMemberId() {
		return adultMemberId;
	}
	public void setAdultMemberId(int adultMemberId) {
		this.adultMemberId = adultMemberId;
	}
	public int getInsuRegistrationId() {
		return insuRegistrationId;
	}
	public void setInsuRegistrationId(int insuRegistrationId) {
		this.insuRegistrationId = insuRegistrationId;
	}
	public String getAdultFirstName() {
		return adultFirstName;
	}
	public void setAdultFirstName(String adultFirstName) {
		this.adultFirstName = adultFirstName;
	}
	public String getAdultMiddleName() {
		return adultMiddleName;
	}
	public void setAdultMiddleName(String adultMiddleName) {
		this.adultMiddleName = adultMiddleName;
	}
	public String getAdultLastName() {
		return adultLastName;
	}
	public void setAdultLastName(String adultLastName) {
		this.adultLastName = adultLastName;
	}
	public String getAdultGender() {
		return adultGender;
	}
	public void setAdultGender(String adultGender) {
		this.adultGender = adultGender;
	}
	public String getProposerRelation() {
		return proposerRelation;
	}
	public void setProposerRelation(String proposerRelation) {
		this.proposerRelation = proposerRelation;
	}
	public String getAdultOccupation() {
		return adultOccupation;
	}
	public void setAdultOccupation(String adultOccupation) {
		this.adultOccupation = adultOccupation;
	}
	public String getAdultDob() {
		return adultDob;
	}
	public void setAdultDob(String adultDob) {
		this.adultDob = adultDob;
	}
	public float getAdultHeight() {
		return adultHeight;
	}
	public void setAdultHeight(float adultHeight) {
		this.adultHeight = adultHeight;
	}
	public float getAdultWeight() {
		return adultWeight;
	}
	public void setAdultWeight(float adultWeight) {
		this.adultWeight = adultWeight;
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
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
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
	@Override
	public String toString() {
		return "AdultMember [adultMemberId=" + adultMemberId + ", insuRegistrationId=" + insuRegistrationId
				+ ", adultFirstName=" + adultFirstName + ", adultMiddleName=" + adultMiddleName + ", adultLastName="
				+ adultLastName + ", adultGender=" + adultGender + ", proposerRelation=" + proposerRelation
				+ ", adultOccupation=" + adultOccupation + ", adultDob=" + adultDob + ", adultHeight=" + adultHeight
				+ ", adultWeight=" + adultWeight + ", int1=" + int1 + ", int2=" + int2 + ", delStatus=" + delStatus
				+ ", string1=" + string1 + ", string2=" + string2 + "]";
	}
	
	
}
