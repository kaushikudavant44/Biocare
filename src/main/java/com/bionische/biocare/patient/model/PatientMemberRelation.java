package com.bionische.biocare.patient.model;

public class PatientMemberRelation {

	private int relationId;
	
	private String relationType;

	public int getRelationId() {
		return relationId;
	}

	public void setRelationId(int relationId) {
		this.relationId = relationId;
	}

	public String getRelationType() {
		return relationType;
	}

	public void setRelationType(String relationType) {
		this.relationType = relationType;
	}

	@Override
	public String toString() {
		return "PatientMemberRelation [relationId=" + relationId + ", relationType=" + relationType + "]";
	}
	
	
}
