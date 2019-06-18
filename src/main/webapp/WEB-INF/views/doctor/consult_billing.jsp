<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
		<head>
		<meta charset="utf-8">
		<title>Invoice</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billing.css">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>

		<div id="invoice">
<!--
		    <div class="toolbar hidden-print">
		        <div class="text-right">
		            <button id="printInvoice" class="btn btn-info"><i class="fa fa-print"></i> Print</button>
		            <button class="btn btn-info"><i class="fa fa-file-pdf-o"></i> Export as PDF</button>
		        </div>
		        <hr>
		    </div> -->


		    <div class="invoice overflow-auto">
		        <div style="min-width: 600px">
		            <header>
		                <div class="row">
		                    <div class="col">
		                        <a target="_blank" >
		                           <img src="${pageContext.request.contextPath}/resources/images/logo.png" data-holder-rendered="true" />
		                            </a>
		                    </div>
		                    <div class="col company-details">
		                        <h2 class="name">
		                            <a target="_blank">
		                            ${consultingDetails.hospitalName}
		                            
		                            </a>
		                        </h2>
		                        <div>${consultingDetails.doctorName}</div>
		                        <div>${consultingDetails.address}</div>
		                        <div>${consultingDetails.contactNo}</div>
		                        <div>${consultingDetails.emailId}</div>
		                    </div>
		                </div>
		            </header>
		            <main>
		                <div class="row contacts">
		                    <div class="col invoice-to">
		                        <div class="text-gray-light">INVOICE TO:</div>
		                        <h2 class="to"> ${consultingDetails.patientName}</h2>
		                   <div class="email"><a >${consultingDetails.email}</a></div> 
		                    </div>
		                    <div class="col invoice-details">
		                        <h1 class="invoice-id">INVOICE ${consultingDetails.meetId}</h1>
		                        <div class="date">Date of Invoice: ${appointmentDetails.date}</div>
		                    </div>
		                </div>
		                <table border="0" cellspacing="0" cellpadding="0">
		                    <thead>
		                        <tr>
		                            <th >SR.NO.</th>		                        
		                            <th class="text-right">Consulting Fees</th>
		                            <th class="right">TOTAL</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td class="center">1</td>
		                            
		                            <td class="unit">${appointmentDetails.amount}</td>

		                            <td class="total">${appointmentDetails.amount}</td>
		                        </tr>
		                      
		                    </tbody>
		                    <tfoot>
		                        <tr>
		                            <td colspan="2"></td>
		                            <td colspan="2">SUBTOTAL</td>
		                            <td>Rs. ${appointmentDetails.amount}</td>
		                        </tr>
		                       <!--  <tr>
		                            <td colspan="2"></td>
		                            <td colspan="2">TAX 25%</td>
		                            <td>Rs. 1,300.00</td>
		                        </tr> -->
		                        <tr>
		                            <td colspan="2"></td>
		                            <td colspan="2">GRAND TOTAL</td>
		                            <td>Rs. ${appointmentDetails.amount}</td>
		                        </tr>
		                    </tfoot>
		                </table>
		                <div class="thanks">Thank you!</div>
										<br>
		                <!-- <div class="notices">
		                    <div>NOTICE:</div>
		                    <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
		                </div> -->
		            </main>
		            <footer>
		                Invoice was created on a computer and is valid without the signature and seal.
		            </footer>
		        </div>
		        <div></div>
		    </div>
		</div>

		</body>
</html>
