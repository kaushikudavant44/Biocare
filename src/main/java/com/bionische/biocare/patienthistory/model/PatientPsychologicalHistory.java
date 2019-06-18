package com.bionische.biocare.patienthistory.model;

public class PatientPsychologicalHistory {

	private int psychologicaLHistoryId;
	private int patientId;
	private String psychologicalHistory;
	private String string1;
	private String string2;
	public int getPsychologicaLHistoryId() {
		return psychologicaLHistoryId;
	}
	public void setPsychologicaLHistoryId(int psychologicaLHistoryId) {
		this.psychologicaLHistoryId = psychologicaLHistoryId;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getPsychologicalHistory() {
		return psychologicalHistory;
	}
	public void setPsychologicalHistory(String psychologicalHistory) {
		this.psychologicalHistory = psychologicalHistory;
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
		return "PatientPsychologicalHistory [psychologicaLHistoryId=" + psychologicaLHistoryId + ", patientId="
				+ patientId + ", psychologicalHistory=" + psychologicalHistory + ", string1=" + string1 + ", string2="
				+ string2 + "]";
	}
	
	
	
}

