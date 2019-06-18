package com.bionische.biocare.patientdoctor.model;
 
public class GetBabyBornReports {

	

	 
	private int babyReportId;
	
	
	 
	private String motherName;
	
	
	 
	private String headCircumference;
	
	 
	private String dob;
	
	 
	private String sex;
	
	 
	private String hospitalName;

	 
	private String birthTime;
	
	 
	private String length;
	
	
	 
	private String birthWeight;
	
	
	 
	private String bloodGroup;
	
	 
	private String deliveryType;
	 
	 
	 
	private int familyId;
	
	 
	 
	private int patientId;
	
	 
	private int doctorId;
	
	
	 
	private int delStatus;
	
	
	 
	private int int1;
	
	
	 
	private int int2;
	
	
	 
	private String string1;
	
	
	 
	private String string2;

	 
	private String doctorName;
	
	 private String specialist;

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

	public String getHeadCircumference() {
		return headCircumference;
	}

	public void setHeadCircumference(String headCircumference) {
		this.headCircumference = headCircumference;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
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

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	@Override
	public String toString() {
		return "GetBabyBornReports [babyReportId=" + babyReportId + ", motherName=" + motherName
				+ ", headCircumference=" + headCircumference + ", dob=" + dob + ", sex=" + sex + ", hospitalName="
				+ hospitalName + ", birthTime=" + birthTime + ", length=" + length + ", birthWeight=" + birthWeight
				+ ", bloodGroup=" + bloodGroup + ", deliveryType=" + deliveryType + ", familyId=" + familyId
				+ ", patientId=" + patientId + ", doctorId=" + doctorId + ", delStatus=" + delStatus + ", int1=" + int1
				+ ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + ", doctorName=" + doctorName
				+ ", specialist=" + specialist + "]";
	}

	
	
}
