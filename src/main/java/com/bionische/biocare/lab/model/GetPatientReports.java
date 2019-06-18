package com.bionische.biocare.lab.model;

 
public class GetPatientReports {

	 
	private int reportId;
	
	private int appointmentId;
	
	private String fileName;
	
	private int status;
	
	private int patientId;
	 
	private String patientName;
	
	private String date; 
	 
    private int labTestId;
	
	private String labTestName;
 
    private int labId;
    
	private String labName;
    
    private int fileType;

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public int getFileType() {
		return fileType;
	}

	public void setFileType(int fileType) {
		this.fileType = fileType;
	}

	@Override
	public String toString() {
		return "GetPatientReports [reportId=" + reportId + ", appointmentId=" + appointmentId + ", fileName=" + fileName
				+ ", status=" + status + ", patientId=" + patientId + ", patientName=" + patientName + ", date=" + date
				+ ", labTestId=" + labTestId + ", labTestName=" + labTestName + ", labId=" + labId + ", labName="
				+ labName + ", fileType=" + fileType + "]";
	}

	 
    
}
