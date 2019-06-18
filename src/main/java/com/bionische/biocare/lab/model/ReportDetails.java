package com.bionische.biocare.lab.model;

public class ReportDetails {

	private int reportId;
	
    private int labTestId;
    
    private int patientId;
    
    private int labId;
	
	private String reportFileName;
	
	private String reportDate;
	
	private String reportTime;
	
    private int int1;
	
	private int int2;
	
	private String string1;
	private String string2;
	private int delStatus;
	
	
	
	public int getLabId() {
		return labId;
	}
	public void setLabId(int labId) {
		this.labId = labId;
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	
	public int getLabTestId() {
		return labTestId;
	}
	public void setLabTestId(int labTestId) {
		this.labTestId = labTestId;
	}
	
	public String getReportFileName() {
		return reportFileName;
	}
	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
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
	
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	@Override
	public String toString() {
		return "ReportDetails [reportId=" + reportId + ", labTestId=" + labTestId + ", patientId=" + patientId
				+ ", labId=" + labId + ", reportFileName=" + reportFileName + ", reportDate=" + reportDate
				+ ", reportTime=" + reportTime + ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1
				+ ", string2=" + string2 + ", delStatus=" + delStatus + "]";
	}
	
	
	
	
}
