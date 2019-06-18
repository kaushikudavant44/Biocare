package com.bionische.biocare.patientlab.model;

public class GetReportDetailsForLab {
	
	private int reportId;
	
	private int patientId;
	
	private int labId;
	
	private String patientFname;
	
	private String patientLname;
	
	private String reportName;
	
	private String reportDate;
	
	private String reportTime;
	
	private String testName;
	
	private String labName;
	
	private String delStatus;
	
	private int int2;
	
	private int int1;

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public String getPatientFname() {
		return patientFname;
	}

	public void setPatientFname(String patientFname) {
		this.patientFname = patientFname;
	}

	public String getPatientLname() {
		return patientLname;
	}

	public void setPatientLname(String patientLname) {
		this.patientLname = patientLname;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public String getLabName() {
		return labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	@Override
	public String toString() {
		return "GetReportDetailsForLab [reportId=" + reportId + ", patientId=" + patientId + ", labId=" + labId
				+ ", patientFname=" + patientFname + ", patientLname=" + patientLname + ", reportName=" + reportName
				+ ", reportDate=" + reportDate + ", reportTime=" + reportTime + ", testName=" + testName + ", labName="
				+ labName + ", delStatus=" + delStatus + ", int2=" + int2 + ", int1=" + int1 + "]";
	}

	
}
