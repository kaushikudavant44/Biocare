package com.bionische.biocare.patientlab.model;

import java.util.List;

 

public class GetPatientLabReportAndBornReports {

	
	List<GetPatientReports> getPatientReportsList;
	List<GetPatientBornReport> getPatientBornReportList;
	List<GetPatientUploadedReport> getPatientUploadedReportList;
	
	public List<GetPatientReports> getGetPatientReportsList() {
		return getPatientReportsList;
	}
	public void setGetPatientReportsList(List<GetPatientReports> getPatientReportsList) {
		this.getPatientReportsList = getPatientReportsList;
	}
	public List<GetPatientBornReport> getGetPatientBornReportList() {
		return getPatientBornReportList;
	}
	public void setGetPatientBornReportList(List<GetPatientBornReport> getPatientBornReportList) {
		this.getPatientBornReportList = getPatientBornReportList;
	}
	
	
	public List<GetPatientUploadedReport> getGetPatientUploadedReportList() {
		return getPatientUploadedReportList;
	}
	public void setGetPatientUploadedReportList(List<GetPatientUploadedReport> getPatientUploadedReportList) {
		this.getPatientUploadedReportList = getPatientUploadedReportList;
	}
	@Override
	public String toString() {
		return "GetPatientLabReportAndBornReports [getPatientReportsList=" + getPatientReportsList
				+ ", getPatientBornReportList=" + getPatientBornReportList + ", getPatientUploadedReportList="
				+ getPatientUploadedReportList + "]";
	}
	
	 
	 
	
	
	
	
	
}
