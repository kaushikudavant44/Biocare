package com.bionische.biocare.doctor.model;

import java.util.List;

import com.bionische.biocare.lab.model.GetLabRatingReview;
import com.bionische.biocare.patient.model.RatingDetails;


public class GetDoctorRatingReviewCount {
	
private int oneStar;
	
	private int twoStar;
	
	private int threeStar;
	
	private int fourStar;
	
	private int fivaeStar;
	
	private List<GetLabRatingReview> labRatingDetails;
	
	private List<RatingDetails> ratingDetails;

	
	
	public List<GetLabRatingReview> getLabRatingDetails() {
		return labRatingDetails;
	}

	public void setLabRatingDetails(List<GetLabRatingReview> labRatingDetails) {
		this.labRatingDetails = labRatingDetails;
	}

	public int getOneStar() {
		return oneStar;
	}

	public void setOneStar(int oneStar) {
		this.oneStar = oneStar;
	}

	public int getTwoStar() {
		return twoStar;
	}

	public void setTwoStar(int twoStar) {
		this.twoStar = twoStar;
	}

	public int getThreeStar() {
		return threeStar;
	}

	public void setThreeStar(int threeStar) {
		this.threeStar = threeStar;
	}

	public int getFourStar() {
		return fourStar;
	}

	public void setFourStar(int fourStar) {
		this.fourStar = fourStar;
	}

	public int getFivaeStar() {
		return fivaeStar;
	}

	public void setFivaeStar(int fivaeStar) {
		this.fivaeStar = fivaeStar;
	}

	public List<RatingDetails> getRatingDetails() {
		return ratingDetails;
	}

	public void setRatingDetails(List<RatingDetails> ratingDetails) {
		this.ratingDetails = ratingDetails;
	}

	@Override
	public String toString() {
		return "GetDoctorRatingReviewCount [oneStar=" + oneStar + ", twoStar=" + twoStar + ", threeStar=" + threeStar
				+ ", fourStar=" + fourStar + ", fivaeStar=" + fivaeStar + ", labRatingDetails=" + labRatingDetails
				+ ", ratingDetails=" + ratingDetails + "]";
	}

	

	

}
