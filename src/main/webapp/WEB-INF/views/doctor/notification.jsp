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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
</head>
<body>
	<jsp:include page="../include/doctorHeader.jsp" />
	<section class="doc_login" id="notification">
	<div class="dashboard_nm text-center">
		<h4>Your Notifications</h4>
	</div>
	<div class="container-fluid">
		<div class="bhoechie-tab-container">
			<div class="drop-content">
				<div class="row">

					<c:forEach items="${doctorNotificationList}"
						var="doctorNotificationList">
						<c:choose>
						<c:when test="${doctorNotificationList.status==0}">
						<div class="col-md-12 col-sm-12 col-xs-12 pd-l0 border-bottom unread-bg">
							<div class="all-notofication">
								<!-- <a href="#" class="rIcon"><i class="fa fa-times"
									aria-hidden="true"></i></a> -->
								<p class="dr-icon">${doctorNotificationList.string1}</p>
 								<p>${doctorNotificationList.notification}.</p>
								<p class="date">${doctorNotificationList.dateTime}"</p>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div class="col-md-12 col-sm-12 col-xs-12 pd-l0 border-bottom">
							<div class="all-notofication">
								<!-- <a href="#" class="rIcon"><i class="fa fa-times"
									aria-hidden="true"></i></a> -->
								<p class="dr-icon">${doctorNotificationList.string1}</p>
 								<p>${doctorNotificationList.notification}.</p>
								<p class="date">${doctorNotificationList.dateTime}"</p>
							</div>
						</div>
						</c:otherwise>
						</c:choose>
						
					</c:forEach>
					 
				</div>
			</div>
		</div>
	</div>

	</section>


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
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
</body>
</html>