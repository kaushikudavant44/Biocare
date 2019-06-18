package com.bionische.biocare.model;
 
public class GetUsersCount {
 
	private int id;
	
	private int labCount;
	
	private int patientCount;
	
	private int pharmacyCount;
	
	private int doctorCount;
	
	private int hospitalCount;

	public int getLabCount() {
		return labCount;
	}

	public void setLabCount(int labCount) {
		this.labCount = labCount;
	}

	public int getPatientCount() {
		return patientCount;
	}

	public void setPatientCount(int patientCount) {
		this.patientCount = patientCount;
	}

	public int getPharmacyCount() {
		return pharmacyCount;
	}

	public void setPharmacyCount(int pharmacyCount) {
		this.pharmacyCount = pharmacyCount;
	}

	public int getDoctorCount() {
		return doctorCount;
	}

	public void setDoctorCount(int doctorCount) {
		this.doctorCount = doctorCount;
	}

	public int getHospitalCount() {
		return hospitalCount;
	}

	public void setHospitalCount(int hospitalCount) {
		this.hospitalCount = hospitalCount;
	}

	@Override
	public String toString() {
		return "GetUsersCount [labCount=" + labCount + ", patientCount=" + patientCount + ", pharmacyCount="
				+ pharmacyCount + ", doctorCount=" + doctorCount + ", hospitalCount=" + hospitalCount + "]";
	}
	
	
}
