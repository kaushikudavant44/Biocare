package com.bionische.biocare.radiology.model;

public class PndtIndications {

	int indicationId;
	
	String indicationName;
	
	int delStatus;

	public int getIndicationId() {
		return indicationId;
	}

	public void setIndicationId(int indicationId) {
		this.indicationId = indicationId;
	}

	public String getIndicationName() {
		return indicationName;
	}

	public void setIndicationName(String indicationName) {
		this.indicationName = indicationName;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "PndtIndications [indicationId=" + indicationId + ", indicationName=" + indicationName + ", delStatus="
				+ delStatus + "]";
	}
	
	
	
}
