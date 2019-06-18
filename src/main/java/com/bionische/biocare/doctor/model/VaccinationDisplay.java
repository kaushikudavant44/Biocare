package com.bionische.biocare.doctor.model;

import java.util.List;

public class VaccinationDisplay {

private int vaxinationAgeId;
	
	private String vaxinationAgeName;
	
	private int int1;
	
	private int int2;
	
	private String string1;
	
	private String string2;
	
	
	List<VaccinationDetails> vaccinationDetailsList;
	
	

	public List<VaccinationDetails> getVaccinationDetailsList() {
		return vaccinationDetailsList;
	}

	public void setVaccinationDetailsList(List<VaccinationDetails> vaccinationDetailsList) {
		this.vaccinationDetailsList = vaccinationDetailsList;
	}

	public int getVaxinationAgeId() {
		return vaxinationAgeId;
	}

	public void setVaxinationAgeId(int vaxinationAgeId) {
		this.vaxinationAgeId = vaxinationAgeId;
	}

	public String getVaxinationAgeName() {
		return vaxinationAgeName;
	}

	public void setVaxinationAgeName(String vaxinationAgeName) {
		this.vaxinationAgeName = vaxinationAgeName;
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
		return "VaccinationDisplay [vaxinationAgeId=" + vaxinationAgeId + ", vaxinationAgeName=" + vaxinationAgeName
				+ ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2
				+ ", vaccinationDetailsList=" + vaccinationDetailsList + "]";
	}

	
		
	
	
	

}
