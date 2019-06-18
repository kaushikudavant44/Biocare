package com.bionische.biocare.model;

 
public class GetBlogs {

 
	private int blogId;

	private String blogDate;

	private String blogTitle;
  
	private String blogBy;

	private String blogImage;

	private String blogContent;
	
	private int likesCount;

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


	public String getBlogImage() {
		return blogImage;
	}

	public void setBlogImage(String blogImage) {
		this.blogImage = blogImage;
	}

	public int getLikesCount() {
		return likesCount;
	}

	public void setLikesCount(int likesCount) {
		this.likesCount = likesCount;
	}

	public String getBlogBy() {
		return blogBy;
	}

	public void setBlogBy(String blogBy) {
		this.blogBy = blogBy;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

	@Override
	public String toString() {
		return "GetBlogs [blogId=" + blogId + ", blogDate=" + blogDate + ", blogTitle=" + blogTitle + ", blogBy="
				+ blogBy + ", blogImage=" + blogImage + ", blogContent=" + blogContent + ", likesCount=" + likesCount
				+ "]";
	}

	 
}
