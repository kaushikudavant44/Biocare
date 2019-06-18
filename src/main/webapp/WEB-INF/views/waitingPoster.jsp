<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
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
  <body onload="initialize()"> 
  <c:url var="usernameValidation" value="/usernameValidation" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="loginProcess" value="/loginProcess" />
<div class="clearfix"></div>

<c:choose>
<c:when test="${sessionScope.patientDetails.patientId>0}">
<jsp:include page="include/patientHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.doctorDetails.doctorId>0}">
<jsp:include page="include/doctorHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.labDetails.labId>0}">
<jsp:include page="include/labHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.medicalDetails.medicalId>0}">
<jsp:include page="include/pharmacyHeader.jsp"/>
</c:when>

<c:otherwise>
<jsp:include page="include/homeHeader.jsp"/> 
</c:otherwise>
</c:choose>

<div class="clearfix"></div>
 <section class="lab_testsec producttab1">
	<div class="container-fluid">
		<h2 class="text-center">Lorem Ipsum is simply dummy text</h2>
		<div class="row">
			<div class="col-sm-4 wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">
				<img src="${pageContext.request.contextPath}/resources/images/posterLft.jpg" class="img-responsive" alt="tablet">
			</div>
			<div class="col-sm-3 wow zoomIn" data-wow-delay="0.2s" data-wow-duration="2s">
				 <h5>Provide patients with important points with the Waiting Room Poster.</h5>
			</div>
			<div class="col-sm-5 wow fadeInRight" data-wow-delay="0.1s" data-wow-duration="1s">
				<img src="${pageContext.request.contextPath}/resources/images/posterimg.png" class="img-responsive" alt="tablet">
				<h3>Waiting Room Poster</h3>
			</div>
		 </div>
	</div>
</section>

<div class="productDetl">
	<div class="row">
		<div class="col-sm-4">
			<h2 class="text-right wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">About</h2>
			<h4 class="text-right wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1.5s">Waiting Room Poster</h4>
		</div>
		<div class="col-sm-8 wow fadeInRight" data-wow-delay="0.1s" data-wow-duration="2s">
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
		</div>
	</div>
</div>
<jsp:include page="include/footer.jsp" />  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<%--  <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> --%>
 <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>

<script type="text/javascript">
new WOW().init();

jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>
</body>
</html>