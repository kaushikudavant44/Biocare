<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body>
<jsp:include page="../include/patientHeader.jsp" />  
<div class="header">
<!-- Carousel================================================== -->
		<!--<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
 
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="images/banner1.png" alt="health care">
    </div>
    <div class="item"> <img class="first-slide" src="images/banner1.png" alt="health care"></div>
    <div class="item"> <img class="first-slide" src="images/banner1.png" alt="health care"></div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>-->
<!-- /.carousel --> 
</div>
<div class="clearfix"></div>
<section class="premiumSec">
	<div class="container">
    	<div class="premium_blk1">
    	<form action="${pageContext.request.contextPath}/submitInsuranceRegistrationDetails" method="post">
   		 <div class="top_blk">
            <table class="app_id">
  <tr>
    <th scope="row">Application ID</th>
  <%--   <td>${makePayment.appId}</td> --%>
  </tr>
  <tr>
    <th scope="row">Status</th>
    <td>Your health care insurance is complete. Please make the payment due.</td>
  </tr>
</table>

        </div>
        <div class="clearfix"></div>
        <hr>
        <div class="form_check app_detail">
        	<div class="row">
                <ul class="list-group col-xs-12 col-sm-12 col-md-12">
                    <li class="list-group-item list-head">Policy Details	</li>
                    <li class="list-group-item payment-summary-name"><label class="ps-icon6">Company Name</label><p class="right_prt"><span class="text-uppercase">${makePayment.companyName}</span></p></li>
                    <li class="list-group-item"><label class="ps-icon6">Policy Type</label><p class="right_prt"><span>Health Insurance</span></p></li>
                    <li class="list-group-item"><label class="ps-icon7">Sum Assured for Health Care Insurance</label><p class="right_prt"><span>${makePayment.cover}</span></p></li>
                    <li class="list-group-item"><label class="ps-icon8">Health Care Annual Premium</label><p class="right_prt"><span>${makePayment.premium}</span></p></li>
                    <li class="list-group-item"><label class="ps-icon8">Total Premium</label><p class="right_prt"><span>${makePayment.premium}</span></p></li>
                </ul>
                
    		</div>
    	</div>
        
        <p class="text-center"><a href="#"><button type="submit" value="Submit">Make Payment</button></a></p>
        </form>
    </div>
    </div>
</section>

             <div class="clearfix"></div>
<jsp:include page="../include/footer.jsp" />   
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
</body>
</html>
