package com.bionische.biocare.patientlab.model;

 
 

public class LabAppointment {
 
	private int labAppId;
	
     private int labTestId;
	
 	private int labId;
	
 	private int patientId;
	
 	private String labAppDate;
	
 	private String patientName;
	
     private String patientContact;
	
 	private int patientAge;
	
 	private String string1;
	
 	private String string2;
	
 	private int int1;
	
 	private int int2;
	
 	private int delStatus;
	
 	private int timeId;
 	 
 	private int doctorId;
	
 	private String patientEmail;
	
	public int getTimeId() {
		return timeId;
	}

	public void setTimeId(int timeId) {
		this.timeId = timeId;
	}

	public String getPatientEmail() {
		return patientEmail;
	}

	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
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

	public int getPatientAge() {
		return patientAge;
	}

	public void setPatientAge(int patientAge) {
		this.patientAge = patientAge;
	}

	
	public int getLabAppId() {
		return labAppId;
	}

	public void setLabAppId(int labAppId) {
		this.labAppId = labAppId;
	}

	public int getLabTestId() {
		return labTestId;
	}

	public void setLabTestId(int labTestId) {
		this.labTestId = labTestId;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public String getLabAppDate() {
		return labAppDate;
	}

	public void setLabAppDate(String labAppDate) {
		this.labAppDate = labAppDate;
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

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	
	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	@Override
	public String toString() {
		return "LabAppointment [labAppId=" + labAppId + ", labTestId=" + labTestId + ", labId=" + labId + ", patientId="
				+ patientId + ", labAppDate=" + labAppDate + ", patientName=" + patientName + ", patientContact="
				+ patientContact + ", patientAge=" + patientAge + ", string1=" + string1 + ", string2=" + string2
				+ ", int1=" + int1 + ", int2=" + int2 + ", delStatus=" + delStatus + ", timeId=" + timeId
				+ ", doctorId=" + doctorId + ", patientEmail=" + patientEmail + "]";
	}

	

}
