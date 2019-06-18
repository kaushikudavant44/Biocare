<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>


	<c:url var="getLabAppointmentsTime" value="/getLabAppointmentsTime" />
	<c:url var="cancelLabAppointmentByLab"
		value="/cancelLabAppointmentByLab" />
	<c:url var="editLabAppointmentByLab" value="/editLabAppointmentByLab" />
	<c:url var="collectSampleWithPaymentDetails" value="/collectSampleWithPaymentDetails" />


	<jsp:include page="../include/labHeader.jsp" />




	<div class="clearfix"></div>
	<section class="doc_login">
	<div class="dashboard_nm text-center">
		<h4>Appointment List</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/labLeftMenu.jsp" />
  <fmt:parseDate value="${currentDate}" var="currDate" 
                              pattern="dd-MM-yyyy" />
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<p style="text-align: center; color: green;" id="messageAnimation">${msg}</p>
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="filter_div date_filter">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<h3>Select Date for previous Appointment</h3>
							</div>
							<form action="showViewLabAppointment" method="get">
								<div class="col-sm-3">
									<label>From Date</label> <input type="text" name="fromDate"
										id="fromDate" placeholder="From Date"
										class="datepicker" value="${fromDate}" >
								</div>
								<div class="col-sm-3">
									<label>To Date</label> <input type="text" name="toDate"
										id="toDate" placeholder="To Date"
										class="datepicker" value="${toDate}" >
								</div>
								<div class="col-sm-1 mar-top30 text-center">
									<label>OR</label>

								</div>
								<div class="col-sm-3">
									<label>Patient Id</label> <input type="text" name="patientId"
										id="patientId" placeholder="Patient Id" value=""
										class="form-control" onkeypress="return IsNumeric(event);">


									<p
										style="color: red; font-size: 14px !important; margin: 0; line-height: 20px;">${message}</p>

								</div>
								<div class="col-sm-2">
									<input type="submit" value="Search" class="btn-fr-all">
								</div>
							</form>
						</div>
						<div class="clearfix"></div>
						<hr>
						<%-- <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
						<div class="loader2"></div>
						<c:forEach items="${getAppointmentDetailsList}"
							var="getAppointmentDetails" varStatus="count">
							<fmt:parseDate value="${getAppointmentDetails.date}" var="apppointDate" 
                              pattern="dd-MM-yyyy" />
                              
							<div class="appointment-div docpatientApp">
								<div class="col-sm-4">
									<h4 class="dropbtn marbot0">
										<i class="icon-doctor-1 font20 mar-top20"></i>
										${getAppointmentDetails.patientName}
									</h4>
									<h5 class="martop0">
										Test : <strong class="fontcolor">${getAppointmentDetails.labTestName}</strong>
									</h5>
									<h5 class="martop0">
										Contact : <strong>${getAppointmentDetails.patientContact}</strong>
									</h5>
								</div>
								<div class="col-sm-3 text-center">
									<h5>Date : ${getAppointmentDetails.date}</h5>
									<h5>Time : ${getAppointmentDetails.time}</h5>

								</div>
								<div class="col-sm-5">


									<p class="text-right">

										<c:choose>
											<c:when test="${getAppointmentDetails.status==1}">
												<a href="#"
													onclick="collectSample(${getAppointmentDetails.appointId})"
													class="btn-fr-all" data-toggle="modal"
													data-target=".bs-example-modal-lg3"> Collect Sample</a>

											</c:when>
											<c:when test="${getAppointmentDetails.status==4  }">

												<a
													href="${pageContext.request.contextPath}/showUploadLabRepots/${getAppointmentDetails.patientId}/${getAppointmentDetails.appointId}"
													class="btn-fr-all">Upload Reports</a>

											</c:when>
										</c:choose>


										<c:if
											test="${currDate <= apppointDate && getAppointmentDetails.status!=4 && getAppointmentDetails.status!=2 && getAppointmentDetails.status!=5}">
											<a href="#"
												onclick="setAppointId(${getAppointmentDetails.appointId}, ${getAppointmentDetails.labId},'${getAppointmentDetails.date}',${getAppointmentDetails.timeId},'${getAppointmentDetails.time}'), getAppointTime(${getAppointmentDetails.timeId});"
												class="btn-fr-all" data-toggle="modal"
												data-target=".bs-example-modal-lg2">Edit/Confirm</a>
										</c:if>
									</p>
								</div>
								<div class="clearfix"></div>
								<hr>
								<div class="col-sm-4"></div>
								<div class="col-sm-3">

									<c:choose>
										<c:when test="${getAppointmentDetails.status==0}">

											<h5 class="text-center">
												Status : <span class="orange_color">Pending</span>
											</h5>

										</c:when>
										<c:when test="${getAppointmentDetails.status==1}">

											<h5 class="text-center">
												Status : <span class="green_color">Confirm</span>
											</h5>

										</c:when>

										<c:when test="${getAppointmentDetails.status==2}">

											<h5 class="text-center">
												Status : <span class="red_color">Cancel</span>
											</h5>

										</c:when>
										<c:when test="${getAppointmentDetails.status==3}">

											<h5 class="text-center">
												Status : <span class="red_color">Reject</span>
											</h5>

										</c:when>
										<c:when test="${getAppointmentDetails.status==4}">

											<h5 class="text-center">
												Status : <span class="green_color">Sample Collected</span>
											</h5>

										</c:when>

										<c:when test="${getAppointmentDetails.status==5}">

											<h5 class="text-center">
												Status : <span class="green_color">Completed</span>
											</h5>

										</c:when>
									</c:choose>


								</div>
								<div class="col-sm-5"></div>
							</div>


						</c:forEach>



					</div>
				</div>

			</div>
		</div>
	</div>
	</section>
	<input type="hidden" name="appointId" id="appointId">
	<input type="hidden" name="labId" id="labId">
	<input type="hidden" name="fromTime" id="fromTime" value="${fromTime}">
	<input type="hidden" name="toTime" id="toTime" value="${toTime}">
	<!--- select time--->
	<div class="modal fade bs-example-modal-lg2" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Edit Appointment</h4>
				<%--  </c:when>
        </c:choose> --%>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-6">
						<input type="text" onchange="getAppointTime(0)" class="datepicker"
							placeholder="select new date" id="newDate" name="newDate"
							disabled>
					</div>
					<div class="col-sm-6">
						<select class="slct_lst" name="time" id="time">


						</select>
					</div>
				</div>
				<div class="clearfix"></div>
				<hr>
				<p class="text-center big-screen">
					<a href="#" onclick="cancelAppointment()"
						class="btn-fr-all btn_red">Cancel Appointment</a> <a href="#"
						onclick="editAppointment()" class="btn-fr-all">Confirm
						Appointment</a>
				</p>
				<p class="text-center small-screen">
					<a href="#" onclick="cancelAppointment()"
						class="btn-fr-all btn_red">Cancel</a> <a href="#"
						onclick="editAppointment()" class="btn-fr-all">Confirm</a>
				</p>
			</div>
		</div>
	</div>


	<div class="modal fade bs-example-modal-lg3" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Payment Details</h4>

			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-6">
						<label> Amount </label> <input type="text"
							placeholder="Enter Test Amount" id="amount" name="amount"
							value="0" onkeyup="calDiscount()">
					</div>
					<div class="col-sm-6">
						<label> Discount % (optional) </label> <input type="text"
							placeholder="Enter Discount" id="discount" name="discount"
							value="0" onkeyup="calDiscount()">
					</div>

				</div>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-6">
						<label> Total Amount</label> <input type="text" disabled
							placeholder="Total Payable Amount" id="totalAmount"
							name="totalAmount" value="0">
					</div>

					<input type="hidden" name="appointmentId" id="appointmentId">
				</div>
				<div class="clearfix"></div>
				<hr>
				<p class="text-center big-screen">
					<a href="#" onclick="collectWithPaymentDetails(0)" class="btn-fr-all btn_red">Send Payment Request </a> &nbsp;
					<a href="#" onclick="collectWithPaymentDetails(1)" class="btn-fr-all">Cash Received </a>
				</p>
				<p class="text-center small-screen">
					<a href="#" onclick="collectWithPaymentDetails(0)" class="btn-fr-all btn_red"> Send Payment Request
						  </a> <a href="#" onclick="collectWithPaymentDetails(1)" class="btn-fr-all"> Cash Received
						 </a>
				</p>
			</div>
		</div>
	</div>



	<!--- End select time--->

	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
	<script>

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

	              /* $(".datepicker").datepicker({
	            	  dateFormat: "yy-mm-dd",
	            	  minDate: 0,
	            	  autoclose: true
	            	}); */
	            	$(".datepicker").datepicker({
		            	 format: "dd-mm-yyyy",
		            	  autoclose: true
		            	});

	          
</script>
	<script type="text/javascript">

function setAppointId(appointId, labId,date,timeId,time)
{
 
	document.getElementById("appointId").value=appointId;
	document.getElementById("labId").value=labId;
	document.getElementById("newDate").value=date;
	//document.getElementById("newTime").value =time;
	var html = '<option value="'+timeId+'" disabled="disabled" selected="selected" >'+time+'</option>';
	html += '</option>';
	$('#time').html(html);
	$("#time").trigger("chosen:updated");
	
}




function getAppointTime(timeId)
{
	var appointId= document.getElementById("appointId").value;
	
	var newDate=document.getElementById("newDate").value;

	var labId=document.getElementById("labId").value;
	 var fromTime=document.getElementById("fromTime").value;
	 var toTime=document.getElementById("toTime").value;
	 
     $
		.getJSON(
				'${getLabAppointmentsTime}',
				{
					labId : labId,
					appointmentDate : newDate,
					fromTime : fromTime,
					toTime : toTime,
					ajax : 'true'
				},
				function(data) {
					    
					if(data.allAppointmentTimeList!=null)
					{
									
			$.each(
							data.allAppointmentTimeList,
							function(key, allTimeList) {
								
							 var html = '<option value="" disabled="disabled" selected >Choose Time...</option>';		
							 var temp=0;
				  $.each(
							data.appointmentTimeList,
							function(key, timeList) {
								
								if(timeList.timeId==allTimeList.timeId){
									
									 var node = document.createElement("option");
						    		 
						    		  var textnode = document.createTextNode(timeList.time);
						    		  node.setAttribute("value", timeList.timeId);
						    		 
						    		  node.appendChild(textnode);
						    		  document.getElementById("time").appendChild(node);

								}
							});
				 
							});
			
					}
				
		
		});
 
}		

function editAppointment()
{
	
	
	var date=document.getElementById("newDate").value;
	var appTimesList=document.getElementById("time").value;
	var appId= document.getElementById("appointId").value;
	
if(appTimesList=="" || appTimesList==null)
	{
	alert("Please Select Time!!");
	}
else{
	
	
	 
	
	$
	.getJSON(
			'${editLabAppointmentByLab}',
			{
				appTimesList : appTimesList,
				date : date,
				appId : appId,
				
				ajax : 'true'
			},
			function(data) {
			 
				location.reload();				
			});
	 
								
								 
}					 
	 
 
	
} 

function cancelAppointment()
	{
		 
		
  var appId=document.getElementById("appointId").value;
    	 
    	  if(confirm("Do you want to cancel?"))
    	  {
    		  $
    			.getJSON(
    					'${cancelLabAppointmentByLab}',
    					{
    						
    						appId : appId,
    						
    						ajax : 'true'
    					},
    					function(data) {
    					 
    						location.reload();		    					
    					});
    			 
			}
		
	}
</script>

	<script>
                        setTimeout(function() {
   $('#messageAnimation').fadeOut('slow');
}, 5000);
                       </script>
	 
	<script type="text/javascript">
                       
 function collectSample(appointmentId) {
                    	  document.getElementById("appointmentId").value=appointmentId;
                 		 
                 			 
					}
                       
 function collectWithPaymentDetails(paymentStatus)
                       {
                    	
	 var discount=$("#discount").val();
	   var amount=$("#amount").val();
	   var totalAmount=$("#totalAmount").val();
	 
                  
	 var appointmentId=document.getElementById("appointmentId").value;
	   
	   $
		.getJSON(
				'${collectSampleWithPaymentDetails}',
				{
					
					appId : appointmentId,
					paymentStatus : paymentStatus,
					discount : discount,
					amount : amount,
					totalAmount : totalAmount,
					ajax : 'true'
				},
				function(data) {
				 
					location.reload();		    					
				});
 }
                       
                       
  function calDiscount()
                       {
                    	   var discount=$("#discount").val();
                    	   var amount=$("#amount").val();
                    	   var total=amount-(amount*discount)/100;
                    	   
                    	   $("#totalAmount").val(total);
                       }
                       </script>



</body>
</html>