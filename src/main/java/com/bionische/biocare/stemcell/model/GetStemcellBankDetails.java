package com.bionische.biocare.stemcell.model;

public class GetStemcellBankDetails {
	
	private int stemCellBankId;
	 
private String stemCellBankName;
	
	private int stemCellBankcityId;
	
	private String stemCellBankAddress;
	
	private String contact1;
	
	private String emailId;
	
	private int rating;
	
	
	    
	public int getStemCellBankId() {
		return stemCellBankId;
		
	}

	public void setStemCellBankId(int stemCellBankId) {
		this.stemCellBankId = stemCellBankId;
	}

	public String getStemCellBankName() {
		return stemCellBankName;
	}

	public void setStemCellBankName(String stemCellBankName) {
		this.stemCellBankName = stemCellBankName;
	}

	public int getStemCellBankcityId() {
		return stemCellBankcityId;
	}

	public void setStemCellBankcityId(int stemCellBankcityId) {
		this.stemCellBankcityId = stemCellBankcityId;
	}

	public String getStemCellBankAddress() {
		return stemCellBankAddress;
	}

	public void setStemCellBankAddress(String stemCellBankAddress) {
		this.stemCellBankAddress = stemCellBankAddress;
	}

	public String getContact1() {
		return contact1;
	}

	public void setContact1(String contact1) {
		this.contact1 = contact1;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "GetStemcellBankDetails [stemCellBankId=" + stemCellBankId + ", stemCellBankName=" + stemCellBankName
				+ ", stemCellBankcityId=" + stemCellBankcityId + ", stemCellBankAddress=" + stemCellBankAddress
				+ ", contact1=" + contact1 + ", emailId=" + emailId + ", rating=" + rating + "]";
	}

	

	

	
	
}
