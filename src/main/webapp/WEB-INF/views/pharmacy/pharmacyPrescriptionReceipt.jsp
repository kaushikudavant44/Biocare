<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<style>
	body { padding:20px; margin-top:0px; border:10px solid #eee; }
</style>
</head>
<body>
<%-- ${getPharmacyPrescriptionReceipt.receiptNo}
${getPharmacyPrescriptionReceipt.doctorName}
${getPharmacyPrescriptionReceipt.createdDate}
${getPharmacyPrescriptionReceipt.totAmount}
${getPharmacyPrescriptionReceipt.txnId}
${getPharmacyPrescriptionReceipt.date}
${getPharmacyPrescriptionReceipt.paidAmt}
${getPharmacyPrescriptionReceipt.commissionAmt}
${getPharmacyPrescriptionReceipt.companyGstNo}
${getPharmacyPrescriptionReceipt.gstNo}
${getPharmacyPrescriptionReceipt.contactNo1}
${getPharmacyPrescriptionReceipt.contactNo2}
${getPharmacyPrescriptionReceipt.email}
${getPharmacyPrescriptionReceipt.website}
${getPharmacyPrescriptionReceipt.address}
${getPharmacyPrescriptionReceipt.companyName} --%>


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
                <em><strong>Receipt :</strong>${getPharmacyPrescriptionReceipt.receiptNo}</em>
						 <br>
                	<em><strong>Comapny Name :</strong>${getPharmacyPrescriptionReceipt.companyName}</em>
                      <em><strong>Company GST No :</strong>${getPharmacyPrescriptionReceipt.companyGstNo}</em> 
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
                        <strong>Doctor Name :</strong> ${getPharmacyPrescriptionReceipt.medicalName}
                        <br>
                        <strong>Receipt.GST No : </strong>${getPharmacyPrescriptionReceipt.gstNo}
                        <br>
                        <strong>Address :</strong> ${getPharmacyPrescriptionReceipt.address}
                        <br>
                       <strong>Email : </strong> ${getPharmacyPrescriptionReceipt.email}
                        <br>
                        <strong>Website : </strong>${getPharmacyPrescriptionReceipt.website}
                        <br>
                    <abbr title="Phone"><strong>Tel:</strong></abbr> ${getPharmacyPrescriptionReceipt.contactNo1} <strong> / </strong> ${getPharmacyPrescriptionReceipt.contactNo2}
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right" style="width:20%; display:inline-block; float:right">
                <div class="text-center">
                    <h1 style="text-align:center; margin-top:50px; text-transform: uppercase; font-weight:600">Receipt</h1>
                </div>
                <%-- <p style="float:right; font-size:14px; line-height:22px;">
                <em><strong>Receipt :</strong> ${getPharmacyPrescriptionReceipt.receiptNo}</em>
						 <br>
                	<em><strong>Comapny Name :</strong> ${getPharmacyPrescriptionReceipt.companyName}</em>
                      <em><strong>Company GST No :</strong>${getPharmacyPrescriptionReceipt.companyGstNo}</em> 
                      <br> 
						 <em><strong>Date:</strong> ${getPharmacyPrescriptionReceipt.createdDate}</em>
						 
						

                    </p> --%>
                   
                    
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
                           
                            <td style="width:20%; text-align: center">${getPharmacyPrescriptionReceipt.date}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getPharmacyPrescriptionReceipt.txnId}</td>
                            
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getPharmacyPrescriptionReceipt.totAmount}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getPharmacyPrescriptionReceipt.commissionAmt}</td>
                            <td style="width:20%; border-left:1px solid #000; text-align: center">${getPharmacyPrescriptionReceipt.paidAmt}</td>
                            
                            
                        </tr>

                    </tbody>
                </table>
               </td>
                <p style="float:left; width:45%; text-align:left; margin-top:10px; "><em><strong>Date:</strong>${getPharmacyPrescriptionReceipt.createdDate}</em> </p>
               <p style="float:right; width:45%; text-align:right; font-size:24px"><strong><em>Thank you!</em></strong></p>
               <div class="clearfix"></div>
            </div> 
        </div>
    </div>
    </div>
 
</body>
</html>