package com.bionische.biocare.pharmacy.model;

public class PrescriptionOrderDetails {
	
	private int prescriptionOrderDetailsId;
	
	private int requestId;
	
	private int prescriptionId;
	
	private int quantity;
	
	private float price;
	
	private int status;
	
	private int delStatus;

	public int getPrescriptionOrderDetailsId() {
		return prescriptionOrderDetailsId;
	}

	public void setPrescriptionOrderDetailsId(int prescriptionOrderDetailsId) {
		this.prescriptionOrderDetailsId = prescriptionOrderDetailsId;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public int getPrescriptionId() {
		return prescriptionId;
	}

	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "PrescriptionOrderDetails [prescriptionOrderDetailsId=" + prescriptionOrderDetailsId + ", requestId="
				+ requestId + ", prescriptionId=" + prescriptionId + ", quantity=" + quantity + ", price=" + price
				+ ", status=" + status + ", delStatus=" + delStatus + "]";
	}

}
