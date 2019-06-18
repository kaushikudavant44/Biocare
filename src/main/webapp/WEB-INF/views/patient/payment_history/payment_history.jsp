<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
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
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
</head>
<body onload="getPatientSubscription()">
	<jsp:include page="../../include/patientHeader.jsp" />

	<div class="clearfix"></div>
	<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center">
		<h4>Patient Payment History</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../../include/patientLeftMenu.jsp" />
				<div
					class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
					<c:url var="getPatientSubscriptionPaymentDetailsByPatientId"
						value="/getPatientSubscriptionPaymentDetailsByPatientId" />
					<c:url var="getConsultingPaymentDetailsByPatientId"
						value="/getConsultingPaymentDetailsByPatientId" />
					<c:url var="getPharmacyPaymentDetailsByPatientId"
						value="/getPharmacyPaymentDetailsByPatientId" />

					<c:url var="getLabPaymentDetailsByPatientId"
						value="/getLabPaymentDetailsByPatientId" />
					<div class="bhoechie-tab-content active">
						<div>

							<div class="filter_div doc_fil">
								<h3>Select Family Member</h3>
								<div class="row">
									<div class="col-md-4 col-sm-4">
										<select class="slct_lst input-text" id="patientId"
											name="patientId" onchange="getPatientSubscription()">

											<c:forEach items="${patientDetailList}"
												var="patientDetailList" varStatus="count">
												<option value="${patientDetailList.patientId}"><c:out
														value="${patientDetailList.fName} ${patientDetailList.lName}" /></option>
											</c:forEach>
										</select>
									</div>
									<!-- <div class="col-md-3 col-sm-3">
							 	<p class="text-center"><a href="#" class="sub_anch"><input class="btn-fr-all" type="button" value="Search"
				onclick="getPatientSubscription()"></a></p>
							 </div> -->
								</div>

							</div>
							<div class="clearfix"></div>
							<hr>

							<div class="bs-example appontlist">
								<ul class="nav nav-tabs newappon">
									<li class="active"><a data-toggle="tab" href="#sectionA"><p>Subscription
												Payment</p></a></li>
									<li><a data-toggle="tab" href="#sectionB"><p>Consulting
												Payment</p></a></li>
									<li><a data-toggle="tab" href="#sectionC"><p>Lab
												Payment</p></a></li>
									<li><a data-toggle="tab" href="#sectionD"><p>Pharmacy
												payment</p></a></li>
								</ul>
								<div class="tab-content">
									<div id="sectionA" class="tab-pane fade in active">

										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="table-responsive">
													<table width="100" border="1" id="myTable23">
														<tr>
															<th scope="col">Sr.no</th>
															<th scope="col">Txn Date</th>
															<th scope="col">Txn Id</th>
															<th scope="col">Order Id</th>
															<th scope="col">Amount</th>
															<th scope="col">Payment Status</th>
														</tr>
														<tbody>


														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>

									<div id="sectionB" class="tab-pane fade">
										<div class="filter_div doc_fil">
											<h3>Consulting Payment</h3>
											<div class="row">
												<div class="col-md-4 col-sm-4">
													<input type="text" id="consultPayFormDate"
														name="consultFormDate" class="datepicker myInput"
														onkeyup="myFunction()" placeholder="From Date"
														title="Type in a name">
												</div>
												<div class="col-md-4 col-sm-4">
													<input type="text" id="consultPayToDate"
														name="consultToDate" class="datepicker myInput"
														onkeyup="myFunction()" placeholder="To Date"
														title="Type in a name">
												</div>
												<div class="col-md-4 col-sm-4">
													<p class="text-center">
														<a href="#" class="sub_anch"><input class="btn-fr-all"
															type="button" value="Search"
															onclick="getConsultPaymentDetails()"></a>
													</p>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
										<hr>
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="table-responsive">
													<table width="100" border="1" id="myTable22">
														<tr>
															<th scope="col">Sr.no</th>
															<th scope="col">Txn Date</th>
															<th scope="col">Doctor Name</th>
															<th scope="col">Txn Id</th>
															<th scope="col">Order Id</th>
															<th scope="col">Amount</th>
															<th scope="col">Payment Status</th>
														</tr>
														<tbody>
														</tbody>
													</table>
												</div>
											</div>
										</div>

									</div>

									<div id="sectionC" class="tab-pane fade">
										<div class="filter_div doc_fil">
											<h3>Lab Payment</h3>
											<div class="row">
												<div class="col-md-4 col-sm-4">
													<input type="text" id="labPayFormDate" name="labFormDate"
														class="datepicker myInput" onkeyup="myFunction()"
														placeholder="From Date" title="Type in a name">
													<!-- <input type="text" id="labPayFormDate" name="labFormDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="From Date" title="Type in a name"> -->
												</div>
												<div class="col-md-4 col-sm-4">
													<input type="text" id="labPayToDate" name="labPayToDate"
														class="datepicker myInput" onkeyup="myFunction()"
														placeholder="To Date" title="Type in a name">
													<!-- <input type="text" id="labPayToDate" name="labPayToDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="To Date" title="Type in a name"> -->
												</div>
												<div class="col-md-4 col-sm-4">
													<p class="text-center">
														<a href="#" class="sub_anch"><input class="btn-fr-all"
															type="button" value="Search"
															onclick="getLabPaymentDetails()"></a>
													</p>
													<!-- <p class="text-center"> <a href="#" class="sub_anch"><input class="btn-fr-all" type="button" value="Search" onclick="getPharmacyPaymentDetails()"></a> -->
													</p>
												</div>
											</div>

										</div>
										<div class="clearfix"></div>
										<hr>
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="table-responsive">
													<table width="100" border="1" id="myTable24">
														<tr>
															<th scope="col">Sr.no</th>
															<th scope="col">Txn Date</th>
															<th scope="col">Lab Name</th>
															<th scope="col">Txn Id</th>
															<th scope="col">Order Id</th>
															<th scope="col">Paid Amount</th>
															<th scope="col">Payment Status</th>
														</tr>
														<tbody>


														</tbody>
													</table>
												</div>
											</div>
										</div>


									</div>

									<div id="sectionD" class="tab-pane fade">
										<div class="filter_div doc_fil">
											<h3>Pharmacy payment</h3>
											<div class="row">
												<div class="col-md-4 col-sm-4">

													<input type="text" id="pharmacyPayFormDate"
														name="pharmacyPayFormDate" class="datepicker myInput"
														onkeyup="myFunction()" placeholder="From Date"
														title="Type in a name">
												</div>
												<div class="col-md-4 col-sm-4">
													<input type="text" id="pharmacyPayToDate"
														name="pharmacyPayToDate" class="datepicker myInput"
														onkeyup="myFunction()" placeholder="To Date"
														title="Type in a name">
												</div>
												<div class="col-md-4 col-sm-4">
													<p class="text-center">
														<a href="#" class="sub_anch"><input class="btn-fr-all"
															type="button" value="Search"
															onclick="getPharmacyPaymentDetails()"></a>

													</p>
												</div>
											</div>

										</div>
										<div class="clearfix"></div>
										<hr>
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="table-responsive">
													<table width="100" border="1" id="myTable25">
														<tr>
															<th scope="col">Sr.no</th>
															<th scope="col">Txn Date</th>
															<th scope="col">Pharmacy Name</th>
															<th scope="col">Txn Id</th>
															<th scope="col">Order Id</th>
															<th scope="col">Amount</th>
															<th scope="col">Payment Status</th>
														</tr>
														<tbody>

														</tbody>
													</table>
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
		</div>
	</div>
	</section>

	<div class="clearfix"></div>
	<jsp:include page="../../include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
	<script type="text/javascript">
		function showLoader() {
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;
			var patientId = document.getElementById("patientId").value;
			var x = new Date(fromDate);
			var y = new Date(toDate);

		}
	</script>
	<script type="text/javascript">
		/* $(".datepicker").datepicker({
		  dateFormat: "yy-mm-dd",
		  minDate: 0,
		  autoclose: true
		}); */
		$(".datepicker").datepicker({
			format : "dd-mm-yyyy",
			autoclose : true
		});
	</script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>
	<script type="text/javascript">
		function getPatientSubscription() {

			var patientId = document.getElementById("patientId").value;
			var fromDate = document.getElementById("consultPayFormDate").value;

			$('#myTable23 td').remove();
			$.getJSON('${getPatientSubscriptionPaymentDetailsByPatientId}', {
				patientId : patientId,

				ajax : 'true'
			}, function(data) {

				//	alert(data);

				var tr = $('<tr></tr>');

				tr.append($('<td></td>').html(1));

				tr.append($('<td></td>').html(data.paymentDate));
				tr.append($('<td></td>').html(data.txnId));
				tr.append($('<td></td>').html(data.orderId));

				tr.append($('<td></td>').html(data.amount));

				if (data.status == 1)
					tr.append($('<td></td>').html('Success'));
				else if (data.status == 6)
					tr.append($('<td></td>').html('Pending'));
				else
					tr.append($('<td></td>').html('Failed'));

				$('#myTable23').append(tr);

			});

		}

		function getConsultPaymentDetails() {

			var patientId = document.getElementById("patientId").value;
			var fromDate = document.getElementById("consultPayFormDate").value;
			var toDate = document.getElementById("consultPayToDate").value;
			$('#myTable22 td').remove();
			$.getJSON('${getConsultingPaymentDetailsByPatientId}', {
				patientId : patientId,
				toDate : toDate,
				fromDate : fromDate,
				ajax : 'true'
			}, function(data) {

				//	alert(data);

				$.each(data, function(key, consultList) {

					var tr = $('<tr></tr>');

					tr.append($('<td></td>').html(key + 1));

					tr.append($('<td></td>').html(consultList.paymentDate));
					tr.append($('<td></td>').html(consultList.doctorName));
					tr.append($('<td></td>').html(consultList.txnId));
					tr.append($('<td></td>').html(consultList.orderId));

					tr.append($('<td></td>').html(consultList.amount));
					if (consultList.paymentStatus == 1)
						tr.append($('<td></td>').html('Success'));
					else if (consultList.paymentStatus == 6)
						tr.append($('<td></td>').html('Pending'));
					else
						tr.append($('<td></td>').html('Failed'));

					$('#myTable22').append(tr);
				})

			});

		}

		function getPharmacyPaymentDetails() {
			var patientId = document.getElementById("patientId").value;

			var fromDate = document.getElementById("pharmacyPayFormDate").value;
			var toDate = document.getElementById("pharmacyPayToDate").value;
			$('#myTable25 td').remove();
			$.getJSON('${getPharmacyPaymentDetailsByPatientId}', {
				patientId : patientId,
				toDate : toDate,
				fromDate : fromDate,
				ajax : 'true'
			}, function(data) {

				//	alert(data);

				$.each(data, function(key, list) {

					var tr = $('<tr></tr>');

					tr.append($('<td></td>').html(key + 1));

					tr.append($('<td></td>').html(list.paymentDate));
					tr.append($('<td></td>').html(list.medicalName));
					tr.append($('<td></td>').html(list.txnId));
					tr.append($('<td></td>').html(list.orderId));
					tr.append($('<td></td>').html(list.totalAmt));

					if (list.paymentStatus == 1)
						tr.append($('<td></td>').html('Success'));
					else if (list.paymentStatus == 6)
						tr.append($('<td></td>').html('Pending'));
					else
						tr.append($('<td></td>').html('Failed'));

					$('#myTable25').append(tr);
				})

			});

		}

		function getLabPaymentDetails() {

			var patientId = document.getElementById("patientId").value;
			var fromDate = document.getElementById("labPayFormDate").value;
			var toDate = document.getElementById("labPayToDate").value;
			$('#myTable24 td').remove();
			$.getJSON('${getLabPaymentDetailsByPatientId}', {
				patientId : patientId,
				toDate : toDate,
				fromDate : fromDate,
				ajax : 'true'
			}, function(data) {

				//	alert(data);

				$.each(data, function(key, list) {

					var tr = $('<tr></tr>');

					tr.append($('<td></td>').html(key + 1));

					tr.append($('<td></td>').html(list.paymentDate));
					tr.append($('<td></td>').html(list.labName));
					tr.append($('<td></td>').html(list.txnId));
					tr.append($('<td></td>').html(list.orderId));

					tr.append($('<td></td>').html(list.amount));
					if (list.paymentStatus == 1)
						tr.append($('<td></td>').html('Success'));
					else if (list.paymentStatus == 6)
						tr.append($('<td></td>').html('Pending'));
					else
						tr.append($('<td></td>').html('Failed'));

					$('#myTable24').append(tr);
				})

			});

		}
	</script>
</body>
</html>