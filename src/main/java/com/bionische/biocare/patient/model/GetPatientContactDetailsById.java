package com.bionische.biocare.patient.model;

public class GetPatientContactDetailsById {

	
	
	private int patientId;
	
	
	private String fName;
	
	
	private String lName; 
	

	private String mName;
	

	private String contactNo;
	

	private String email;

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

	@Override
	public String toString() {
		return "GetPatientContactDetailsById [patientId=" + patientId + ", fName=" + fName + ", lName=" + lName
				+ ", mName=" + mName + ", contactNo=" + contactNo + ", email=" + email + "]";
	}
	
	
}
