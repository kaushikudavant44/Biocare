package com.bionische.biocare.patientlab.model;

public class GetPatientUploadedReport {

	
	private int reportId;
	
	
	private int patientId;
	
	
    private int labTestId;
	
	
    private int labId;
		
	
	private String reportFileName;
	
	
	private String reportDate;
	
	
    private int int1;


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


	public int getLabId() {
		return labId;
	}


	public void setLabId(int labId) {
		this.labId = labId;
	}


	public String getReportFileName() {
		return reportFileName;
	}


	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
	}


	public String getReportDate() {
		return reportDate;
	}


	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}


	public int getInt1() {
		return int1;
	}


	public void setInt1(int int1) {
		this.int1 = int1;
	}


	@Override
	public String toString() {
		return "GetPatientUploadedReport [reportId=" + reportId + ", patientId=" + patientId + ", labTestId="
				+ labTestId + ", labId=" + labId + ", reportFileName=" + reportFileName + ", reportDate=" + reportDate
				+ ", int1=" + int1 + "]";
	}
    
    
    
}