package com.bionische.biocare.doctor.model;

import com.bionische.biocare.patient.model.Info;

public class DoctorLogin {

	DoctorDetails doctorDetails;
	Info info;
	Info doctorSuscriptionInfo;
	public DoctorDetails getDoctorDetails() {
		return doctorDetails;
	}
	public void setDoctorDetails(DoctorDetails doctorDetails) {
		this.doctorDetails = doctorDetails;
	}
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	public Info getDoctorSuscriptionInfo() {
		return doctorSuscriptionInfo;
	}
	public void setDoctorSuscriptionInfo(Info doctorSuscriptionInfo) {
		this.doctorSuscriptionInfo = doctorSuscriptionInfo;
	}
	@Override
	public String toString() {
		return "DoctorLogin [doctorDetails=" + doctorDetails + ", info=" + info + ", doctorSuscriptionInfo="
				+ doctorSuscriptionInfo + "]";
	}
	 
	       
}
   