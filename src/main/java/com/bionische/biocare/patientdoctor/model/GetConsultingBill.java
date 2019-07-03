package com.bionische.biocare.patientdoctor.model;

 
public class GetConsultingBill {

	 
	private int meetId;
 	private int appointmentId;
 	
	private int doctorId;
	private String doctorName;
	//dr education
	private String qualification;
	//dr signs
	private String signature;
	
	private int hospitalId;
	private String hospitalName;
    private String address;
	private String date;
	//hospital con no.
	private String contactNo;
	//hospital email
	private String emailId;

	 private float amount;
	 
	private int patientId;
 
 	private String patientName;

	//patient email
    private String email;
    
    
	public int getMeetId() {
		return meetId;
	}
	public void setMeetId(int meetId) {
		this.meetId = meetId;
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
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	 
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
	@Override
	public String toString() {
		return "GetConsultingBill [meetId=" + meetId + ", appointmentId=" + appointmentId + ", doctorId=" + doctorId
				+ ", doctorName=" + doctorName + ", qualification=" + qualification + ", signature=" + signature
				+ ", hospitalId=" + hospitalId + ", hospitalName=" + hospitalName + ", address=" + address + ", date="
				+ date + ", contactNo=" + contactNo + ", emailId=" + emailId + ", amount=" + amount + ", patientId="
				+ patientId + ", patientName=" + patientName + ", email=" + email + "]";
	}
	 
		
}
