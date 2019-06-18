package com.bionische.biocare.stemcell.model;

public class PatientEnrollDetails {
	
	
private int patientId;
	
	private int hospitalId;
	
	private int planId;
	
	private int stemCellBankId;

	private int stateId;
	
	private int cityId;
	
	private String date;
	
    private String time;
        
    private int countryId;
		
	private String pregnancyType;
		
	private String expectedDeliveryDate;
		
	private int delStatus;
		
   private int int1;
		
   private int int2;
		
	private String string1;
	
	
	private String string2;


	

	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	

	
	
	public int getPlanId() {
		return planId;
	}


	public void setPlanId(int planId) {
		this.planId = planId;
	}


	public int getStemCellBankId() {
		return stemCellBankId;
	}


	public void setStemCellBankId(int stemCellBankId) {
		this.stemCellBankId = stemCellBankId;
	}


	private int patientEnrollId;
	
	
	
	public int getPatientEnrollId() {
		return patientEnrollId;
	}


	public void setPatientEnrollId(int patientEnrollId) {
		this.patientEnrollId = patientEnrollId;
	}


	public int getPatientId() {
		return patientId;
	}


	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}


	

	public int getHospitalId() {
		return hospitalId;
	}


	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}


	


	public int getStateId() {
		return stateId;
	}


	public void setStateId(int stateId) {
		this.stateId = stateId;
	}


	public int getCityId() {
		return cityId;
	}


	public void setCityId(int cityId) {
		this.cityId = cityId;
	}


	public int getCountryId() {
		return countryId;
	}


	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}


	public String getPregnancyType() {
		return pregnancyType;
	}


	public void setPregnancyType(String pregnancyType) {
		this.pregnancyType = pregnancyType;
	}


	public String getExpectedDeliveryDate() {
		return expectedDeliveryDate;
	}


	public void setExpectedDeliveryDate(String expectedDeliveryDate) {
		this.expectedDeliveryDate = expectedDeliveryDate;
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


	@Override
	public String toString() {
		return "PatientEnrollDetails [patientId=" + patientId + ", hospitalId=" + hospitalId + ", planId=" + planId
				+ ", stemCellBankId=" + stemCellBankId + ", stateId=" + stateId + ", cityId=" + cityId + ", date="
				+ date + ", time=" + time + ", countryId=" + countryId + ", pregnancyType=" + pregnancyType
				+ ", expectedDeliveryDate=" + expectedDeliveryDate + ", delStatus=" + delStatus + ", int1=" + int1
				+ ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + ", patientEnrollId="
				+ patientEnrollId + "]";
	}


	

}
