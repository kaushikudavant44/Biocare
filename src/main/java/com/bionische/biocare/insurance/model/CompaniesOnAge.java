package com.bionische.biocare.insurance.model;

import java.util.List;


public class CompaniesOnAge {
	
	private int companyId;
	
	private int premiumId;
	
	private String companyName;
	
	private String betweenAge;
	
	private String membersType;
	
	private int ratings;
	
	private int premiumPerday;
	
	private List<CoverDetails> coverDetails;
	
	private List<InsuranceReview> insuranceReview;
    
    private List<String> criticalFactors;
    
    private List<CompanyFeatures> companyFeatures;
    
	public int getPremiumPerday() {
		return premiumPerday;
	}

	public void setPremiumPerday(int premiumPerday) {
		this.premiumPerday = premiumPerday;
	}

	public List<InsuranceReview> getInsuranceReview() {
		return insuranceReview;
	}

	public void setInsuranceReview(List<InsuranceReview> insuranceReview) {
		this.insuranceReview = insuranceReview;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getPremiumId() {
		return premiumId;
	}

	public void setPremiumId(int premiumId) {
		this.premiumId = premiumId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBetweenAge() {
		return betweenAge;
	}

	public void setBetweenAge(String betweenAge) {
		this.betweenAge = betweenAge;
	}

	public String getMembersType() {
		return membersType;
	}

	public void setMembersType(String membersType) {
		this.membersType = membersType;
	}

	public int getRatings() {
		return ratings;
	}

	public void setRatings(int ratings) {
		this.ratings = ratings;
	}

	public List<CoverDetails> getCoverDetails() {
		return coverDetails;
	}

	public void setCoverDetails(List<CoverDetails> coverDetails) {
		this.coverDetails = coverDetails;
	}

	public List<String> getCriticalFactors() {
		return criticalFactors;
	}

	public void setCriticalFactors(List<String> criticalFactors) {
		this.criticalFactors = criticalFactors;
	}

	public List<CompanyFeatures> getCompanyFeatures() {
		return companyFeatures;
	}

	public void setCompanyFeatures(List<CompanyFeatures> companyFeatures) {
		this.companyFeatures = companyFeatures;
	}

	@Override
	public String toString() {
		return "CompaniesOnAge [companyId=" + companyId + ", premiumId=" + premiumId + ", companyName=" + companyName
				+ ", betweenAge=" + betweenAge + ", membersType=" + membersType + ", ratings=" + ratings
				+ ", premiumPerday=" + premiumPerday + ", coverDetails=" + coverDetails + ", insuranceReview="
				+ insuranceReview + ", criticalFactors=" + criticalFactors + ", companyFeatures=" + companyFeatures
				+ "]";
	}

	
}
