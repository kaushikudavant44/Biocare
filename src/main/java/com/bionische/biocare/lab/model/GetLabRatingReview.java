package com.bionische.biocare.lab.model;
 
 
public class GetLabRatingReview {

 
	private int ratingReviewId;
 
	private int labId;

 
	private int patientId;

 
	private float rating;

 
	private String review;

 
	private String patientName;

 
	private String string1;

 
	private String date;

 
	private int int2;

 
	private int int1;

 
	private int delStatus;

	public int getRatingReviewId() {
		return ratingReviewId;
	}

	public void setRatingReviewId(int ratingReviewId) {
		this.ratingReviewId = ratingReviewId;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
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

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "GetLabRatingReview [ratingReviewId=" + ratingReviewId + ", labId=" + labId + ", patientId=" + patientId
				+ ", rating=" + rating + ", review=" + review + ", patientName=" + patientName + ", string1=" + string1
				+ ", date=" + date + ", int2=" + int2 + ", int1=" + int1 + ", delStatus=" + delStatus + "]";
	}

	
	
}
