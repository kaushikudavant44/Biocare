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
 <section class="lab_testsec producttab1 waitingRm">
	<div class="container">
		<h2 class="text-center">Lorem Ipsum is simply dummy text</h2>
		<div class="row">
				<div class="col-sm-7">
					<div class="borderbox">
					<img src="${pageContext.request.contextPath}/resources/images/videoshow.jpg">
						<div class="modelVideo wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">
							<video width="320" height="240" controls>
							    <source src="${pageContext.request.contextPath}/resources/images/allmodel.mp4" type="video/mp4">
							</video>
						</div>
					</div>
				</div>
				<div class="col-sm-5 topmrgn1 wow fadeInRight" data-wow-delay="0.1s" data-wow-duration="1s">
						<h4> 3D models</h4>
						<p>Zoom and rotate 360 degrees,sketch on-screen to show affected areas and explain procedures.
Peel back layers to expose tissue, muscle and bone for further explanation.</p>
				
				</div>
	     </div>
	</div>
</section>

<!-- Carousel================================================== -->
		<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/wallboard.jpg" alt="health care"></div>
   </div>
<!-- /.carousel --> 
</div>

<div class="clearfix"></div>
<div class="productDetl">
	<div class="row">
		<div class="col-sm-4">
			<h2 class="text-right wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1s">About</h2>
			<h4 class="text-right wow fadeInLeft" data-wow-delay="0.1s" data-wow-duration="1.5s">Exam Room Wallboard</h4>
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
jQuery(document).ready(function() {
	  var owl = jQuery('.owl-carousel');
	  owl.owlCarousel({
	    items: 3,
	    loop: true,
	    margin: 20,
	    autoplay: true,
	    autoplayTimeout: 1500,
	    autoplayHoverPause: false,
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
</body>
</html>