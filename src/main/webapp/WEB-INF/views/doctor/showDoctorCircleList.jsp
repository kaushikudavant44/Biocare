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
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
	     <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />

</head>
<body >
	 
	 <c:url var="acceptDoctorNetworkCircleRequest" value="/acceptDoctorNetworkCircleRequest" />
	<c:url var="sendVideoCallToDoctor" value="/sendVideoCallToDoctor" />
<jsp:include page="../include/doctorHeader.jsp" />

<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center">
		<h4>Connected Doctors</h4>
	</div>
		<div class="container-fluid netwkblk">
		<div class="row">
			<div class="bhoechie-tab-container">
			
        	<jsp:include page="../include/leftmenu.jsp"/>
 <div
					class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
					<div class="bhoechie-tab-content active">
  <div class="col-md-12 text-right"><a href="${pageContext.request.contextPath}/searchDoctorForCircle"><button class="serchDoc">Search Other Doctor <span class="glyphicon glyphicon-chevron-right"></span></button></a></div>
  <div class="clearfix"></div>
 
 	<input type="hidden" id="url" value="${url}">
 	<input type="hidden" id="doctorId" value="${sessionScope.doctorDetails.doctorId}">
  <c:forEach items="${getDoctorBasicDetailsList}" var = "getDoctorBasicDetails">
<div class="col-lg-4 col-md-6 col-sm-12">
<div class="card">
 
  <img src="${doctorUrl}/${getDoctorBasicDetails.doctorId}/profile/${getDoctorBasicDetails.profilePhoto}" alt="Doctor Photo" class="img-responsive" >
 
  <h3>${getDoctorBasicDetails.doctorName}</h3>
  <p class="title">${getDoctorBasicDetails.specType}</p>
  <p>${getDoctorBasicDetails.cityName}</p>
   <p style="margin: 0px;">${getDoctorBasicDetails.contact}</p>
  <!-- <div style="margin: 24px 0;">
    <a href="#"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="#"><i class="fa fa-linkedin"></i></a>  
    <a href="#"><i class="fa fa-facebook"></i></a> 
  </div> -->
  
  
   <p><c:choose>
    <c:when test="${getDoctorBasicDetails.status==0}">
   <button onclick="acceptDoctorNetworkCircleRequest(${getDoctorBasicDetails.doctorId})">Accept Request</button> 
  </c:when>
  <c:otherwise>
   <button class="btn-fr-all" onclick="videoCallToDoctor(${getDoctorBasicDetails.doctorId})">Call <i class="fa fa-video-camera"></i></button>
   </c:otherwise>
   </c:choose>
   </p>
 
 
</div>
</div>
</c:forEach>
 
 
 
 
 
</div>
</div>
</div>
</div>

</div>
</section>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	 
	 <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	 

	<script
		src='${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js'></script>
		
 	<script src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  
			<script src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>
	<script>
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
</script>
 
		 
<script type="text/javascript">
function videoCallToDoctor(doctorId)
{
	 
	 
	 
	var fromToken=document.getElementById("token").value;
	
	 var fromDoctorId = document.getElementById("doctorId").value;
	 var url = document.getElementById("url").value;
	var videoCallUrl=url+"?"+fromDoctorId+""+doctorId;
	
	 $
		.getJSON(
				'${sendVideoCallToDoctor}',
				{
					videoCallUrl : videoCallUrl,
					fromDeviceType : 2,
					fromToken : fromToken,
					doctorId : doctorId,
					ajax : 'true'
				},
				function(data) {
					 
					window.open(videoCallUrl);
				});
}


function acceptDoctorNetworkCircleRequest(fromId) {
	 
	$.getJSON('${acceptDoctorNetworkCircleRequest}', {
		fromId : fromId,
		ajax : 'true'
	}, function(data) {
		location.reload();
	});
}
</script>

</body>
</html>