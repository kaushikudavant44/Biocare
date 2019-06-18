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
<link
	href="${pageContext.request.contextPath}/resources/css/videoCall2.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css
/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />

<link rel="stylesheet"
	href=${pageContext.request.contextPath}/resources/css/prescription.css>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>


	<div>
		<div role="document">

			<div id="printableArea">

				<div>

					<a href="#" onclick="printDiv('printableArea')"><span
						class="icon-printer right-specing"></span></a>
					<div class="clearfix"></div>

				</div>
				<div>

					<div id="invoice">

						<div class="invoice overflow-auto">
							<div class="prescptPrnt">
								<header>
								<div class="row">
									<div class="col">
										<a target="_blank" class="logoimg"> <img
											src="${pageContext.request.contextPath}/resources/images/logo.png"
											data-holder-rendered="true" class="img-responsive" />
										</a>
									</div>
									<div class="col company-details">
										<h2 class="name">
											<a target="_blank"> <img
												src="${pageContext.request.contextPath}/resources/images/dr.png"
												data-holder-rendered="true" height="42" width="42" />
												<div id="drName">${consultingDetails.doctorName}</div>
											</a>
											<div id="drQual">${consultingDetails.qualification}</div>
											
										</h2>

										<br>
										<div id="drQual">${consultingDetails.date}</div>
										<div id="hosp">${consultingDetails.hospitalName}</div>
										<div id="drMob">${consultingDetails.contactNo}</div>

									</div>
								</div>
								</header>

								<h1></h1>

								<main>
								<div class="row contacts">
									<div class="col invoice-to">

										<span style="font-size: 30px;">&#8478;</span>


										<h2 class="to" id="patName">${consultingDetails.patientName}</h2>
									</div>

								</div>


								<div>
									<div class="table-responsive">
										<div class="content" id="content">


											<table width="100%" border="1"
												class="tbl table table-bordered table table-hover"
												id="prescTable">
												<tbody>
													<tr align="center">
														<th>Sr.No</th>
														<th>Medicine</th>
														<th>quantity</th>
														<th>Instructions</th>
														<th>Timing</th>
													</tr>
													<c:forEach items="${prescriptionDetails}" var="prescriptionDetails" varStatus="count">
														<td>${count.index+1}</td>
														<td>${prescriptionDetails.medicineName}</td>
														<td>${prescriptionDetails.medicineQuantity}</td>
														<td>${prescriptionDetails.medicineInstruction}</td>
														<td>${prescriptionDetails.medicineTiming}</td>
													
													</c:forEach>
												</tbody>
											</table>

										</div>
									</div>
								</div>

								</main>

								<img id="sign" alt="sign" align="right" height="30" width="45" src="${consultingDetails.signature}"/>
								<h1></h1>
								<div style="text-align: center;" id="drHospAdd"></div>



							</div>
							<div></div>

						</div>
					</div>
				</div>



			</div>
		</div>
	</div>
	<!--Doctor Payment  -->

</body>
</html>