package com.bionische.biocare.radiology.model;

public class NewPndtPatientDetails {

	int pndtPatientId;

	String patientName;

	String mName;

	String lName;

	String mobileNo;

	int delStatus;

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public int getPndtPatientId() {
		return pndtPatientId;
	}

	public void setPndtPatientId(int pndtPatientId) {
		this.pndtPatientId = pndtPatientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "NewPndtPatientDetails [pndtPatientId=" + pndtPatientId + ", patientName=" + patientName + ", mName="
				+ mName + ", lName=" + lName + ", mobileNo=" + mobileNo + ", delStatus=" + delStatus + "]";
	}

}
