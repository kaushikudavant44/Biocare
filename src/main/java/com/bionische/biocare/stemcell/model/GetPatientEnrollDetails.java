package com.bionische.biocare.stemcell.model;


public class GetPatientEnrollDetails {

	private int patientenrollId;
	private String time;
	
	private String date;
	
private int planId;
	
	private int familyId;
	
	//private int planId;

	//private int familyId;

	private int patientId;

	    
	private String planType;
	
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








	private String planName;
	
	
	private String planCost;
	
	private String planDays;
		
	private String expectedDeliveryDate;
	

	
	

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	

	
	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPlanCost() {
		return planCost;
	}

	public void setPlanCost(String planCost) {
		this.planCost = planCost;
	}

	public String getPlanDays() {
		return planDays;
	}

	public void setPlanDays(String planDays) {
		this.planDays = planDays;
	}

	public String getExpectedDeliveryDate() {
		return expectedDeliveryDate;
	}

	public void setExpectedDeliveryDate(String expectedDeliveryDate) {
		this.expectedDeliveryDate = expectedDeliveryDate;
	}

	public int getPatientenrollId() {
		return patientenrollId;
	}

	public void setPatientenrollId(int patientenrollId) {
		this.patientenrollId = patientenrollId;
	}

	@Override
	public String toString() {
		return "GetPatientEnrollDetails [patientenrollId=" + patientenrollId + ", time=" + time + ", date=" + date
				+ ", planId=" + planId + ", familyId=" + familyId + ", patientId=" + patientId + ", planType="
				+ planType + ", planName=" + planName + ", planCost=" + planCost + ", planDays=" + planDays
				+ ", expectedDeliveryDate=" + expectedDeliveryDate + "]";
	}

 

	

	

	
	
	

	
}
