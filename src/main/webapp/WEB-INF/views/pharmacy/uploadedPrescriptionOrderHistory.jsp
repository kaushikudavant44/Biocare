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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">


</head>         
<body>
<jsp:include page="../include/pharmacyHeader.jsp"/> 


 
		<c:url var="getPrescriptionDetailsForOrder" value="/getPrescriptionDetailsForOrder" />

  
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="dashboard_nm text-center"><h4> History</h4></div>
<div class="container-fluid"> 
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/pharmacyLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	               <div class="bhoechie-tab-content active">
	                 <div class="filter_div labhistory ">
	                 <div class="col-md-12 col-sm-12">
	                <h3>View Orders History</h3>
	                </div>
		                	<form action="${pageContext.request.contextPath}/showPharmacyOrderHistory" method="GET">
			                <div class="col-sm-5">
			                <label>From Date</label>
			                	<input type="text" name="fromDate" id="startdate" placeholder="from Date" readonly class="datepicker" value="${fromDate}">
			                </div>
			                 <div class="col-sm-5">
			                 <label>To Date</label>
			                	<input type="text" name="toDate" id="enddate" placeholder="to Date" readonly class="datepicker" value="${toDate}">
			                </div>
			                			                 
			                 <div class="col-sm-2">
			                	<input type="submit" class="btn-fr-all" value="search">
			                </div>
			                </form>
	                </div>
	                <div class="clearfix"></div>
	                <hr>
	                  
       			        <div class="loader2"> </div>  
	                 
	                <div class="clearfix" ></div>
	                <c:forEach items="${getMedicalOrderDetailsList}" var="getMedicalOrderDetails"
									varStatus="count">
	                		<div class="pharmacy_ord" >
	                		 
	                		<div id="pharmacy_ord">
	                		
	                		
	                			<div class="pat_name">
	                			<p class="text-center pat_detl">Patient Details</p>
	                			<h3>patient Name : <span>${getMedicalOrderDetails.patientName}</span></h3>
	                			<h3><strong>Address</strong> : <span>${getMedicalOrderDetails.address}</span></h3>
	                			<h3><strong>Contact :</strong><span>  ${getMedicalOrderDetails.patientContact}</span></h3>
	                			<h3><strong>Total Bill :</strong> <span>${getMedicalOrderDetails.totalAmt}/-</span></h3>
	                			<h3><a href="#" data-toggle="modal" data-target="#largeModal" onclick="getPrescriptionDetails(${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.doctorName}','${getMedicalOrderDetails.doctorContact}','${getMedicalOrderDetails.totalAmt}')"><span class="scheduleInfo">
	                			<img class="rx_image" src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg" width="24" height:24px alt="Rx_image"></span>View Prescription</a></h3>
								<h3>
								<a href="${pageContext.request.contextPath}/showMedicineBillToPharmacy/${getMedicalOrderDetails.requestToMedicalId}">	<span class="icon-prescription-1" 												
													 class="icon-prescription-1" data-placement="bottom" data-original-title="Medicine Invoice">	</span>View Invoice</a>
								
								</h3>	
											  
								<h4 class="text-right">Order Id :<strong>${getMedicalOrderDetails.requestToMedicalId}</strong> </h4>			 
								<c:choose>
                                <c:when test="${getMedicalOrderDetails.deliveryType==0}">
                                 <h4 class="text-right">Delivery Status :<strong> Home Delivery</strong> </h4>
                                </c:when>
                                <c:otherwise>
                                <h4 class="text-right">Delivery Status :<strong> Collect from Store </strong></h4>
                                </c:otherwise>
                                </c:choose>
                                
                                <c:choose>
                                 <c:when test="${getMedicalOrderDetails.paymentStatus==0}">
                                 <h4 class="text-right"><strong>Payment Failed</strong></h4>
 								</c:when>
								<c:otherwise>
								<h4 class="text-right"><strong>Payment successful</strong></h4>
								 
								</c:otherwise>
                                 </c:choose>
                                 
											 <%-- <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" class="btn-fr-all" value="send" onclick="paidStatus(${completedPrescription.patientRequestToMedicalId})">yes</h4> --%>
											
 											 <%-- <h4 class="text-right"><strong> Delivered?:</strong> <input type="radio" onclick="deliverdStatus(${completedPrescription.patientRequestToMedicalId})" class="btn-fr-all" value="send" >yes</h4> --%>
											<h4 class="text-right"><strong>Delivered successful</strong></h4>
								
	                			<h4 class="text-right">
	                			
	                				
	                			<strong>Date :</strong>${getMedicalOrderDetails.orderDate}</h4>
	                			</div>
	                			
	                			</div>
	                			</div>
	                			
	                			</c:forEach>
	                			
	                			<div class="clearfix"></div>
	                			<div class="order-gp"></div>
	                			
	                	 </div>
	                		</div> 
	                		
	                		
	                		
                    </div>
            </div>
               
            </div>
             </div>
         </div> 
</section>

<div id="largeModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
				<form action="${pageContext.request.contextPath}/confirmUploadedPrescriptionMedicalOrder" method="POST" onsubmit="return confirm('Are you sure submit order?')">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title"> Prescription </h4>
					</div>
					<div class="modal-body carousel1" id="displayTable">
					<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
						  <div class="carousel-inner" role="listbox">
						     <%--<div class="item active"><iframe src="https://www.youtube-nocookie.com/embed/Bi8ikmo1pMI?rel=0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
						     </div>--%>
						   <!--  <div class="item active" id="prescriptionImage"><img class="first-slide" id="prescriptionImage" src="https://bionische.com/biocare/resources/images/logo.png" alt="prescription"></div> --> 
						   	 <div id="prescriptionImage">
     				<!--  <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-1.jpg" data-lightbox="example-1"><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-1.jpg" alt="image-1" /></a>
    			     <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-2.jpg" data-lightbox="example-2" data-title="Optional caption."><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-2.jpg" alt="image-1"/></a> -->
   							 </div>
						  </div>
  					<!-- 	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> --> 
  					</div>
					<div class="pat_name text-center">
	                			<%-- <img src="http://104.238.116.176:8080/images/patient/${patientDetailList.patientId}/prescription/${patientDetailList.prescriptionName}" class="img-responsive prescrptimg" alt="prescription"> --%>
	                		</div>
	                		<hr>
	                		<p class="text-center"><label>Total Amount</label>
						<input type="text" name="totAmount"  id="totAmount" placeholder="Enter total Amount...." class="prescAmt" readonly></p>
					</div>
					<input type="hidden" id="requestId" name="requestId">
					
					 <div class="Modal-footer">
					 	<p class="text-center medicine-order"><input type="submit" class="btn-fr-all" value="send"></p>
					 </div>
					</form> 
				</div>
			</div>
		</div>
															
<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 
 <!-- Modal -->
<div class="modal fade pharmacy_ord" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	 <div class="modal-dialog" role="document">
		 <div class="modal-content">
			 <div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				
				<img src="${pageContext.request.contextPath}/resources/images/camera.png" alt="prescription">
				
			 </div>
		 </div>
	 </div>
</div>
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script>
$(function() {
	  $('.panel-default a').click(function() {
	    if ($(this).hasClass('activestate')) {
	      $(this).removeClass('activestate');
	    } else {
	      $('.panel-default a').removeClass('activestate');
	      $(this).addClass('activestate');
	    }
	  });
	});
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

</script>

<script type="text/javascript">
jQuery(document).ready(function() {
    var owl = jQuery('.owl-carousel');
    owl.owlCarousel({
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 1000,
      autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
</script>

<script>
		 
	 function paidStatus(requestId) {
				  
			  
		 $
		 
														.getJSON(
																'${updatePaidStatus}',
																{
																	requestId : requestId,
																	
																	ajax : 'true'
																},
																function(data) {
																	
																	
																	location.reload();

																})
		 
	 }
	 
	 function deliverdStatus(requestId) {
				  
		  
		 $
		 
														.getJSON(
																'${updateDeliveredStatus}',
																{
																	requestId : requestId,
																	
																	ajax : 'true'
																},
																function(data) {
																	
																	
																	location.reload();

																})
		 
	 }




</script>
<script type="text/javascript">
 
$('.datepicker').datepicker({
	  autoclose: true,
	  
	  format: "dd-mm-yyyy"}).datepicker()
	  
	 /*  $('.datepicker').datepicker({
	  autoclose: true,
	  startDate: new Date(),
	  format: "yyyy-mm-dd"}).datepicker() */
	  
</script>

<script>

var doc = new jsPDF();
var specialElementHandlers = {
    ".pharmacy_ord" : function (element, renderer) {
        return true;
    }
};
function downloadPdf(patientRequestToMedicalId){

	 
    doc.fromHTML($("#pharmacy_ord"+patientRequestToMedicalId).html(), 15, 15, {
        'width': 170,
            'elementHandlers': specialElementHandlers
    });
    doc.save('sample-file.pdf');
    location.reload();

}
</script>

<script type="text/javascript">
function getPrescriptionImage(patientId,medicalReqId,prescriptionName,totAmt)
{
	var prescription = prescriptionName.split(",");
	
	
	document.getElementById("requestId").value=medicalReqId;
	document.getElementById("totAmount").value=totAmt;
	//var imageSrc="https://bionische.com/biocare/resources/images/logo.png";
	 for(var i=0;i<prescription.length;i++){
	
		
		 var imageSrc="http://104.238.116.176:8080/images/patient/"+patientId+"/prescription/"+prescription[i];
	
 	 $("#prescriptionImage").append('<a class="example-image-link" href="'+imageSrc+'" data-lightbox="example-1"><img class="example-image" src="'+imageSrc+'" alt="image-1" /></a>');  
	 }
	 
}

</script>
</body>
</html>