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
<jsp:include page="include/homeHeader.jsp"/> 
<div class="clearfix"></div>
<section class="blogpg">
	<div class="container">
	<div class="dtcircle"><span class="icon-calendar-page"></span></div><h5>${blogs.blogDate}</h5>
		<div class="blogimg">
			<img src="${blogsUrl}${blogs.blogImage}" class="img-responsive" alt="doctorblog">
		</div>
		<h4>${blogs.blogTitle}</h4>
		<p>${blogs.blogContent}.</p>
	<!-- 	<p>lorem is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
		 --><hr>
		<!-- <div class="text-right">
		<p><a href="#"> <strong>Next Post : </strong> Doctors <span class="glyphicon glyphicon-chevron-right"></span></a></p>
		</div>
		<hr>
		<div class="contact-inpt">
		<h3 class="text-center">Leave A Reply</h3>
		<div class="row">
			<div class="col-sm-6">
				<input type="text" name="fullname" id="fullname" placeholder="Full Name" autocomplete="no-fill">
			</div>
			<div class="col-sm-6">
				<input type="text" name="email" id="email" placeholder="Email Id" autocomplete="no-fill">
			</div>
			<div class="col-sm-6">
				<textarea type="text" name="comment" id="comment" placeholder="Comment"></textarea>
			</div>
			<div class="col-sm-6">
				<input type="submit" name="submit"  class="btn-fr-all" value="Send Message">
			</div>
		</div>
      </div> -->
	</div>
</section>

<jsp:include page="include/footer.jsp" />  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<%--  <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> --%>
 <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script>

jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>




</body>
</html>