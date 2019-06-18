package com.bionische.biocare.stemcell.model;

public class PlanDetails {
	
private int planId;
	
  private int stemCellBankId;
	
private String planName;
private String planType;
	
 private String planCost;
	
	private String planDays;
	
private String message;
	
private String termsCondition;
	
   
public String getPlanType() {
	return planType;
}
public void setPlanType(String planType) {
	this.planType = planType;
}

public int getStemCellBankId() {
	return stemCellBankId;
}
public void setStemCellBankId(int stemCellBankId) {
	this.stemCellBankId = stemCellBankId;
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
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getTermsCondition() {
	return termsCondition;
}
public void setTermsCondition(String termsCondition) {
	this.termsCondition = termsCondition;
}
public int getPlanId() {
	return planId;
}
public void setPlanId(int planId) {
	this.planId = planId;
}
@Override
public String toString() {
	return "Plan_Details [planId=" + planId + ", stemCellBankId=" + stemCellBankId + ", planName=" + planName
			+ ", planType=" + planType + ", planCost=" + planCost + ", planDays=" + planDays + ", message=" + message
			+ ", termsCondition=" + termsCondition + "]";
}




}
