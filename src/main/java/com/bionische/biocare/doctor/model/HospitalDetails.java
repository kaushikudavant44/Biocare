package com.bionische.biocare.doctor.model;

public class HospitalDetails {

	private int hospitalId;
	
	private int countryId;
	
	private int stateId;
	
	private int cityId;
	
	private String contactNo;
	
	private String email;
	
	private String address;

	private String hospitalName;
	
    private int delStatus;
	
	private String string1;
	
	private String string2;
	
	private int int1;
	
	private int int2;
	
	private float latitude;
	
	private int longitude;
	
	
	/**
	 *	This type is use for predict clinic or hospital
	 *  clinic =0
	 *  hospital=1 
	 */
	private int type;

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public String getString2() {
		return string2;
	}

	public void setString2(String string2) {
		this.string2 = string2;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "HospitalDetails [hospitalId=" + hospitalId + ", countryId=" + countryId + ", stateId=" + stateId
				+ ", cityId=" + cityId + ", contactNo=" + contactNo + ", email=" + email + ", address=" + address
				+ ", hospitalName=" + hospitalName + ", delStatus=" + delStatus + ", string1=" + string1 + ", string2="
				+ string2 + ", int1=" + int1 + ", int2=" + int2 + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", type=" + type + "]";
	}

	
	
	
	
}
