package com.bionische.biocare.insurance.model;

public class CoverDetails {
	
	private int premiumId;
	
	private int cover;
	
	private int premium;

	public int getPremiumId() {
		return premiumId;
	}

	public void setPremiumId(int premiumId) {
		this.premiumId = premiumId;
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
		return "CoverDetails [premiumId=" + premiumId + ", cover=" + cover + ", premium=" + premium + "]";
	}
	
	
	
	
	
	

}
