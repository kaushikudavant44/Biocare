package com.bionische.biocare.patientdoctor.model;

import java.util.List;

public class GetTempAppointmentDetailsList {

	
	List<GetAppointmentDetails>  getAppointmentDetailsList;

	public List<GetAppointmentDetails> getGetAppointmentDetailsList() {
		return getAppointmentDetailsList;
	}

	public void setGetAppointmentDetailsList(List<GetAppointmentDetails> getAppointmentDetailsList) {
		this.getAppointmentDetailsList = getAppointmentDetailsList;
	}

	@Override
	public String toString() {
		return "GetTempAppointmentDetailsList [getAppointmentDetailsList=" + getAppointmentDetailsList + "]";
	}
	
}
