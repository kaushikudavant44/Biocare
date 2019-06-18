package com.bionische.biocare.radiology.model;

public class PndtPatientBasicDetails {

	private int pndtId;
	private int patientId;
	private String fName;
	private String lName;
	private String mName;

	private String address;
	private String contactNo;
	private String email;
	private int doctorId;

	public int getPndtId() {
		return pndtId;
	}

	public void setPndtId(int pndtId) {
		this.pndtId = pndtId;
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

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	@Override
	public String toString() {
		return "PndtPatientBasicDetails [pndtId=" + pndtId + ", patientId=" + patientId + ", fName=" + fName
				+ ", lName=" + lName + ", mName=" + mName + ", address=" + address + ", contactNo=" + contactNo
				+ ", email=" + email + ", doctorId=" + doctorId + "]";
	}

}
