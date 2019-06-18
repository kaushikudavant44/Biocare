package com.bionische.biocare.patientdoctor.model;

import java.util.List;

public class DoctorPatientMeeting {
	
	private int meetId;
	
    private int doctorId;
	
	private int patientId;
	
	private String time;
	
	private String date;
	
	private String discussion;
	
	private String patientProblem;
	
	private String note;
	
	private int delStatus;
	
	private String string1;
	
	private String string2;
	
	private int int1;
	
	private int int2;
	
	private List<PrescriptionDetails> prescriptionDetailsList;
	

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
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

	public String getPatientProblem() {
		return patientProblem;
	}

	public void setPatientProblem(String patientProblem) {
		this.patientProblem = patientProblem;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
	}

	public List<PrescriptionDetails> getPrescriptionDetailsList() {
		return prescriptionDetailsList;
	}

	public void setPrescriptionDetailsList(List<PrescriptionDetails> prescriptionDetailsList) {
		this.prescriptionDetailsList = prescriptionDetailsList;
	}

	@Override
	public String toString() {
		return "DoctorPatientMeeting [meetId=" + meetId + ", doctorId=" + doctorId + ", patientId=" + patientId
				+ ", time=" + time + ", date=" + date + ", discussion=" + discussion + ", patientProblem="
				+ patientProblem + ", note=" + note + ", delStatus=" + delStatus + ", string1=" + string1 + ", string2="
				+ string2 + ", int1=" + int1 + ", int2=" + int2 + ", prescriptionDetailsList=" + prescriptionDetailsList
				+ "]";
	}
 
}
