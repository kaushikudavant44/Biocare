package com.bionische.biocare.lab.model;

public class LabAppOfLastThirtyDays {
	
    private String appDate;
	
	private int totalApp;

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public int getTotalApp() {
		return totalApp;
	}

	public void setTotalApp(int totalApp) {
		this.totalApp = totalApp;
	}

	@Override
	public String toString() {
		return "LabAppOfLastThirtyDays [appDate=" + appDate + ", totalApp=" + totalApp + "]";
	}
	
	

}
