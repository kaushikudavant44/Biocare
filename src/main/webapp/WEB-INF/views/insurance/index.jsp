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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body>
<div class="navbar-wrapper">
  <div class="container-fluid">
    <nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logo_health.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
         </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">      
            <li class="active"><a href="index.html">Home</a></li>
            <li><a href="about.html">About Us </a></li>
            <li class="dropdown"> <a href="#" class="dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">  Department  <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
              </ul>
            </li>
            <li><a href="physiotherapist.html">Services</a></li>
            <li><a href="Gallery.html">Gallery</a></li>
            <li><a href="appointment.html">Appointment</a></li>
            <li><a href="contact.php">Contact</a></li>
          </ul>
        </div>
     
    </nav>
  </div>
</div>

<div class="header">
<!-- Carousel================================================== -->
		<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="images/banner1.png" alt="health care">
      <!--<div class="container">
        <div class="carousel-caption">
          <h1>Example headline.</h1>
          <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
          <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
        </div>
      </div>-->
    </div>
    <div class="item"> <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/banner1.png" alt="health care"></div>
    <div class="item"> <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/banner1.png" alt="health care"></div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
<!-- /.carousel --> 
</div>
<div class="clearfix"></div>
<section class="healthSec">
	<div class="container">
        <div class="row">
        	<div class="col-sm-4">
            	<a href="${pageContext.request.contextPath}/views/health.jsp" class="hvr-float"><div class="health_blk animate" data-animate="zoomIn" data-duration="1.0s" data-delay="0.1s">
                	<span class="glyphicon glyphicon-music"></span>
                    <h4>health insurance</h4>
                </div> </a>
            </div>
            <div class="col-sm-4">
            	<a href="#" class="hvr-float"><div class="health_blk animate" data-animate="zoomIn" data-duration="1.0s" data-delay="0.1s">
                	<span class="glyphicon glyphicon-music"></span>
                    <h4>car insurance</h4>
                </div> </a>
            </div>
            <div class="col-sm-4">
            	<a href="#" class="hvr-float"><div class="health_blk animate" data-animate="zoomIn" data-duration="1.0s" data-delay="0.1s">
                	<span class="glyphicon glyphicon-music"></span>
                    <h4>life insurance</h4>
                </div> </a>
            </div>
             <div class="clearfix"></div>
             <div class="gap"></div>
              <div class="clearfix"></div>
            <div class="col-sm-12">
            	<a href="#"><div class="health_blk animate" data-animate="zoomIn" data-duration="1.0s" data-delay="0.1s">
                	<span class="glyphicon glyphicon-music"></span>
                    <h4>personal loan</h4>
                </div> </a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp" />  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script>
$('.animate').scrolla({
		mobile: false,
		once: true
	});

</script>
</body>
</html>
