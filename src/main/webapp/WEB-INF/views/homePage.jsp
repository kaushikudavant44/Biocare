<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="matx no-js">
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
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/mqtt/mqttcallback.js"
	type="text/javascript"></script>
<script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
            //document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
 </script>
</head>
<!--  <body onload="callMe()"> -->
<body onload="callMe()">
	<c:url var="usernameValidation" value="/usernameValidation" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
	<c:url var="getStateByCountryId" value="/getStateByCountryId" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
	<c:url var="loginProcess" value="/loginProcess" />
	<%-- <c:url var="patientLoginProcess" value="/patientLoginProcess" /> --%>
	<div class="clearfix"></div>
	<c:choose>
		<c:when test="${sessionScope.patientDetails.patientId>0}">
			<jsp:include page="include/patientHeader.jsp" />
		</c:when>
		<c:when test="${sessionScope.doctorDetails.doctorId>0}">
			<jsp:include page="include/doctorHeader.jsp" />
		</c:when>
		<c:when test="${sessionScope.labDetails.labId>0}">
			<jsp:include page="include/labHeader.jsp" />
		</c:when>
		<c:when test="${sessionScope.medicalDetails.medicalId>0}">
			<jsp:include page="include/pharmacyHeader.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="include/homeHeader.jsp" />
		</c:otherwise>
	</c:choose>
	<div class="clearfix"></div>
	<div class="header">
		<!-- Carousel================================================== -->
		<div id="myCarousel" class="carousel carousel-fade slide"
			data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<%--<div class="item active"><iframe src="https://www.youtube-nocookie.com/embed/Bi8ikmo1pMI?rel=0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
     </div>--%>
				<div class="item active">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/banner1.jpg"
						alt="health care">
				</div>
				<div class="item">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/banner2.jpg"
						alt="health care">
				</div>
				<div class="item">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/banner3.jpg"
						alt="health care">
				</div>
				<div class="item">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/banner4.jpg"
						alt="health care">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->
	</div>
	<div class="clearfix"></div>

	<!-- ads -->

	<div id="stickytypeheader">
		<div class="ad-bg">
			<!-- <input type="submit" name="submit" value="Submit" onClick="PopUp('hide')" /> -->
			<div class="alert-close">
				<span class="closed-button" aria-hidden="true">×</span>
			</div>
			<%-- <img src="${pageContext.request.contextPath}/resources/images/ads-img.jpg" class="img-responsive" alt="ads img"> --%>
			<!-- <img  ismap=""  src="https://secure.img-cdn.mediaplex.com/0/10599/247540/728x90.jpg?mpqs=&amp;mpssl=1&amp;mpvc="> -->

			<div id="myCarousel1" class="carousel carousel-fade slide"
				data-ride="carousel" data-interval="2000">
				<div class="carousel-inner" role="listbox">
					<%--<div class="item active"><iframe src="https://www.youtube-nocookie.com/embed/Bi8ikmo1pMI?rel=0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
     </div>--%>
					 <c:forEach items="${advertiseDetailsList}" var="advertiseDetails" varStatus="count">
   <c:set var="act" value=""/>
   <c:if test="${count.index==0}">
   <c:set var="act" value="active"/>
   </c:if>
					<div class="item ${act}">
						<img ismap=""
							src="${advertiseUrl}${advertiseDetails.fileName}">
					</div>
					 </c:forEach>
					<%-- <div class="item"> <img src="${pageContext.request.contextPath}/resources/images/ads-img3.jpg" class="img-responsive" alt="ads img"> </div>  --%>

				</div>

			</div>
		</div>
	</div>

	<div id="sticky"></div>



	<!-- ads -->

	<section class="abt_bionische" id="about">

	<div class="container">
		<ul class="imp_links">
			<c:choose>
				<c:when test="${sessionScope.patientDetails.patientId>0}">
					<a href='${pageContext.request.contextPath}/showPatienReportPage' class="wow zoomIn" data-wow-delay="0.4s" data-wow-duration="4s"><li
						class="last_li"><span class="icon-newspaper"></span><br>
							Reports</li></a>
					<a href='${pageContext.request.contextPath}/showBookAppointment' class="wow zoomIn" data-wow-delay="0.4s" data-wow-duration="4s"><li><span
							class="icon-calendar-page"></span><br> Book Appointment</li></a>
					<a href='${pageContext.request.contextPath}/showBookAppointment' class="wow zoomIn" data-wow-delay="0.4s" data-wow-duration="4s"><li><span
							class="icon-experiment"></span><br> Lab Test</li></a>
					<a href='${pageContext.request.contextPath}/showOrderMedicinePage' class="wow zoomIn" data-wow-delay="0.4s" data-wow-duration="4s"><li><span
							class="icon-pills"></span><br> Order Medicines</li></a>
					<a href='${pageContext.request.contextPath}/showConsultinghome' class="wow zoomIn" data-wow-delay="0.4s" data-wow-duration="4s"><li><span
							class="icon-male-consultant"></span><br> Online Counsulting</li></a>

				</c:when>

				<c:otherwise>
					<a onclick="openLoginModal(1)"><li class="last_li wow zoomIn" data-wow-delay="0.3s" data-wow-duration="3s"><span
							class="icon-newspaper"></span><br> Reports</li></a>
					<a onclick="openLoginModal(2)"><li class="wow zoomIn" data-wow-delay="0.3s" data-wow-duration="3s"><span
							class="icon-calendar-page"></span><br> Book Appointment</li></a>
					<a href='${pageContext.request.contextPath}/showLabtest'><li class="wow zoomIn" data-wow-delay="0.3s" data-wow-duration="3s"><span
							class="icon-experiment"></span><br> Lab Test</li></a>
					<a href='${pageContext.request.contextPath}/showHomeOrderMedicine'><li class="wow zoomIn" data-wow-delay="0.3s" data-wow-duration="3s"><span
							class="icon-pills"></span><br> Order Medicines</li></a>
					<a href='${pageContext.request.contextPath}/showConsultinghome'><li class="wow zoomIn" data-wow-delay="0.3s" data-wow-duration="3s"><span
							class="icon-male-consultant"></span><br> Online Counsulting</li></a>
				</c:otherwise>
			</c:choose>
		</ul>


		<div class="clearfix"></div>
<%-- <div id="myCarousel1" class="carousel carousel-fade slide"
		data-ride="carousel" data-wrap="true" data-interval="2000"
		data-pause="false">
		<div class="carousel-inner" role="listbox">

			<c:forEach items="${advertiseDetailsList}" var="advertiseDetails"
				varStatus="count">
				<c:set var="act" value="" />
				<c:if test="${count.index==0}">
					<c:set var="act" value="active" />
				</c:if>
				<div class="item ${act}">
					<img class="first-slide"
						src="${advertiseUrl}${advertiseDetails.fileName}"
						class="img-responsive" alt="advertisement">
				</div>

			</c:forEach>
		</div>
	</div> --%>
		<img
			src="${pageContext.request.contextPath}/resources/images/abt_img2.jpg"
			class="img-responsive wow fadeInRight" data-wow-delay="0.3s" data-wow-duration="3s" alt="health care">
		<h3 class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">About</h3>
		<h2 class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">Biocare</h2>
		<p class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="2s">Biocare develops Enterprise Healthcare Solutions to deliver
			sophisticated clinical management and enhanced patient care. Our
			solutions are aimed at providing scalable and secure Healthcare
			Application Development to sustain patient satisfaction and medical
			compliance. Biocare allows users to make informed healthcare
			decisions through real-time data on the fly.</p>
		<p class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="2.5s">Our in-depth knowledge and expertise with digital healthcare
			technologies makes us unique as we integrate digitization at all
			levels of the healthcare ecosystem. As a "digital-first" company, we
			focus on mobile solutions that create better healthcare outcomes. As
			a feature-rich app, Biocare renders users with exceptional
			efficiency, faster access to accurate information, integration with
			other platforms, & real-time communication.</p>
		<div class="iboardSec" id="iboard">
			<div class="row">
				<div class="col-sm-8">
					<h5>About Our Product</h5>
					<h4>I Board</h4>
				</div>
				<div class="col-sm-4 text-right">
					<a class="btn-fr-all" data-toggle="collapse" data-target="#iboardImg">Click Here</a>
				</div>
			</div>
		</div>
	</div>
				<div id="iboardImg" class="collapse">
				<div class="container">
				   <div id="myCarousel2" class="carousel carousel-fade slide"
			data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/iboardbg1.jpg"
						alt="health care">
						<!-- <div class="carousel-caption">
					        <h3>Used for Pregnancy</h3>
					        <p>Coming Soon.....</p>
					      </div> -->
				</div>
				<div class="item">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/iboardbg2.jpg"
						alt="health care">
						<!-- <div class="carousel-caption">
					        <h3>Used for Pregnancy</h3>
					        <p>Coming Soon.....</p>
					      </div> -->
				</div>
				<div class="item">
					<img class="first-slide"
						src="${pageContext.request.contextPath}/resources/images/iboardbg.jpg"
						alt="health care">
						<!-- <div class="carousel-caption">
					        <h3>Used for Pregnancy</h3>
					        <p>Coming Soon.....</p>
					      </div> -->
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel2" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel2" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		</div>
				  </div>
	</section>

	<section class="abt_bionische app-disp">

	<ul class="imp_links">
		<c:choose>
			<c:when test="${sessionScope.patientDetails.patientId>0}">
				<a href='${pageContext.request.contextPath}/showPatienReportPage'><li
					class="last_li"><span class="icon-newspaper"></span><br>
						Reports</li></a>
				<a href='${pageContext.request.contextPath}/showBookAppointment'><li><span
						class="icon-calendar-page"></span><br> Book Appointment</li></a>
				<a href='${pageContext.request.contextPath}/showBookAppointment'><li><span
						class="icon-experiment"></span><br> Lab Test</li></a>
				<a href='${pageContext.request.contextPath}/showOrderMedicinePage'><li><span
						class="icon-pills"></span><br> Order Medicines</li></a>
				<a href='${pageContext.request.contextPath}/showConsultinghome'><li><span
						class="icon-male-consultant"></span><br> Online Counsulting</li></a>

			</c:when>

			<c:otherwise>
				<a onclick="openLoginModal(1)"><li class="last_li"><span
						class="icon-newspaper"></span><br> Reports</li></a>
				<a onclick="openLoginModal(2)"><li><span
						class="icon-calendar-page"></span><br> Book Appointment</li></a>
				<a href='${pageContext.request.contextPath}/showLabtest'><li><span
						class="icon-experiment"></span><br> Lab Test</li></a>
				<a href='${pageContext.request.contextPath}/showHomeOrderMedicine'><li><span
						class="icon-pills"></span><br> Order Medicines</li></a>
				<a href='${pageContext.request.contextPath}/showConsultinghome'><li><span
						class="icon-male-consultant"></span><br> Online Counsulting</li></a>
			</c:otherwise>
		</c:choose>
	</ul>
	<div class="clearfix"></div>
	
	<div class="container">
		<img
			src="${pageContext.request.contextPath}/resources/images/abt_img2.jpg"
			class="img-responsive" alt="health care">
		<h3>About</h3>
		<h2>Biocare</h2>
		<p>Biocare develops Enterprise Healthcare Solutions to deliver
			sophisticated clinical management and enhanced patient care. Our
			solutions are aimed at providing scalable and secure Healthcare
			Application Development to sustain patient satisfaction and medical
			compliance. Biocare allows users to make informed healthcare
			decisions through real-time data on the fly.</p>
		<p class="displyN">Our in-depth knowledge and expertise with
			digital healthcare technologies makes us unique as we integrate
			digitization at all levels of the healthcare ecosystem. As a
			"digital-first" company, we focus on mobile solutions that create
			better healthcare outcomes. As a feature-rich app, Biocare renders
			users with exceptional efficiency, faster access to accurate
			information, integration with other platforms, & real-time
			communication.</p>

	</div>
	</section>
	<section class="doc_appoint" id="appoint">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 text-left">
				<h3 class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">Instant appointment</h3>
				<h2 class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">with doctors</h2>
				<ul class="list_doc">
					<li class="wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">Improved Health Outcomes through real-time
						patient-provider collaboration.</li>
					<li class="wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="1.5s">Enhanced Employee Productivity and Satisfaction.</li>
					<li class="wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="2s">Comprehensive Facilities Management Solutions.</li>
					<li class="wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="2.5s">Simultaneous Monitoring and Reporting.</li>
					<li class="wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="3s">End-to-End connectivity for Doctors and Patients.</li>
					<li class="wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="3.5s">Remote Healthcare Technology.</li>
				</ul>
				<div class="space_btw"></div>
				<a href="#" class="btn-fr-all" onclick="getDoctorList()">Find
					Right Doctor</a>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>

	</section>
	<section class="doc_appoint app-disp">
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-9 text-left">
				<h3>Instant appointment</h3>
				<h2>with doctors</h2>
				<ul class="list_doc">
					<li>Improved Health Outcomes through real-time
						patient-provider collaboration.</li>
					<li>Enhanced Employee Productivity and Satisfaction.</li>
					<li>Comprehensive Facilities Management Solutions.</li>
					<li>Simultaneous Monitoring and Reporting.</li>
					<li>End-to-End connectivity for Doctors and Patients.</li>
					<li>Remote Healthcare Technology.</li>
				</ul>
				<div class="space_btw"></div>
				<a href="#" class="btn-fr-all" onclick="getDoctorList()">Find
					Right Doctor</a>
			</div>
		</div>
	</div>

	</section>
	<section class="detlSection" id="health">
	<div class="container-fluid">
		<h3 class="text-center wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="2s">Biocare</h3>
		<h2 class="text-center wow fadeInUp" data-wow-delay="0.3s" data-wow-duration="3s">Healthcare Platform</h2>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="doc-tab"
				data-toggle="tab" href="#doctor" role="tab" aria-controls="contact"
				aria-selected="false"><span class="icon-doctor"></span> <br>Doctor</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="home-tab"
				data-toggle="tab" href="#patient" role="tab" aria-controls="patient"
				aria-selected="true"><span class="icon-doctor-1"></span><br>Patient</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#lab" role="tab" aria-controls="lab"
				aria-selected="false"><span class="icon-lab-microscope"></span><br>Lab</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#pharma" role="tab" aria-controls="pharmacy"
				aria-selected="false"><span class="icon-cross"></span><br>
					Pharmacy</a></li>
			<li class="nav-item"><a class="nav-link" id="hospital-tab"
				data-toggle="tab" href="#hospital" role="tab" aria-controls="hospital"
				aria-selected="false"><span class="icon-cross"></span><br>
					Hospital</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane active" id="doctor" role="tabpanel"
				aria-labelledby="doc-tab">
				<div class="container">
				<div class="row">
					<div class="col-sm-6 leftText">
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-calendar-page"></span>
							</div>
							<h4>Patient Appointments</h4>
							<p>Makes it easy for doctors to manage all the appointments.</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-calendar-with-a-clock-time-tools"></span>
							</div>
							<h4>Timing</h4>
							<p>Doctor can set their availability timing.</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-newspaper"></span>
							</div>
							<h4>Reports</h4>
							<p>Doctor can see or manage reports through mobile , system,
								tabs..etc</p>
						</div>
						<p>
							For more.....click on Login <a
								href="${pageContext.request.contextPath}/showDoctorLoginPage"
								class="btn-del pull-right">Login</a>
						</p>

					</div>
					
					<div class="col-sm-6">
						<img
							src="${pageContext.request.contextPath}/resources/images/docR.jpg"
							class="img-responsive wow zoomIn" data-wow-delay="0.1s" data-wow-duration="1s" alt="doc">
					</div>
				</div>
				</div>
			</div>
			<div class="tab-pane fade" id="patient" role="tabpanel"
				aria-labelledby="home-tab">
				<div class="container">
				<div class="row">
					<div class="col-sm-6 leftText">
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-calendar-page"></span>
							</div>
							<h4>Book Appointments</h4>
							<p>Patient can book appointment(lab or doctor) anytime ,
								anywhere</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-pills"></span>
							</div>
							<h4>Order Medicine</h4>
							<p>Patient can order medicine online</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-newspaper"></span>
							</div>
							<h4>Reports</h4>
							<p>Patient can see their reports and share with doctor too</p>
						</div>
						<p>
							For more.....click on Login <a
								href="${pageContext.request.contextPath}/showPatientLoginPage"
								class="btn-del pull-right">Login</a>
						</p>
					</div>
					
					<div class="col-sm-6">
						<img
							src="${pageContext.request.contextPath}/resources/images/patientR.jpg"
							class="img-responsive wow zoomIn" data-wow-delay="0.1s" data-wow-duration="1s" alt="doc">
					</div>
				</div>
				</div>
			</div>
			<div class="tab-pane fade" id="lab" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container">
				<div class="row">
					<div class="col-sm-6 leftText">
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-calendar-page"></span>
							</div>
							<h4>Book Appointments</h4>
							<p>Book tests and scans based on preferred cost, time,
								location and more</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="fa fa-search"></span>
							</div>
							<h4>Find Lab</h4>
							<p>Search from a wide network of renowned labs</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-newspaper"></span>
							</div>
							<h4>Reports</h4>
							<p>Manage reports through mobile , system,
								tabs..etc</p>
						</div>
						<p>
							For more.....click on Login <a
								href="${pageContext.request.contextPath}/showLabLoginPage"
								class="btn-del pull-right">Login</a>
						</p>
					</div>
					
					<div class="col-sm-6">
						<img
							src="${pageContext.request.contextPath}/resources/images/labR.jpg"
							class="img-responsive wow zoomIn" data-wow-delay="0.1s" data-wow-duration="1s" alt="doc">
					</div>
				</div>
				</div>
			</div>
			<div class="tab-pane fade" id="pharma" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="container">
					<div class="row">
					<div class="col-sm-6 leftText">
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-pills"></span>
							</div>
							<h4>Order Medicine</h4>
							<p>Patient can order online medicine through their prescription. </p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-calendar-with-a-clock-time-tools"></span>
							</div>
							<h4>Store Medical Records</h4>
							<p>Get your records whenever you want.</p>
						</div>
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-newspaper"></span>
							</div>
							<h4>Find Medical</h4>
							<p>Search pharmacies / medical near you.</p>
						</div>
						<p>
							For more.....click on Login <a
								href="${pageContext.request.contextPath}/showPharmacyLoginPage"
								class="btn-del pull-right">Login</a>
						</p>
					</div>
					
					<div class="col-sm-6">
						<img
							src="${pageContext.request.contextPath}/resources/images/pharmR.jpg"
							class="img-responsive wow zoomIn" data-wow-delay="0.1s" data-wow-duration="1s" alt="doc">
					</div>
				</div>
				</div>
			</div>
			<div class="tab-pane fade" id="hospital" role="tabpanel"
				aria-labelledby="hospital-tab">
				<div class="container">
				<div class="row">
					<div class="col-sm-6 leftText">
						<div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-newspaper"></span>
							</div>
							<h4>Hospital Management</h4>
							<p>Complete hospital management services.</p>
						</div>
						<!-- <div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-calendar-with-a-clock-time-tools"></span>
							</div>
							<h4>ffh</h4>
							<p>fgfgfh</p>
						</div> -->
						<!-- <div class="detlbox animate" data-animate="fadeInLeft">
							<div class="iconbk">
								<span class="icon-newspaper"></span>
							</div>
							<h4>cvfgf</h4>
							<p>ghgh</p>
						</div> -->
					</div>
					
					<div class="col-sm-6">
						<img
							src="${pageContext.request.contextPath}/resources/images/hospitalR.jpg"
							class="img-responsive wow zoomIn" data-wow-delay="0.1s" data-wow-duration="1s" alt="doc">
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section class="blogSection" id="blog">
	<h3 class="text-center wow fadeInDown" data-wow-delay="0.1s" data-wow-duration="1s">Biocare</h3>
	<h2 class="text-center wow fadeInDown" data-wow-delay="0.1s" data-wow-duration="1s">Blog</h2>
	</section>
	<section class="blogDetl">
	<div class="container">
		<div class="owl-carousel owl-theme wow zoomIn" data-wow-delay="0.1s" data-wow-duration="1s">

			<c:forEach items="${getBlogsList}" var="getBlogs" varStatus="count">
				<div class="item">
					<div class="blogInfo">
						
							<img src="${blogsUrl}${getBlogs.blogImage}" class="img-responsive" alt="blogger">

						<h4>${getBlogs.blogTitle}</h4>
						<h5>${getBlogs.blogBy}</h5>
						<p>${getBlogs.blogDate}.</p>
						<p class="text-center"><a href="${pageContext.request.contextPath}/showBlogsDetailsById/${getBlogs.blogId}"
							class="btn-del">Read More..</a></p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>
	<%-- <section class="adsSection">
	<img src="${pageContext.request.contextPath}/resources/images/bannerAds.jpg" class="img-responsive" alt="advertisement">
</section> --%>


	<%-- <section class="how_it_wrks">
	<div class="container">
	<h2>How it works</h2>
		<div class="row">
			<div class="col-sm-4"><img src="${pageContext.request.contextPath}/resources/images/register.png" class="img-responsive" alt="health care">
				<h3>Step 1</h3>
				<h4>Register / Sign Up</h4>
			</div>
			<div class="col-sm-4"><img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive" alt="health care">
				<h3>Step 2</h3>
				<h4>Fill Your Data</h4>
			</div>
			<div class="col-sm-4"><img src="${pageContext.request.contextPath}/resources/images/nextstep.png" class="img-responsive" alt="health care">
			<h3>Step 3</h3>
				<h4>Go to next Process</h4>
			</div>
		</div>
	</div>
</section> --%>
	<section class="articles" id="article">
	<div class="container">
	<h3 class="text-center wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="1s">Articles</h3>
		<h2 class="text-center wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="1s">Read top articles from health experts</h2>
		<%-- <div class="grid">
			<div class="owl-carousel owl-theme">
				<div class="item">
					<figure class="effect-lily"> <img
						src="${pageContext.request.contextPath}/resources/images/asan.jpg"
						class="img-responsive" alt="articles"> <figcaption>
					<div>
						<h2>6 Simple Yoga Asanas for Beginners</h2>
						<p>Lily likes to play with crayons and pencils</p>
					</div>
					<a href="#">View more</a> </figcaption> </figure>
				</div>
				<div class="item">
					<figure class="effect-lily"> <img
						src="${pageContext.request.contextPath}/resources/images/egg.jpg"
						class="img-responsive" alt="articles"> <figcaption>
					<div>
						<h2>Health Benefits of Eating Eggs</h2>
						<p>Lily likes to play with crayons and pencils</p>
					</div>
					<a href="#">View more</a> </figcaption> </figure>
				</div>
				<div class="item">
					<figure class="effect-lily"> <img
						src="${pageContext.request.contextPath}/resources/images/emot.jpg"
						class="img-responsive" alt="articles"> <figcaption>
					<div>
						<h2>7 Habits of Emotionally Evolved People</h2>
						<p>Lily likes to play with crayons and pencils</p>
					</div>
					<a href="#">View more</a> </figcaption> </figure>
				</div>
				<div class="item">
					<figure class="effect-lily"> <img
						src="${pageContext.request.contextPath}/resources/images/skin.jpg"
						class="img-responsive" alt="articles"> <figcaption>
					<div>
						<h2>7 Important Skin Care Tips</h2>
						<p>Lily likes to play with crayons and pencils</p>
					</div>
					<a href="#">View more</a> </figcaption> </figure>
				</div>
			</div>
		</div> --%>
		
			<div class="owl-carousel owl-theme">
				<div class="item">
					 <img
						src="${pageContext.request.contextPath}/resources/images/asan.jpg"
						class="img-responsive" alt="articles"> 
					<div>
						<h4>6 Simple Yoga Asanas for Beginners</h4>
						<p>Coming Soooon.....</p>
						<a href="#">View more</a>
					</div>
					
				</div>
				<div class="item">
					 <img
						src="${pageContext.request.contextPath}/resources/images/egg.jpg"
						class="img-responsive" alt="articles"> 
					<div>
						<h4>Health Benefits of Eating Eggs</h4>
						<p>Coming Soooon.....</p>
						<a href="#">View more</a>
					</div>
					
				</div>
				<div class="item">
					 <img
						src="${pageContext.request.contextPath}/resources/images/emot.jpg"
						class="img-responsive" alt="articles"> 
					<div>
						<h4>7 Habits of Emotionally Evolved People</h4>
						<p>Coming Soooon.....</p>
						<a href="#">View more</a>
					</div>
					
				</div>
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/images/skin.jpg"
						class="img-responsive" alt="articles"> 
					<div>
						<h4>7 Important Skin Care Tips</h4>
						<p>Coming Soooon.....</p>
						<a href="#">View more</a>
					</div>
				</div>
			</div>
		

	</div>
	</section>

	<section class="app_download">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<img
					src="${pageContext.request.contextPath}/resources/images/download_app1.png"
					class="img-responsive wow slideInLeft" data-wow-delay="0.1s" data-wow-duration="1s" alt="articles">
			</div>
			<div class="col-sm-6 mrgn_app">
				<h2 class="wow slideInRight" data-wow-delay="0.1s" data-wow-duration="1s">Download Biocare app</h2>
				<ul class="list_doc">
					<li class="wow slideInRight" data-wow-delay="0.1s" data-wow-duration="1.5s">Book Appointments and Lab Test</li>
					<li class="wow slideInRight" data-wow-delay="0.1s" data-wow-duration="2s">Consult Doctors Online</li>
					<li class="wow slideInRight" data-wow-delay="0.1s" data-wow-duration="2.5s">Detail Reports</li>
					<li class="wow slideInRight" data-wow-delay="0.1s" data-wow-duration="3s">Find Doctors</li>
				</ul>
				<p class="app_install">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/appstore.jpg"
						class="img-responsive" alt="Download app"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/playstore.jpg"
						class="img-responsive" alt="Download app"></a>
				</p>
			</div>
		</div>
	</div> 
	</section>
	<input id="locationCity" type="hidden" />
	<section class="app_download app-disp">
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-6 mrgn_app">
				<h2>Download Biocare app</h2>
				<ul class="list_doc">
					<li>Book Appointments and Lab Test</li>
					<li>Consult Doctors Online</li>
					<li>Detail Reports</li>
					<li>Find Doctors</li>
				</ul>
				<p class="app_install">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/appstore.jpg"
						class="img-responsive" alt="Download app"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/playstore.jpg"
						class="img-responsive" alt="Download app"></a>
				</p>
			</div>
		</div>
	</div>
	</section>
	<section class="counter-Dispy">
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-2">
				<img
					src="${pageContext.request.contextPath}/resources/images/docCount.png"
					class="img-responsive" alt="Doctor Counter">
				<h5>${getUsersCount.doctorCount}</h5>
				<p>Doctors</p>

			</div>
			<div class="col-sm-2">
				<img
					src="${pageContext.request.contextPath}/resources/images/patCount.png"
					class="img-responsive" alt="patient Counter">
				<h5>${getUsersCount.patientCount}</h5>
				<p>Patients</p>

			</div>
			<div class="col-sm-2">
				<img
					src="${pageContext.request.contextPath}/resources/images/labCount.png"
					class="img-responsive" alt="pharmacy Counter">
				<h5>${getUsersCount.labCount}</h5>
				<p>Lab</p>

			</div>
			<div class="col-sm-2">
				<img
					src="${pageContext.request.contextPath}/resources/images/pharmCount.png"
					class="img-responsive" alt="lab Counter">
				<h5>${getUsersCount.pharmacyCount}</h5>
				<p>Pharmacy</p>

			</div>
			<div class="col-sm-2">
				<img
					src="${pageContext.request.contextPath}/resources/images/hospCount.png"
					class="img-responsive" alt="Hospital Counter">
				<h5>${getUsersCount.hospitalCount}</h5>
				<p>Hospital</p>

			</div>
		</div>
	</div>
	</section>

<div class="linksSection">
	<h3 class="text-center">Biocare Links</h3>
</div>
<a id="back-to-top" href="#" class="back-to-top" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>  

	<jsp:include page="include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUPcyDrmpg21nIDmrhuaFvyom1uLHlIJw&libraries=places"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/geolocation.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<%--  <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> --%>
	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script> --%>
	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/css3-animate-it.js"></script> --%>
		<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script>
	 new WOW().init();
$(document).ready(function(){
	  $('.detlSection .nav-link').click(function(){
	    $('.detlSection .nav-link').removeClass("active");
	    $(this).addClass("active");
	});
	});
	
$(document).ready(function(){
    $(window).scroll(function () {
           if ($(this).scrollTop() > 50) {
               $('#back-to-top').fadeIn();
           } else {
               $('#back-to-top').fadeOut();
           }
       });
       // scroll body to 0px on click
       $('#back-to-top').click(function () {
           $('#back-to-top').tooltip('hide');
           $('body,html').animate({
               scrollTop: 0
           }, 800);
           return false;
       });
       
       $('#back-to-top').tooltip('show');

});

	
	
</script>
	<!-- <script type="text/javascript">
	 $(document).ready(function(){
			// $fn.scrollSpeed(step, speed, easing);
			jQuery.scrollSpeed(200, 100);
});

//Custom scrolling speed with jQuery
//Source: github.com/ByNathan/jQuery.scrollSpeed
//Version: 1.0.2

(function($) {
 
 jQuery.scrollSpeed = function(step, speed, easing) {
     
     var $document = $(document),
         $window = $(window),
         $body = $('html, body'),
         option = easing || 'default',
         root = 0,
         scroll = false,
         scrollY,
         scrollX,
         view;
         
     if (window.navigator.msPointerEnabled)
     
         return false;
         
     $window.on('mousewheel DOMMouseScroll', function(e) {
         
         var deltaY = e.originalEvent.wheelDeltaY,
             detail = e.originalEvent.detail;
             scrollY = $document.height() > $window.height();
             scrollX = $document.width() > $window.width();
             scroll = true;
         
         if (scrollY) {
             
             view = $window.height();
                 
             if (deltaY < 0 || detail > 0)
         
                 root = (root + view) >= $document.height() ? root : root += step;
             
             if (deltaY > 0 || detail < 0)
         
                 root = root <= 0 ? 0 : root -= step;
             
             $body.stop().animate({
         
                 scrollTop: root
             
             }, speed, option, function() {
         
                 scroll = false;
             
             });
         }
         
         if (scrollX) {
             
             view = $window.width();
                 
             if (deltaY < 0 || detail > 0)
         
                 root = (root + view) >= $document.width() ? root : root += step;
             
             if (deltaY > 0 || detail < 0)
         
                 root = root <= 0 ? 0 : root -= step;
             
             $body.stop().animate({
         
                 scrollLeft: root
             
             }, speed, option, function() {
         
                 scroll = false;
             
             });
         }
         
         return false;
         
     }).on('scroll', function() {
         
         if (scrollY && !scroll) root = $window.scrollTop();
         if (scrollX && !scroll) root = $window.scrollLeft();
         
     }).on('resize', function() {
         
         if (scrollY && !scroll) view = $window.height();
         if (scrollX && !scroll) view = $window.width();
         
     });       
 };
 
 jQuery.easing.default = function (x,t,b,c,d) {
 
     return -c * ((t=t/d-1)*t*t*t - 1) + b;
 };
 
})(jQuery);
	 
	 </script> -->
	<!-- ads  -->
	<script>
$(document).ready(function(){
  // Add smooth scrolling to all links
  $(".navbar-wrapper a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});
</script>
	<script>
    $(function(){
        var stickyHeaderTop = $('#stickytypeheader').offset().top;
 
        $(window).scroll(function(){
                if( $(window).scrollTop() > stickyHeaderTop ) {
                        $('#stickytypeheader').css({position: 'fixed', top: '0px'});
                        $('#sticky').css('display', 'block');
                } else {
                        $('#stickytypeheader').css({position: 'static', top: '0px'});
                        $('#sticky').css('display', 'none');
                }
                
        });
        
  });
    </script>

	<script>
    $(document).ready(function(c) {
    	$('.alert-close').on('click', function(c){
    		$('.ad-bg').fadeOut('slow', function(c){
    	  		$('.ad-bg').remove();
    		});
    	});	
    });
    </script>
	<!-- ads  -->

	<script>
		function callMe(){
			
			initialize123();
			init();
		}
		</script>

	<script>
	function getDoctorList(){
		var city=document.getElementById("locationCity").value;
		
		if(city==null){
			city="Nashik,Maharashtra,In";
		}
		
		window.open("${pageContext.request.contextPath}/showDoctorList?city="+city,"_self");
	}
	</script>

	<script>
$('.animate').scrolla({
		mobile: false,
		once: true
	});

</script>
	<script type="text/javascript">
//new WOW().init();
jQuery(document).ready(function() {
  var owl = jQuery('.owl-carousel');
  owl.owlCarousel({
    items: 3,
    loop: true,
    margin: 20,
    autoplay: true,
    autoplayTimeout: 1000,
    autoplayHoverPause: true,
    responsiveClass:true,
    responsive:{
        0:{
            items:1,
            nav:true
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:3,
           /*  nav:true, */
            loop:true
        }
    }
  });
  jQuery('.play').on('click', function() {
    owl.trigger('play.owl.autoplay', [2000])
  })
  jQuery('.stop').on('click', function() {
    owl.trigger('stop.owl.autoplay')
  })
})


jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>


	<script type="text/javascript">


$(document).ready(function(){
  var date_input=$('input[name="date"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  var options={
    format: 'dd/mm/yyyy',
    container: container,
    todayHighlight: true,
    autoclose: true,
  };
  date_input.datepicker(options);
});

function setUserType(userType)
{
	document.getElementById("userType").value=userType;
	$("#signupId").empty();
	if(userType==1){
		
		var signup='<a   href="#signup"   data-toggle="modal" >Not Registered? <strong>Sign up</strong></a>';
	 //document.getElementById("signupId").href="#signup"; 
	 //document.getElementById("signupId").data-toggle="modal";
	 $('#signupId').append($(signup));
	 
	}
  else if(userType==2){
	  var signup='<a   href="${pageContext.request.contextPath}/showDoctorRegProcess"    >Not Registered? <strong>Sign up</strong></a>';	
		 $('#signupId').append($(signup));
  }
	
  else if(userType==3){
	  var signup='<a   href="${pageContext.request.contextPath}/showLabRegProcess"    >Not Registered? <strong>Sign up</strong></a>';	
		 $('#signupId').append($(signup));
  }
	
  else if(userType==4){
	  var signup='<a   href="${pageContext.request.contextPath}/showMedicalRegProcess"    >Not Registered? <strong>Sign up</strong></a>';	
		 $('#signupId').append($(signup));
  }
	} 

 
</script>


	<!--For Current Location  -->
	<script type="text/javascript"> 
  
  function usernameValidation(){
		 
		 var userName=document.getElementById("uName").value; 
		    document.getElementById("validate1").innerHTML="";
		 $
			.getJSON(
					'${usernameValidation}',
					{
						userName : userName,
						
						ajax : 'true'
					},
					function(data) {
						
						if(data.message=='Success')
							{
							document.getElementById("uName").value="";
							document.getElementById("validate").innerHTML="UserName Already Exists" ; 
							
							
							}
						else
						{
							
							
						}
						
						
					})
	 }
  
 

  function getStateBYCountry() {
 											 
 		 var countryId=document.getElementById("countryId").value; 
 		$('#stateId option').remove();
 		  
 		 $
 														.getJSON(
 																'${getStateByCountryId}',
 																{
 																	countryId : countryId,
 																	
 																	ajax : 'true'
 																},
 																function(data) {
 																	
 																	
 																	var len = data.length;
 																	var strVar="";
 																	strVar +="<option value=''>--select--<\/option>";
 																	for (var i = 0; i < len; i++) {
 																		
 																		strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
 																 
 																	} 
 																	 $('#stateId').append($(strVar))

 																})
 		 
 		 
 	 }
 	
 	</script>
	<script>
function getCityBYStateId()
{

var stateId=document.getElementById("stateId").value; 
$('#cityId option').remove();

$
												.getJSON(
														'${getCityByStateId}',
														{
															stateId : stateId,
															
															ajax : 'true'
														},
														function(data) {
															
															
															var len = data.length;
															var strVar="";
															strVar +="<option value=''>--select--<\/option>";
															for (var i = 0; i < len; i++) {
														
																strVar += "<option value="+data[i].cityId+">"+data[i].cityName+"<\/option>";
														 
															} 
															 $('#cityId').append($(strVar))

														})
	
	
}

function validatePassword() {
    var newPassword = document.getElementById("password").value;

    var minNumberofChars = 8;
    var maxNumberofChars = 16;
    var regularExpression  =/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
  
    if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
    	document.getElementById("password").value="";
    	document.getElementById("validate1").innerHTML="password length should be min 8"; 
        return false;
    }
    if(!regularExpression.test(newPassword)) {
       
        document.getElementById("password").value="";
        document.getElementById("validate1").innerHTML="";
    	document.getElementById("validate1").innerHTML="password should contain atleast one number and one special character"; 
        return false;
    }
    if(newPassword=username)
	{
	document.getElementById("password").value="";
    document.getElementById("validate1").innerHTML="";
	document.getElementById("validate1").innerHTML="password should not be same as username"; 
    return false;
	}
}

function emailvalidation()
{
	var email = document.getElementById("email").value;
	document.getElementById("emailValidate").innerHTML="";
	if(/^[a-z]+$/i.test(email.charAt(0)))
		{
		
		}
	else{
		
		document.getElementById("emailValidate").innerHTML="";
		document.getElementById("emailValidate").innerHTML="Invalid email"; 
	}
	
}


function resetFunction() {
    document.getElementById("reset").reset();
}
function eraseMsg()
{
	 document.getElementById("validate").innerHTML="";
	 
}
function myFunction() {
	

    var x = document.getElementById("password");
    
    if (x.type === "password") {
        x.type = "text";
        
    }
}
</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
    
	$('.datepicker').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	
</script>


	<script>
		 
	 function loginProcess() {
										 
		 var userName=document.getElementById("LogInUname").value; 
		 var password=document.getElementById("LogInPasswors").value;
		 var userType=document.getElementById("userType").value;
		 					    
		 $
		 
														.getJSON(
																'${loginProcess}',
																{
																	userName : userName,
																	password : password,
																	userType : userType,
																	ajax : 'true'
																},
																function(data) {
																	
																	if(data.message=="wrong") 
																		{
																	 document.getElementById("errormessage").innerHTML="Invalid credential."; 
																		}  
																	else
																		{
																		window.open("${pageContext.request.contextPath}/"+data.message,"_self");

																		}
																})
		
		 
	 }
	 
	 function clearMsg()
	 {
		 document.getElementById("errormessage").innerHTML="";  
	 }
	 function erasePwdMsg()
	 {
				 document.getElementById("validate1").innerHTML="";
	 }
	 
	 /* confirm password */
	 $('#password, #confirm_password').on('keyup', function () {
		  if ($('#password').val() == $('#confirm_password').val()) {
		    $('#message').html('Matching').css('color', 'green');
		  } else 
		    $('#message').html('Not Matching').css('color', 'red');
		});
	 
	 
	 function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function (e) {
		            $('#blah')
		                .attr('src', e.target.result)
		                .width(80)
		                .height(80);
		        };

		        reader.readAsDataURL(input.files[0]);
		    }
		}
	</script>

</body>
</html>