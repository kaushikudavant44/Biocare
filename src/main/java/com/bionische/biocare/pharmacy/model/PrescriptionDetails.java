package com.bionische.biocare.pharmacy.model;

import java.util.List;

public class PrescriptionDetails {
	
	private int prescriptionId;

	private int meetingId;

 

	private String medicineName;

	private String medicineQuantity;

	private String medicineTiming;

	private String medicineInstruction;
	
	private String medicineDuration;

	private float float1;

	private int int1;

	private int int2;

	private String string1;

	private String string2;

	private int delstatus;


	public String getMedicineInstruction() {
		return medicineInstruction;
	}

	public void setMedicineInstruction(String medicineInstruction) {
		this.medicineInstruction = medicineInstruction;
	}

	public String getMedicineDuration() {
		return medicineDuration;
	}

	public void setMedicineDuration(String medicineDuration) {
		this.medicineDuration = medicineDuration;
	}
	
   public int getPrescriptionId() {
		return prescriptionId;
	}

	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}

	public int getMeetingId() {
		return meetingId;
	}

	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}

	 

	public String getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}

	 
 

	public String getMedicineQuantity() {
		return medicineQuantity;
	}

	public void setMedicineQuantity(String medicineQuantity) {
		this.medicineQuantity = medicineQuantity;
	}

	public String getMedicineTiming() {
		return medicineTiming;
	}

	public void setMedicineTiming(String medicineTiming) {
		this.medicineTiming = medicineTiming;
	}

	

	public float getFloat1() {
		return float1;
	}

	public void setFloat1(float float1) {
		this.float1 = float1;
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

	public int getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(int delstatus) {
		this.delstatus = delstatus;
	}

	@Override
	public String toString() {
		return "PrescriptionDetails [prescriptionId=" + prescriptionId + ", meetingId=" + meetingId + ", medicineName="
				+ medicineName + ", medicineQuantity=" + medicineQuantity + ", medicineTiming=" + medicineTiming
				+ ", medicineInstruction=" + medicineInstruction + ", medicineDuration=" + medicineDuration
				+ ", float1=" + float1 + ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2="
				+ string2 + ", delstatus=" + delstatus + "]";
	}

	 
	
	
}
