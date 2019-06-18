package com.bionische.biocare.lab.model;
 
public class TestsInLab {

	 
	private int id;
	 
    private int testId;
	 
	private int labId;
	 
	private int delStatus;
	
	private String instructions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	@Override
	public String toString() {
		return "TestsInLab [id=" + id + ", testId=" + testId + ", labId=" + labId + ", delStatus=" + delStatus
				+ ", instructions=" + instructions + "]";
	}
	
	
}
