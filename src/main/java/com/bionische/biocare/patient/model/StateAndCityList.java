package com.bionische.biocare.patient.model;

import java.util.List;

public class StateAndCityList {

	
	private int stateId;
	
	private int countryId;
	
	private String stateName;

	
	private List<City> cityList;


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


	public String getStateName() {
		return stateName;
	}


	public void setStateName(String stateName) {
		this.stateName = stateName;
	}


	public List<City> getCityList() {
		return cityList;
	}


	public void setCityList(List<City> cityList) {
		this.cityList = cityList;
	}


	@Override
	public String toString() {
		return "StateAndCityList [stateId=" + stateId + ", countryId=" + countryId + ", stateName=" + stateName
				+ ", cityList=" + cityList + "]";
	}
	
	
}
