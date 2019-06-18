package com.bionische.biocare.lab.model;

import com.bionische.biocare.patient.model.Info;

public class LabLogin {
	
	LabDetails labDetails;
	Info info;
	Info labSuscriptionInfo;
	
	public LabDetails getLabDetails() {
		return labDetails;
	}
	public void setLabDetails(LabDetails labDetails) {
		this.labDetails = labDetails;
	}
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	public Info getLabSuscriptionInfo() {
		return labSuscriptionInfo;
	}
	public void setLabSuscriptionInfo(Info labSuscriptionInfo) {
		this.labSuscriptionInfo = labSuscriptionInfo;
	}
	@Override
	public String toString() {
		return "LabLogin [labDetails=" + labDetails + ", info=" + info + ", labSuscriptionInfo=" + labSuscriptionInfo
				+ "]";
	}
	 
	 
	

}
