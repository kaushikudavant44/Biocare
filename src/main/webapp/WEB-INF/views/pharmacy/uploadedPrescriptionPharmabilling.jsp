<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Invoice</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billing.css">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script> 
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
		                            ${getMedicalOrderDetails.medicalName}
		                            </a>
		                        </h2>
		                        <div>${getMedicalOrderDetails.address}</div>
		                        <div>${getMedicalOrderDetails.contact}</div>
		                        <div>${getMedicalOrderDetails.email}</div>
		                    </div>
		                </div>
		            </header>
		            <main>
		                <div class="row contacts">
		                    <div class="col invoice-to">
		                        <div class="text-gray-light">INVOICE TO:</div>
		                         <h2 class="to">${getMedicalOrderDetails.patientName}</h2>
		                       <!--  <div class="email"><a >ganesh@example.com</a></div> -->
		                    </div>
		                    <div class="col invoice-details">
		                        <h1 class="invoice-id">INVOICE ${getMedicalOrderDetails.requestToMedicalId}</h1>
		                        <div class="date">Date of Invoice: ${getMedicalOrderDetails.paymentDate}</div>
		                    </div>
		                </div>
		             
		                <div class="modal-body carousel1" id="displayTable">
					<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
						  <div class="carousel-inner" role="listbox">
						    
						 
						   	 <div id="prescriptionImage">
     				<!--   <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-1.jpg" data-lightbox="example-1"><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-1.jpg" alt="image-1" /></a>
    			     <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-2.jpg" data-lightbox="example-2" data-title="Optional caption."><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-2.jpg" alt="image-1"/></a> -->
    			   <c:forEach items="${prescriptions}" var="prescriptions">
    			   
    			     <a class="example-image-link" href="${prescriptions}" data-lightbox="example-1"><p class="text-center"><img class="example-image invoiceimg" src="${prescriptions}" alt="image-1" /></p></a>
    			   </c:forEach>
   						  
   						  </div>
						  </div>
  						  
  					</div>
					<div class="pat_name text-center">
	                			<%-- <img src="http://104.238.116.176:8080/images/patient/${patientDetailList.patientId}/prescription/${patientDetailList.prescriptionName}" class="img-responsive prescrptimg" alt="prescription"> --%>
	                		</div>
	                		<hr>
	                		<p class="text-center"><label>Total Amount</label>
						<input type="text" name="totAmount"  id="totAmount"  value="${getMedicalOrderDetails.totalAmt}" class="prescAmt" readonly></p>
					</div>
					
		                
		                <div class="clearfix"></div>
		                <div class="thanks text-center"><strong>Thank you!</strong></div>
										
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
