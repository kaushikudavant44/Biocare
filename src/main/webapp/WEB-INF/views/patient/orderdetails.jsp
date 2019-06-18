<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content=""> 
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/videoCall2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>

</head>

<body>
<c:url var="getPrescriptionByMeetingId" value="/getPrescriptionByMeetingId" />
<jsp:include page="../include/patientHeader.jsp"/> 

<div class="clearfix"></div>
<section class="doc_login" id="medicine">
 <div class="dashboard_nm text-center"><h4>Order Details </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active" id="details">
                <div class="row">
                				<div class="col-md-6 col-sm-6">
                				<ul class="shipping-date">
                					<li>Ordered on : ${getMedicalOrderDetails.orderDate}</li>
                					<li><a href="#" data-toggle="modal" data-target="#largeModal" onclick="showPrescription(${getMedicalOrderDetails.doctorName})"><span data-toggle="tooltip" data-placement="top" title="View Prescription" ><!-- Order No : 404-9365095-1337931 --></span></a></li>
                				</ul>
                				</div>
                				<!-- <div class="col-md-6 col-sm-6">
                				<div class="prient-btn">
                					<a href="#" onclick="printTable()">Printable Order Summary</a>
                				</div>
                				</div> -->
                			</div>
                	<div class="a-box ">
                			
                			<div class="a-box-inner">
                			<div class="row">
                			
                				<div class="col-md-8 col-sm-8">
                				<div class="col-md-6 col-sm-6">
                					<div class="shipping-details">
                						<h4>Shipping Address</h4>
										<p>${getMedicalOrderDetails.orderDate} <br>
										${getMedicalOrderDetails.address}
									    <br>${getMedicalOrderDetails.pincode}
										India</p>
                					</div>
                				</div>
                				
                				<div class="col-md-6 col-sm-6">
                				<%-- <div class="shipping-details">
                					<h4>Payment Method</h4>
                					<div class="payment-method">
                						<img src="${pageContext.request.contextPath}/resources/images/card1.jpg"><small>****1504</small>
                					</div>
									<!-- <p>Pay on Delivery (Cash/Card). Cash on delivery (COD) available. Card/Net banking acceptance subject to device availability.</p> -->
                				</div> --%>
                				</div>
                				</div>
                				<div class="col-md-4 col-sm-4">
                					<div class="table-responsive shipping-tbl">
                						<table width="100%" border="0">	
						<thead>
							<tr>
								<th colspan="2">Order Summary</th>
							</tr>							
						</thead>
						
                    <tbody>
                    <tr>
                         <td>Item(s) Subtotal:</td>
						 <td><span class="flaticon-rupee-indian"></span>${getMedicalOrderDetails.totalAmt}</td>		
						 
						</tr>
						 <tr>
                         <td>Shipping:</td>
						 <td><span class="flaticon-rupee-indian"></span>00.00</td>		
						 
						</tr>
						 <tr>
                         <td><strong>Total:</strong></td>
						 <td><span class="flaticon-rupee-indian"></span> <strong>${getMedicalOrderDetails.totalAmt}</strong></td>		
						 
						</tr>
						 
						 
					</tbody>
						</table>
						<form action="${pageContext.request.contextPath}/patientMedicinePaymentCheckout" method="post">
						<input type="hidden" value="${getMedicalOrderDetails.totalAmt}" name="totalAmt">
						<input type="hidden" value="${getMedicalOrderDetails.requestToMedicalId}" name="requestToMedicalId">
						<br>
						<c:if test="${getMedicalOrderDetails.status==1}">
						<input class="btn-fr-all" type="submit" value="Proceed">
						</c:if>
						
						</form>
                					</div>
                				</div>
                				
                				</div>
                			</div>
                		</div>
                
  				</div>
  </div>
  </div>
  </div>
  </div>
  </section>
  
  <!--priscription  -->
<div id="largeModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title"> Prescription </h4>
					</div>
					<div class="modal-body" id="displayTable">
					<div class="pat_name text-center">
	                			<div class="row">
	                				<div class="col-sm-10 modal-pric-details">
	                				<h5><strong>Doctor Name : </strong> <span id="docName"></span></h5>
	                				
	                				</div>
	                				<div class="col-sm-2 modal-down-icon">
	                					<!-- <a href="#"><span class="fa  fa-download"></span></a> -->
	                					<!-- <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a> -->
	                				</div> 
	                				
	                			</div>
	                		</div>
	                		<br>
 						 	 <div class="table-responsive">
        	<table width="100%" border="0" class="tbl table table-bordered table table-hover" id="prescTable">
   <tr align="center">
    <th>Sr.No</th>
    <th>Medicine</th>
    <th>Quantity</th>
    <th>Instructions</th>
    <th>Timing</th>
  </tr>

</table> 

        </div>

					</div>
					 
					
				</div> 
			</div>
</div>
<!--priscrption  -->
  
  <div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 


<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>  --%>
<script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
<script>
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	
	 jQuery('ul.nav li.dropdown').hover(function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
	}, function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
	});
</script>

<script>
function showPrescription(meetId,doctorName)
{	 
	 
	  document.getElementById("docName").innerHTML=doctorName;
	  $('#prescTable td').remove();
 
	
	 $
		.getJSON(
				'${getPrescriptionByMeetingId}',
				{
					meetId : meetId,
					
					ajax : 'true'
				},
				function(data) {
					
					$.each(
							data,
								function(key, display) {

					var tr = $('<tr></tr>');
					

					tr.append($('<td></td>').html(key+1));
					tr.append($('<td></td>').html(display.medicineName));
					tr.append($('<td></td>').html(display.medicineQuantity));
					tr.append($('<td></td>').html(display.medicineInstruction));
					tr.append($('<td></td>').html(display.medicineTiming));
					
				 	 $('#prescTable').append(tr);
							})

					

				}) 
      
	 
}
function printTable()
{
		    
	        var html="<html>";
	      
	        html+= document.getElementById("details").innerHTML;

	        html+="</html>";
	       

	        var printWin = window.open();
	        printWin.document.write(html);
	        printWin.document.close();
	        printWin.focus();
	        printWin.print();
	        printWin.close();
	    
}


</script>
</body>
</html>