package com.bionische.biocare.patient.model;

public class PatientAddress {
	
	private int patientId;

	private String cityName;
	
	private String stateName;
	
	private String countryName;
	
	private String address;
	
	private int pincode;
	
	private String contact;
	
	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
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

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Override
	public String toString() {
		return "PatientAddress [patientId=" + patientId + ", cityName=" + cityName + ", stateName=" + stateName
				+ ", countryName=" + countryName + ", address=" + address + ", pincode=" + pincode + ", contact="
				+ contact + "]";
	}

	
	
}
