<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

</head>         
<body>
<jsp:include page="../include/pharmacyHeader.jsp"/> 


<c:url var="getPrescriptionDetailsForOrder"
		value="/getPrescriptionDetailsForOrder" />
 

  
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="dashboard_nm text-center"><h4>View Orders</h4></div>
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
	                				<p class="text-center pat_detl">Patient Details </p>
	                			<h3 class="text-left">${getMedicalOrderDetails.patientName} </h3>
	                			<h3 class="text-left"> <strong>Address </strong>:<span> ${getMedicalOrderDetails.address}</span></h3>
	                			<h3 class="text-left"> <strong>Order Date </strong>:<span> ${getMedicalOrderDetails.orderDate}</span></h3>
	                			<h3><a href="#" data-toggle="modal" data-target="#largeModal" onclick="getPrescriptionDetails(${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.doctorName}','${getMedicalOrderDetails.doctorContact}')">
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
                                 
								
	                			<h4 class="text-right"><span> Contact :<strong> ${getMedicalOrderDetails.patientContact}</strong></span></h4>
	                			</div>
	                			
	                			<div class="clearfix"></div>
	                			<div class="order-gp"></div>
	                			
	                		</div>
	                		</c:forEach>
	                		<c:forEach items="${getMedicalOrderDetailsList1}" var="getMedicalOrderDetailsList"
									varStatus="count">
	                		<div class="pharmacy_ord">
	                		 
	                			<div class="pat_name">
	                				<p class="text-center pat_detl">Patient Details </p>
	                			<h3 class="text-left">${getMedicalOrderDetailsList.patientName}</h3>
	                			<h3 class="text-left"> <strong>Address </strong>:<span> ${getMedicalOrderDetailsList.address}</span></h3>
	                			<h3 class="text-left"> <strong>Order Date </strong>:<span>  ${getMedicalOrderDetailsList.orderDate}</span></h3>
	                			<h3><a href="#" data-toggle="modal" data-target="#largeModal1" onclick="getPrescriptionImage(${getMedicalOrderDetailsList.patientId},${getMedicalOrderDetailsList.requestToMedicalId},'${getMedicalOrderDetailsList.string1}')">
	                			<span class="scheduleInfo" > <img src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg" class="rx_image"  width="24" height="24px"  alt="Rx_image"></span> Click Here</a></h3>
                                <h4 class="text-right">Order Id :<strong>${getMedicalOrderDetailsList.requestToMedicalId}</strong> </h4>
                               
                                <c:choose>
                                <c:when test="${getMedicalOrderDetailsList.deliveryType==0}">
                                 <h4 class="text-right">Delivery Status :<strong> Home Delivery</strong> </h4>
                                </c:when>
                                <c:otherwise>
                                <h4 class="text-right">Delivery Status :<strong> Collect from Store </strong></h4>
                                </c:otherwise>
                                </c:choose>
                               
								
	                			<h4 class="text-right"><span> Contact :<strong>${getMedicalOrderDetailsList.patientContact}</strong></span></h4>
	                			</div>
	                			
	                			<div class="clearfix"></div>
	                			<div class="order-gp"></div>
	                			
	                		</div>
	                		</c:forEach>
	                		
	                		
                    </div>
            </div>
               
            </div>
             </div>
         </div> 
</section>

<!--priscription  -->
<div id="largeModal" class="modal fade bs-example-modal-lg reportsDesign" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
				<form action="${pageContext.request.contextPath}/confirmMedicalOrder" method="POST" onsubmit="return confirm('Are you sure submit order?')">
					<div class="modal-body card_sec" id="displayTable">
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
					<div class="pat_name text-center">
	                			<div class="row">
	                				<div class="col-sm-10 modal-pric-details">
	                				
	                				
	                				</div>
	                				
	                				 <!-- <div class="col-sm-4 modal-pric-details"> <h5><strong>Hospital :</strong> <span> Surya Multispaclity Hospital </span></h5></div> 
	                				<div class="col-sm-3 modal-pric-details"><h5><strong>Contact No. :</strong> <span id="docContact"></span></h5></div>-->
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
											<td>medicineName</td>
											<td>10</td>	
											<td>Afetrnoon</td>										
											<td><input class="input-text" type="text" name="" placeholder="50.00"></td>
										</tr>
										<tr>
										  <td>medicineName</td>
											<td>10</td>	
											<td>Afetrnoon</td>											
											<td align="center"><input class="input-text" type="text" name="" placeholder="50.00"></td>
										</tr> -->
										</tbody>
										<tfoot>
										<tr>
											<td colspan="4"><strong>Total Amount</strong></td>
																					
											<td><strong><span id="totalAmt"></span></strong></td>
											
										</tr>
										
										</tfoot>
										
									</table>
	                			</div>
<input type="hidden" id="requestId" name="requestId">
<input type="hidden" id="totAmount" name="totAmount" value="0" required>
			<hr>
					<div class="signB">
						Signature: <img src="${pageContext.request.contextPath}/resources/images/sign.png" class="img-responsive img-center">
					</div>
					<p class="text-center medicine-order"><input type="submit" class="btn-fr-all" value="send"></p>
					</div>
					 
					</form> 
					
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
						<h5 class="text-right"><strong>Doctor Name : </strong> <span id="docName">Dr.Kaushik </span></h5>
	                				<!-- <h5><strong>Hospital Name :</strong> <span> Surya Multispaclity Hospital </span></h5> -->
	                			<h5 class="text-right"><strong>Contact No. :</strong> <span id="docContact">1234567890</span></h5>
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
	                		<p class="text-center"><label>Enter Total Amount</label>
						<input type="text" name="totAmount"  id="totAmount" placeholder="Enter total Amount..." class="prescAmt"></p>
					<hr>
					<div class="signB">
						Signature: <img src="${pageContext.request.contextPath}/resources/images/sign.png" class="img-responsive img-center">
					</div>
					<input type="hidden" id="requestId1" name="requestId">
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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
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
      autoplayTimeout: 100     autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
</script>

 <script type="text/javascript">
 function getPrescriptionDetails(requestId, doctorName, doctorContact)
 {
	  
	 document.getElementById("requestId").value=requestId;
	 $("#docName").text(doctorName);
	 $("#docContact").text(doctorContact);
	 $("#totalAmt").text(00);
	 $('#precsription tbody tr').remove();
	 $
		.getJSON(
				'${getPrescriptionDetailsForOrder}',
				{
					requestId : requestId,
					
					ajax : 'true'
				},
				function(data) {
					 
					
					$.each(
							data,
								function(key, prescriptionList) {
								//alert(prescriptionList.medicineName);
								var tr = $('<tr></tr>');
								
						/* 		tr.append($('<td></td>').html(key+1)); */
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.quantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
								/* onkeyup=" return checkNum(event,this);" */
								tr.append($('<td></td>').html('<input class="input-text" type="text" name="'+prescriptionList.prescriptionOrderDetailsId+'price" id="'+prescriptionList.prescriptionOrderDetailsId+'price" value="'+prescriptionList.price+'" onkeyup="getTotalBill(); return checkNum(event,this);"   onkeypress="return IsNumeric(event,this);">'));
								/* tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming)); */
					
								$('#precsription tbody').append(tr);
							})	
							
							
				});
	 //getPrescriptionDetailsForOrder
	 
	 
 }
 
 function getTotalBill(){
 $('input[type="text"].input-text').each(function () {
	 
	   calculateSum();
	});
 }
 function calculateSum() {    
	  var sum = 0;        
	  $('input[type="text"].input-text').each(function () {      
	    if (!isNaN(this.value) && this.value.length != 0) {
	      sum += parseFloat(this.value);
	    }    
	  });

	  $("#totalAmt").text(sum.toFixed(2));
	  $("#totAmount").val(sum.toFixed(2));
	  
	}
 
 /* function prescriptionBillingValidation()
 {
	 var price=document.getElementById("testId").value; 
	  
	 
	   if(labAppPatientId==""||labCity==""||testId=="") 
		 {
			 alert(" please fill all details");
			 		 
		 }
		 else 
		{
			 $("#labAppointment").submit();
			
	    }
		
 } */
 </script>

 
    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(evt, element) {
        	 var charCode = (evt.which) ? evt.which : event.keyCode

        		        if (
        		            (charCode != 45 || $(element).val().indexOf('-') != -1) &&   
        		            (charCode != 46 || $(element).val().indexOf('.') != -1) &&      
        		            (charCode < 48 || charCode > 57))
        		            return false;

        		        return true;
        }
       
        
        function checkNum(eve, element) {
        	if($(element).val().indexOf('.') == 0) {    $(element).val($(element).val().substring(1));
        }
        
        }
        
        function getPrescriptionImage(patientId,medicalReqId,prescriptionName)
        {
        	
        	var prescription = prescriptionName.split(",");
        	
        	$("#prescriptionImage").empty();
        	document.getElementById("requestId1").value=medicalReqId;
        	
        	//var imageSrc="https://bionische.com/biocare/resources/images/logo.png";
        	 for(var i=0;i<prescription.length;i++){
        	
        		
        		 var imageSrc="http://104.238.116.176:8080/images/patient/"+patientId+"/prescription/"+prescription[i];
        	
         	 $("#prescriptionImage").append('<a class="example-image-link" id="imageTag" href="'+imageSrc+'" data-lightbox="example-1"><img class="example-image" src="'+imageSrc+'" alt="image-1" /></a>');  
        	 }
        	 
        }
        
     </script>
     
    
</body>
</html>