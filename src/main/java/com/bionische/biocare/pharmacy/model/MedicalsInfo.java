package com.bionische.biocare.pharmacy.model;

public class MedicalsInfo{
	
	private int medicalId;
	
	private String cityName;
	
	private String medicalName;
	
	private String address;
	
    private int int1;
	
	private int int2;
	
	private String string1;
	
	private String string2;
	
	private int delStatus;

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getMedicalName() {
		return medicalName;
	}

	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "MedicasInfo [medicalId=" + medicalId + ", cityName=" + cityName + ", medicalName=" + medicalName
				+ ", address=" + address + ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2="
				+ string2 + ", delStatus=" + delStatus + "]";
	}
	
	
	
	
	

}
