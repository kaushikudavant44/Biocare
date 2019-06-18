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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    
   
</head> 
  <body class="login_prt"> 
 
  
<div class="clearfix"></div>

<!-- verification Successful -->
<div class="success-blk " id="successDiv" style="display:none;">
<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>
    <div class="log_user verify_successfully" >
    <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/done.jpg" class="img-responsive" alt="wait"></div>
    <h3 class="text-center">Your verification Pending Please wait until we verify your profile! </h3>
   	<p>You'll receive a confirmation email at <a href="mailto:mail@example.com">info@bionische.com</a></p>
 <br>
 <div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center">
						<a class="proceed_b" href="${pageContext.request.contextPath}/homePage">Go To Home</a>
						</div>
					</div>
				</div>
            </div>
    </div>
    
</div>
<!-- verification Successful -->

<!-- verification failed -->
<div class="success-blk " id="failDiv" style="display:none">
<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>
    <div class="log_user verify_successfully" >
    <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/fail.jpg" class="img-responsive" alt="wait"></div>
    <h3 class="text-center">Your verification Failed </h3>
   	<!-- <p>You'll receive a confirmation email at <a href="mailto:mail@example.com">info@bionische.com</a></p> -->
 <br>
 <div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center">
						<a class="proceed_b" href="${pageContext.request.contextPath}/showDoctorHomePage">Try Again</a>
						</div>
					</div>
				</div>
            </div>
    </div>
</div>
<!-- verification failed -->

<!-- verification Pending -->
<div class="success-blk " id="failDiv" style="display:none">
<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>
    <div class="log_user verify_successfully" >
    <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/fail.jpg" class="img-responsive" alt="wait"></div>
    <h3 class="text-center">Your verification Pending </h3>
   	<!-- <p>You'll receive a confirmation email at <a href="mailto:mail@example.com">info@bionische.com</a></p> -->
 
    </div>
</div>
<!-- verification Pending -->

</body>

<script>
//show success page
window.onload = function() {
  document.getElementById('successDiv').style.display = 'block';
};
</script>
</html>
