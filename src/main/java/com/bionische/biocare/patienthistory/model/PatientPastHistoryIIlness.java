package com.bionische.biocare.patienthistory.model;

public class PatientPastHistoryIIlness {

	private int pastHistoryIllnessId;
	private String illnessName;
    private String IllnessDescription;
    private int int1;
    private int int2;
    private String string1;
    private String string2;
	public int getPastHistoryIllnessId() {
		return pastHistoryIllnessId;
	}
	public void setPastHistoryIllnessId(int pastHistoryIllnessId) {
		this.pastHistoryIllnessId = pastHistoryIllnessId;
	}
	public String getIllnessName() {
		return illnessName;
	}
	public void setIllnessName(String illnessName) {
		this.illnessName = illnessName;
	}
	public String getIllnessDescription() {
		return IllnessDescription;
	}
	public void setIllnessDescription(String illnessDescription) {
		IllnessDescription = illnessDescription;
	}
	public int getInt1() {
		return int1;
	}
	public void setInt1(int int1) {
		this.int1 = int1;
	}
	public int getInt2() {
		return int2;
	}
	public void setInt2(int int2) {
		this.int2 = int2;
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
		return "PatientPastHistoryIIlness [pastHistoryIllnessId=" + pastHistoryIllnessId + ", illnessName="
				+ illnessName + ", IllnessDescription=" + IllnessDescription + ", int1=" + int1 + ", int2=" + int2
				+ ", string1=" + string1 + ", string2=" + string2 + "]";
	}
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
