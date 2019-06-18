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
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
    	<h2>StemCell Registration</h2>
        <ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="#">Pages</a></li>
			<li class="active"><a>Lab Registration</a></li>
		</ul>
        </div>
    </div>
</section>


<section id="registration">
	<div class="container">
    	<form method="POST" action='${pageContext.request.contextPath}/submitStemcellRegProcess' id="validation-form" enctype="multipart/form-data">
        	<div class="row">
            <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Patient Name</label>
            	<input type="text" class="input-text" name="patientName" id="patientName" data-rule-required="true" required/>
</div>
</div>
 
            	<div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Address</label>
    <input type="text" class="input-text" name="addr" id="addr" data-rule-required="true" required/>
                    </div>
                </div> 
                
  <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                     <label id="otherbranch" for="exampleInputEmail1">City</label>
                    <select class="input-text" id="cityId" name="cityId" onclick="getAllCityByStateId()" class="input-text" >
							 <c:forEach items="${cityList}" var = "cityList">
                             <option value="${cityList.cityId}">${cityList.cityName}</option>
                             </c:forEach>
                             
                    </select>
</div>
</div> 

               <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">State</label>
    <select data-placeholder="select gender" class="chosen-select form-control input-text" id="state" name="state">
                    	                      	  <option value=""></option>
                    	  <option value="married">Maharashtra</option>
                    	   <option value="unmarried">Karnataka-</option>
                    	    <option value="unmarried">Gujrat-</option>
                    	      <option value="unmarried">Chennai</option>
                    	    
                    	   
                    	            
                    	   
                    	  
                    	
                    	</select>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Country</label>
    <select data-placeholder="select gender" class="chosen-select form-control input-text" id="country" name="country">
                    	                      	  <option value=""></option>
                    	  <option value="india">India</option>
                    	   <option value="USA">USA</option>
                    	    <option value="Africa">Africa</option>
                    	      <option value="UAE">UAE</option>
                    	      </select>
                    	      </div>
                    
                </div>
                  <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Email</label>
    <input type="email" class="input-text" name="email" id="email" required/>
                    </div>
                    </div>
               
               
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Contact No1</label>
    <input type="text" class="input-text" name="contact1" id="contact1" required/>
                    </div>
                </div>
           <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Contact No2</label>
    <input type="text" class="input-text" name="contact2" id="contact2" required/>
                    </div>
                    </div>
        
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Date Of Birth</label>
    <input type="text"  class="input-text" name="birth_Date" id="birth_Date" required/>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Age</label>
    <input type="text" class="input-text"  name="age" id="age" required/>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                	    <label for="exampleInputEmail1">Gender</label>
                	
                    	<select data-placeholder="select gender" class="chosen-select form-control input-text" id="gender" name="gender">
                    	                     	  <option value=""></option>
                    	  <option value="2">Male</option>
                    	              <option value="2">Female</option>
                    	  
                    	
                    	</select>
    
        </div>
                </div>
                  <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Blood Group</label>
                    	<select data-placeholder="select gender" class="chosen-select form-control input-text" id="bloodGroup" name="bloodGroup">
                    	                      	  <option value=""></option>
                    	  <option value="A+">A+</option>
                    	   <option value="A-">A-</option>
                    	              <option value="B+">B+</option>
                    	                  <option value="B-">B-</option>
                    	                      <option value="AB+">AB+</option>
                    	                      <option value="o+">o+</option>
                    	                       <option value="o-">o-</option>
                    	                         <option value="AB">AB+</option>
                    	                  
                    	   
                    	  
                    	
                    	</select>
                    </div>
                </div>
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Marital Status</label>
   <select data-placeholder="select gender" class="chosen-select form-control input-text" id="maritalStatus" name="maritalStatus">
                    	                      	  <option value=""></option>
                    	  <option value="married">married</option>
                    	   <option value="unmarried">unmarried-</option>
                    	            
                    	   
                    	  
                    	
                    	</select>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">photo</label>
    <input type="file" class="input-text"  name="photo" id="photo"/ accept="image/x-png,image/gif,image/jpeg" required>
                    </div>
                    </div>

               
               
                
        
             


                <div class="col-sm-12 col-md-12">
                 <div class="form-group">
                    	<input type="submit" value="Submit" class="btn btn-success">
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
  
 <!-- <script>
	$(document)
   .ready(
  function() {
	$('#cityId')
									.change(
											function() {
												alert("kk");
												$
														.getJSON(
																'${getAllCityByStateId}',
																{
																	
																	cityId : cityId,
																	ajax : 'true'
																
																)};
										
 

					
	</script>
	
     
	 -->

</body>
</html>