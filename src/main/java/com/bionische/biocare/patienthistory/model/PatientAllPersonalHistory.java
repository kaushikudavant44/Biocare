package com.bionische.biocare.patienthistory.model;

import java.util.List;

 

public class PatientAllPersonalHistory {

	
	MenstrualObstetricHistory menstrualObstetricHistory;
	PatientFamilyHistory       patientFamilyHistory;
	PatientHistoryChiefComplaints patientHistoryChiefComplaints;
	PatientPastHistory          patientPastHistory;
	PatientPastHistoryIIlness   patientPastHistoryIIlness;
	PatientPersonalHistory    patientPersonalHistory;
	PatientPsychologicalHistory patientPsychologicalHistory;
	PatientTreatementHistory    patientTreatementHistoryp;
	List<PatientPastHistoryIIlness> patientPastHistoryIIlnessList;
	/**
	 * @return the menstrualObstetricHistory
	 */
	public MenstrualObstetricHistory getMenstrualObstetricHistory() {
		return menstrualObstetricHistory;
	}
	/**
	 * @param menstrualObstetricHistory the menstrualObstetricHistory to set
	 */
	public void setMenstrualObstetricHistory(MenstrualObstetricHistory menstrualObstetricHistory) {
		this.menstrualObstetricHistory = menstrualObstetricHistory;
	}
	/**
	 * @return the patientFamilyHistory
	 */
	public PatientFamilyHistory getPatientFamilyHistory() {
		return patientFamilyHistory;
	}
	/**
	 * @param patientFamilyHistory the patientFamilyHistory to set
	 */
	public void setPatientFamilyHistory(PatientFamilyHistory patientFamilyHistory) {
		this.patientFamilyHistory = patientFamilyHistory;
	}
	/**
	 * @return the patientHistoryChiefComplaints
	 */
	public PatientHistoryChiefComplaints getPatientHistoryChiefComplaints() {
		return patientHistoryChiefComplaints;
	}
	/**
	 * @param patientHistoryChiefComplaints the patientHistoryChiefComplaints to set
	 */
	public void setPatientHistoryChiefComplaints(PatientHistoryChiefComplaints patientHistoryChiefComplaints) {
		this.patientHistoryChiefComplaints = patientHistoryChiefComplaints;
	}
	/**
	 * @return the patientPastHistory
	 */
	public PatientPastHistory getPatientPastHistory() {
		return patientPastHistory;
	}
	/**
	 * @param patientPastHistory the patientPastHistory to set
	 */
	public void setPatientPastHistory(PatientPastHistory patientPastHistory) {
		this.patientPastHistory = patientPastHistory;
	}
	/**
	 * @return the patientPastHistoryIIlness
	 */
	public PatientPastHistoryIIlness getPatientPastHistoryIIlness() {
		return patientPastHistoryIIlness;
	}
	/**
	 * @param patientPastHistoryIIlness the patientPastHistoryIIlness to set
	 */
	public void setPatientPastHistoryIIlness(PatientPastHistoryIIlness patientPastHistoryIIlness) {
		this.patientPastHistoryIIlness = patientPastHistoryIIlness;
	}
	/**
	 * @return the patientPersonalHistory
	 */
	public PatientPersonalHistory getPatientPersonalHistory() {
		return patientPersonalHistory;
	}
	/**
	 * @param patientPersonalHistory the patientPersonalHistory to set
	 */
	public void setPatientPersonalHistory(PatientPersonalHistory patientPersonalHistory) {
		this.patientPersonalHistory = patientPersonalHistory;
	}
	/**
	 * @return the patientPsychologicalHistory
	 */
	public PatientPsychologicalHistory getPatientPsychologicalHistory() {
		return patientPsychologicalHistory;
	}
	/**
	 * @param patientPsychologicalHistory the patientPsychologicalHistory to set
	 */
	public void setPatientPsychologicalHistory(PatientPsychologicalHistory patientPsychologicalHistory) {
		this.patientPsychologicalHistory = patientPsychologicalHistory;
	}
	/**
	 * @return the patientTreatementHistoryp
	 */
	public PatientTreatementHistory getPatientTreatementHistoryp() {
		return patientTreatementHistoryp;
	}
	/**
	 * @param patientTreatementHistoryp the patientTreatementHistoryp to set
	 */
	public void setPatientTreatementHistoryp(PatientTreatementHistory patientTreatementHistoryp) {
		this.patientTreatementHistoryp = patientTreatementHistoryp;
	}
	/**
	 * @return the patientPastHistoryIIlnessList
	 */
	public List<PatientPastHistoryIIlness> getPatientPastHistoryIIlnessList() {
		return patientPastHistoryIIlnessList;
	}
	public void setPatientPastHistoryIIlnessList(List<PatientPastHistoryIIlness> patientPastHistoryIIlnessList) {
		this.patientPastHistoryIIlnessList = patientPastHistoryIIlnessList;
	}
	@Override
	public String toString() {
		return "PatientAllPersonalHistory [menstrualObstetricHistory=" + menstrualObstetricHistory
				+ ", patientFamilyHistory=" + patientFamilyHistory + ", patientHistoryChiefComplaints="
				+ patientHistoryChiefComplaints + ", patientPastHistory=" + patientPastHistory
				+ ", patientPastHistoryIIlness=" + patientPastHistoryIIlness + ", patientPersonalHistory="
				+ patientPersonalHistory + ", patientPsychologicalHistory=" + patientPsychologicalHistory
				+ ", patientTreatementHistoryp=" + patientTreatementHistoryp + ", patientPastHistoryIIlnessList="
				+ patientPastHistoryIIlnessList + "]";
	}
	 
	
	
	
	
}
