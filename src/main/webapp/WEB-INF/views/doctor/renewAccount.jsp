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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>         
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 
<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center"><h4>Renew Your Account</h4></div>
<div class="container-fluid">
        	<div class="bs-example renewAcc">
        	<div class="col-sm-3">
									 <div class="plan-selct">
									 <img src="${pageContext.request.contextPath}/resources/images/free.jpg" class="img-responsive" alt="free trial">
									 	<h4>Free Trial</h4>
									 	<ul>
									 		<li>30 days Trial</li>
									 		<li>Access Reports</li>
									 		<li>Online and offline Appointments</li>
									 		<li>Lab tests</li>
									 		<li>Online Consulting</li>
									 	
									 	</ul>
									 	<p><span>Rs.0 / $0</span> per month</p>
									 	<a href="#" class="btn-fr-all">Buy</a>
									 </div>
				                    	 
	            		           	</div>
	            		           	<div class="col-sm-3">
									 <div class="plan-selct">
									 <img src="${pageContext.request.contextPath}/resources/images/basic.jpg" class="img-responsive" alt="free trial">
									 	<h4>Basic</h4>
									 	<ul>
									 		<li>3 Months</li>
									 		<li>Access Reports</li>
									 		<li>Online and offline Appointments</li>
									 		<li>Lab tests</li>
									 		<li>Online Consulting</li>
									 	
									 	</ul>
									 	<p><span>Rs.300 / $4.08</span> 3 months</p>
									 	<a href="#" class="btn-fr-all">Buy</a>
									 </div>
				                    	 
	            		           	</div>
	            		           	<div class="col-sm-3">
									 <div class="plan-selct">
									 <img src="${pageContext.request.contextPath}/resources/images/basic.jpg" class="img-responsive" alt="free trial">
									 	<h4>Advanced</h4>
									 	<ul>
									 		<li>6 Months</li>
									 		<li>Access Reports</li>
									 		<li>Online and offline Appointments</li>
									 		<li>Lab tests</li>
									 		<li>Online Consulting</li>
									 	
									 	</ul>
									 	<p><span>Rs.300 / $4.08</span> 6 months</p>
									 	<a href="#" class="btn-fr-all">Buy</a>
									 </div>
				                    	 
	            		           	</div>
	            		           	<div class="col-sm-3">
									 <div class="plan-selct">
									 <img src="${pageContext.request.contextPath}/resources/images/basic.jpg" class="img-responsive" alt="free trial">
									 	<h4>Premium</h4>
									 	<ul>
									 		<li>1 year</li>
									 		<li>Access Reports</li>
									 		<li>Online and offline Appointments</li>
									 		<li>Lab tests</li>
									 		<li>Online Consulting</li>
									 	
									 	</ul>
									 	<p><span>Rs.300 / $4.08</span> Annual</p>
									 	<a href="#" class="btn-fr-all">Buy</a>
									 </div>
				                    	 
	            		           	</div>
								</div>
							
    </div> 
 </section>
 <div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>