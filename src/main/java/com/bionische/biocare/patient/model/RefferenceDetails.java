package com.bionische.biocare.patient.model;

public class RefferenceDetails {
	
	private int refferenceId;
	
	private int sender_id;
	
	private String receiver_address;
	 
	private String refferenceCode;
	
	private int status;

	public int getRefferenceId() {
		return refferenceId;
	}

	public void setRefferenceId(int refferenceId) {
		this.refferenceId = refferenceId;
	}

	public int getSender_id() {
		return sender_id;
	}

	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_address() {
		return receiver_address;
	}

	public void setReceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}

	public String getRefferenceCode() {
		return refferenceCode;
	}

	public void setRefferenceCode(String refferenceCode) {
		this.refferenceCode = refferenceCode;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RefferenceDetails [refferenceId=" + refferenceId + ", sender_id=" + sender_id + ", receiver_address="
				+ receiver_address + ", refferenceCode=" + refferenceCode + ", status=" + status + "]";
	}
	
	
	
	

}
