package com.bionische.biocare.radiology.model;

import java.util.Date;
import java.util.List;

import com.bionische.biocare.patientdoctor.model.PrescriptionDetails;

public class PNDTPatientDetails {

	private int pndtId;

	private int pndtPatientId;

	private int pndtHeaderId;

	private String patientName;

	private String mName;

	private String lName;

	private String state;

	private int numberOfChild;

	private int numberOfMaleChild;

	private int numberOfFemaleChild;

	private String relativeType;

	private String relativeName;

	private String address;

	private String refDoctor;

	private String selfDoctor;

	private String weeksOfPregnancy;

	private String nameOfDoctor;

	private String numberOfIndication;

	private String nonInvasiveProc;

	private String pregWomenObtainDate;

	private String dateProcCarOut;

	private String resOfNonInvasiveProc;

	private String resOfPreNatalDiagnoProc;

	private String indicationMTPAbnormal;

	private String genDiseaseHistory;

	private String indicationDiangoProc;

	private String dateConsentOfPrgWomen;

	private String invasiveProcCarOut;

	private String complicationInvasiveProc;

	private String additionalTestRecommended;

	private String resultOfProcedure;

	private String dateResOfProcedure;

	private String invasivePreNatalDiagnoProc;

	private String indicationMTPabnormality;

	private List<ChildsModel> childsModelList;

	private int delStatus;

	private int labId;

	private int patientType;;

	private int string1;

	private String nameOfDoctorPerformProc;

	Date created_date;

	Date modified_date;

	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Date getModified_date() {
		return modified_date;
	}

	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}

	public String getNameOfDoctorPerformProc() {
		return nameOfDoctorPerformProc;
	}

	public void setNameOfDoctorPerformProc(String nameOfDoctorPerformProc) {
		this.nameOfDoctorPerformProc = nameOfDoctorPerformProc;
	}

	public int getPndtPatientId() {
		return pndtPatientId;
	}

	public void setPndtPatientId(int pndtPatientId) {
		this.pndtPatientId = pndtPatientId;
	}

	public int getPndtHeaderId() {
		return pndtHeaderId;
	}

	public void setPndtHeaderId(int pndtHeaderId) {
		this.pndtHeaderId = pndtHeaderId;
	}

	public List<ChildsModel> getChildsModelList() {
		return childsModelList;
	}

	public void setChildsModelList(List<ChildsModel> childsModelList) {
		this.childsModelList = childsModelList;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getLabId() {
		return labId;
	}

	public void setLabId(int labId) {
		this.labId = labId;
	}

	public int getPatientType() {
		return patientType;
	}

	public void setPatientType(int patientType) {
		this.patientType = patientType;
	}

	public int getString1() {
		return string1;
	}

	public void setString1(int string1) {
		this.string1 = string1;
	}

	public int getPndtId() {
		return pndtId;
	}

	public void setPndtId(int pndtId) {
		this.pndtId = pndtId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getNumberOfChild() {
		return numberOfChild;
	}

	public void setNumberOfChild(int numberOfChild) {
		this.numberOfChild = numberOfChild;
	}

	public int getNumberOfMaleChild() {
		return numberOfMaleChild;
	}

	public void setNumberOfMaleChild(int numberOfMaleChild) {
		this.numberOfMaleChild = numberOfMaleChild;
	}

	public int getNumberOfFemaleChild() {
		return numberOfFemaleChild;
	}

	public void setNumberOfFemaleChild(int numberOfFemaleChild) {
		this.numberOfFemaleChild = numberOfFemaleChild;
	}

	public String getRelativeType() {
		return relativeType;
	}

	public void setRelativeType(String relativeType) {
		this.relativeType = relativeType;
	}

	public String getRelativeName() {
		return relativeName;
	}

	public void setRelativeName(String relativeName) {
		this.relativeName = relativeName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRefDoctor() {
		return refDoctor;
	}

	public void setRefDoctor(String refDoctor) {
		this.refDoctor = refDoctor;
	}

	public String getSelfDoctor() {
		return selfDoctor;
	}

	public void setSelfDoctor(String selfDoctor) {
		this.selfDoctor = selfDoctor;
	}

	public String getWeeksOfPregnancy() {
		return weeksOfPregnancy;
	}

	public void setWeeksOfPregnancy(String weeksOfPregnancy) {
		this.weeksOfPregnancy = weeksOfPregnancy;
	}

	public String getNameOfDoctor() {
		return nameOfDoctor;
	}

	public void setNameOfDoctor(String nameOfDoctor) {
		this.nameOfDoctor = nameOfDoctor;
	}

	public String getNumberOfIndication() {
		return numberOfIndication;
	}

	public void setNumberOfIndication(String numberOfIndication) {
		this.numberOfIndication = numberOfIndication;
	}

	public String getNonInvasiveProc() {
		return nonInvasiveProc;
	}

	public void setNonInvasiveProc(String nonInvasiveProc) {
		this.nonInvasiveProc = nonInvasiveProc;
	}

	public String getPregWomenObtainDate() {
		return pregWomenObtainDate;
	}

	public void setPregWomenObtainDate(String pregWomenObtainDate) {
		this.pregWomenObtainDate = pregWomenObtainDate;
	}

	public String getDateProcCarOut() {
		return dateProcCarOut;
	}

	public void setDateProcCarOut(String dateProcCarOut) {
		this.dateProcCarOut = dateProcCarOut;
	}

	public String getResOfNonInvasiveProc() {
		return resOfNonInvasiveProc;
	}

	public void setResOfNonInvasiveProc(String resOfNonInvasiveProc) {
		this.resOfNonInvasiveProc = resOfNonInvasiveProc;
	}

	public String getResOfPreNatalDiagnoProc() {
		return resOfPreNatalDiagnoProc;
	}

	public void setResOfPreNatalDiagnoProc(String resOfPreNatalDiagnoProc) {
		this.resOfPreNatalDiagnoProc = resOfPreNatalDiagnoProc;
	}

	public String getIndicationMTPAbnormal() {
		return indicationMTPAbnormal;
	}

	public void setIndicationMTPAbnormal(String indicationMTPAbnormal) {
		this.indicationMTPAbnormal = indicationMTPAbnormal;
	}

	public String getGenDiseaseHistory() {
		return genDiseaseHistory;
	}

	public void setGenDiseaseHistory(String genDiseaseHistory) {
		this.genDiseaseHistory = genDiseaseHistory;
	}

	public String getIndicationDiangoProc() {
		return indicationDiangoProc;
	}

	public void setIndicationDiangoProc(String indicationDiangoProc) {
		this.indicationDiangoProc = indicationDiangoProc;
	}

	public String getDateConsentOfPrgWomen() {
		return dateConsentOfPrgWomen;
	}

	public void setDateConsentOfPrgWomen(String dateConsentOfPrgWomen) {
		this.dateConsentOfPrgWomen = dateConsentOfPrgWomen;
	}

	public String getInvasiveProcCarOut() {
		return invasiveProcCarOut;
	}

	public void setInvasiveProcCarOut(String invasiveProcCarOut) {
		this.invasiveProcCarOut = invasiveProcCarOut;
	}

	public String getComplicationInvasiveProc() {
		return complicationInvasiveProc;
	}

	public void setComplicationInvasiveProc(String complicationInvasiveProc) {
		this.complicationInvasiveProc = complicationInvasiveProc;
	}

	public String getAdditionalTestRecommended() {
		return additionalTestRecommended;
	}

	public void setAdditionalTestRecommended(String additionalTestRecommended) {
		this.additionalTestRecommended = additionalTestRecommended;
	}

	public String getResultOfProcedure() {
		return resultOfProcedure;
	}

	public void setResultOfProcedure(String resultOfProcedure) {
		this.resultOfProcedure = resultOfProcedure;
	}

	public String getDateResOfProcedure() {
		return dateResOfProcedure;
	}

	public void setDateResOfProcedure(String dateResOfProcedure) {
		this.dateResOfProcedure = dateResOfProcedure;
	}

	public String getInvasivePreNatalDiagnoProc() {
		return invasivePreNatalDiagnoProc;
	}

	public void setInvasivePreNatalDiagnoProc(String invasivePreNatalDiagnoProc) {
		this.invasivePreNatalDiagnoProc = invasivePreNatalDiagnoProc;
	}

	public String getIndicationMTPabnormality() {
		return indicationMTPabnormality;
	}

	public void setIndicationMTPabnormality(String indicationMTPabnormality) {
		this.indicationMTPabnormality = indicationMTPabnormality;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	@Override
	public String toString() {
		return "PNDTPatientDetails [pndtId=" + pndtId + ", pndtPatientId=" + pndtPatientId + ", pndtHeaderId="
				+ pndtHeaderId + ", patientName=" + patientName + ", mName=" + mName + ", lName=" + lName + ", state="
				+ state + ", numberOfChild=" + numberOfChild + ", numberOfMaleChild=" + numberOfMaleChild
				+ ", numberOfFemaleChild=" + numberOfFemaleChild + ", relativeType=" + relativeType + ", relativeName="
				+ relativeName + ", address=" + address + ", refDoctor=" + refDoctor + ", selfDoctor=" + selfDoctor
				+ ", weeksOfPregnancy=" + weeksOfPregnancy + ", nameOfDoctor=" + nameOfDoctor + ", numberOfIndication="
				+ numberOfIndication + ", nonInvasiveProc=" + nonInvasiveProc + ", pregWomenObtainDate="
				+ pregWomenObtainDate + ", dateProcCarOut=" + dateProcCarOut + ", resOfNonInvasiveProc="
				+ resOfNonInvasiveProc + ", resOfPreNatalDiagnoProc=" + resOfPreNatalDiagnoProc
				+ ", indicationMTPAbnormal=" + indicationMTPAbnormal + ", genDiseaseHistory=" + genDiseaseHistory
				+ ", indicationDiangoProc=" + indicationDiangoProc + ", dateConsentOfPrgWomen=" + dateConsentOfPrgWomen
				+ ", invasiveProcCarOut=" + invasiveProcCarOut + ", complicationInvasiveProc="
				+ complicationInvasiveProc + ", additionalTestRecommended=" + additionalTestRecommended
				+ ", resultOfProcedure=" + resultOfProcedure + ", dateResOfProcedure=" + dateResOfProcedure
				+ ", invasivePreNatalDiagnoProc=" + invasivePreNatalDiagnoProc + ", indicationMTPabnormality="
				+ indicationMTPabnormality + ", childsModelList=" + childsModelList + ", delStatus=" + delStatus
				+ ", labId=" + labId + ", patientType=" + patientType + ", string1=" + string1
				+ ", nameOfDoctorPerformProc=" + nameOfDoctorPerformProc + ", created_date=" + created_date
				+ ", modified_date=" + modified_date + ", status=" + status + "]";
	}

}
