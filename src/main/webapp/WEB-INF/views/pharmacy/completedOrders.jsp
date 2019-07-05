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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">


    <style type="text/css">
@media print
{
body * { visibility: hidden; }
#largeModal * { visibility: visible; }
#largeModal { position: absolute; top: 00px; left: 30px; }


#print {display: none;}
#close {display: none;}
}
</style>
</head>         
<body>
<jsp:include page="../include/pharmacyHeader.jsp"/> 


 <c:url var="getPrescriptionDetailsForOrder"
		value="/getPrescriptionDetailsForOrder" />
		
		<c:url var="updatePaidStatus" value="/updatePaidStatus" />
		<c:url var="updateDeliveredStatus" value="/updateDeliveredStatus" />
	
			<%--<c:url var="updateUploadedPrescriptionDeliveredStatus" value="/updateUploadedPrescriptionDeliveredStatus" /> --%>
  
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="dashboard_nm text-center"><h4>Completed Orders</h4></div>
<div class="container-fluid"> 
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/pharmacyLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content active">
	                <c:forEach items="${getMedicalOrderDetailsList}" var="getMedicalOrderDetails"
									varStatus="count">
	                		<div class="pharmacy_ord">
	                		
	                		
	                		
	                			<div class="pat_name">
	                				<p class="text-center pat_detl">Patient Details</p>
	                			<h3 class="text-left"><strong>PatientName</strong> : <span>${getMedicalOrderDetails.patientName}</span></h3>
	                			<h3 class="text-left"><strong>Address</strong> : <span> ${getMedicalOrderDetails.address}</span></h3>
	                			<h3 class="text-left"><strong>Contact</strong> : <span> ${getMedicalOrderDetails.patientContact}</span></h3>
	                			<h3 class="text-left"><strong>Total Bill</strong> : <span>${getMedicalOrderDetails.totalAmt}/-</span></h3>
	                			<h3><a href="#" data-toggle="modal" data-target="#largeModal" onclick="getPrescriptionDetails(${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.doctorName}','${getMedicalOrderDetails.doctorContact}','${getMedicalOrderDetails.totalAmt}')"><span class="scheduleInfo">
	                			<img class="rx_image" src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg" width="24" height:24px alt="Rx_image"></span> Click Here</a></h3>
	                			  
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
                                 <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" class="btn-fr-all paidStatus" value="${getMedicalOrderDetails.requestToMedicalId}" >yes</h4>
								 <h4 class="text-right"><strong> Delivered?:</strong> <input data-toggle="tooltip" title="Hooray!" disabled  value="${getMedicalOrderDetails.requestToMedicalId}" type="radio" class="btn-fr-all deliveryStatus" value="send"  >yes</h4>
								
								</c:when>
								<c:otherwise>
								 <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" disabled value="${getMedicalOrderDetails.requestToMedicalId}" checked class="btn-fr-all" value="send">yes</h4>
								<h4 class="text-right"><strong> Delivered?:</strong> <input   value="${getMedicalOrderDetails.requestToMedicalId}" type="radio" class="btn-fr-all deliveryStatus" value="send"  >yes</h4>
								
								</c:otherwise>
                                 </c:choose>
								
						
						<div class="clearfix"></div>
	                			<div class="order-gp"></div>
	                			
	                			
	                			</div>
	                			</div>
	                		
	                			</c:forEach>
	                			
	                			 <c:forEach items="${getMedicalOrderDetailsList1}" var="getMedicalOrderDetails"
									varStatus="count">
	                		<div class="pharmacy_ord">
	                		
	                		
	                		
	                			<div class="pat_name">
	                				<p class="text-center pat_detl">Patient Details</p>
	                			<h3 class="text-left"><strong>PatientName</strong> : <span>${getMedicalOrderDetails.patientName}</span></h3>
	                			<h3 class="text-left"><strong>Address</strong> : <span> ${getMedicalOrderDetails.address}</span></h3>
	                			<h3 class="text-left"><strong>Contact</strong> : <span> ${getMedicalOrderDetails.patientContact}</span></h3>
	                			<h3 class="text-left"><strong>Total Bill</strong> : <span>${getMedicalOrderDetails.totalAmt}/-</span></h3>
	                			<h3><a href="#" data-toggle="modal" data-target="#largeModal1" onclick="getPrescriptionImage(${getMedicalOrderDetails.patientId},${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.string1}',${getMedicalOrderDetails.totalAmt})">
	                			<span class="scheduleInfo" > <img src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg" class="rx_image"  width="24" height="24px"  alt="Rx_image"></span> Click Here</a></h3>
	                			  
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
                                 <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" class="btn-fr-all paidStatus" value="${getMedicalOrderDetails.requestToMedicalId}" >yes</h4>
								 <h4 class="text-right"><strong> Delivered?:</strong> <input data-toggle="tooltip" title="Hooray!" disabled  value="${getMedicalOrderDetails.requestToMedicalId}" type="radio" class="btn-fr-all deliveryStatus" value="send"  >yes</h4>
								
								</c:when>
								<c:otherwise>
								 <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" disabled value="${getMedicalOrderDetails.requestToMedicalId}" checked class="btn-fr-all" value="send">yes</h4>
								<h4 class="text-right"><strong> Delivered?:</strong> <input value="${getMedicalOrderDetails.requestToMedicalId}" type="radio" class="btn-fr-all deliveryStatus" value="send"  >yes</h4>
								
								</c:otherwise>
                                 </c:choose>
								
						
						<div class="clearfix"></div>
	                			<div class="order-gp"></div>
	                			
	                			
	                			</div>
	                			</div>
	                		
	                			</c:forEach>
							<!-- </div> -->
                    </div>
            </div>
               
            </div>
             </div>
         </div> 
</section>

<div id="largeModal" class="modal fade bs-example-modal-lg reportsDesign" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
					<div class="modal-body card_sec" id="displayTable">
					<button id="close" type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
							<a id ="print"onclick="print()"><span class="icon-printer down-icon-modal"></span></a>
							<hr>
							<h4 class="modal-title" id="hospitalName"></h4>
							<h5 class="text-right"><strong>Doctor Name : </strong> <span id="docName"> </span></h5>
	                			 
	                			<h5 class="text-right"><strong>Contact No. :</strong> <span id="docContact"></span></h5>
							<hr>
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
					<div class="pat_name text-center">
	                			<div class="row">
	                				<div class="col-sm-10 modal-pric-details">
	                				</div>
	                				<div class="col-sm-2 modal-down-icon">
	                					<!-- <a href="#"><span class="fa  fa-download"></span></a> -->
	                					<!-- <a href="#"><i class="icon-printer" aria-hidden="true"></i></a> -->
	                				</div> 
	                				
	                			</div>
	                		</div>
	                		
	                		<br>
 						 	 <div class="table-responsive">
	                				<table id="precsription">
										<thead>
										<tr>
											<td><strong>Medicine</strong></td>
											<td><strong>Quantity</strong></td>
											<td><strong>Instructions</strong></td>	
											<td><strong>Time</strong></td>									
											<td width="20%"><strong>Total Price</strong></td>
											
											
									</tr>
									</thead>
									<tbody>
									<!-- <tr>
											<td> Crosin </td>
											<td> 10 </td>
											<td> After Food </td>
											<td> Morning, Night </td>
											<td> 35.00/- </td>
											
									</tr> -->
									</tbody>
									<tfoot>
									<tr>
											<td colspan="4"><strong>Total Price</strong></td>
											
											<td><strong><span id='totAmt'></span>/-</strong></td>
											
											
									</tr>
										 
										</tfoot>
										
									</table>
	                			</div>
	                			<hr>
					<div class="signB">
						Signature: <img id="doctorSign" class="img-responsive img-center">
					</div>

					</div>
					 
					
				</div>
			</div>
		</div>
					
					
		<div id="largeModal1" class="modal fade bs-example-modal-lg reportsDesign" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
				<form action="${pageContext.request.contextPath}/confirmUploadedPrescriptionMedicalOrder" method="POST" onsubmit="return confirm('Are you sure submit order?')">
					<div class="modal-body carousel1 card_sec" id="displayTable">
					<a onclick="printTable()"><span class="icon-printer down-icon-modal"></span></a>
						<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
								<hr>
							<h4 class="modal-title"> Hospital Name </h4>
							<h5 class="text-right"><strong>Doctor Name : </strong> <span id="docName"> </span></h5>
	                				<!-- <h5><strong>Hospital Name :</strong> <span> Surya Multispaclity Hospital </span></h5> -->
	                			<h5 class="text-right"><strong>Contact No. :</strong> <span id="docContact"></span></h5>
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<hr>
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
					<hr>
					<div class="signB">
						Signature: <img src="${pageContext.request.contextPath}/resources/images/sign.png" class="img-responsive img-center">
					</div>
					</div>
					<input type="hidden" id="requestId" name="requestId">
					
					 <div class="Modal-footer">
					 	<!-- <p class="text-center medicine-order"><input type="submit" class="btn-fr-all" value="send"></p> -->
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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'>

</script>
<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
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
		 
	 



</script>


<script type="text/javascript">
function getPrescriptionDetails(requestId, doctorName, doctorContact,totAmt)
{
	   
	 
	  
	 $("#totAmt").text(totAmt);  
	 $('#precsription tbody tr').remove();
	 $
		.getJSON(
				'${getPrescriptionDetailsForOrder}',
				{
					requestId : requestId,
					
					ajax : 'true'
				},
				function(data) {
					 
					 $("#docName").text(data.doctorName);
					 $("#hospitalName").text(data.hospitalName);
					 $("#docContact").text(data.contact);
					 document.getElementById("doctorSign").src=data.signature;
					 
					$.each(
							data.getPrescriptionDetailsForOrderList,
								function(key, prescriptionList) {
								//alert(prescriptionList.medicineName);
								var tr = $('<tr></tr>');
								
						/* 		tr.append($('<td></td>').html(key+1)); */
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.quantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
								/* onkeyup=" return checkNum(event,this);" */
								tr.append($('<td></td>').html(prescriptionList.price+'/-'));
								/* tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming)); */
					
								$('#precsription tbody').append(tr);
							})	
							
							
				});
	 //getPrescriptionDetailsForOrder
	 
	 
}



 
$('#paidStatus').click(function(){
	 var cnfrm = confirm('Are you sure payment is recieved?');
	 if(cnfrm != true)
	{
	 return false;
	}
	 else
		 {
		 alert("kjh");
		 
		 $
		 
			.getJSON(
					'${updatePaidStatus}',
					{
						requestId : $(this).val(),
						
						ajax : 'true'
					},
					function(data) {
						
						
						location.reload();

					})
						 
		 }

	})
	




$('.paidStatus').click(function(){
	 var cnfrm = confirm('Are you sure payment is recieved?');
	 if(cnfrm != true)
	{
	 return false;
	}
	 else
		 {
		 
		 
		 $
		 
			.getJSON(
					'${updatePaidStatus}',
					{
						requestId : $(this).val(),
						
						ajax : 'true'
					},
					function(data) {
						
						 
						location.reload();

					})
						 
		 }

	})
	
	$('.deliveryStatus').click(function(){
		
		 
		 
		
	 var cnfrm = confirm('Are you sure medicine is Delivered?');
	 if(cnfrm != true)
	{
	 return false;
	}
	 else
	 {
		 $
		 
			.getJSON(
					'${updateDeliveredStatus}',
					{
						requestId : $(this).val(),
						
						ajax : 'true'
					},
					function(data) {
						
						
						location.reload();

					})
	 }
		 
	})
	
	
	function getPrescriptionImage(patientId,medicalReqId,prescriptionName,totAmt)
{
	
	var prescription = prescriptionName.split(",");
	
	$("#prescriptionImage").empty();
	document.getElementById("requestId").value=medicalReqId;
	document.getElementById("totAmount").value=totAmt;
	//var imageSrc="https://bionische.com/biocare/resources/images/logo.png";
	 for(var i=0;i<prescription.length;i++){
	
		 
		 var imageSrc="http://104.238.116.176:8080/images/patient/"+patientId+"/prescription/"+prescription[i];
	
 	 $("#prescriptionImage").append('<a class="example-image-link" id="imageTag'+i+'" href="'+imageSrc+'" data-lightbox="example-1"><img class="example-image" src="'+imageSrc+'" alt="image-1" /></a>');  
	 }
	 
}


	</script>
</body>
</html>