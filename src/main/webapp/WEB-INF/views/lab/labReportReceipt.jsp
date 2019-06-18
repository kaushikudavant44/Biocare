<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
</head>
<body>
<%-- ${getLabReportReceipt.receiptNo}
${getLabReportReceipt.doctorName}
${getLabReportReceipt.createdDate}
${getLabReportReceipt.totAmount}
${getLabReportReceipt.txnId}
${getLabReportReceipt.date}
${getLabReportReceipt.paidAmt}
${getLabReportReceipt.commissionAmt}
${getLabReportReceipt.companyGstNo}
${getLabReportReceipt.gstNo}
${getLabReportReceipt.contactNo1}
${getLabReportReceipt.contactNo2}
${getLabReportReceipt.email}
${getLabReportReceipt.website}
${getLabReportReceipt.address}
${getLabReportReceipt.companyName} --%>


<div class="container">
    <div class="row">
    <div class="text-center">
                    <h1 style="text-align:center">Receipt</h1>
                </div>
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3" >
            <div class="row">
            
                <div class="col-xs-6 col-sm-6 col-md-6" style="width:30%; display:inline-block; float:left">
                    <address style="float:left; font-size:14px; line-height:22px;	">
                        <strong>Doctor Name :</strong> ${getLabReportReceipt.labName}
                        <br>
                        <strong>Receipt.GST No : </strong>${getLabReportReceipt.gstNo}
                        <br>
                        <strong>Address :</strong> ${getLabReportReceipt.address}
                        <br>
                       <strong>Email : </strong> ${getLabReportReceipt.email}
                        <br>
                        <strong>Website : </strong>${getLabReportReceipt.website}
                        <br>
                        <abbr title="Phone"><strong>Tel:</strong></abbr> ${getLabReportReceipt.contactNo1}
						<abbr title="Phone"><strong>Mob:</strong></abbr> ${getLabReportReceipt.contactNo2}
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right" style="width:70%; display:inline-block; float:right">
                <p style="float:right; font-size:14px; line-height:22px;">
                <em><strong>Receipt :</strong> ${getLabReportReceipt.receiptNo}</em>
						 <br>
                	<em><strong>Comapny Name :</strong> ${getLabReportReceipt.companyName}</em>
                      <em><strong>Company GST No :</strong>${getLabReportReceipt.companyGstNo}</em> 
                      <br> 
						 <em><strong>Date:</strong> ${getLabReportReceipt.createdDate}</em>
						 
						

                    </p>
                   
                    
                </div>
            </div>
             <div class="row">
                
                </span>
                <br>
                <table class="table table-hover" style="border:1px solid #000;">
                    <thead>
                        <tr style="background:#eee;">
 
                            <th style="width:20%; border-bottom:1px solid #000; font-size:13px; padding:10px; text-align: center">Date</th>
                            <th style="width:20%; border-left:1px solid #000; border-bottom:1px solid #000; font-size:13px; text-align: center">Txn ID</th>
                            
                            <th style="width:20%; border-left:1px solid #000; border-bottom:1px solid #000; font-size:13px; text-align: center">Total</th>
                            <th style="width:20%; border-left:1px solid #000; border-bottom:1px solid #000; font-size:13px; text-align: center">Commission Amount</th>
                            <th style="width:20%; border-left:1px solid #000; border-bottom:1px solid #000; font-size:13px; text-align: center">Paid Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                           
                            <td style="width:20%; text-align: center">${getLabReportReceipt.date}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getLabReportReceipt.txnId}</td>
                            
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getLabReportReceipt.totAmount}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getLabReportReceipt.commissionAmt}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getLabReportReceipt.paidAmt}</td>
                            
                            
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