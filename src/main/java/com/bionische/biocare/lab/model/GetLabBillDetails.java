package com.bionische.biocare.lab.model;
 

public class GetLabBillDetails {
	
	
	private int id;
	 
 
	private int patientId;
	 
	private String patientName;
	 
	private int labId;
	 
	private String labName;

	private int amountType;


	private int status;


	private float amount;


	private float discount; 
	
	private float totalAmount;
  
	private String txnId;
	 
	private String orderId;
	 
	private String paymentDate;
	 
	private String testIdList;
	 
	private String labTestName;
	 
	private String email;
	 
	private String contact;
	 
	private String address;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public String getLabName() {
		return labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	public int getAmountType() {
		return amountType;
	}

	public void setAmountType(int amountType) {
		this.amountType = amountType;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getTestIdList() {
		return testIdList;
	}

	public void setTestIdList(String testIdList) {
		this.testIdList = testIdList;
	}

	public String getLabTestName() {
		return labTestName;
	}

	public void setLabTestName(String labTestName) {
		this.labTestName = labTestName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "GetLabBillDetails [id=" + id + ", patientId=" + patientId + ", patientName=" + patientName + ", labId="
				+ labId + ", labName=" + labName + ", amountType=" + amountType + ", status=" + status + ", amount="
				+ amount + ", discount=" + discount + ", totalAmount=" + totalAmount + ", txnId=" + txnId + ", orderId="
				+ orderId + ", paymentDate=" + paymentDate + ", testIdList=" + testIdList + ", labTestName="
				+ labTestName + ", email=" + email + ", contact=" + contact + ", address=" + address + "]";
	}

	 

}
