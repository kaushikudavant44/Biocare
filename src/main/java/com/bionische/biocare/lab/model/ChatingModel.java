package com.bionische.biocare.lab.model;

public class ChatingModel {

	
	int id;
	String message;
	String receiveName;
	int receiveId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public int getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(int receiveId) {
		this.receiveId = receiveId;
	}
	@Override
	public String toString() {
		return "ChatingModel [id=" + id + ", message=" + message + ", receiveName=" + receiveName + ", receiveId="
				+ receiveId + "]";
	}
	
	
}
