package com.bionische.biocare.doctor.model;

 
public class DoctorBankAccountInfo {

	 
	private int id;
	 
	private int doctorId;
	 
	private String accountNo;
	 
	private String bankName;
	 
	private String bankBranch;
	 
	private String ifscCode;
	 
	private String accHolderName;
	 
	private String panNo;
	 
	private String gstNo;
	 
	private int delStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankBranch() {
		return bankBranch;
	}

	public void setBankBranch(String bankBranch) {
		this.bankBranch = bankBranch;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public String getAccHolderName() {
		return accHolderName;
	}

	public void setAccHolderName(String accHolderName) {
		this.accHolderName = accHolderName;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "LabBankAccountInfo [id=" + id + ", doctorId=" + doctorId + ", accountNo=" + accountNo + ", bankName="
				+ bankName + ", bankBranch=" + bankBranch + ", ifscCode=" + ifscCode + ", accHolderName="
				+ accHolderName + ", panNo=" + panNo + ", gstNo=" + gstNo + ", delStatus=" + delStatus + "]";
	}
	
	
}
