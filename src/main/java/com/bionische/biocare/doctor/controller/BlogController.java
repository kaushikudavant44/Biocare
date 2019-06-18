package com.bionische.biocare.doctor.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.VpsImageUpload;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.model.GetBlogs;
import com.bionische.biocare.model.NewBlog;
import com.bionische.biocare.patient.model.Info;

@Scope("session")
@Controller
public class BlogController {

	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);

	@RequestMapping(value = "/addNewBlog", method = RequestMethod.GET)
	public ModelAndView addNewBlog(Locale locale, Model model) {

		logger.info("opening insert blog page", locale);

		ModelAndView modelBlog = new ModelAndView("doctor/addNewBlog");

		return modelBlog;
	} 

	@PostMapping(value = "/saveNewBlog")
	public String saveNewBlog(@ModelAttribute NewBlog newBlog, HttpServletRequest request) {
		
		Info respone = new Info();

		System.out.println("Data  " + newBlog.toString() + "\n\n image " + newBlog.getBlogImage().getOriginalFilename());
		
		respone.setError(false);
		respone.setMessage("Data uploaded");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		String timestamp = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date())+doctorDetails.getDoctorId();
		try {
			VpsImageUpload.uploadBlogFile(newBlog.getBlogImage(),
					timestamp + VpsImageUpload.getFileExtension(newBlog.getBlogImage()));
		} catch (IOException e) {
			
			e.printStackTrace();
		}

		return "redirect:myBlogs";

	}
	
	
	@RequestMapping(value = "/myBlogs", method = RequestMethod.GET)
	public ModelAndView myBlogs( HttpServletRequest request) {

		logger.info("opening my blog page");


		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");


		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("drId",doctorDetails.getDoctorId());
	   
	   List<GetBlogs> blogsList=Constant.getRestTemplate().postForObject(Constant.url+"blogs/getBlogsDetailsByDrId",map,List.class);

		logger.info("Blogs List "+blogsList.toString());

	
		
		ModelAndView modelBlog = new ModelAndView("doctor/myBlogs");
		modelBlog.addObject("blogList", blogsList);
		
		return modelBlog;
	}

	
	@RequestMapping(value = "/showBlogsDetailsById/{blogId}", method = RequestMethod.GET)
	public ModelAndView showBlogsDetailsById(@PathVariable("blogId")int blogId, HttpServletRequest request) {

		logger.info("opening my blog page");


	 
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("blogId",blogId);
	   
	    GetBlogs blogs=Constant.getRestTemplate().postForObject(Constant.url+"blogs/getBlogsDetailsByBlogId",map,GetBlogs.class);
 
		logger.info("Blogs List "+blogs.toString());

	
		
		ModelAndView modelBlog = new ModelAndView("blogPg");
		modelBlog.addObject("blogsUrl",Constant.BLOGS);
		modelBlog.addObject("blogs", blogs);
		
		return modelBlog;
	}
	

}
