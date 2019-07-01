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
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">

</head>
<body>
	<jsp:include page="../include/pharmacyHeader.jsp" />



	<c:url var="getPrescriptionDetailsForOrder"
		value="/getPrescriptionDetailsForOrder" />
	<c:url var="getPrescriptionDetailsForInvoice"
		value="/getPrescriptionDetailsForInvoice" />

	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>History</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/pharmacyLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content active">
						<div class="filter_div labhistory ">
							<div class="col-md-12 col-sm-12">
								<h3>View Orders History</h3>
							</div>
							<form
								action="${pageContext.request.contextPath}/showPharmacyOrderHistory"
								method="GET">
								<div class="col-sm-5">
									<label>From Date</label> <input type="text" name="fromDate"
										id="startdate" placeholder="from Date" readonly
										class="datepicker" value="${fromDate}">
								</div>
								<div class="col-sm-5">
									<label>To Date</label> <input type="text" name="toDate"
										id="enddate" placeholder="to Date" readonly class="datepicker"
										value="${toDate}">
								</div>

								<div class="col-sm-2">
									<input type="submit" class="btn-fr-all" value="search">
								</div>
							</form>
						</div>
						<div class="clearfix"></div>
						<hr>

						<div class="loader2"></div>

						<div class="clearfix"></div>
						<c:forEach items="${getMedicalOrderDetailsList}"
							var="getMedicalOrderDetails" varStatus="count">
							<div class="pharmacy_ord">

								<div id="pharmacy_ord">


									<div class="pat_name">
										<p class="text-center pat_detl">Patient Details</p>
										<h3>
											patient Name : <span>${getMedicalOrderDetails.patientName}</span>
										</h3>
										<h3>
											<strong>Address</strong> : <span>${getMedicalOrderDetails.address}</span>
										</h3>
										<h3>
											<strong>Contact :</strong><span>
												${getMedicalOrderDetails.patientContact}</span>
										</h3>
										<h3>
											<strong>Total Bill :</strong> <span>${getMedicalOrderDetails.totalAmt}/-</span>
										</h3>
										<h3>
											<a href="#" data-toggle="modal" data-target="#largeModal"
												onclick="getPrescriptionDetails(${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.doctorName}','${getMedicalOrderDetails.doctorContact}','${getMedicalOrderDetails.totalAmt}')"><span
												class="scheduleInfo"> <img class="rx_image"
													src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg"
													width="24" height:24px alt="Rx_image"></span>View
												Prescription</a>
										</h3>
										<h3>
											<a href="#" onclick="getPrescriptionDetailsForInvoice(${getMedicalOrderDetails.requestToMedicalId},${getMedicalOrderDetails.totalAmt});" data-toggle="modal" data-target="#invoice1">
												<span class="icon-prescription-1"> </span>View Invoice
											</a>

										</h3>

										<h4 class="text-right">
											Order Id :<strong>${getMedicalOrderDetails.requestToMedicalId}</strong>
										</h4>
										<c:choose>
											<c:when test="${getMedicalOrderDetails.deliveryType==0}">
												<h4 class="text-right">
													Delivery Status :<strong> Home Delivery</strong>
												</h4>
											</c:when>
											<c:otherwise>
												<h4 class="text-right">
													Delivery Status :<strong> Collect from Store </strong>
												</h4>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${getMedicalOrderDetails.paymentStatus==0}">
												<h4 class="text-right">
													<strong>Payment Failed</strong>
												</h4>
											</c:when>
											<c:otherwise>
												<h4 class="text-right">
													<strong>Payment successful</strong>
												</h4>

											</c:otherwise>
										</c:choose>

										<%-- <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" class="btn-fr-all" value="send" onclick="paidStatus(${completedPrescription.patientRequestToMedicalId})">yes</h4> --%>

										<%-- <h4 class="text-right"><strong> Delivered?:</strong> <input type="radio" onclick="deliverdStatus(${completedPrescription.patientRequestToMedicalId})" class="btn-fr-all" value="send" >yes</h4> --%>
										<h4 class="text-right">
											<strong>Delivered successful</strong>
										</h4>

										<h4 class="text-right">


											<strong>Date :</strong>${getMedicalOrderDetails.orderDate}</h4>
									</div>

								</div>
							</div>

						</c:forEach>
						<c:forEach items="${getMedicalOrderDetailsList1}"
							var="getMedicalOrderDetails" varStatus="count">
							<div class="pharmacy_ord">

								<div id="pharmacy_ord">


									<div class="pat_name">
										<p class="text-center pat_detl">Patient Details</p>
										<h3>
											patient Name : <span>${getMedicalOrderDetails.patientName}</span>
										</h3>
										<h3>
											<strong>Address</strong> : <span>${getMedicalOrderDetails.address}</span>
										</h3>
										<h3>
											<strong>Contact :</strong><span>
												${getMedicalOrderDetails.patientContact}</span>
										</h3>
										<h3>
											<strong>Total Bill :</strong> <span>${getMedicalOrderDetails.totalAmt}/-</span>
										</h3>

										<h3>
											<a href="#" data-toggle="modal" data-target="#largeModal1"
												onclick="getPrescriptionImage(${getMedicalOrderDetails.patientId},${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.string1}',${getMedicalOrderDetails.totalAmt})">
												<span class="scheduleInfo"> <img
													src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg"
													class="rx_image" width="24" height="24px" alt="Rx_image"></span>
												View Prescription
											</a>
										</h3>
										<h3>

											<a href="#"
												<%-- href="${pageContext.request.contextPath}/showUploadedPrescriptionMedicineBillToPharmacy/${getMedicalOrderDetails.requestToMedicalId}" --%> data-toggle="modal"
												data-target="#invoice2"> <span
												class="icon-prescription-1" class="icon-prescription-1"
												data-original-title="Medicine Invoice"> </span>View Invoice
											</a>

										</h3>

										<h4 class="text-right">
											Order Id :<strong>${getMedicalOrderDetails.requestToMedicalId}</strong>
										</h4>
										<c:choose>
											<c:when test="${getMedicalOrderDetails.deliveryType==0}">
												<h4 class="text-right">
													Delivery Status :<strong> Home Delivery</strong>
												</h4>
											</c:when>
											<c:otherwise>
												<h4 class="text-right">
													Delivery Status :<strong> Collect from Store </strong>
												</h4>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${getMedicalOrderDetails.paymentStatus==0}">
												<h4 class="text-right">
													<strong>Payment Failed</strong>
												</h4>
											</c:when>
											<c:otherwise>
												<h4 class="text-right">
													<strong>Payment successful</strong>
												</h4>

											</c:otherwise>
										</c:choose>

										<%-- <h4 class="text-right"><strong> Paid?:</strong> <input type="radio" class="btn-fr-all" value="send" onclick="paidStatus(${completedPrescription.patientRequestToMedicalId})">yes</h4> --%>

										<%-- <h4 class="text-right"><strong> Delivered?:</strong> <input type="radio" onclick="deliverdStatus(${completedPrescription.patientRequestToMedicalId})" class="btn-fr-all" value="send" >yes</h4> --%>
										<h4 class="text-right">
											<strong>Delivered successful</strong>
										</h4>

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




	<div id="largeModal"
		class="modal fade bs-example-modal-lg reportsDesign" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<div class="modal-body card_sec" id="displayTable">
					<a onclick="printTable()"><span
						class="icon-printer down-icon-modal"></span></a>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<hr>
					<h4 class="modal-title" id="hospitalName"></h4>
					<h5 class="text-right">
						<strong>Doctor Name : </strong> <span id="docName"> </span>
					</h5>

					<h5 class="text-right">
						<strong>Contact No. :</strong> <span id="docContact"></span>
					</h5>
					<div class="circle1">
						<i class="fa fa-list-ul" aria-hidden="true"></i>
					</div>
					<hr>
					<div class="pat_name text-center">
						<div class="row">
							<div class="col-sm-10 modal-pric-details"></div>

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

	<div id="largeModal1"
		class="modal fade bs-example-modal-lg reportsDesign" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<form
					action="${pageContext.request.contextPath}/confirmUploadedPrescriptionMedicalOrder"
					method="POST"
					onsubmit="return confirm('Are you sure submit order?')">

					<div class="modal-body carousel1 card_sec" id="displayTable">
						<a onclick="printTable()"><span
							class="icon-printer down-icon-modal"></span></a>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<hr>
						<h4 class="modal-title">Hospital Name</h4>
						<h5 class="text-right">
							<strong>Doctor Name : </strong> <span id="docName"> </span>
						</h5>
						<!-- <h5><strong>Hospital Name :</strong> <span> Surya Multispaclity Hospital </span></h5> -->
						<h5 class="text-right">
							<strong>Contact No. :</strong> <span id="docContact"></span>
						</h5>
						<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<hr>
						<div id="myCarousel" class="carousel carousel-fade slide"
							data-ride="carousel">
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
						<p class="text-center">
							<label>Total Amount</label> <input type="text" name="totAmount"
								id="totAmount" placeholder="Enter total Amount...."
								class="prescAmt" readonly>
						</p>
						<hr>
						<div class="signB">
							Signature: <img
								src="${pageContext.request.contextPath}/resources/images/sign.png"
								class="img-responsive img-center">
						</div>
						<p class="text-center medicine-order">
							<input type="submit" class="btn-fr-all" value="send">
						</p>

					</div>
					<input type="hidden" id="requestId" name="requestId">

				</form>
			</div>
		</div>
	</div>

	<div id="invoice1" class="modal fade bs-example-modal-lg reportsDesign"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<div class="modal-body card_sec" id="displayTable">
					<a onclick="printTable()"><span
						class="icon-printer down-icon-modal"></span></a>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<hr>
					<h4 class="modal-title" id="medicalName"></h4>
					<h5 class="text-right">
						<strong>Address : </strong> <span id="mediclaAddress"> </span>
					</h5>

					<h5 class="text-right">
						<strong>Contact No. :</strong> <span id="medicalContact"> </span>
					</h5>
					<h5 class="text-right">
						<strong>Email Id. :</strong> <span id="medicalEmail"> </span>
					</h5>

					<div class="circle1">
						<i class="fa fa-list-ul" aria-hidden="true"></i>
					</div>
					<hr>
					<div class="invoice overflow-auto">
						<div>
							<header>
							<div class="row">
								<div class="col">

									<a target="_blank"> <img
										src="${pageContext.request.contextPath}/resources/images/logo.png"
										data-holder-rendered="true" />
									</a>
								</div>
								<hr>

							</div>
							</header>
							<main>
							<div class="row contacts text-left">
								<div class="col-sm-6 invoice-to">
									<div class="text-gray-light">
										<strong>INVOICE TO:</strong>
									</div>
									<h4 class="to" id="patientName"></h4>

								</div>
								<div class="col-sm-6 invoice-details text-right">
									<div class="invoice-id">
										<strong>INVOICE: <span id="invoiceNo"></span></strong>
									</div>
									<h5 class="date">
										<span>Date of Invoice: <span id="invoiceDate"></span></span>
									</h5>
								</div>
							</div>
							<table border="0" cellspacing="0" cellpadding="0"
								id="invoiceTable">
								<thead>
									<tr>
										<th>SR.NO.</th>
										<th class="text-center">ITEM NAME</th>
										<th class="text-right">QTY</th>
										 
										<th class="right">TOTAL</th>
									</tr>
								</thead>

								<tbody>


								</tbody>
								<tfoot>
									<tr>
										<td colspan="1"></td>
										<td colspan="2">SUBTOTAL</td>
										<td><span id="invSubTotal"></span></td>
									</tr>

									<tr>
										<td colspan="1"></td>
										<td colspan="2">GRAND TOTAL</td>
										<td><span id="invGrandTotal"></span></td>
									</tr>
								</tfoot>
							</table>
							<br>
							<div class="thanks text-center">Thank you!</div>
							<br>
							<!-- <div class="notices">
		                    <div>NOTICE:</div>
		                    <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
		                </div> --> </main>
							<footer class="invoicefoot"> Invoice was created on a
							computer and is valid without the signature and sealff. </footer>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="invoice2" class="modal fade bs-example-modal-lg reportsDesign"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<div class="modal-body card_sec" id="displayTable">
					<a onclick="printTable()"><span
						class="icon-printer down-icon-modal"></span></a>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<hr>
					<h4 class="modal-title">Bio pharma</h4>
					<h5 class="text-right">
						<strong>Address : </strong> <span>Nasalapur,Nashik,Maharashtra
						</span>
					</h5>
					<!-- <h5><strong>Hospital Name :</strong> <span> Surya Multispaclity Hospital </span></h5> -->
					<h5 class="text-right">
						<strong>Contact No. :</strong> <span>7276757346</span>
					</h5>
					<h5 class="text-right">
						<strong>Email Id. :</strong> <span>gpagar33@gmail.com</span>
					</h5>

					<div class="circle1">
						<i class="fa fa-list-ul" aria-hidden="true"></i>
					</div>
					<hr>
					<div class="invoice overflow-auto">
						<div>
							<header>
							<div class="row">
								<div class="col">
									<a target="_blank"> <img
										src="${pageContext.request.contextPath}/resources/images/logo.png"
										data-holder-rendered="true" />
									</a>
								</div>
								<div class="col company-details">
									<h2 class="name">
										<a target="_blank"> ${getMedicalOrderDetails.medicalName}
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
								<div class="col-sm-6 invoice-to">
									<div class="text-gray-light">
										<strong>INVOICE TO:</strong>
									</div>
									<h4 class="to">${getMedicalOrderDetails.patientName}</h4>
									<!--  <div class="email"><a >ganesh@example.com</a></div> -->
								</div>
								<div class="col-sm-6 invoice-details text-right">
									<div class="invoice-id">
										<strong>INVOICE
											${getMedicalOrderDetails.requestToMedicalId}</strong>
									</div>
									<div class="date">
										<span>Date of Invoice:
											${getMedicalOrderDetails.paymentDate}</span>
									</div>
								</div>
							</div>

							<div class="carousel1" id="displayTable">
								<div id="myCarousel" class="carousel carousel-fade slide"
									data-ride="carousel">
									<div class="carousel-inner" role="listbox">


										<div id="prescriptionImage">
											<a class="example-image-link"
												href="http://lokeshdhakar.com/projects/lightbox2/images/image-1.jpg"
												data-lightbox="example-1"><img class="example-image"
												src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-1.jpg"
												alt="image-1" /></a> <a class="example-image-link"
												href="http://lokeshdhakar.com/projects/lightbox2/images/image-2.jpg"
												data-lightbox="example-2" data-title="Optional caption."><img
												class="example-image"
												src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-2.jpg"
												alt="image-1" /></a>
											<c:forEach items="${prescriptions}" var="prescriptions">

												<a class="example-image-link" href="${prescriptions}"
													data-lightbox="example-1"><p class="text-center">
														<img class="example-image invoiceimg"
															src="${prescriptions}" alt="image-1" />
													</p></a>
											</c:forEach>

										</div>
									</div>

								</div>
								<div class="pat_name text-center">
									<%-- <img src="http://104.238.116.176:8080/images/patient/${patientDetailList.patientId}/prescription/${patientDetailList.prescriptionName}" class="img-responsive prescrptimg" alt="prescription"> --%>
								</div>
								<hr>
								<p class="text-center">
									<label>Total Amount</label> <input type="text" name="totAmount"
										id="totAmount" value="${getMedicalOrderDetails.totalAmt}"
										class="prescAmt">
								</p>
							</div>


							<div class="clearfix"></div>
							<br>
							<div class="thanks text-center">Thank you!</div>
							<br>
							<!-- <div class="notices">
		                    <div>NOTICE:</div>
		                    <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
		                </div> --> </main>
							<footer class="invoicefoot"> Invoice was created on a
							computer and is valid without the signature and seal. </footer>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
	<!-- Modal -->
	<div class="modal fade pharmacy_ord" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

					<img
						src="${pageContext.request.contextPath}/resources/images/camera.png"
						alt="prescription">

				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
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

	<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>

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


function getPrescriptionDetailsForInvoice(requestId,totAmt)
{
	   
 
	 $('#invoiceTable tbody tr').remove();
	 $
		.getJSON(
				'${getPrescriptionDetailsForInvoice}',
				{
					requestId : requestId,
					
					ajax : 'true'
				},
				function(data) {
					 
					 $("#medicalName").text(data.medicalName);
					 $("#mediclaAddress").text(data.address);
					 $("#medicalContact").text(data.contact);
					 $("#medicalEmail").text(data.email);
					 $("#patientName").text(data.patientName);
					 $("#invoiceNo").text(requestId);
					 $("#invoiceDate").text(data.invoiceDate);
					 $("#invSubTotal").text(totAmt);
					 $("#invGrandTotal").text(totAmt);
					 
		              
		                
		                        
					 
					$.each(
							data.getPrescriptionDetailsForOrderList,
								function(key, prescriptionList) {
								//alert(prescriptionList.medicineName);
								var tr = $('<tr></tr>');
								
						 		tr.append($('<td></td>').html(key+1));  
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.quantity));
								 
								 
								tr.append($('<td></td>').html(prescriptionList.price+'/-'));
								 
					
								$('#invoiceTable tbody').append(tr);
							})	
							
							
				});
	 //getPrescriptionDetailsForOrder
	 
	 
}


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