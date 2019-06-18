package com.bionische.biocare.doctor.model;

 
public class GetDoctorBasicDetails {

	 
	private int doctorId;
	
	private String doctorName;
	
	private String qualification;
	
	private int specId;
	
	private String specType;
	
	private String gender;
	
	private String cityName;
	
	private String address;
	
	private String yearOfExp;
	
	private String aboutMe;
	
	private String profilePhoto;
	
	private String contact;
	
	private String email;
	
	private int status;

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public int getSpecId() {
		return specId;
	}

	public void setSpecId(int specId) {
		this.specId = specId;
	}

	public String getSpecType() {
		return specType;
	}

	public void setSpecType(String specType) {
		this.specType = specType;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	 

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	 

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getYearOfExp() {
		return yearOfExp;
	}

	public void setYearOfExp(String yearOfExp) {
		this.yearOfExp = yearOfExp;
	}

	@Override
	public String toString() {
		return "GetDoctorBasicDetails [doctorId=" + doctorId + ", doctorName=" + doctorName + ", qualification="
				+ qualification + ", specId=" + specId + ", specType=" + specType + ", gender=" + gender + ", cityName="
				+ cityName + ", address=" + address + ", yearOfExp=" + yearOfExp + ", aboutMe=" + aboutMe
				+ ", profilePhoto=" + profilePhoto + ", contact=" + contact + ", email=" + email + ", status=" + status
				+ "]";
	}

 
}
