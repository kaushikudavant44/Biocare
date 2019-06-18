package com.bionische.biocare.doctor.model;

 
public class DoctorSuscriptionReceipt {

	 
	private int suscriptionId;
	 
	private int doctorId;
	 
	private float amount;
	 
	private String orderId;
	 
	private String createdDate;
	 
	private String txnId;
	 
	private float packageAmt;
	 
	private String companyGstNo;
	 
	private String gstNo; 
	
	private String contactNo1;
	 
	private String contactNo2;
	 
	private String email;
	 
	private String website;
	 
	private String address;
	  
	private String companyName;

	public int getSuscriptionId() {
		return suscriptionId;
	}

	public void setSuscriptionId(int suscriptionId) {
		this.suscriptionId = suscriptionId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public float getPackageAmt() {
		return packageAmt;
	}

	public void setPackageAmt(float packageAmt) {
		this.packageAmt = packageAmt;
	}

	public String getCompanyGstNo() {
		return companyGstNo;
	}

	public void setCompanyGstNo(String companyGstNo) {
		this.companyGstNo = companyGstNo;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public String getContactNo1() {
		return contactNo1;
	}

	public void setContactNo1(String contactNo1) {
		this.contactNo1 = contactNo1;
	}

	public String getContactNo2() {
		return contactNo2;
	}

	public void setContactNo2(String contactNo2) {
		this.contactNo2 = contactNo2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Override
	public String toString() {
		return "LabSuscriptionReceipt [suscriptionId=" + suscriptionId + ", doctorId=" + doctorId + ", amount="
				+ amount + ", orderId=" + orderId + ", createdDate=" + createdDate + ", txnId=" + txnId
				+ ", packageAmt=" + packageAmt + ", companyGstNo=" + companyGstNo + ", gstNo=" + gstNo + ", contactNo1="
				+ contactNo1 + ", contactNo2=" + contactNo2 + ", email=" + email + ", website=" + website + ", address="
				+ address + ", companyName=" + companyName + "]";
	}

	 
	
	
	
}
