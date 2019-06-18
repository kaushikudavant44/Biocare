package com.bionische.biocare.doctor.model;

import java.util.List;

import com.bionische.biocare.patient.model.Info;

public class SpecializationDetailsList {
	
	private  List<SpecializationDetails> specializationDetailsList;
	

	private   Info info;


	public List<SpecializationDetails> getSpecializationDetailsList() {
		return specializationDetailsList;
	}


	public void setSpecializationDetailsList(List<SpecializationDetails> specializationDetailsList) {
		this.specializationDetailsList = specializationDetailsList;
	}


	public Info getInfo() {
		return info;
	}


	public void setInfo(Info info) {
		this.info = info;
	}


	@Override
	public String toString() {
		return "SpecializationDetailsList [specializationDetailsList=" + specializationDetailsList + ", info=" + info
				+ "]";
	}

	 
	
	
	

}
