package com.bionische.biocare.model;

import org.springframework.web.multipart.MultipartFile;

public class NewBlog {

	
	private String blogTitle;

	private MultipartFile blogImage;
	
	private String blogContent;
	
	
	
	
 
 
	public MultipartFile getBlogImage() {
		return blogImage;
	}
	public void setBlogImage(MultipartFile blogImage) {
		this.blogImage = blogImage;
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
	@Override
	public String toString() {
		return "NewBlog [blogTitle=" + blogTitle + ", blogImage=" + blogImage + ", blogContent=" + blogContent + "]";
	}
	
	





	
}
