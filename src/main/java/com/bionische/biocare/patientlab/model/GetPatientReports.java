package com.bionische.biocare.patientlab.model;

import java.util.Date;

public class GetPatientReports {

	
 
	private int reportId;
	
	 
	private int patientId;
 
    private int labTestId;
	
 
    private String labTestName;
	
 
    private int labId;
	
	 
    private String labName;
	
	 
	private String reportFileName;
	 
	private String reportDate;
	
 
    private int int1;
	
	
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public int getLabTestId() {
		return labTestId;
	}
	public void setLabTestId(int labTestId) {
		this.labTestId = labTestId;
	}
 
	public String getLabTestName() {
		return labTestName;
	}
	public void setLabTestName(String labTestName) {
		this.labTestName = labTestName;
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
	@Override
	public String toString() {
		return "GetPatientReports [reportId=" + reportId + ", patientId=" + patientId + ", labTestId=" + labTestId
				+ ", labTestName=" + labTestName + ", labId=" + labId + ", labName=" + labName + ", reportFileName="
				+ reportFileName + ", reportDate=" + reportDate + ", int1=" + int1 + "]";
	}
	
	
}
