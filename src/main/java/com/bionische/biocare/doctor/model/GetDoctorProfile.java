package com.bionische.biocare.doctor.model;
 
public class GetDoctorProfile {

	
 
	private int doctorId;
	
	
 
	private String fName;
	
 
	private String lName; 
	
 
	private String mName;
	
 
	private String gender;
	
 
	private int cityId;
	
	private String signature;
 
	private String cityName;
	
 
    private int stateId;
	
 
	private int countryId;
	
 
	private int hospitalId;
 
	private String address;
 
	private String yearOfExperience;
 
	private String aboutMe;
	
 
	private String profilePhoto;
	
 
	private String contactNo;
	
 
	private String email;
	
 
	private String qualification;
 
	private String college;
	 
	private String passingYear;
	
	private float fees;
	 
	private int specId;
	
	private int int2;
	 
	private String specType;
	 
	private String councilRegNo;
	 
	private String councilName;
	
	private int delStatus;

	
	
	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	public float getFees() {
		return fees;
	}

	public void setFees(float fees) {
		this.fees = fees;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

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

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getYearOfExperience() {
		return yearOfExperience;
	}

	public void setYearOfExperience(String yearOfExperience) {
		this.yearOfExperience = yearOfExperience;
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

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getPassingYear() {
		return passingYear;
	}

	public void setPassingYear(String passingYear) {
		this.passingYear = passingYear;
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

	public String getCouncilRegNo() {
		return councilRegNo;
	}

	public void setCouncilRegNo(String councilRegNo) {
		this.councilRegNo = councilRegNo;
	}

	public String getCouncilName() {
		return councilName;
	}

	public void setCouncilName(String councilName) {
		this.councilName = councilName;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	@Override
	public String toString() {
		return "GetDoctorProfile [doctorId=" + doctorId + ", fName=" + fName + ", lName=" + lName + ", mName=" + mName
				+ ", gender=" + gender + ", cityId=" + cityId + ", signature=" + signature + ", cityName=" + cityName
				+ ", stateId=" + stateId + ", countryId=" + countryId + ", hospitalId=" + hospitalId + ", address="
				+ address + ", yearOfExperience=" + yearOfExperience + ", aboutMe=" + aboutMe + ", profilePhoto="
				+ profilePhoto + ", contactNo=" + contactNo + ", email=" + email + ", qualification=" + qualification
				+ ", college=" + college + ", passingYear=" + passingYear + ", fees=" + fees + ", specId=" + specId
				+ ", int2=" + int2 + ", specType=" + specType + ", councilRegNo=" + councilRegNo + ", councilName="
				+ councilName + ", delStatus=" + delStatus + "]";
	}

	 


	
	
	
}
