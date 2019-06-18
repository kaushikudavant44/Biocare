package com.bionische.biocare.patienthistory.model;

public class PatientHistoryChiefComplaints {

	
	private int chiefcomplaintsId;
	private int patientId;
	private String complaints;
	public int getChiefcomplaintsId() {
		return chiefcomplaintsId;
	}
	public void setChiefcomplaintsId(int chiefcomplaintsId) {
		this.chiefcomplaintsId = chiefcomplaintsId;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patient_Id) {
		this.patientId = patient_Id;
	}
	public String getComplaints() {
		return complaints;
	}
	public void setComplaints(String complaints) {
		this.complaints = complaints;
	}
	@Override
	public String toString() {
		return "PatientHistoryChiefComplaints [chiefcomplaintsId=" + chiefcomplaintsId + ", patientId=" + patientId
				+ ", complaints=" + complaints + "]";
	}
	
    
}
