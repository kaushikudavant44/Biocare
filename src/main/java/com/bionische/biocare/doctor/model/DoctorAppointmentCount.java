package com.bionische.biocare.doctor.model;


public class DoctorAppointmentCount {

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
		return "DoctorAppointmentCount [totalApp=" + totalApp + ", completedApp=" + completedApp + "]";
	}
	
	

}
