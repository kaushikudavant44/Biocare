package com.bionische.biocare.patient.model;

import java.util.List;

public class RatingDetailsList {
	
	
	
    private float rating;
    
    private int doctor_id;
    
  List<GetPatientReviews> getPatientReviews;
	
	
	public List<GetPatientReviews> getGetPatientReviews() {
	return getPatientReviews;
}

public void setGetPatientReviews(List<GetPatientReviews> getPatientReviews) {
	this.getPatientReviews = getPatientReviews;
}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}


	public int getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}

	@Override
	public String toString() {
		return "RatingDetailsList [rating=" + rating + ", doctor_id=" + doctor_id + ", getPatientReviews="
				+ getPatientReviews + "]";
	}

	
}


