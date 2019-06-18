package com.bionische.biocare.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.model.AdvertiseDetails;
import com.bionische.biocare.pharmacy.model.MedicalDetails;

@Controller
public class AdvertiseController {

	
	public final Log LOGGER = LogFactory.getLog(AdvertiseController.class);
	
	
	 @RequestMapping(value="/showAddAdvertise", method=RequestMethod.GET)

	 public String showAddAdvertise(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
		 
		 return "showAddNewAdvertise";
	 }
	 
	 
	 @RequestMapping(value="/addNewAdvertise", method=RequestMethod.POST)

	 public String addNewAdvertise(HttpServletRequest request,@RequestParam("fileName") List<MultipartFile> file,
	 		HttpServletResponse response)
	 {
		 int adsType=Integer.parseInt(request.getParameter("adsType"));
	 
		String expDate=request.getParameter("expDate");
		 
		HttpSession session = request.getSession();
		AdvertiseDetails advertiseDetails=new AdvertiseDetails();
		int userType=(int) session.getAttribute("userType");
		advertiseDetails.setDelStatus(2);
		advertiseDetails.setAdsType(adsType);
		if(userType==0)
		{
			
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			advertiseDetails.setAdsFrom(doctorDetails.getDoctorId());
			advertiseDetails.setFromType(userType);
			
		}
		if(userType==2)
		{
			LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
			advertiseDetails.setFromType(userType);
		}
		if(userType==3)
		{
			MedicalDetails medicalDetails = (MedicalDetails) session.getAttribute("medicalDetails");
			advertiseDetails.setFromType(userType);
		}
		advertiseDetails.setExpDate(DateConverter.convertToYMD(expDate));
		
		try {
			VpsImageUpload vpsImageUpload = new VpsImageUpload();
			String adsFileName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date()) + VpsImageUpload.getFileExtension(file.get(0));

			advertiseDetails.setFileName(adsFileName);

			vpsImageUpload.saveUploadedFiles(file, 12, adsFileName, 0);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		try {
		AdvertiseDetails advertiseDetailsRes = Constant.getRestTemplate().postForObject(Constant.url + "advertisement/addNewAds", advertiseDetails, AdvertiseDetails.class);
		}
		catch (Exception e) {
			LOGGER.error("Error while addNewAds.",e);
			throw new RuntimeException("Error while addNewAds.",e);
		}
		 return "showAddNewAdvertise";
	 }
	 
	 @RequestMapping(value="/showCurrentActiveAdvertise", method=RequestMethod.GET)

	 public String showCurrentActiveAdvertise(HttpServletRequest request,Model model,
	 		HttpServletResponse response)
	 {
		 HttpSession session = request.getSession();
			  
			int userType=(int) session.getAttribute("userType");
			MultiValueMap<String, Object> map=new LinkedMultiValueMap<>();
			map.add("userType",userType);
		 if(userType==0)
			{
			 DoctorDetails doctorDetails=	(DoctorDetails)session.getAttribute("doctorDetails");
				map.add("adsFrom", doctorDetails.getDoctorId());
			}
			else if(userType==2) {
				LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
			map.add("adsFrom", labDetails.getLabId());
			}
			else if(userType==3) {
				MedicalDetails medicalDetails=	(MedicalDetails)session.getAttribute("medicalDetails");
				map.add("adsFrom", medicalDetails.getMedicalId());
			}
		 try {
				List<AdvertiseDetails> advertiseDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "advertisement/getCurrentActiveAdsByUser", map, List.class);
				model.addAttribute("advertiseDetailsList",advertiseDetailsList);
				model.addAttribute("advertiseUrl",Constant.ADVERTISE);
		 }
				catch (Exception e) {
					LOGGER.error("Error while showCurrentActiveAdvertise.",e);
					throw new RuntimeException("Error while showCurrentActiveAdvertise.",e);
				}
		 return "showCurrectActiveAdvertise";
	 }
	 
	 
	 @RequestMapping(value="/getAdvertise", method=RequestMethod.GET)
	 public @ResponseBody List<AdvertiseDetails> getAdvertise(HttpServletRequest request,Model model,
	 		HttpServletResponse response)
	 {
		 try {
		 List<AdvertiseDetails> advertiseDetailsList=  Constant.getRestTemplate().getForObject(Constant.url + "advertisement/getRandom10Ads", List.class);
			model.addAttribute("advertiseDetailsList",advertiseDetailsList);
		 return advertiseDetailsList;
		 }
		 catch (Exception e) {
			 LOGGER.error("Error while getAdvertise.",e);
				throw new RuntimeException("Error while getAdvertise.",e);
		}
	 }
}
