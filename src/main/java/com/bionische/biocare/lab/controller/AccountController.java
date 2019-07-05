package com.bionische.biocare.lab.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.lab.model.GetLabReportReceipt;
import com.bionische.biocare.lab.model.LabBankAccountInfo;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.lab.model.LabSuscriptionReceipt;
@Scope("session")
@Controller
public class AccountController {

	public final Log LOGGER = LogFactory.getLog(AccountController.class);
	LabBankAccountInfo labBankAccountInfo;
	List<LabSuscriptionReceipt> labSuscriptionReceiptList;
	List<GetLabReportReceipt> getLabReportReceiptList;
	
	
	 @RequestMapping(value="/showLabBankDetails", method=RequestMethod.GET)

	 public ModelAndView showBankDetails(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
		 HttpSession session = request.getSession();
			LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
	 	ModelAndView model=new ModelAndView("lab/bankDetails");
	 	
	 	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", ""+labDetails.getLabId());
		labBankAccountInfo=Constant.getRestTemplate().postForObject(Constant.url + "getLabBankDetails", map, LabBankAccountInfo.class);
		model.addObject("labBankAccountInfo",labBankAccountInfo);
		model.addObject("labBankAcc","active");
	 	return model;
	 	
	 }
	 

	@RequestMapping(value = "/showAddEditLabBankDetails", method = RequestMethod.GET)
	public ModelAndView showAddEditLabBankDetails(HttpServletRequest request) {
		ModelAndView model=new ModelAndView("lab/addEditBankDetails");
		 try {
			 HttpSession session = request.getSession();
				LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("labId", ""+labDetails.getLabId());
				labBankAccountInfo=Constant.getRestTemplate().postForObject(Constant.url + "getLabBankDetails", map, LabBankAccountInfo.class);
		model.addObject("labBankAccountInfo",labBankAccountInfo);
		 }catch (Exception e) {
				LOGGER.error("Error while fecthing doctor Bank Details in showAddEditLabBankDetails",e);
				throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditLabBankDetails",e);
		}
		
		return model;
	}
	
	
	@RequestMapping(value = "/submitLabBankDetails", method = RequestMethod.POST)
	public String submitLabBankDetails(HttpServletRequest request, Model model) {
		
		 try {
			 HttpSession session = request.getSession();
			 LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
			 LabBankAccountInfo labBankAccountInfo=new LabBankAccountInfo();
				try {
					labBankAccountInfo.setId(Integer.parseInt(request.getParameter("id")));
				}catch (Exception e) {
					 
				}
				labBankAccountInfo.setLabId(labDetails.getLabId());
				labBankAccountInfo.setAccHolderName(request.getParameter("accHolderName"));
				labBankAccountInfo.setAccountNo(request.getParameter("accountNo"));
				labBankAccountInfo.setBankBranch(request.getParameter("bankBranch"));
				labBankAccountInfo.setBankName(request.getParameter("bankName"));
				labBankAccountInfo.setDelStatus(0);
				labBankAccountInfo.setGstNo(request.getParameter("gstNo"));
				labBankAccountInfo.setIfscCode(request.getParameter("ifscCode"));
				labBankAccountInfo.setPanNo(request.getParameter("panNo"));
				
				LabBankAccountInfo labBankAccountInfoRes=Constant.getRestTemplate().postForObject(Constant.url + "insertLabBankDetails", labBankAccountInfo, LabBankAccountInfo.class);
		model.addAttribute("doctorBankAccountInfo",labBankAccountInfo);
		 }catch (Exception e) {
				LOGGER.error("Error while fecthing doctor Bank Details in showAddEditLabBankDetails",e);
				throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditLabBankDetails",e);
		}
		
		return "redirect:/showLabBankDetails";
	}
	
	
	@RequestMapping(value = "/getLabSuscriptionReceipt", method = RequestMethod.GET)
	public String getLabSuscriptionReceipt(HttpServletRequest request, Model model) {
		try {
			 HttpSession session = request.getSession();
			 LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
				LabBankAccountInfo labBankAccountInfo=new LabBankAccountInfo();
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("labId", labDetails.getLabId());
			//  doctorBankAccountInfoRes=Constant.getRestTemplate().postForObject(Constant.url + "getDoctorSuscriptionReceipt", map, List.class);
			  
			  ParameterizedTypeReference<List<LabSuscriptionReceipt>> typeRef = new ParameterizedTypeReference<List<LabSuscriptionReceipt>>() {
				};
				ResponseEntity<List<LabSuscriptionReceipt>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getLabSuscriptionReceipt",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
				
				labSuscriptionReceiptList = responseEntity.getBody();
			
			
		model.addAttribute("labSuscriptionReceiptList",labSuscriptionReceiptList);
		 }catch (Exception e) {
				LOGGER.error("Error while fecthing doctor Bank Details in getLabSuscriptionReceipt",e);
				throw new RuntimeException("Error while fecthing doctor Bank Details in getLabSuscriptionReceipt",e);
		}
		return "lab/subscriptionReceiptList";
		//return "redirect:/pdf?url=pdfDoctorSuscriptionReceipt";
	}
	
	
	@RequestMapping(value = "/pdfLabSuscriptionReceipt/{id}", method = RequestMethod.GET)
	public String pdfLabSuscriptionReceipt(@PathVariable("id") int id, HttpServletResponse response, HttpServletRequest request, Model model) {
		
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("suscriptionId", id);
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_OCTET_STREAM));
		HttpEntity<MultiValueMap<String, Object>> request1 = new HttpEntity<MultiValueMap<String, Object>>(map,
				headers);

		ResponseEntity<byte[]> response1 = Constant.getRestTemplate()
				.exchange(Constant.url + "labSubscriptionReceiptPdf", HttpMethod.POST, request1, byte[].class);
		// Files.write(Paths.get("E:\\ss\\demo1.pdf"), response1.getBody());

		System.out.println("Success ");

		byte[] data = response1.getBody();

		streamReport(response, data, "receipt.pdf");
		}
catch (Exception e) {
	LOGGER.error("Error while fecthing  pharmacyPrescriptionReceiptPdf", e);
	throw new RuntimeException("Error while fecthing pharmacyPrescriptionReceiptPdf", e);

	 
 }
		
		
		return "lab/labSubscriptionReceipt";
	}
	

	
	
	@RequestMapping(value = "/showLabReportReceiptHistory", method = RequestMethod.GET)

	public String showLabReportReceiptHistory(HttpServletRequest request, Model model) {
	
		 
		 return "lab/labReportBillHistory";
	}
	@RequestMapping(value = "/getLabReportReceiptHistory", method = RequestMethod.GET)

	public @ResponseBody List<GetLabReportReceipt> getLabReportReceiptHistory(HttpServletRequest request, Model model) {
		
		 String fromDate=DateConverter.convertToYMD(request.getParameter("fromDate"));
		 String toDate=DateConverter.convertToYMD(request.getParameter("toDate"))+" 23:59:59";
	 
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		 HttpSession session = request.getSession();
			LabDetails labDetails=	(LabDetails)session.getAttribute("labDetails");
			
		map.add("labId", labDetails.getLabId());
		map.add("fromDate", fromDate);
		map.add("toDate", toDate);
		try {
			 
 
 			ParameterizedTypeReference<List<GetLabReportReceipt>> typeRef = new ParameterizedTypeReference<List<GetLabReportReceipt>>() {
			};
			ResponseEntity<List<GetLabReportReceipt>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getLabReportReceipt",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			getLabReportReceiptList=new ArrayList<GetLabReportReceipt>();
			getLabReportReceiptList= responseEntity.getBody();
  
			
			model.addAttribute("getLabReportReceiptList",getLabReportReceiptList);
		return getLabReportReceiptList;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
	 
	 return null;
			}
	
	@RequestMapping(value = "/pdfViewReportReceipt/{receiptNo}", method = RequestMethod.GET)
	public String pdfViewReportReceipt(@PathVariable("receiptNo") int receiptNo, HttpServletResponse response, HttpServletRequest request, Model model) {
		

		 try {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("receiptNo", receiptNo);
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_OCTET_STREAM));
			HttpEntity<MultiValueMap<String, Object>> request1 = new HttpEntity<MultiValueMap<String, Object>>(map,
					headers);

			ResponseEntity<byte[]> response1 = Constant.getRestTemplate()
					.exchange(Constant.url + "labReportReceiptPdf", HttpMethod.POST, request1, byte[].class);
			// Files.write(Paths.get("E:\\ss\\demo1.pdf"), response1.getBody());

			System.out.println("Success ");

			byte[] data = response1.getBody();

			streamReport(response, data, "receipt.pdf");
			}
	catch (Exception e) {
		LOGGER.error("Error while fecthing  pharmacyPrescriptionReceiptPdf", e);
		throw new RuntimeException("Error while fecthing pharmacyPrescriptionReceiptPdf", e);

		 
	 }
		
		
		
		return "lab/labReportReceipt";
	}
	
	
	
	
	
	protected void streamReport(HttpServletResponse response, byte[] data, String name) throws IOException {

		response.setContentType("application/pdf");
		// response.setHeader("Content-disposition", "attachment; filename=" + name);
		response.setHeader("Content-disposition", " filename=" + name);
		response.setContentLength(data.length);

		response.getOutputStream().write(data);
		response.getOutputStream().flush();
	}
	
	
	
	
	/*
	
	
	
	
	
	
	
	
	private Dimension format = PD4Constants.A4;
	private boolean landscapeValue = false;
	private int topValue = 8;
	private int leftValue = 0;
	private int rightValue = 0;
	private int bottomValue = 8;
	private String unitsValue = "m";
	private String proxyHost = "";
	private int proxyPort = 0;

	private int userSpaceWidth = 750;
	private static int BUFFER_SIZE = 1024;
	
	@RequestMapping(value = "/pdfLab", method = RequestMethod.GET)
	public void showPDF(HttpServletRequest request, HttpServletResponse response) {

		String url = request.getParameter("url");
		System.out.println("URL " + url);
		// http://monginis.ap-south-1.elasticbeanstalk.com
	    File f = new File(Constant.PDF_PATH);
		//File f = new File("/home/ats-11/pdf/ordermemo221.pdf");
		//File f = new File("/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf");

		System.out.println("I am here " + f.toString());
		try {
			 
			runConverter(Constant.ReportURL + url, f, request, response);
			System.out.println("Come on lets get ");
		} catch (IOException e) {
			// TODO Auto-generated catch block

			System.out.println("Pdf conversion exception " + e.getMessage());
		}

		// get absolute path of the application
		ServletContext context = request.getSession().getServletContext();
		String appPath = context.getRealPath("");
		String filename = "ordermemo221.pdf";
	//	 String filePath = "/opt/tomcat-latest/webapps/uploads/report.pdf";
		String filePath = Constant.PDF_PATH;
		//String filePath = "/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf";

		// construct the complete absolute path of the file
		String fullPath = appPath + filePath;
		File downloadFile = new File(filePath);
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// get MIME type of the file
			String mimeType = context.getMimeType(fullPath);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/pdf";
			}
			System.out.println("MIME type: " + mimeType);

			String headerKey = "Content-Disposition";

			// response.addHeader("Content-Disposition", "attachment;filename=report.pdf");
			response.setContentType("application/pdf");

			// get output stream of the response
			OutputStream outStream;

			outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;

			// write bytes read from the input stream into the output stream

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void runConverter(String urlstring, File output, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
	 
		if (urlstring.length() > 0) {
			if (!urlstring.startsWith("http://") && !urlstring.startsWith("file:")) {
				urlstring = "http://" + urlstring;
			}
			System.out.println("PDF URL " + urlstring);
			java.io.FileOutputStream fos = new java.io.FileOutputStream(output);

			PD4ML pd4ml = new PD4ML();

			try {

				PD4PageMark footer = new PD4PageMark();  
				footer.setPageNumberTemplate("page $[page] of $[total]");  
				footer.setTitleAlignment(PD4PageMark.LEFT_ALIGN);  
				footer.setPageNumberAlignment(PD4PageMark.RIGHT_ALIGN);  
				footer.setInitialPageNumber(1);  
				footer.setFontSize(8);  
				footer.setAreaHeight(15); 
			
				pd4ml.setPageFooter(footer);

			} catch (Exception e) {
				System.out.println("Pdf conversion method excep " + e.getMessage());
			}
			try {
				pd4ml.setPageSize(landscapeValue ? pd4ml.changePageOrientation(format) : format);
			} catch (Exception e) {
				System.out.println("Pdf conversion ethod excep " + e.getMessage());
			}

			if (unitsValue.equals("mm")) {
				pd4ml.setPageInsetsMM(new Insets(topValue, leftValue, bottomValue, rightValue));
			} else {
				pd4ml.setPageInsets(new Insets(topValue, leftValue, bottomValue, rightValue));
			}

			pd4ml.setHtmlWidth(userSpaceWidth);

			
			

			pd4ml.render(urlstring, fos); 

		}
	}*/
}
