package com.bionische.biocare.patientdoctor.model;

public class ConsultingDetails {
	
	private int doctorId;
	
	private int patintId;
	
	private int meetId;
	
	private String hospitalName;
	
	private String doctorName;
	
	private String date;
	
	private String time;
	
	private String patientProblem;
	
	private String discussion;
	
	private String note;
	
	private String patientName;
	
	private int int2;
	
	private String address;
	
	//hospital con no.
	private String contactNo;
	
	//hospital email
	
	private String emailId;
	
	//patient email
	
	private String email;
	
	//dr education
	
	private String qualification;
	
	//dr signs
	private String signature;
	
	
	
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPatintId() {
		return patintId;
	}

	public void setPatintId(int patintId) {
		this.patintId = patintId;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
	}


	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	

	public String getDiscussion() {
		return discussion;
	}

	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPatientProblem() {
		return patientProblem;
	}

	public void setPatientProblem(String patientProblem) {
		this.patientProblem = patientProblem;
	}

	@Override
	public String toString() {
		return "ConsultingDetails [doctorId=" + doctorId + ", patintId=" + patintId + ", meetId=" + meetId
				+ ", hospitalName=" + hospitalName + ", doctorName=" + doctorName + ", date=" + date + ", time=" + time
				+ ", patientProblem=" + patientProblem + ", discussion=" + discussion + ", note=" + note
				+ ", patientName=" + patientName + ", int2=" + int2 + ", address=" + address + ", contactNo="
				+ contactNo + ", emailId=" + emailId + ", email=" + email + ", qualification=" + qualification
				+ ", signature=" + signature + "]";
	}

	


	

	
}
