package com.bionische.biocare.patient.model;

public class PatientAddressList {
	
	private int patientAddressListId;
	
	private int pincode;
	
	private String fullName;
	
	private String locality;
	
	private String house;
	
	private String street;
	
	private String country;
	
	private String state;
	
	private String city;
	
	private String contactNo;
	
	private int patientId;

	public int getPatientAddressListId() {
		return patientAddressListId;
	}

	public void setPatientAddressListId(int patientAddressListId) {
		this.patientAddressListId = patientAddressListId;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	@Override
	public String toString() {
		return "PatientAddressList [patientAddressListId=" + patientAddressListId + ", pincode=" + pincode
				+ ", fullName=" + fullName + ", locality=" + locality + ", house=" + house + ", street=" + street
				+ ", country=" + country + ", state=" + state + ", city=" + city + ", contactNo=" + contactNo
				+ ", patientId=" + patientId + "]";
	}

	
}
