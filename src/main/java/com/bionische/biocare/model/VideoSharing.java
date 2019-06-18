package com.bionische.biocare.model;
 
public class VideoSharing {
 
	private int videoId;
	private int patientId;
	private int doctorId;
	private String title;
	private String videoFileName;
	private int delStatus;
	private String doctorName;
	private String patientName;
	public int getVideoId() {
		return videoId;
	}
	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	@Override
	public String toString() {
		return "VideoSharing [videoId=" + videoId + ", patientId=" + patientId + ", doctorId=" + doctorId + ", title="
				+ title + ", videoFileName=" + videoFileName + ", delStatus=" + delStatus + ", doctorName=" + doctorName
				+ ", patientName=" + patientName + "]";
	}
	 
	
}
