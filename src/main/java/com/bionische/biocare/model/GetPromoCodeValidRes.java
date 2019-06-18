package com.bionische.biocare.model;

public class GetPromoCodeValidRes {

	private int offerId;

	
	private String message;
	
	private float discountPer;
	
	private boolean isError;

	public int getOfferId() {
		return offerId;
	}

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public float getDiscountPer() {
		return discountPer;
	}

	public void setDiscountPer(float discountPer) {
		this.discountPer = discountPer;
	}

	 

	public boolean isError() {
		return isError;
	}

	public void setError(boolean isError) {
		this.isError = isError;
	}

	@Override
	public String toString() {
		return "GetPromoCodeValidRes [offerId=" + offerId + ", message=" + message + ", discountPer=" + discountPer
				+ ", isError=" + isError + "]";
	}

	 
}
