package com.bionische.biocare.patienthistory.model;

import java.util.List;
 
 

public class PatientHistoryIllnessList {

	
	
List<PatientPastHistoryIIlness> PatientPastHistoryIIlnessList;
	
	

	/**
	 * @return the patientPastHistoryIIlnessList
	 */
	public List<PatientPastHistoryIIlness> getPatientPastHistoryIIlnessList() {
		return PatientPastHistoryIIlnessList;
	}

	/**
	 * @param patientPastHistoryIIlnessList the patientPastHistoryIIlnessList to set
	 */
	public void setPatientPastHistoryIIlnessList(List<PatientPastHistoryIIlness> patientPastHistoryIIlnessList) {
		PatientPastHistoryIIlnessList = patientPastHistoryIIlnessList;
	}

	
	@Override
	public String toString() {
		return "PatientHistoryIllnessList [PatientPastHistoryIIlnessList=" + PatientPastHistoryIIlnessList + 
				 "]";
	}
	
	
}
