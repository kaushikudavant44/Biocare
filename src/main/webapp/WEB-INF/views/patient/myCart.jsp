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
<c:url var="deleteCartItem" value="/deleteCartItem" />
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login" id="medicine">
 <div class="dashboard_nm text-center"><h4>My Cart </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
                	<div class="row">
                	<c:choose>
                              <c:when test="${empty getCartProductDetails}">
                              
						<div class="notFound">												
					     <img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">																		
			         	 <p>Result Not Found</p>																		
			            </div>	
			            			
				</c:when>		
                 <c:otherwise>
                	<form action="${pageContext.request.contextPath}/showDeliverAddress" method="GET" id="showReviewOrder">
                	<c:forEach items="${getCartProductDetails}" var="getCartProductDetails">
                		<div class="col-lg-6 col-md-12 col-sm-12">
                			<div class="itemDetails">
                			<div class="col-lg-3 col-md-2 col-sm-2 col-xs-3">
                			<div class="imageContainer text-center"><img src="${pageContext.request.contextPath}/resources/images/medicine.png" class="img-responsive img-center" alt="medicine"></div>
                			</div>
                			<div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" >
                				<div class="mycard-details">
                				
                					<h5><i class="icon-doctor" aria-hidden="true"></i> <strong>&nbsp;Doctor Name </strong>&nbsp; ${getCartProductDetails.doctorName}</h5>
                					<h5><i class="icon-doctor-1" aria-hidden="true"></i> <strong>&nbsp; Patient Name</strong>&nbsp; ${getCartProductDetails.patientName}</h5>
                					<small><i class="icon-calendar-page" aria-hidden="true"></i> &nbsp; ${getCartProductDetails.cartDate}</small>
                					<a href="#" data-toggle="modal" data-target="#largeModal" onclick="showPrescription(${getCartProductDetails.meetId})"> <i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility" aria-hidden="true"></i>&nbsp; View Prescription</a>
                					
                					
                				
                				<div class="clearfix"></div>
                				
                				</div>
                			</div>
                			
                			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-1">
                			<div class="delete-icon"><span class="icon-rubbish-bin" onclick="deleteCartItem(${getCartProductDetails.cartId})"></span></div>
                			<div class="send-card"><input type="checkbox" name="orderReview" value="${getCartProductDetails.cartId}"> </div>
                			</div>
                				
                			</div>
                		</div>
                		   </c:forEach>             		
                		<div class="col-md-12 col-sm-12">
                			
                		<div class="pull-right all-send">
                		
                		<input class="btn-fr-all" type="button" value="Place Order" onclick="reviewOrder()">
                		</div>
                		</div>
                		</form>
                		</c:otherwise> 
                		</c:choose>
                	</div>
                	
                	
                	
                </div>
</div>
</div>
</div>
 </div>
</section>


<div id="largeModal" class="modal fade bs-example-modal-lg reportsDesign"
			tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
					<div class="modal-body card_sec" id="displayTable">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
							<a onclick="printTable()"><span class="icon-printer down-icon-modal"></span></a>
							<hr>
							<h4 class="modal-title">Hospital Name <br> <span>Dr. Kaushik Udavant</span></h4>
							<hr>
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
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
        <hr>
        <div class="signB">
						Signature: <img src="${pageContext.request.contextPath}/resources/images/sign.png" class="img-responsive img-center">
					</div>

					</div>
					 
					
				</div>
			</div>
		</div>


<jsp:include page="../include/footer.jsp"/> 

		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
 
 <script>
 
 function deleteCartItem(cartId)
 {
	  if(confirm("Delete Item?"))
	  {
	 	 $
			.getJSON(
					'${deleteCartItem}',
					{
						cartId : cartId,
						ajax : 'true'
					},
					function(data) {
						
						if(data.message=="success")
							{
							location.reload();
							}
						else
							{
							alert("failed to delete");
							}
					})
	  }
 }					
 
 function showPrescription(meetId)
 {	 
 	 
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
 
 function reviewOrder()
 {
	 /* var items = $("input:radio[name=orderReview]:checked").val();
	 alert(items); */
	 if($("input[type='checkbox'][name='orderReview']:checked").length)
		 {
	 
	 $('#showReviewOrder').submit();
		 }
	 else
		 {
		 alert("Please select Prescription");
		 }

	 
 }
 
 </script>               

</body>
</html>