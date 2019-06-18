package com.bionische.biocare.stemcell.model;


public class ConfirmDetails {

	/*private int patientenrollId;
	
	private int patientId;*/

	private String pregnancyType;
	/*private String time;
	
	private String date;*/
	
	private String countryName;
	
	private int countryId;
	
	private int stateId;   
	
	private int cityId;
	
	private int hospitalId;

	private String stateName;

	private String cityName;
	
	private String hospitalName;

     private int planId;
	
	private String expectedDeliveryDate;

	
	public String getPregnancyType() {
		return pregnancyType;
	}

	public void setPregnancyType(String pregnancyType) {
		this.pregnancyType = pregnancyType;
	}

	
	

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
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

	public int getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getExpectedDeliveryDate() {
		return expectedDeliveryDate;
	}

	public void setExpectedDeliveryDate(String expectedDeliveryDate) {
		this.expectedDeliveryDate = expectedDeliveryDate;
	}

	@Override
	public String toString() {
		return "ConfirmDetails [pregnancyType=" + pregnancyType + ", countryName=" + countryName + ", countryId="
				+ countryId + ", stateId=" + stateId + ", cityId=" + cityId + ", hospitalId=" + hospitalId
				+ ", stateName=" + stateName + ", cityName=" + cityName + ", hospitalName=" + hospitalName + ", planId="
				+ planId + ", expectedDeliveryDate=" + expectedDeliveryDate + "]";
	}

	
	
	
	
	

	
	
	

	
}
