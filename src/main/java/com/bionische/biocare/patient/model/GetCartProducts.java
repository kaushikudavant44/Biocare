package com.bionische.biocare.patient.model;

public class GetCartProducts {
	
	private int cartId;
	
    private int doctorId;
	
	private int patintId;
	
	private int meetId;
	
	private String hospitalName;
	
	private String doctorName;
	
	private String cartDate;
	
	private String patientProblem;
	
	private String discussion;
	
	private String note;
	
	private String patientName;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPatintId() {
		return patintId;
	}

	public void setPatintId(int patintId) {
		this.patintId = patintId;
	}

	public int getMeetId() {
		return meetId;
	}

	public void setMeetId(int meetId) {
		this.meetId = meetId;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getCartDate() {
		return cartDate;
	}

	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}

	public String getPatientProblem() {
		return patientProblem;
	}

	public void setPatientProblem(String patientProblem) {
		this.patientProblem = patientProblem;
	}

	public String getDiscussion() {
		return discussion;
	}

	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	@Override
	public String toString() {
		return "GetCartProducts [cartId=" + cartId + ", doctorId=" + doctorId + ", patintId=" + patintId + ", meetId="
				+ meetId + ", hospitalName=" + hospitalName + ", doctorName=" + doctorName + ", cartDate=" + cartDate
				+ ", patientProblem=" + patientProblem + ", discussion=" + discussion + ", note=" + note
				+ ", patientName=" + patientName + "]";
	}
	
	

}
