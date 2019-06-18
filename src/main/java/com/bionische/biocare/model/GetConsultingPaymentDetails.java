package com.bionische.biocare.model;
 
public class GetConsultingPaymentDetails {

	 
	private int appointId;
 
	private int doctorId;
	 
	private String doctorName;
	 
	private int patientId;
 
	private String patientName;

    private int paymentStatus;
	 
    private String txnId;
 
    private String orderId;
	 
    private float amount;
	 
    private String paymentDate;


	public int getAppointId() {
		return appointId;
	}


	public void setAppointId(int appointId) {
		this.appointId = appointId;
	}


	public int getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}


	public String getDoctorName() {
		return doctorName;
	}


	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
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


	public int getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
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


	public float getAmount() {
		return amount;
	}


	public void setAmount(float amount) {
		this.amount = amount;
	}


	public String getPaymentDate() {
		return paymentDate;
	}


	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}


	@Override
	public String toString() {
		return "GetConsultingPaymentDetails [appointId=" + appointId + ", doctorId=" + doctorId + ", doctorName="
				+ doctorName + ", patientId=" + patientId + ", patientName=" + patientName + ", paymentStatus="
				+ paymentStatus + ", txnId=" + txnId + ", orderId=" + orderId + ", amount=" + amount + ", paymentDate="
				+ paymentDate + "]";
	}
	
	
}
