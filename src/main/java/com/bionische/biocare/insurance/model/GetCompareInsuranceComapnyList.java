package com.bionische.biocare.insurance.model;

import java.util.List;

import com.bionische.biocare.patient.model.Info;


public class GetCompareInsuranceComapnyList {

List<GetCompareInsuranceComapny> GetCompareInsuranceComapnyList;
	
	Info info;

	public List<GetCompareInsuranceComapny> getGetCompareInsuranceComapnyList() {
		return GetCompareInsuranceComapnyList;
	}

	public void setGetCompareInsuranceComapnyList(List<GetCompareInsuranceComapny> getCompareInsuranceComapnyList) {
		GetCompareInsuranceComapnyList = getCompareInsuranceComapnyList;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "GetCompareInsuranceComapnyList [GetCompareInsuranceComapnyList=" + GetCompareInsuranceComapnyList
				+ ", info=" + info + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
