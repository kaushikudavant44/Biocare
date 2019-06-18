package com.bionische.biocare.patientlab.model;

public class GetLabAppointment {

	
 
	private int appointId;
	
 
	private String testIdList;
	
 
	private String labTestName;
	
 
	private int labId;
	
 
	private String labName;

 
	private int patientId;
	
	private int timeId;
 
	private String time;
 
	private String date;
 
	private String labAddress;
	
 
	private String patientName; 
 
	private String patientContact; 
	
 
    private int delStatus;

	private int status;

	 
	private int paymentStatus;

	 
	private float totalAmount;
	 
	private String patientEmail;
 
    private int doctorId;
 
    private int refference;
    
	private String doctorName;

	public int getTimeId() {
		return timeId;
	}



	public void setTimeId(int timeId) {
		this.timeId = timeId;
	}



	public int getAppointId() {
		return appointId;
	}



	public void setAppointId(int appointId) {
		this.appointId = appointId;
	}



	public String getLabName() {
		return labName;
	}



	public void setLabName(String labName) {
		this.labName = labName;
	}



	public int getPatientId() {
		return patientId;
	}



	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public String getLabAddress() {
		return labAddress;
	}



	public void setLabAddress(String labAddress) {
		this.labAddress = labAddress;
	}



	public String getPatientName() {
		return patientName;
	}



	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}



	public String getPatientContact() {
		return patientContact;
	}



	public void setPatientContact(String patientContact) {
		this.patientContact = patientContact;
	}



	public int getDelStatus() {
		return delStatus;
	}



	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}



	public String getPatientEmail() {
		return patientEmail;
	}



	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
	}



	public int getLabId() {
		return labId;
	}



	public void setLabId(int labId) {
		this.labId = labId;
	}

 

	public String getLabTestName() {
		return labTestName;
	}



	public void setLabTestName(String labTestName) {
		this.labTestName = labTestName;
	}



	public String getTestIdList() {
		return testIdList;
	}



	public void setTestIdList(String testIdList) {
		this.testIdList = testIdList;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}


 

	public float getTotalAmount() {
		return totalAmount;
	}



	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}



	public int getPaymentStatus() {
		return paymentStatus;
	}



	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
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



	public int getRefference() {
		return refference;
	}



	public void setRefference(int refference) {
		this.refference = refference;
	}



	@Override
	public String toString() {
		return "GetLabAppointment [appointId=" + appointId + ", testIdList=" + testIdList + ", labTestName="
				+ labTestName + ", labId=" + labId + ", labName=" + labName + ", patientId=" + patientId + ", timeId="
				+ timeId + ", time=" + time + ", date=" + date + ", labAddress=" + labAddress + ", patientName="
				+ patientName + ", patientContact=" + patientContact + ", delStatus=" + delStatus + ", status=" + status
				+ ", paymentStatus=" + paymentStatus + ", totalAmount=" + totalAmount + ", patientEmail=" + patientEmail
				+ ", doctorId=" + doctorId + ", refference=" + refference + ", doctorName=" + doctorName + "]";
	}

 
 
	 
}
