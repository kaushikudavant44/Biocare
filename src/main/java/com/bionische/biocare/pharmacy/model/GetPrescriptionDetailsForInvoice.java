package com.bionische.biocare.pharmacy.model;

import java.beans.Transient;
import java.util.List;
 
public class GetPrescriptionDetailsForInvoice {

	
 
	private int medicalId;
	
	private String medicalName;
	  
	private String email;
	
	private String patientName;
 
	private String contact;
	 
	private String address;
	
	private String invoiceDate;
	
 
	List<GetPrescriptionDetailsForOrder> getPrescriptionDetailsForOrderList;

	public int getMedicalId() {
		return medicalId;
	}

	public void setMedicalId(int medicalId) {
		this.medicalId = medicalId;
	}

	public String getMedicalName() {
		return medicalName;
	}

	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<GetPrescriptionDetailsForOrder> getGetPrescriptionDetailsForOrderList() {
		return getPrescriptionDetailsForOrderList;
	}

	public void setGetPrescriptionDetailsForOrderList(
			List<GetPrescriptionDetailsForOrder> getPrescriptionDetailsForOrderList) {
		this.getPrescriptionDetailsForOrderList = getPrescriptionDetailsForOrderList;
	}

	public String getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	@Override
	public String toString() {
		return "GetPrescriptionDetailsForInvoice [medicalId=" + medicalId + ", medicalName=" + medicalName + ", email="
				+ email + ", patientName=" + patientName + ", contact=" + contact + ", address=" + address
				+ ", invoiceDate=" + invoiceDate + ", getPrescriptionDetailsForOrderList="
				+ getPrescriptionDetailsForOrderList + "]";
	}

 
	
}
