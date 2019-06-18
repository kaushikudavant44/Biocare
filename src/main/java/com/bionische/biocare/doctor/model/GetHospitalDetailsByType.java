package com.bionische.biocare.doctor.model;

public class GetHospitalDetailsByType {

	
	int hospitalId;
	
	
	private String hospitalName;
	
	
	private String address;
	
	
	private String contactNo;
     
	
	private String email;
	
	
	private int cityId;
	
	
	private int stateId;
	
	
	private String cityName;
	
	
	private String stateName;
	
	
	private String type;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "GetHospitalDetailsByType [hospitalId=" + hospitalId + ", hospitalName=" + hospitalName + ", address="
				+ address + ", contactNo=" + contactNo + ", email=" + email + ", cityId=" + cityId + ", stateId="
				+ stateId + ", cityName=" + cityName + ", stateName=" + stateName + ", type=" + type + "]";
	}
	
	
	
}
