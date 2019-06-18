package com.bionische.biocare.patientdoctor.model;

public class SharingReportWithDoc {
	
	private int reportToDocId;
	
	private int patientId;
	
	private int doctorId;
	
	private String reportId;
	
	private String date;
	
    private int int1;
	
	private int int2;
	
	private String string1;
	
	private String string2;
	
	private int delStatus;

	
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getReportToDocId() {
		return reportToDocId;
	}

	public void setReportToDocId(int reportToDocId) {
		this.reportToDocId = reportToDocId;
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

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
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

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "SharingReportWithDoc [reportToDocId=" + reportToDocId + ", patientId=" + patientId + ", doctorId="
				+ doctorId + ", reportId=" + reportId + ", date=" + date + ", int1=" + int1 + ", int2=" + int2
				+ ", string1=" + string1 + ", string2=" + string2 + ", delStatus=" + delStatus + "]";
	}
	
	
	

}
