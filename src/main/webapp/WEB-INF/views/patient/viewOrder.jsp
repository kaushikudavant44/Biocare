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
	<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/videoCall2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
</head>
<body>


	<c:url var="getAppointmentsTime" value="/getAppointmentsTime" />
	<c:url var="deleteDoctorAppointment" value="/deleteDoctorAppointment" />
	<c:url var="editPatientAppointmentByDoctor"
		value="/editPatientAppointmentByDoctor" />



	<jsp:include page="../include/patientHeader.jsp" />



<script>
function getRecentMedicineOrderRecord(){
	//window.open("${pageContext.request.contextPath}/getPatientRecentMedicineOrder","_self");
}

</script>

	<div class="clearfix"></div>
	<section class="doc_login">
	<div class="dashboard_nm text-center">
		<h4>
			View Order
		</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						 <div class="filter_div doc_fil">   
							<h3>Select date to previous order</h3>
							<form
								action="${pageContext.request.contextPath}/getPatientMedicineOrder"
								method="GET">

								<div class="col-sm-5">
									<label>From Date</label> <input type="text" name="fromDate"
										id="fromDate" placeholder="from date"
										class="datepicker form-control" value="${fromDate}" readonly>
								</div>

								<div class="col-sm-5">
									<label>To Date</label> <input type="text" name="toDate"
										id="toDate" placeholder="to date"
										class="datepicker form-control" value="${toDate}" readonly>
								</div>
								<div class="col-sm-2">
									<input type="submit" value="Search"
										class="btn-fr-all dspl-appt">

								</div>
							</form>
						</div> 
						<div class="clearfix"></div>
						<hr>
						<%--  <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
       			     <div class="loader2"> </div>
						<c:forEach items="${ordersHistory}" var="ordersHistory" varStatus="count">
	                		<div class="pharmacy_ord">
	                		
	                			<div class="pat_name">
	                				<p class="text-center pat_detl">${ordersHistory.medicalName}</p>
	                			<h3 class="text-left"><strong>${ordersHistory.date} ${ordersHistory.time}</strong></h3>
	                			
	                			 
								<c:choose>
                                            
											<c:when test="${ordersHistory.status==0}">
											 <h4 class="text-right"><strong> Paid?:</strong><%--  <input type="radio" class="btn-fr-all" value="send" onclick="paidStatus(${completedPrescription.patientRequestToMedicalId})"> --%>yes</h4>
											</c:when>
											<c:when test="${ordersHistory.status==1}">
											 <h4 class="text-right"><strong>Payment successful</strong></h4>
											</c:when>
												
								</c:choose> 
							
	                			
	                			</div>
	                			<div class="pat_name text-center">
	                			<div class="row">
	                				<div class="col-sm-4"><h5><strong>Doctor Name :</strong> <span>${ordersHistory.doctorName}</span></h5></div>
	                				<div class="col-sm-4"><h5><strong>Contact No. :</strong> <span>${ordersHistory.string1}</span></h5></div>
	                				<div class="col-sm-4"><h5><strong>Hospital:</strong> <span>${ordersHistory.hospitalName}</span></h5></div>
	                			</div>
	                		</div>
	                			<div class="clearfix"></div>
	                			<!-- <div class="order-gp"></div> -->
	                			<div class="table-responsive">
	                				<table>
										<tbody>
										<tr>
											<td><strong>Medicine</strong></td>
											<td><strong>Quantity</strong></td>
											<td><strong>Price</strong></td>
											
											
										</tr>
										<c:forEach items="${ordersHistory.getPrescriptionWithBill}" var="prescriptionDetails" varStatus="count">
										<tr>
											<td>${prescriptionDetails.medicineName}</td>
											<td>${prescriptionDetails.medicineQuantity}</td>
											<td>${prescriptionDetails.price}</td>
										
											
										</tr>
											
										</c:forEach>
										<tr>
											<td colspan="2"><strong>Total Bill :-</strong> </td>
											<td><strong>${ordersHistory.totalBill}</strong></td>
										</tr>
										</tbody>
									
									</table>
	                			</div>
	                		</div>
	                		</c:forEach>



					</div>
				</div>

			</div>
		</div>
	</div>
	</section>
	<input type="hidden" name="appointId" id="appointId">
	<input type="hidden" name="doctorId" id="doctorId">
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
							placeholder="select new date" id="newDate" name="newDate">
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
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script> -->

	<script type="text/javascript">

	              /* $(".datepicker").datepicker({
	            	  dateFormat: "yy-mm-dd",
	            	  minDate: 0,
	            	  autoclose: true
	            	}); */
	            	$(".datepicker").datepicker({
		            	 format: "dd-mm-yyyy",
		            	  autoclose: true
		            	}).datepicker("setDate", new Date);

	          
</script>


</body>
</html>