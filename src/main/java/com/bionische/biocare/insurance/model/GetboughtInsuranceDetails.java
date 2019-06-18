package com.bionische.biocare.insurance.model;

import java.util.List;


public class GetboughtInsuranceDetails {


	private int registrationId;
	private String regDate;
	private String dueDate;
	private  int premium;
	private int companyId;
	private String companyName;
	private int noOfAdult;
	private int noOfChild;
	private int cover;
	private String status;
	 
	private int int1;
	private int int2;
	private String string1;
	private String string2;
	
	
	List<AdultMember> adultMemberList;
	List<ChildMemberDetails> childMemberList;
	
	
	
	public int getRegistrationId() {
		return registrationId;
	}
	public void setRegistrationId(int registrationId) {
		this.registrationId = registrationId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public int getPremium() {
		return premium;
	}
	public void setPremium(int premium) {
		this.premium = premium;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getNoOfAdult() {
		return noOfAdult;
	}
	public void setNoOfAdult(int noOfAdult) {
		this.noOfAdult = noOfAdult;
	}
	public int getNoOfChild() {
		return noOfChild;
	}
	public void setNoOfChild(int noOfChild) {
		this.noOfChild = noOfChild;
	}
	public int getCover() {
		return cover;
	}
	public void setCover(int cover) {
		this.cover = cover;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getString2() {
		return string2;
	}
	public void setString2(String string2) {
		this.string2 = string2;
	}
	public List<AdultMember> getAdultMemberList() {
		return adultMemberList;
	}
	public void setAdultMemberList(List<AdultMember> adultMemberList) {
		this.adultMemberList = adultMemberList;
	}
	public List<ChildMemberDetails> getChildMemberList() {
		return childMemberList;
	}
	public void setChildMemberList(List<ChildMemberDetails> childMemberList) {
		this.childMemberList = childMemberList;
	}
	@Override
	public String toString() {
		return "GetboughtInsuranceDetails [registrationId=" + registrationId + ", regDate=" + regDate + ", dueDate="
				+ dueDate + ", premium=" + premium + ", companyId=" + companyId + ", companyName=" + companyName
				+ ", noOfAdult=" + noOfAdult + ", noOfChild=" + noOfChild + ", cover=" + cover + ", status=" + status
				+ ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2
				+ ", adultMemberList=" + adultMemberList + ", childMemberList=" + childMemberList + "]";
	}
	 
	
	
	
}
