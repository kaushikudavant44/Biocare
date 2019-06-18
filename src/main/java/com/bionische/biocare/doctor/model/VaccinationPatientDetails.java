package com.bionische.biocare.doctor.model;

public class VaccinationPatientDetails {

	private int patientId;
	  
	
	private String fName;
	
	
	private String lName;
	

	private String mName;
	

	private String gender;
	

	private String address;	
	

	private String bloodGroup;
	 

	private String birthDate;
 

	private int delStatus;


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


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getBloodGroup() {
		return bloodGroup;
	}


	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
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


	@Override
	public String toString() {
		return "VaccinationPatientDetails [patientId=" + patientId + ", fName=" + fName + ", lName=" + lName
				+ ", mName=" + mName + ", gender=" + gender + ", address=" + address + ", bloodGroup=" + bloodGroup
				+ ", birthDate=" + birthDate + ", delStatus=" + delStatus + "]";
	}
	
	

}
