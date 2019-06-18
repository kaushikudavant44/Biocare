package com.bionische.biocare.patientdoctor.model;

public class GetRatingCount {

	private int count;
	
	private int rating;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "GetRatingCount [count=" + count + ", rating=" + rating + "]";
	}
	
	
	
	
}
