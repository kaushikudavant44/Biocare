package com.bionische.biocare.patientdoctor.model;

 
 
public class PatientCallDetails {

	 
	private int id;
	
	private int doctorId;
	
	private int patientId;
	
	private int status;
	
	private String datetime;
	
	private String fromName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	@Override
	public String toString() {
		return "PatientCallDetails [id=" + id + ", doctorId=" + doctorId + ", patientId=" + patientId + ", status="
				+ status + ", datetime=" + datetime + ", fromName=" + fromName + "]";
	}

	 
	
	
}
