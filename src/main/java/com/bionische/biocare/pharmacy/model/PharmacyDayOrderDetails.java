package com.bionische.biocare.pharmacy.model;

public class PharmacyDayOrderDetails {

    private int orderCount;
	
	private int collection;

	private int delivered;

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getCollection() {
		return collection;
	}

	public void setCollection(int collection) {
		this.collection = collection;
	}

	public int getDelivered() {
		return delivered;
	}

	public void setDelivered(int delivered) {
		this.delivered = delivered;
	}

	@Override
	public String toString() {
		return "PharmacyDayOrderDetails [orderCount=" + orderCount + ", collection=" + collection + ", delivered="
				+ delivered + "]";
	}
	
	
}
