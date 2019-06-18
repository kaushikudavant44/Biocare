package com.bionische.biocare.radiology.model;

public class IndicationsModel {

	private int id;

	private int patientId;
	private int pndtId;

	private String indications;



	private int int_2;

	private String string1;

	private String string2;

	public int getPndtId() {
		return pndtId;
	}

	public void setPndtId(int pndtId) {
		this.pndtId = pndtId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getIndications() {
		return indications;
	}

	public void setIndications(String indications) {
		this.indications = indications;
	}

	

	

	public int getInt_2() {
		return int_2;
	}

	public void setInt_2(int int_2) {
		this.int_2 = int_2;
	}

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public String getString2() {
		return string2;
	}

	public void setString2(String string2) {
		this.string2 = string2;
	}

	@Override
	public String toString() {
		return "IndicationsModel [id=" + id + ", patientId=" + patientId + ", pndtId=" + pndtId + ", indications="
				+ indications + ", int_2=" + int_2 + ", string1=" + string1 + ", string2=" + string2 + "]";
	}

	

}
