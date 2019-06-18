package com.bionische.biocare.doctor.model;

public class GetHospitalDetails {

	
	int id;
	
	
	int doctorId;
	
	
	int hospitalId;
	
	
	
	private String hospitalName;
	
	
	private String address;
	
	
	private String contactNo;

	
	private String email;
	
	
	private int cityId;
	
	private int stateId;
	
	
	private String cityName;
	
	
	private String stateName;
	
	private int type;
	
	

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "GetHospitalDetails [id=" + id + ", doctorId=" + doctorId + ", hospitalId=" + hospitalId
				+ ", hospitalName=" + hospitalName + ", address=" + address + ", contactNo=" + contactNo + ", email="
				+ email + ", cityId=" + cityId + ", stateId=" + stateId + ", cityName=" + cityName + ", stateName="
				+ stateName + ", type=" + type + "]";
	}

	

	
	

	
	
}
