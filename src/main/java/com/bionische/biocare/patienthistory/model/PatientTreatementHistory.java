package com.bionische.biocare.patienthistory.model;

public class PatientTreatementHistory {

	
	private int treatementHistoryId;
	private int patientId;
	private  String treatmentReceived;
	private String allergyReactions;
	private String surgicalIntervention;
	private String useOralContraceptives;
	private String bloodTransfusion;
	private String intakeNsaid;
	private String regularUsezoralContraceptives;
	private String String1;
	private String string2;
	private String string3;
	public int getTreatementHistoryId() {
		return treatementHistoryId;
	}
	public void setTreatementHistoryId(int treatementHistoryId) {
		this.treatementHistoryId = treatementHistoryId;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getTreatmentReceived() {
		return treatmentReceived;
	}
	public void setTreatmentReceived(String treatmentReceived) {
		this.treatmentReceived = treatmentReceived;
	}
	public String getAllergyReactions() {
		return allergyReactions;
	}
	public void setAllergyReactions(String allergyReactions) {
		this.allergyReactions = allergyReactions;
	}
	public String getSurgicalIntervention() {
		return surgicalIntervention;
	}
	public void setSurgicalIntervention(String surgicalIntervention) {
		this.surgicalIntervention = surgicalIntervention;
	}
	public String getUseOralContraceptives() {
		return useOralContraceptives;
	}
	public void setUseOralContraceptives(String useOralContraceptives) {
		this.useOralContraceptives = useOralContraceptives;
	}
	public String getBloodTransfusion() {
		return bloodTransfusion;
	}
	public void setBloodTransfusion(String bloodTransfusion) {
		this.bloodTransfusion = bloodTransfusion;
	}
	public String getIntakeNsaid() {
		return intakeNsaid;
	}
	public void setIntakeNsaid(String intakeNsaid) {
		this.intakeNsaid = intakeNsaid;
	}
	public String getRegularUsezoralContraceptives() {
		return regularUsezoralContraceptives;
	}
	public void setRegularUsezoralContraceptives(String regularUsezoralContraceptives) {
		this.regularUsezoralContraceptives = regularUsezoralContraceptives;
	}
	public String getString1() {
		return String1;
	}
	public void setString1(String string1) {
		String1 = string1;
	}
	public String getString2() {
		return string2;
	}
	public void setString2(String string2) {
		this.string2 = string2;
	}
	public String getString3() {
		return string3;
	}
	public void setString3(String string3) {
		this.string3 = string3;
	}
	@Override
	public String toString() {
		return "PatientTreatementHistory [treatementHistoryId=" + treatementHistoryId + ", patientId=" + patientId
				+ ", treatmentReceived=" + treatmentReceived + ", allergyReactions=" + allergyReactions
				+ ", surgicalIntervention=" + surgicalIntervention + ", useOralContraceptives=" + useOralContraceptives
				+ ", bloodTransfusion=" + bloodTransfusion + ", intakeNsaid=" + intakeNsaid
				+ ", regularUsezoralContraceptives=" + regularUsezoralContraceptives + ", String1=" + String1
				+ ", string2=" + string2 + ", string3=" + string3 + "]";
	}
	
	
	
}
