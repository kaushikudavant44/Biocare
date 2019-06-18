package com.bionische.biocare.insurance.model;

public class BuyDetails {
	
	private int companyId;
	
	private int premium;
	
	private int cover;
	
	private String adult;
	
	private String child;
	
	private int noOfChild;
	
	private int noOfAdult;
	
	private String age;
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getPremium() {
		return premium;
	}

	public void setPremium(int premium) {
		this.premium = premium;
	}

	public int getCover() {
		return cover;
	}

	public void setCover(int cover) {
		this.cover = cover;
	}

	public String getAdult() {
		return adult;
	}

	public void setAdult(String adult) {
		this.adult = adult;
	}

	public String getChild() {
		return child;
	}

	public void setChild(String child) {
		this.child = child;
	}

	public int getNoOfChild() {
		return noOfChild;
	}

	public void setNoOfChild(int noOfChild) {
		this.noOfChild = noOfChild;
	}

	public int getNoOfAdult() {
		return noOfAdult;
	}

	public void setNoOfAdult(int noOfAdult) {
		this.noOfAdult = noOfAdult;
	}

	@Override
	public String toString() {
		return "BuyDetails [companyId=" + companyId + ", premium=" + premium + ", cover=" + cover + ", adult=" + adult
				+ ", child=" + child + ", noOfChild=" + noOfChild + ", noOfAdult=" + noOfAdult + "]";
	}
	
	
	
	
	
	
	

}
