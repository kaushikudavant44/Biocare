<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<style>
	body { padding:20px; margin-top:0px; border:10px solid #eee; }
</style>
</head>
<body>
 
 
 
 
 <%-- ${labSuscriptionReceipt.amount}
 
	${labSuscriptionReceipt.createdDate}
	 
	${labSuscriptionReceipt.txnId}
	 
	${labSuscriptionReceipt.packageAmt}
	 
	${labSuscriptionReceipt.companyGstNo}
	 
	${labSuscriptionReceipt.gstNo} 
	
	${labSuscriptionReceipt.contactNo1}
	 
	${labSuscriptionReceipt.contactNo2}
	 
	${labSuscriptionReceipt.email}
	 
	${labSuscriptionReceipt.website}
	 
	${labSuscriptionReceipt.address}
	  
	${labSuscriptionReceipt.companyName} --%>
	
	
	<div class="container">
	<div class="row">
    			<div class="receipt-header">
					<div class="col-xs-6 col-sm-6 col-md-6" style="float:left; width:50%">
						<div class="receipt-left" >
							<div><img src="${pageContext.request.contextPath}/resources/images/logo.jpg" style="width:100%;"></div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6" style="float:right; width:45%">
						<div class="receipt-right">
							<p style="float:right; font-size:14px; line-height:22px;">
                <em><strong>Receipt :</strong>${getDoctorConsultingReceipt.receiptNo}</em>
						 <br>
                	<em><strong>Comapny Name :</strong>  ${labSuscriptionReceipt.companyName}</em>
                      <em><strong>Company GST No :</strong>${labSuscriptionReceipt.companyGstNo}</em> 
                      </p>
						</div>
					</div>
				</div>
            </div>
            
    <div class="row">
    
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3" >
            <div class="row">
            
                <div class="col-xs-6 col-sm-6 col-md-6" style="width:70%; display:inline-block; float:left">
                    <address style="float:left; font-size:14px; line-height:22px;	">
                       <%--  <strong>Doctor Name :</strong> ${getDoctorConsultingReceipt.doctorName}+ --%>
                        <br>
                        <strong>Receipt.GST No : </strong>${labSuscriptionReceipt.gstNo}  
                        <br>
                        <strong>Address :</strong> ${labSuscriptionReceipt.address}
                        <br>
                       <strong>Email : </strong> ${labSuscriptionReceipt.email}
                        <br>
                        <strong>Website : </strong>${labSuscriptionReceipt.website}
                        <br>
                        <abbr title="Phone"><strong>Tel:</strong></abbr> ${labSuscriptionReceipt.contactNo1} <strong>/ </strong>  ${labSuscriptionReceipt.contactNo2}
						<br>
                    </address>
                </div>
               <div class="col-xs-6 col-sm-6 col-md-6 text-right" style="width:20%; display:inline-block; float:right">
                 <div class="text-center">
                    <h1 style="text-align:center; margin-top:50px; text-transform: uppercase; font-weight:600">Receipt</h1>
                </div>
                <%-- <p style="float:right; font-size:14px; line-height:22px;">
                <em><strong>Receipt :</strong> ${getDoctorConsultingReceipt.receiptNo}</em>
						 <br>
                	<em><strong>Comapny Name :</strong>  ${labSuscriptionReceipt.companyName}</em>
                      <em><strong>Company GST No :</strong>${labSuscriptionReceipt.companyGstNo}</em> 
                      <br> 
						 <em><strong>Date:</strong> ${labSuscriptionReceipt.createdDate}</em>

                    </p> --%>
                   
                    
                </div>
            </div>
             <div class="row">
                
                </span>
                <br>
                <table class="table table-hover" style="border:1px solid #000; width:100%;">
                    <thead>
                        <tr style="background:#eee;">
 							 <th style="width:20%; border-bottom:1px solid #000; font-size:13px; padding:10px; text-align: center">Txn ID</th>
                            <th style="width:20%; border-bottom:1px solid #000; font-size:13px; padding:10px; text-align: center">Suscription Amount</th>
                            
                            <th style="width:20%; border-left:1px solid #000; border-bottom:1px solid #000; font-size:13px; text-align: center">PackageAmt</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                           <td style="width:20%; text-align: center">${labSuscriptionReceipt.txnId}</td>     
                            <td style="width:20%; text-align: center"> ${labSuscriptionReceipt.amount}</td>                            
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${labSuscriptionReceipt.packageAmt}</td>
  
                        </tr>

                    </tbody>
                </table>
               </td>
               <p style="float:left; width:45%; text-align:left; margin-top:10px; "><em><strong>Date:</strong> ${labSuscriptionReceipt.createdDate}</em> </p>
               <p style="float:right; width:45%; text-align:right; font-size:24px"><strong><em>Thank you!</em></strong></p>
               <div class="clearfix"></div>
            </div> 
        </div>
    </div>
    </div>
 
   
</body>
</html>