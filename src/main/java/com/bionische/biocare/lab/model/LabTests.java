package com.bionische.biocare.lab.model;

public class LabTests {
	
	private int labTestId;
	
	private String labTestName; 
	
	private String instruction;
	
	private int int1;
	
	private int int2;
	
	private String string1;
	private String string2;
	private int delStatus;

	
	
	public String getInstruction() {
		return instruction;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
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
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public int getLabTestId() {
		return labTestId;
	}
	public void setLabTestId(int labTestId) {
		this.labTestId = labTestId;
	}
	public String getLabTestName() {
		return labTestName;
	}
	public void setLabTestName(String labTestName) {
		this.labTestName = labTestName;
	}
	@Override
	public String toString() {
		return "LabTests [labTestId=" + labTestId + ", labTestName=" + labTestName + ", instructions=" + instruction
				+ ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + ", delStatus="
				+ delStatus + "]";
	}
	
	
	
	
}
