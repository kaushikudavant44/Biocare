package com.bionische.biocare.lab.model;

public class RadiologistPndtDetails {
	
	
	int id;
	
	String userName;
	
	String password;
	
	int labId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	@Override
	public String toString() {
		return "RadiologistPndtDetails [id=" + id + ", userName=" + userName + ", password=" + password + ", labId="
				+ labId + "]";
	}
	
	

}
