package com.bionische.biocare.radiology.model;

import java.util.Date;

public class PndtPatientHeader {

	
	int pndt_header_id;
	
	int patient_id;
	
	int month;
	
	int year;
	
	int lab_id;
	
	Date created_date;
	
	Date modified_date;

	public int getPndt_header_id() {
		return pndt_header_id;
	}

	public void setPndt_header_id(int pndt_header_id) {
		this.pndt_header_id = pndt_header_id;
	}

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	

	public int getLab_id() {
		return lab_id;
	}

	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Date getModified_date() {
		return modified_date;
	}

	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}

	@Override
	public String toString() {
		return "PndtPatientHeader [pndt_header_id=" + pndt_header_id + ", patient_id=" + patient_id + ", month=" + month
				+ ", year=" + year + ", lab_id=" + lab_id + ", created_date=" + created_date + ", modified_date="
				+ modified_date + "]";
	}

	
	
	
	
}
