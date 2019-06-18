package com.bionische.biocare.patientlab.model;

public class BabyBornReports {

	private int babyReportId;

	private String doctorName;

	private String motherName;

	private int hospitalId;

	private String dob;

	private String sex;

	private String birthTime;

	private String length;

	private String birthWeight;

	private String headCircumference;

	private String bloodGroup;

	private String deliveryType;

	private String hospitalName;

	private int familyId;

	private int patientId;

	private int doctorId;

	private int delStatus;

	private int int2;

	private String string1;

	private String string2;

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public int getBabyReportId() {
		return babyReportId;
	}

	public void setBabyReportId(int babyReportId) {
		this.babyReportId = babyReportId;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getBirthTime() {
		return birthTime;
	}

	public void setBirthTime(String birthTime) {
		this.birthTime = birthTime;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getBirthWeight() {
		return birthWeight;
	}

	public void setBirthWeight(String birthWeight) {
		this.birthWeight = birthWeight;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
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

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

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

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getHeadCircumference() {
		return headCircumference;
	}

	public void setHeadCircumference(String headCircumference) {
		this.headCircumference = headCircumference;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	@Override
	public String toString() {
		return "BabyBornReports [babyReportId=" + babyReportId + ", doctorName=" + doctorName + ", motherName="
				+ motherName + ", hospitalId=" + hospitalId + ", dob=" + dob + ", sex=" + sex + ", birthTime="
				+ birthTime + ", length=" + length + ", birthWeight=" + birthWeight + ", headCircumference="
				+ headCircumference + ", bloodGroup=" + bloodGroup + ", deliveryType=" + deliveryType
				+ ", hospitalName=" + hospitalName + ", familyId=" + familyId + ", patientId=" + patientId
				+ ", doctorId=" + doctorId + ", delStatus=" + delStatus + ", int2=" + int2 + ", string1=" + string1
				+ ", string2=" + string2 + "]";
	}

}
