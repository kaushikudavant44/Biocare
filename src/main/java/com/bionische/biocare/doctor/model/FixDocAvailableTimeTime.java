package com.bionische.biocare.doctor.model;

import java.util.Arrays;

public class FixDocAvailableTimeTime {

	String [] timeId;
	String clinicName;
	int clinicId;
	int noOfPatient;

	public int getClinicId() {
		return clinicId;
	}

	public void setClinicId(int clinicId) {
		this.clinicId = clinicId;
	}

	public String[] getTimeId() {
		return timeId;
	}

	public void setTimeId(String[] timeId) {
		this.timeId = timeId;
	}

	public int getNoOfPatient() {
		return noOfPatient;
	}

	public void setNoOfPatient(int noOfPatient) {
		this.noOfPatient = noOfPatient;
	}

	public String getClinicName() {
		return clinicName;
	}

	public void setClinicName(String clinicName) {
		this.clinicName = clinicName;
	}

	@Override
	public String toString() {
		return "FixDocAvailableTimeTime [timeId=" + Arrays.toString(timeId) + ", clinicName=" + clinicName
				+ ", clinicId=" + clinicId + ", noOfPatient=" + noOfPatient + "]";
	}

	 
	 
}
