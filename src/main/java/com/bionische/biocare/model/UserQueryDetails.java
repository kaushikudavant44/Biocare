package com.bionische.biocare.model;
 
public class UserQueryDetails {
 
	private int ticketNo;
	
	private int status;
	
	private String name;
	
	private String email;
	
	private String phone;
	
	private String message;
	
	private String reply;
	
	private String generatedDate;
	
	private String replyDate;
	

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getGeneratedDate() {
		return generatedDate;
	}

	public void setGeneratedDate(String generatedDate) {
		this.generatedDate = generatedDate;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "UserQueryDetails [ticketNo=" + ticketNo + ", status=" + status + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", message=" + message + ", reply=" + reply + ", generatedDate=" + generatedDate
				+ ", replyDate=" + replyDate + "]";
	}

	 
}
