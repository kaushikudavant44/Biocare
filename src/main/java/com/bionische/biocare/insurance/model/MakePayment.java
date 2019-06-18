package com.bionische.biocare.insurance.model;

public class MakePayment {
	
	private int appId;
	
	private String companyName;
	
	private int cover;
	
	private int premium;

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getCover() {
		return cover;
	}

	public void setCover(int cover) {
		this.cover = cover;
	}

	public int getPremium() {
		return premium;
	}

	public void setPremium(int premium) {
		this.premium = premium;
	}

	@Override
	public String toString() {
		return "MakePayment [appId=" + appId + ", companyName=" + companyName + ", cover=" + cover + ", premium="
				+ premium + "]";
	}
	
	
	
	
	
	

}
