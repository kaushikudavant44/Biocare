package com.bionische.biocare.patient.model;

public class PatientDetails {

	private int patientId;
	private String fName;
	private String lName;
	private String mName;
	private int familyId;
	private String address;
	private String contactNo;
	private String email;
	private String bloodGroup;
	private String regDate;
	private String gender;
	private String userName;
	private int cityId;
    private int stateId;
    private String qualification;
	private int countryId;
	private String birthDate;
	private String profilePhoto; 
	private int delStatus;
	 
	private String webToken;
	 
	private String motherName;
	
	private int age;
	
	private int int1;
	
	private int int2;
	
	private String string1;
	
	private String string2;
	
	 
	private String password;
 
	private String refferalCode;
	
	
	
	public String getRefferalCode() {
		return refferalCode;
	}

	public void setRefferalCode(String refferalCode) {
		this.refferalCode = refferalCode;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public int getStateId() {
		return stateId;
	}

	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
    
	public int getFamilyId() {
		return familyId;
	}

	public void setFamilyId(int familyId) {
		this.familyId = familyId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
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

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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
 
	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
  
	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getWebToken() {
		return webToken;
	}

	public void setWebToken(String webToken) {
		this.webToken = webToken;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	@Override
	public String toString() {
		return "PatientDetails [patientId=" + patientId + ", fName=" + fName + ", lName=" + lName + ", mName=" + mName
				+ ", familyId=" + familyId + ", address=" + address + ", contactNo=" + contactNo + ", email=" + email
				+ ", bloodGroup=" + bloodGroup + ", regDate=" + regDate + ", gender=" + gender + ", userName="
				+ userName + ", cityId=" + cityId + ", stateId=" + stateId + ", qualification=" + qualification
				+ ", countryId=" + countryId + ", birthDate=" + birthDate + ", profilePhoto=" + profilePhoto
				+ ", delStatus=" + delStatus + ", webToken=" + webToken + ", motherName=" + motherName + ", age=" + age
				+ ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + ", password="
				+ password + ", refferalCode=" + refferalCode + "]";
	}




	
	
       
}
