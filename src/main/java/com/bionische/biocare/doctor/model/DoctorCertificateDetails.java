package com.bionische.biocare.doctor.model;

import java.util.Date;

public class DoctorCertificateDetails {

	
	 
    private int cetrificateId;
	
	 
    private String cetrificate;
	
	 
    private int doctorId;
	 
    private String string1;
    
    private Date createDate;
    
	private Date lastModifiedDate;
	
    private String message;
	 
    private int delStatus;
	 
    private int int1;

	public int getCetrificateId() {
		return cetrificateId;
	}

	public void setCetrificateId(int cetrificateId) {
		this.cetrificateId = cetrificateId;
	}

	public String getCetrificate() {
		return cetrificate;
	}

	public void setCetrificate(String cetrificate) {
		this.cetrificate = cetrificate;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "DoctorCertificateDetails [cetrificateId=" + cetrificateId + ", cetrificate=" + cetrificate
				+ ", doctorId=" + doctorId + ", string1=" + string1 + ", createDate=" + createDate
				+ ", lastModifiedDate=" + lastModifiedDate + ", message=" + message + ", delStatus=" + delStatus
				+ ", int1=" + int1 + "]";
	}

	 
	
	
	
}
