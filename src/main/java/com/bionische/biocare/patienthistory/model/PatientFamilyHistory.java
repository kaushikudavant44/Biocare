package com.bionische.biocare.patienthistory.model;

public class PatientFamilyHistory {

	private int familyHistoryId;
	private int patientId;
	private String familyHistory;
	private String string1;
	private String string2;
	public int getFamilyHistoryId() {
		return familyHistoryId;
	}
	public void setFamilyHistoryId(int familyHistoryId) {
		this.familyHistoryId = familyHistoryId;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getFamilyHistory() {
		return familyHistory;
	}
	public void setFamilyHistory(String familyHistory) {
		this.familyHistory = familyHistory;
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
	@Override
	public String toString() {
		return "PatientFamilyHistory [familyHistoryId=" + familyHistoryId + ", patientId=" + patientId
				+ ", familyHistory=" + familyHistory + ", string1=" + string1 + ", string2=" + string2 + "]";
	}
	
	
	
	
}
