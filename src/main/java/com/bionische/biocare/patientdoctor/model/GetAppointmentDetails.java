package com.bionische.biocare.patientdoctor.model;

public class GetAppointmentDetails {
 
	private int appointId;
 
	private int doctorId;
	
	
	private String profilePhoto;
 
	private int patientId;
	
 
	private String time;
	
	private int timeId;
	
 
	private float amount;
	
	private String date;
 
    private String hospitalId;
	
 
	private String hospitalName;
 
	private String hospitalAddress;
 
	private String doctorName;
 
	private String patientName; 
	
	private int paymentStatus;
	
 
    private int delStatus;

 
    private int status;
    
    private int int_1;

	public int getAppointId() {
		return appointId;
	}

	public void setAppointId(int appointId) {
		this.appointId = appointId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getHospitalAddress() {
		return hospitalAddress;
	}

	public void setHospitalAddress(String hospitalAddress) {
		this.hospitalAddress = hospitalAddress;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	public int getInt_1() {
		return int_1;
	}

	public void setInt_1(int int_1) {
		this.int_1 = int_1;
	}

	
	public int getTimeId() {
		return timeId;
	}

	public void setTimeId(int timeId) {
		this.timeId = timeId;
	}
	
	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	@Override
	public String toString() {
		return "GetAppointmentDetails [appointId=" + appointId + ", doctorId=" + doctorId + ", profilePhoto="
				+ profilePhoto + ", patientId=" + patientId + ", time=" + time + ", timeId=" + timeId + ", amount="
				+ amount + ", date=" + date + ", hospitalId=" + hospitalId + ", hospitalName=" + hospitalName
				+ ", hospitalAddress=" + hospitalAddress + ", doctorName=" + doctorName + ", patientName=" + patientName
				+ ", paymentStatus=" + paymentStatus + ", delStatus=" + delStatus + ", status=" + status + ", int_1="
				+ int_1 + "]";
	}

	 
	
	
}
