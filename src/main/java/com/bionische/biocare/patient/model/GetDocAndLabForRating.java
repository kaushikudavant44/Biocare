package com.bionische.biocare.patient.model;

import java.util.List;

import com.bionische.biocare.patientdoctor.model.ConsultingDetails;
import com.bionische.biocare.patientlab.model.GetLabAppointment;

public class GetDocAndLabForRating {
	
	List<ConsultingDetails> doctorsInfo;
	
	List<GetLabAppointment> labInfo;

	public List<ConsultingDetails> getDoctorsInfo() {
		return doctorsInfo;
	}

	public void setDoctorsInfo(List<ConsultingDetails> doctorsInfo) {
		this.doctorsInfo = doctorsInfo;
	}

	public List<GetLabAppointment> getLabInfo() {
		return labInfo;
	}

	public void setLabInfo(List<GetLabAppointment> labInfo) {
		this.labInfo = labInfo;
	}

	@Override
	public String toString() {
		return "GetDocAndLabForRating [doctorsInfo=" + doctorsInfo + ", labInfo=" + labInfo + "]";
	}
	
	

}
