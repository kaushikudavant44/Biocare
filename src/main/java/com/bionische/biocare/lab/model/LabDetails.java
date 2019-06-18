package com.bionische.biocare.lab.model;

import java.util.Date;

public class LabDetails {

	private int cityId;
	private int stateId;
	private int countryId;

	private int labId;
	private String labName;

	private String address;

	private String fromTime;

	private String toTime;

	private String owner;

	private String licenceNo;

	private String photo;

	private int delStatus;

	private String contact;

	private String email;

	private float latitude;

	private float longitude;

	private String userName;

	private String password;

	private int int1;

	private int int2;

	private int int3;

	private String string1;

	private String string2;

	private String string3;

	private String token;

	private int isRadiologist;

	private Date createDate;

	private Date lastModifiedDate;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getIsRadiologist() {
		return isRadiologist;
	}

	public void setIsRadiologist(int isRadiologist) {
		this.isRadiologist = isRadiologist;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	private String teststypes;

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getLabName() {
		return labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getLicenceNo() {
		return licenceNo;
	}

	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
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

	public int getInt3() {
		return int3;
	}

	public void setInt3(int int3) {
		this.int3 = int3;
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

	public String getString3() {
		return string3;
	}

	public void setString3(String string3) {
		this.string3 = string3;
	}

	public String getTeststypes() {
		return teststypes;
	}

	public void setTeststypes(String teststypes) {
		this.teststypes = teststypes;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getLat() {
		return latitude;
	}

	public void setLat(float lat) {
		this.latitude = lat;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	@Override
	public String toString() {
		return "LabDetails [cityId=" + cityId + ", stateId=" + stateId + ", countryId=" + countryId + ", labId=" + labId
				+ ", labName=" + labName + ", address=" + address + ", fromTime=" + fromTime + ", toTime=" + toTime
				+ ", owner=" + owner + ", licenceNo=" + licenceNo + ", photo=" + photo + ", delStatus=" + delStatus
				+ ", contact=" + contact + ", email=" + email + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", userName=" + userName + ", password=" + password + ", int1=" + int1 + ", int2=" + int2 + ", int3="
				+ int3 + ", string1=" + string1 + ", string2=" + string2 + ", string3=" + string3 + ", token=" + token
				+ ", isRadiologist=" + isRadiologist + ", createDate=" + createDate + ", lastModifiedDate="
				+ lastModifiedDate + ", teststypes=" + teststypes + "]";
	}

}
