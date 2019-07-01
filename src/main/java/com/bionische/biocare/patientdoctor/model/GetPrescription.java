package com.bionische.biocare.patientdoctor.model;

import java.util.List;

public class GetPrescription {

	
	List<PrescriptionDetails> prescriptionDetailsList;
	ConsultingDetails consultingDetails;
	public List<PrescriptionDetails> getPrescriptionDetailsList() {
		return prescriptionDetailsList;
	}
	public void setPrescriptionDetailsList(List<PrescriptionDetails> prescriptionDetailsList) {
		this.prescriptionDetailsList = prescriptionDetailsList;
	}
	public ConsultingDetails getConsultingDetails() {
		return consultingDetails;
	}
	public void setConsultingDetails(ConsultingDetails consultingDetails) {
		this.consultingDetails = consultingDetails;
	}
	@Override
	public String toString() {
		return "GetPrescription [prescriptionDetailsList=" + prescriptionDetailsList + ", consultingDetails="
				+ consultingDetails + "]";
	}
	
	
}
