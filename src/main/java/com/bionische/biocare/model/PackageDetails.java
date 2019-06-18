package com.bionische.biocare.model;
 
 
 
public class PackageDetails {

	
 
	private int packageId;
	 
	private String packageName;
 
	 
	private int userType;
 
	 
	private String packageDesc;
	 
	private String termsAndCondition;
	 
	private String createDate;
	 
	private String lastModifiedDate;
	
 
	private int delStatus;
	 
	private int packageDuration;
	 
	private int durationType;
	 
	private int packageCost;


	public int getPackageId() {
		return packageId;
	}


	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}


	public String getPackageName() {
		return packageName;
	}


	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}


	public int getUserType() {
		return userType;
	}


	public void setUserType(int userType) {
		this.userType = userType;
	}


	public String getPackageDesc() {
		return packageDesc;
	}


	public void setPackageDesc(String packageDesc) {
		this.packageDesc = packageDesc;
	}


	public String getTermsAndCondition() {
		return termsAndCondition;
	}


	public void setTermsAndCondition(String termsAndCondition) {
		this.termsAndCondition = termsAndCondition;
	}

 
 

	public int getDelStatus() {
		return delStatus;
	}


	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}


 

	public int getPackageDuration() {
		return packageDuration;
	}


	public void setPackageDuration(int packageDuration) {
		this.packageDuration = packageDuration;
	}

 


	public int getDurationType() {
		return durationType;
	}


	public void setDurationType(int durationType) {
		this.durationType = durationType;
	}


	public int getPackageCost() {
		return packageCost;
	}


	public void setPackageCost(int packageCost) {
		this.packageCost = packageCost;
	}

	

	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getLastModifiedDate() {
		return lastModifiedDate;
	}


	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}


	@Override
	public String toString() {
		return "PackageDetails [packageId=" + packageId + ", packageName=" + packageName + ", userType=" + userType
				+ ", packageDesc=" + packageDesc + ", termsAndCondition=" + termsAndCondition + ", createDate="
				+ createDate + ", lastModifiedDate=" + lastModifiedDate + ", delStatus=" + delStatus
				+ ", packageDuration=" + packageDuration + ", durationType=" + durationType + ", packageCost="
				+ packageCost + "]";
	}


	 
	
	
}
