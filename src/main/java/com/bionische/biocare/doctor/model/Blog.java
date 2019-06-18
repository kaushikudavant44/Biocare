package com.bionische.biocare.doctor.model;

public class Blog {

	private int blogId;
	
	private String blogDate;
	
	private String blogTitle;
	
	private String blogContent;
	
	private String blogImage;
		
	private boolean isUsed;

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	public String getBlogDate() {
		return blogDate;
	}

	public void setBlogDate(String blogDate) {
		this.blogDate = blogDate;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

	public String getBlogImage() {
		return blogImage;
	}

	public void setBlogImage(String blogImage) {
		this.blogImage = blogImage;
	}

	public boolean isUsed() {
		return isUsed;
	}

	public void setUsed(boolean isUsed) {
		this.isUsed = isUsed;
	}

	
	@Override
	public String toString() {
		return "Blog [blogId=" + blogId + ", blogDate=" + blogDate + ", blogTitle=" + blogTitle + ", blogContent="
				+ blogContent + ", blogImage=" + blogImage + ", isUsed=" + isUsed + "]";
	}
	
	
	
	
	
}
