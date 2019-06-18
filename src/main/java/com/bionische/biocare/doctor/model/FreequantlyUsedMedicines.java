package com.bionische.biocare.doctor.model;

public class FreequantlyUsedMedicines {
	
	private int freequantlyUsedMedicinesId;

	private int doctorId;
	
	private int delStatus;
	
	private int int1;
	
	private int int2;
	
	private String medicineName;
	
	private String string1;
	
	private String string2;

	public int getFreequantlyUsedMedicinesId() {
		return freequantlyUsedMedicinesId;
	}

	public void setFreequantlyUsedMedicinesId(int freequantlyUsedMedicinesId) {
		this.freequantlyUsedMedicinesId = freequantlyUsedMedicinesId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
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

	public String getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
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
		return "FreequantlyUsedMedicines [freequantlyUsedMedicinesId=" + freequantlyUsedMedicinesId + ", doctorId="
				+ doctorId + ", delStatus=" + delStatus + ", int1=" + int1 + ", int2=" + int2 + ", medicineName="
				+ medicineName + ", string1=" + string1 + ", string2=" + string2 + "]";
	}
	
	
	
}
