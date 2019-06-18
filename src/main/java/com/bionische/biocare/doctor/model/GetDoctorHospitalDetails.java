package com.bionische.biocare.doctor.model;

 
public class GetDoctorHospitalDetails {

 
	private int id;
	
 
	private int doctorId;
	
 
	private int hospitalId;
	
 
	private String hospitalName;
	
 
	private int delStatus;
	
	private int hospitalType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	 

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getHospitalType() {
		return hospitalType;
	}

	public void setHospitalType(int hospitalType) {
		this.hospitalType = hospitalType;
	}

	@Override
	public String toString() {
		return "GetDoctorHospitalDetails [id=" + id + ", doctorId=" + doctorId + ", hospitalId=" + hospitalId
				+ ", hospitalName=" + hospitalName + ", delStatus=" + delStatus + ", hospitalType=" + hospitalType
				+ "]";
	}

	 
	
}
