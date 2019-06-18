package com.bionische.biocare.patient.model;

public class City {
private int cityId;
private String cityName;
private int stateId;
private int int1;
private int int2;
private String string1;
private String string2;
private int delStatus;

public int getCityId() {
	return cityId;
}
public void setCityId(int cityId) {
	this.cityId = cityId;
}
public String getCityName() {
	return cityName;
}
public void setCityName(String cityName) {
	this.cityName = cityName;
}
public int getStateId() {
	return stateId;
}
public void setStateId(int stateId) {
	this.stateId = stateId;
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
	return "DoctorCityList [cityId=" + cityId + ", cityName=" + cityName + ", stateId=" + stateId + ", int1=" + int1
			+ ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + ", delStatus=" + delStatus + "]";
}
public static Object getDoctorCityList() {
	// TODO Auto-generated method stub
	return null;
}


}
