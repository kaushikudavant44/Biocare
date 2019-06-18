<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
</head>
<body>
 
 
 
 
<%--  ${doctorSuscriptionReceipt.amount} --%>
  
	 
	<%-- ${doctorSuscriptionReceipt.createdDate}
	 
	${doctorSuscriptionReceipt.txnId} --%>
	 
	<%-- ${doctorSuscriptionReceipt.packageAmt} --%>
	 
<%-- 	${doctorSuscriptionReceipt.companyGstNo}
	 
	${doctorSuscriptionReceipt.gstNo} 
	
	${doctorSuscriptionReceipt.contactNo1}
	 
	${doctorSuscriptionReceipt.contactNo2}
	 
	${doctorSuscriptionReceipt.email}
	 
	${doctorSuscriptionReceipt.website}
	 
	${doctorSuscriptionReceipt.address}
	  
	${doctorSuscriptionReceipt.companyName} --%>
	
	
	
	
	<div class="container">
    <div class="row">
    <div class="text-center">
                    <h1 style="text-align:center">Receipt</h1>
                </div>
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3" >
            <div class="row">
            
                <div class="col-xs-6 col-sm-6 col-md-6" style="width:30%; display:inline-block; float:left">
                    <address style="float:left; font-size:14px; line-height:22px;	">
                       <%--  <strong>Doctor Name :</strong> ${getDoctorConsultingReceipt.doctorName}+ --%>
                        <br>
                        <strong>Receipt.GST No : </strong>${doctorSuscriptionReceipt.gstNo} 
                        <br>
                        <strong>Address :</strong> ${doctorSuscriptionReceipt.address}
                        <br>
                       <strong>Email : </strong> ${doctorSuscriptionReceipt.email}
                        <br>
                        <strong>Website : </strong>${doctorSuscriptionReceipt.website}
                        <br>
                        <abbr title="Phone"><strong>Tel:</strong></abbr> ${doctorSuscriptionReceipt.contactNo1}
						<abbr title="Phone"><strong>Mob:</strong></abbr> ${doctorSuscriptionReceipt.contactNo2}
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right" style="width:70%; display:inline-block; float:right">
                <p style="float:right; font-size:14px; line-height:22px;">
                <em><strong>Receipt :</strong> ${getDoctorConsultingReceipt.receiptNo}</em>
						 <br>
                	<em><strong>Comapny Name :</strong>  ${doctorSuscriptionReceipt.companyName}</em>
                      <em><strong>Company GST No :</strong>${doctorSuscriptionReceipt.companyGstNo}</em> 
                      <br> 
						 <em><strong>Date:</strong> ${doctorSuscriptionReceipt.createdDate}</em>
						 
						

                    </p>
                   
                    
                </div>
            </div>
             <div class="row">
                
                </span>
                <br>
                <table class="table table-hover" style="border:1px solid #000; width:100%;">
                    <thead>
                        <tr style="background:#eee;">
 
                            <th style="width:20%; border-bottom:1px solid #000; font-size:13px; padding:10px; text-align: center">Suscription Amount</th>
                            <th style="width:20%; border-left:1px solid #000; border-bottom:1px solid #000; font-size:13px; text-align: center">PackageAmt</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                           
                            <td style="width:20%; text-align: center"> ${doctorSuscriptionReceipt.amount}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${doctorSuscriptionReceipt.packageAmt}</td>
                            
                            
                        </tr>
                       
                        
                        
                        
                    </tbody>
                </table>
               </td>
            </div> 
        </div>
    </div>
    </div>
	
 
   
</body>
</html>