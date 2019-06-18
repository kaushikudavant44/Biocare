package com.bionische.biocare.patient.controller;

import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.PaytmConstant;
import com.paytm.pg.merchant.CheckSumServiceHelper;
@Scope("session")
@Controller
public class PaymentGayewayController {

	@RequestMapping(value="/showMerchantCheckoutPage", method=RequestMethod.GET)
	
	public ModelAndView showMerchantCheckoutPage(HttpServletRequest request,
			HttpServletResponse response)
	{
	  
		ModelAndView model=new ModelAndView("paymentgateway/merchantCheckoutPage");
		
		
		return model;
		
	}
	
@RequestMapping(value="/showPageRedirect", method=RequestMethod.POST)
	
	public ModelAndView showPageRedirect(HttpServletRequest request,
			HttpServletResponse response)
	{
	  
		ModelAndView model=new ModelAndView("paymentgateway/pgRedirect");
		Enumeration<String> paramNames = request.getParameterNames();
		Map<String, String[]> mapData = request.getParameterMap();
		TreeMap<String,String> parameters = new TreeMap<String,String>();
		String paytmChecksum =  "";
		while(paramNames.hasMoreElements()) {
			String paramName = (String)paramNames.nextElement();
			parameters.put(paramName,mapData.get(paramName)[0]);	
		}
		parameters.put("MID",PaytmConstant.MID);
		parameters.put("CHANNEL_ID",PaytmConstant.CHANNEL_ID);
		parameters.put("INDUSTRY_TYPE_ID",PaytmConstant.INDUSTRY_TYPE_ID);
		parameters.put("WEBSITE",PaytmConstant.WEBSITE);
		parameters.put("MOBILE_NO","9823875548");
		parameters.put("EMAIL","kaushikudavant44@gmail.com");
		parameters.put("CALLBACK_URL", "http://localhost:8080/paytm_java/pgResponse.jsp");
		String checkSum = null;
		try {
			checkSum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(PaytmConstant.MERCHANT_KEY, parameters);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		StringBuilder outputHtml = new StringBuilder();
		outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
		outputHtml.append("<html>");
		outputHtml.append("<head>");
		outputHtml.append("<title>Merchant Check Out Page</title>");
		outputHtml.append("</head>");
		outputHtml.append("<body>");
		outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
		outputHtml.append("<form method='post' action='"+ PaytmConstant.PAYTM_URL +"' name='f1'>");
		outputHtml.append("<table border='1'>");
		outputHtml.append("<tbody>");
		for(Map.Entry<String,String> entry : parameters.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			outputHtml.append("<input type='hidden' name='"+key+"' value='" +value+"'>");	
		}	  
			  
		outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='"+checkSum+"'>");
		outputHtml.append("</tbody>");
		outputHtml.append("</table>");
		outputHtml.append("<script type='text/javascript'>");
		outputHtml.append("document.f1.submit();");
		outputHtml.append("</script>");
		outputHtml.append("</form>");
		outputHtml.append("</body>");
		outputHtml.append("</html>");
		//out.println(outputHtml);
	
	
		
		return model;
		
	}
	
@RequestMapping(value="/showPageResponse", method=RequestMethod.GET)

public ModelAndView showPageResponse(HttpServletRequest request,
		HttpServletResponse response)
{
  
	ModelAndView model=new ModelAndView("paymentgateway/pgResponse");
	Enumeration<String> paramNames = request.getParameterNames();
	Map<String, String[]> mapData = request.getParameterMap();
	TreeMap<String,String> parameters = new TreeMap<String,String>();
	String paytmChecksum =  "";
	while(paramNames.hasMoreElements()) {
		String paramName = (String)paramNames.nextElement();
		if(paramName.equals("CHECKSUMHASH")){
			paytmChecksum = mapData.get(paramName)[0];
		}else{
			parameters.put(paramName,mapData.get(paramName)[0]);
		}
	}
	boolean isValideChecksum = false;
	String outputHTML="";
	try{
		isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstant.MERCHANT_KEY,parameters,paytmChecksum);
		if(isValideChecksum && parameters.containsKey("RESPCODE")){
			if(parameters.get("RESPCODE").equals("01")){
				outputHTML = parameters.toString();
			}else{
				outputHTML="<b>Payment Failed.</b>";
			}
		}else{
			outputHTML="<b>Checksum mismatched.</b>";
		}
	}catch(Exception e){
		outputHTML=e.toString();
	}
	model.addObject("outputHTML",outputHTML);
	return model;
	
}




	
}
