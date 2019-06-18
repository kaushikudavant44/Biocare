package com.bionische.biocare.lab.model;


public class LabAppointmentCount {
	
    private int totalApp;
	
	private int completedApp;

	public int getTotalApp() {
		return totalApp;
	}

	public void setTotalApp(int totalApp) {
		this.totalApp = totalApp;
	}

	public int getCompletedApp() {
		return completedApp;
	}

	public void setCompletedApp(int completedApp) {
		this.completedApp = completedApp;
	}

	@Override
	public String toString() {
		return "LabAppointmentCount [totalApp=" + totalApp + ", completedApp=" + completedApp + "]";
	}

	
}
