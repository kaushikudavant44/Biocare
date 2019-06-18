package com.bionische.biocare.pharmacy.model;

 
public class PharmacySubscriptionDetails {

 
	private int suscriptionId;
	 
	private int medicalId;
	
  
	private int packageId;
	 
	private float amount;
	 
	private int delStatus;
	 
	private String orderId;
	 
	private String paymentDate;
	 
	private String packageExpDate;
	 
	private String txnId;
	 
	private int txnStatus;
	
	private int offerId;
	 
	private float packageAmt;
	
	public int getSuscriptionId() {
		return suscriptionId;
	}

	public void setSuscriptionId(int suscriptionId) {
		this.suscriptionId = suscriptionId;
	}
 

	public int getPackageId() {
		return packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getPackageExpDate() {
		return packageExpDate;
	}

	public void setPackageExpDate(String packageExpDate) {
		this.packageExpDate = packageExpDate;
	}

 

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

 

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public int getTxnStatus() {
		return txnStatus;
	}

	public void setTxnStatus(int txnStatus) {
		this.txnStatus = txnStatus;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}

	public int getOfferId() {
		return offerId;
	}

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}

	public float getPackageAmt() {
		return packageAmt;
	}

	public void setPackageAmt(float packageAmt) {
		this.packageAmt = packageAmt;
	}

	@Override
	public String toString() {
		return "PharmacySubscriptionDetails [suscriptionId=" + suscriptionId + ", medicalId=" + medicalId
				+ ", packageId=" + packageId + ", amount=" + amount + ", delStatus=" + delStatus + ", orderId="
				+ orderId + ", paymentDate=" + paymentDate + ", packageExpDate=" + packageExpDate + ", txnId=" + txnId
				+ ", txnStatus=" + txnStatus + ", offerId=" + offerId + ", packageAmt=" + packageAmt + "]";
	}

 

	 
	 

	 

	 
 
}
