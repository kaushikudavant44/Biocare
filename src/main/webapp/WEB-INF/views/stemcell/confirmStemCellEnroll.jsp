<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/docs/3.3/favicon.ico">
   
    <title>home for health</title>

    <!-- Bootstrap core CSS -->  
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chosen.css">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--<link href="Carousel%20Template%20for%20Bootstrap_files/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!--<script src="Carousel%20Template%20for%20Bootstrap_files/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    
   
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap-datepicker/css/datepicker.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
    <div id="top-bg">
    	<div class="container">
        	<div class="top-right">
            	<ul>
                	<li><a href="#">Login </a></li>
                    <li><a href="#">Sign Up</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
            </div>
        </div>
    </div>
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="/"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
              <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Department</a></li>
                 <li><a href="#">Services</a></li>
                <li><a href="#">Appointment</a></li>
                 <li><a class="last" href="#">Contact</a></li>
                
                <!--<li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>-->
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/inner-head.jpg" alt="First slide">
        </div>
      </div>
    </div><!-- /.carousel -->


<section id="headign-bg">
	<div class="container">
    	<div class="page-title">
    	<h2>Confirm Page</h2>
        <ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="#">Pages</a></li>
			<li class="active"><a>Enroll Confirmation Page</a></li>
		</ul>
        </div>
    </div>
</section>


<section id="registration">
	<div class="container">
    	<form method="POST" action='${pageContext.request.contextPath}/submitPatientStemcellRegProcess' id="validation-form" enctype="multipart/form-data">
    	 
    	 <input type="hidden" id="countryName" value="${confirmDetails.countryId}" name="countryName"/>
				<input type="hidden" id="stateName" value="${confirmDetails.stateId}" name="stateName"/>
				<input type="hidden" id="cityName" value="${confirmDetails.cityId}" name="cityName"/>
				<input type="hidden" id="hospitalName" value="${confirmDetails.hospitalId}" name="hospitalName"/>
    	 
    	 
    	 
    	 
        	<div class="row">
        	  <div class="col-sm-3 col-md-3">
        	  <div class="form-group">
        	  
        	   
country:<input type="text"  class="input-text" name="countryId" id="countryId" value="${confirmDetails.countryName}" required/>
			         
                     
						</div>
						</div>
						
						
		 <div class="col-sm-3 col-md-3">
        	  <div class="form-group">
        	  
        	  
state:<input type="text"  class="input-text" name="stateId" id="stateId" value="${confirmDetails.stateName}" required/>
			         
                     
						</div>
						</div>
						
						<div class="col-sm-3 col-md-3">
        	  <div class="form-group">
        	  
        	  
city:<input type="text"  class="input-text" name="stateId" id="stateId" value="${confirmDetails.cityName}" required/>
			         
                     
						</div>
						</div>
					  
					  
					  			<div class="col-sm-3 col-md-3">
        	  <div class="form-group">
        	  
        	  
Hospital:<input type="text"  class="input-text" name="hospitalId" id="hospitalId" value="${confirmDetails.hospitalName}" required/>
			         
                     
						</div>
						</div>
						
						
								  			<div class="col-sm-3 col-md-3">
        	  <div class="form-group">
        	  
        	  
PregNancyType:<input type="text"  class="input-text" name="pregnancyType" id="pregnancyType" value="${confirmDetails.pregnancyType}" required/>
			         
                     
						</div>
						</div>
					  
					  					
								  			<div class="col-sm-3 col-md-3">
        	  <div class="form-group">
        	  
        	  
ExpectedDeliveyDate:<input type="text"  class="input-text" name="expectedDeliveryDate" id="expectedDeliveryDate" value="${confirmDetails.expectedDeliveryDate}" required/>
			         
                     
						</div>
						</div>
					  
						
				
                <div class="col-sm-12 col-md-12">
                 <div class="form-group">
                    	<input type="submit" value="Continue" class="btn btn-success" onclick="Validate()">
              <a href='${pageContext.request.contextPath}/showEnrollPatientStemCell'></a><input type="submit" value="Edit" class="btn btn-success" onclick="Validate()"></a>
                    	
                    </div>
            </div>
            </div>
        	
        </form>
    
    </div>
</section>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
     
    <!--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>-->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
   
    <script src="${pageContext.request.contextPath}/resources/js/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script>
  $('#expectedDeliveryDate').datetimepicker({ format: 'DD/MM/YYYY' });
  $('#birth_Date').datetimepicker({ format: 'DD/MM/YYYY' });
			
  </script>
   <script type="text/javascript">
            function Validate()
            {
                var e = document.getElementById("bloodGroup");
                var e = document.getElementById("pregnancyType");

                var strUser = e.options[e.selectedIndex].value;

              //  var strUser1 = e.options[e.selectedIndex].text;
                if(strUser==0)
                {
                    alert("Please select");
                }
            }
        </script> 
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
</body>
</html>