package com.bionische.biocare.doctor.model;
 
public class GetDoctorConsultingReceipt {
 
	private int receiptNo;
	 
	private int doctorId;
	 
	private String doctorName;
	 
	private String createdDate;
	 
	private float totAmount;
	 
	private String txnId;
	 
	private String date;
	  
	private String fromDate;
	 
	private String toDate;
 
	private float paidAmt;
	 
	private float commissionAmt;
	 
	private String companyGstNo;
	 
	private String gstNo;
	 
	private String contactNo1;
	 
	private String contactNo2;
	 
	private String email;
	 
	private String website;
	 
	private String address;
	  
	private String companyName;

	
	
	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
 

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

 

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public int getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}

	public float getTotAmount() {
		return totAmount;
	}

	public void setTotAmount(float totAmount) {
		this.totAmount = totAmount;
	}

	public float getPaidAmt() {
		return paidAmt;
	}

	public void setPaidAmt(float paidAmt) {
		this.paidAmt = paidAmt;
	}

	public float getCommissionAmt() {
		return commissionAmt;
	}

	public void setCommissionAmt(float commissionAmt) {
		this.commissionAmt = commissionAmt;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
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

	 
	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Override
	public String toString() {
		return "GetPharmacyPrescriptionReceipt [receiptNo=" + receiptNo + ", doctorId=" + doctorId + ", doctorName="
				+ doctorName + ", createdDate=" + createdDate + ", totAmount=" + totAmount + ", txnId=" + txnId
				+ ", date=" + date + ", fromDate=" + fromDate + ", toDate=" + toDate + ", paidAmt=" + paidAmt
				+ ", commissionAmt=" + commissionAmt + ", companyGstNo=" + companyGstNo + ", gstNo=" + gstNo
				+ ", contactNo1=" + contactNo1 + ", contactNo2=" + contactNo2 + ", email=" + email + ", website="
				+ website + ", address=" + address + ", companyName=" + companyName + "]";
	}

	 

	 

	 
	 

	 
	
	
}
