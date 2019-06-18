package com.bionische.biocare.doctor.controller;

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
import com.bionische.biocare.doctor.model.DoctorBankAccountInfo;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.doctor.model.DoctorSuscriptionReceipt;
import com.bionische.biocare.doctor.model.GetDoctorConsultingReceipt;
import com.bionische.biocare.patient.model.Info;

@Scope("session")
@Controller
public class AccountingController {

	/*
	 * <pd4ml.version>1.0</pd4ml.version> <dependency> <groupId>org.pd4ml</groupId>
	 * <artifactId>pd4ml</artifactId> <version>${pd4ml.version}</version>
	 * </dependency>
	 * 
	 * <dependency> <groupId>org.pd4ml</groupId> <artifactId>ss_css2</artifactId>
	 * <version>${pd4ml.version}</version> </dependency>
	 */
	public final Log LOGGER = LogFactory.getLog(AccountingController.class);
	public DoctorBankAccountInfo doctorBankAccountInfo;
	public List<DoctorSuscriptionReceipt> doctorSuscriptionReceiptList;
	List<GetDoctorConsultingReceipt> getDoctorConsultingReceiptList;

	 @RequestMapping(value="/showDocBankDetails", method=RequestMethod.GET)

	 public ModelAndView showPharmaBankDetails(HttpServletRequest request,
	 		HttpServletResponse response)
	 {
	   
	 	ModelAndView model=new ModelAndView("doctor/bankDetails");
	 	
	 	HttpSession session = request.getSession();

		Info profileInfo = (Info) session.getAttribute("profilePassword");
		if(profileInfo==null) {
			model = new ModelAndView("profilePassword");
			model.addObject("redirectUrl","showDocBankDetails");
			
			return model;
		}
	 	try {
		 
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			doctorBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorBankDetails", map,
					DoctorBankAccountInfo.class);
			model.addObject("doctorBankAccountInfo", doctorBankAccountInfo);
			model.addObject("bankDetails","active");
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
		}

	 	return model;
	 	
	 }
	
	@RequestMapping(value = "/showAddEditDoctorBankDetails", method = RequestMethod.GET)
	public ModelAndView showAddEditDoctorBankDetails(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("doctor/addEditBankDetails");
		try {
			HttpSession session = request.getSession();
			Info profileInfo = (Info) session.getAttribute("profilePassword");
			if(profileInfo==null) {
				model = new ModelAndView("profilePassword");
				model.addObject("redirectUrl","showAddEditDoctorBankDetails");
				
				return model;
			}
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", "" + doctorDetails.getDoctorId());
			doctorBankAccountInfo = Constant.getRestTemplate().postForObject(Constant.url + "getDoctorBankDetails", map,
					DoctorBankAccountInfo.class);
			model.addObject("doctorBankAccountInfo", doctorBankAccountInfo);
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
		}

		return model;
	}

	@RequestMapping(value = "/submitDoctorBankDetails", method = RequestMethod.POST)
	public String submitDoctorBankDetails(HttpServletRequest request, Model model) {

		try {
			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			DoctorBankAccountInfo doctorBankAccountInfo = new DoctorBankAccountInfo();
			try {
				doctorBankAccountInfo.setId(Integer.parseInt(request.getParameter("id")));
			} catch (Exception e) {

			}
			doctorBankAccountInfo.setDoctorId(doctorDetails.getDoctorId());
			doctorBankAccountInfo.setAccHolderName(request.getParameter("accHolderName"));
			doctorBankAccountInfo.setAccountNo(request.getParameter("accountNo"));
			doctorBankAccountInfo.setBankBranch(request.getParameter("bankBranch"));
			doctorBankAccountInfo.setBankName(request.getParameter("bankName"));
			doctorBankAccountInfo.setDelStatus(0);
			doctorBankAccountInfo.setGstNo(request.getParameter("gstNo"));
			doctorBankAccountInfo.setIfscCode(request.getParameter("ifscCode"));
			doctorBankAccountInfo.setPanNo(request.getParameter("panNo"));

			DoctorBankAccountInfo doctorBankAccountInfoRes = Constant.getRestTemplate().postForObject(
					Constant.url + "insertDoctorBankDetails", doctorBankAccountInfo, DoctorBankAccountInfo.class);
			model.addAttribute("doctorBankAccountInfo", doctorBankAccountInfo);
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
		}

		return "redirect:/showDoctorHomePage";
	}

	@RequestMapping(value = "/getDoctorPaymentReceipt", method = RequestMethod.GET)
	public String getDoctorPaymentReceipt(HttpServletRequest request, Model model) {
		try {
			HttpSession session = request.getSession();
			DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
			DoctorBankAccountInfo doctorBankAccountInfo = new DoctorBankAccountInfo();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("doctorId", doctorDetails.getDoctorId());
			// doctorBankAccountInfoRes=Constant.getRestTemplate().postForObject(Constant.url
			// + "getDoctorSuscriptionReceipt", map, List.class);

			ParameterizedTypeReference<List<DoctorSuscriptionReceipt>> typeRef = new ParameterizedTypeReference<List<DoctorSuscriptionReceipt>>() {
			};
			ResponseEntity<List<DoctorSuscriptionReceipt>> responseEntity = Constant.getRestTemplate().exchange(
					Constant.url + "getDoctorSuscriptionReceipt", HttpMethod.POST,
					new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);

			doctorSuscriptionReceiptList = responseEntity.getBody();

			model.addAttribute("doctorSuscriptionReceiptList", doctorSuscriptionReceiptList);
		} catch (Exception e) {
			LOGGER.error("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
			throw new RuntimeException("Error while fecthing doctor Bank Details in showAddEditDoctorBankDetails", e);
		}
		return "doctor/paymentReceiptList";
		// return "redirect:/pdf?url=pdfDoctorSuscriptionReceipt";
	}

	@RequestMapping(value = "/pdfDoctorSuscriptionReceipt/{id}", method = RequestMethod.GET)
	public void pdfDoctorSuscriptionReceipt(@PathVariable("id") int id, HttpServletRequest request, Model model,
			HttpServletResponse response) {

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("suscriptionId", id);
		// ResponseEntity<ResponseEntity>=Constant.getRestTemplate().postForObject(Constant.url
		// + "doctorSubscriptionReceiptPdf", map, ResponseEntity<byte[]>.class);

		// This method will download file using RestTemplate
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_OCTET_STREAM));
			HttpEntity<MultiValueMap<String, Object>> request1 = new HttpEntity<MultiValueMap<String, Object>>(map,
					headers);

			ResponseEntity<byte[]> response1 = Constant.getRestTemplate()
					.exchange(Constant.url + "doctorSubscriptionReceiptPdf", HttpMethod.POST, request1, byte[].class);
			// Files.write(Paths.get("E:\\ss\\demo1.pdf"), response1.getBody());

			System.out.println("Success ");

			byte[] data = response1.getBody();

			streamReport(response, data, "Subscription.pdf");

		} catch (Exception e) {
			System.out.println("Error " + e.getMessage());
			e.printStackTrace();
		}

		// return "doctor/doctorSubscriptionReceipt";
	}

	/*@RequestMapping(value = "/showDoctorConsultingReceiptHistory", method = RequestMethod.GET)

	public String showDoctorConsultingReceiptHistory(HttpServletRequest request, Model model) {

		return "doctor/doctorConsultingBillHistory";
	}*/

	@RequestMapping(value = "/getDoctorConsultingReceiptHistory", method = RequestMethod.GET)

	public @ResponseBody List<GetDoctorConsultingReceipt> getDoctorConsultingReceiptHistory(HttpServletRequest request,
			Model model) {

		String fromDate = DateConverter.convertToYMD(request.getParameter("fromDate"));
		String toDate = DateConverter.convertToYMD(request.getParameter("toDate")) + " 23:59:59";

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		map.add("doctorId", doctorDetails.getDoctorId());
		map.add("fromDate", fromDate);
		map.add("toDate", toDate);
		try {

			ParameterizedTypeReference<List<GetDoctorConsultingReceipt>> typeRef = new ParameterizedTypeReference<List<GetDoctorConsultingReceipt>>() {
			};
			ResponseEntity<List<GetDoctorConsultingReceipt>> responseEntity = Constant.getRestTemplate().exchange(
					Constant.url + "getDoctorConsultingReceipt", HttpMethod.POST,
					new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
			getDoctorConsultingReceiptList = new ArrayList<GetDoctorConsultingReceipt>();
			getDoctorConsultingReceiptList = responseEntity.getBody();

			model.addAttribute("getDoctorConsultingReceiptList", getDoctorConsultingReceiptList);
			return getDoctorConsultingReceiptList;
		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return null;
	}

	@RequestMapping(value = "/pdfViewConsultinfReceipt/{receiptNo}", method = RequestMethod.GET)
	public void pdfViewConsultinfReceipt(@PathVariable("receiptNo") int receiptNo,HttpServletResponse response, HttpServletRequest request,
			Model model) {

		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("receiptNo", receiptNo);
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_OCTET_STREAM));
		HttpEntity<MultiValueMap<String, Object>> request1 = new HttpEntity<MultiValueMap<String, Object>>(map,
				headers);

		ResponseEntity<byte[]> response1 = Constant.getRestTemplate()
				.exchange(Constant.url + "doctorConsultingReceiptPdf", HttpMethod.POST, request1, byte[].class);
		// Files.write(Paths.get("E:\\ss\\demo1.pdf"), response1.getBody());

		System.out.println("Success ");

		byte[] data = response1.getBody();

		streamReport(response, data, "Subscription.pdf");
		}
catch (Exception e) {
	LOGGER.error("Error while fecthing doctor pdfViewConsultinfReceipt", e);
	throw new RuntimeException("Error while fecthing pdfViewConsultinfReceipt", e);
}
		//return "doctor/doctorConsultingReceipt";
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
	 * private Dimension format = PD4Constants.A4; private boolean landscapeValue =
	 * false; private int topValue = 8; private int leftValue = 0; private int
	 * rightValue = 0; private int bottomValue = 8; private String unitsValue = "m";
	 * private String proxyHost = ""; private int proxyPort = 0;
	 * 
	 * private int userSpaceWidth = 750; private static int BUFFER_SIZE = 1024;
	 * 
	 * @RequestMapping(value = "/pdf", method = RequestMethod.GET) public void
	 * showPDF(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * String url = request.getParameter("url"); System.out.println("URL " + url);
	 * // http://monginis.ap-south-1.elasticbeanstalk.com File f = new
	 * File(Constant.PDF_PATH); //File f = new
	 * File("/home/ats-11/pdf/ordermemo221.pdf"); //File f = new
	 * File("/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf");
	 * 
	 * System.out.println("I am here " + f.toString()); try {
	 * 
	 * runConverter(Constant.ReportURL + url, f, request, response);
	 * System.out.println("Come on lets get "); } catch (IOException e) { // TODO
	 * Auto-generated catch block
	 * 
	 * System.out.println("Pdf conversion exception " + e.getMessage()); }
	 * 
	 * // get absolute path of the application ServletContext context =
	 * request.getSession().getServletContext(); String appPath =
	 * context.getRealPath(""); String filename = "ordermemo221.pdf"; // String
	 * filePath = "/opt/tomcat-latest/webapps/uploads/report.pdf"; String filePath =
	 * Constant.PDF_PATH; //String filePath =
	 * "/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf";
	 * 
	 * // construct the complete absolute path of the file String fullPath = appPath
	 * + filePath; File downloadFile = new File(filePath); FileInputStream
	 * inputStream = null; try { inputStream = new FileInputStream(downloadFile); }
	 * catch (FileNotFoundException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } try { // get MIME type of the file String mimeType =
	 * context.getMimeType(fullPath); if (mimeType == null) { // set to binary type
	 * if MIME mapping not found mimeType = "application/pdf"; }
	 * System.out.println("MIME type: " + mimeType);
	 * 
	 * String headerKey = "Content-Disposition";
	 * 
	 * // response.addHeader("Content-Disposition",
	 * "attachment;filename=report.pdf");
	 * response.setContentType("application/pdf");
	 * 
	 * // get output stream of the response OutputStream outStream;
	 * 
	 * outStream = response.getOutputStream();
	 * 
	 * byte[] buffer = new byte[BUFFER_SIZE]; int bytesRead = -1;
	 * 
	 * // write bytes read from the input stream into the output stream
	 * 
	 * while ((bytesRead = inputStream.read(buffer)) != -1) {
	 * outStream.write(buffer, 0, bytesRead); }
	 * 
	 * inputStream.close(); outStream.close();
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } }
	 * 
	 * private void runConverter(String urlstring, File output, HttpServletRequest
	 * request, HttpServletResponse response) throws IOException {
	 * 
	 * if (urlstring.length() > 0) { if (!urlstring.startsWith("http://") &&
	 * !urlstring.startsWith("file:")) { urlstring = "http://" + urlstring; }
	 * System.out.println("PDF URL " + urlstring); java.io.FileOutputStream fos =
	 * new java.io.FileOutputStream(output);
	 * 
	 * PD4ML pd4ml = new PD4ML();
	 * 
	 * try {
	 * 
	 * PD4PageMark footer = new PD4PageMark();
	 * footer.setPageNumberTemplate("page $[page] of $[total]");
	 * footer.setTitleAlignment(PD4PageMark.LEFT_ALIGN);
	 * footer.setPageNumberAlignment(PD4PageMark.RIGHT_ALIGN);
	 * footer.setInitialPageNumber(1); footer.setFontSize(8);
	 * footer.setAreaHeight(15);
	 * 
	 * pd4ml.setPageFooter(footer);
	 * 
	 * } catch (Exception e) { System.out.println("Pdf conversion method excep " +
	 * e.getMessage()); } try { pd4ml.setPageSize(landscapeValue ?
	 * pd4ml.changePageOrientation(format) : format); } catch (Exception e) {
	 * System.out.println("Pdf conversion ethod excep " + e.getMessage()); }
	 * 
	 * if (unitsValue.equals("mm")) { pd4ml.setPageInsetsMM(new Insets(topValue,
	 * leftValue, bottomValue, rightValue)); } else { pd4ml.setPageInsets(new
	 * Insets(topValue, leftValue, bottomValue, rightValue)); }
	 * 
	 * pd4ml.setHtmlWidth(userSpaceWidth);
	 * 
	 * 
	 * 
	 * 
	 * pd4ml.render(urlstring, fos);
	 * 
	 * } }
	 */
}
