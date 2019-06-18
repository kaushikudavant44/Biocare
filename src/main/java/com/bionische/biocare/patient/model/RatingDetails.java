package com.bionische.biocare.patient.model;

import java.util.Date;

public class RatingDetails {
	private int ratingReviewId;
	private int doctorId;
	private float rating;
	private String review;
	private int patientId;
	private String patientName;
	private int int1;
	private int int2;
    private String string1;
    private String string2;
    private int delStatus;
    private String createDate;
    
    
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getRatingReviewId() {
		return ratingReviewId;
	}
	public void setRatingReviewId(int ratingReviewId) {
		this.ratingReviewId = ratingReviewId;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
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
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	@Override
	public String toString() {
		return "RatingDetails [ratingReviewId=" + ratingReviewId + ", doctorId=" + doctorId + ", rating=" + rating
				+ ", review=" + review + ", patientId=" + patientId + ", patientName=" + patientName + ", int1=" + int1
				+ ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + ", delStatus=" + delStatus
				+ ", createDate=" + createDate + "]";
	}
	
	
    
	
}
