package com.bionische.biocare.doctor.model;

public class DoctorCollectionAndReportDetail {

    private int unreadReport;
	
	private int totalCollection;

	public int getUnreadReport() {
		return unreadReport;
	}

	public void setUnreadReport(int unreadReport) {
		this.unreadReport = unreadReport;
	}

	public int getTotalCollection() {
		return totalCollection;
	}

	public void setTotalCollection(int totalCollection) {
		this.totalCollection = totalCollection;
	}

	@Override
	public String toString() {
		return "DoctorCollectionAndReportDetail [unreadReport=" + unreadReport + ", totalCollection=" + totalCollection
				+ "]";
	}
	
	
}
