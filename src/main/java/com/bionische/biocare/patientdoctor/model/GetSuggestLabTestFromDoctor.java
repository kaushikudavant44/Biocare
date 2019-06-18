package com.bionische.biocare.patientdoctor.model;

 
 
public class GetSuggestLabTestFromDoctor {

	 
	private int suggestId;
	
	private int meetId;
	
	private int doctorId;
	
	private int patientId;
	
	private String testIdList;
	
	private String testNameList;
	
	private int labId;
	
	private String labName;

	public int getSuggestId() {
		return suggestId;
	}

	public void setSuggestId(int suggestId) {
		this.suggestId = suggestId;
	}

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

	public String getTestIdList() {
		return testIdList;
	}

	public void setTestIdList(String testIdList) {
		this.testIdList = testIdList;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
	}

	public String getTestNameList() {
		return testNameList;
	}

	public void setTestNameList(String testNameList) {
		this.testNameList = testNameList;
	}

	 

	public String getLabName() {
		return labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	@Override
	public String toString() {
		return "GetSuggestLabTestFromDoctor [suggestId=" + suggestId + ", meetId=" + meetId + ", doctorId=" + doctorId
				+ ", patientId=" + patientId + ", testIdList=" + testIdList + ", testNameList=" + testNameList
				+ ", labId=" + labId + ", labName=" + labName + "]";
	}

	 
	 
	 
}
