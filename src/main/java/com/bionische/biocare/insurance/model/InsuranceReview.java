package com.bionische.biocare.insurance.model;

public class InsuranceReview {

	private int reviewId;
	
	private int companyId;
	
	private int patientId;
	
	private String date;
		
    private String companyReview;
		
    private int int1;

    private int int2;
	
    private int delStatus;	
	
    private String string1;
	
    private String string2;
    
    private String patientname;
	
	
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCompanyId() {
	return companyId;
}
public void setCompanyId(int companyId) {
	this.companyId = companyId;
}
	
	public int getReviewId() {
	return reviewId;
}
public void setReviewId(int reviewId) {
	this.reviewId = reviewId;
}
	public String getCompanyReview() {
		return companyReview;
	}
	public void setCompanyReview(String companyReview) {
		this.companyReview = companyReview;
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
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
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
		return "InsuranceReview [reviewId=" + reviewId + ", companyId=" + companyId + ", patientId=" + patientId
				+ ", date=" + date + ", companyReview=" + companyReview + ", int1=" + int1 + ", int2=" + int2
				+ ", delStatus=" + delStatus + ", string1=" + string1 + ", string2=" + string2 + ", patientname="
				+ patientname + "]";
	}
	

}
