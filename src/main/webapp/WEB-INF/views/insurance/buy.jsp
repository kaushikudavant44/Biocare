<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body>
<c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  
  <jsp:include page="../include/patientHeader.jsp" />  
<%-- <div class="navbar-wrapper box">
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
 --%>
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
    	<div class="top_blk">
        	<img src="${pageContext.request.contextPath}/resources/images/premium_logo.jpg" class="img-responsive" alt="premium logo">
            <h5>Mediclassic - Individual - Health insurance</h5>
            <hr> 
            <table class="health-insurance-values">
            <tbody>
            <tr>
                <th>No. of Adult</th>
                <th>No. of Children</th>
                <th>Age of Eldest Member</th>
                <th>Sum Insured</th>
                <th>Premium</th>
            </tr>
           <tr>
                <td data-th="No. of Adult">${buyDetails.adult}</td>
                <td data-th="No. of Children">${buyDetails.child}</td>
                <td data-th="Age of Eldest Member">${buyDetails.age}</td>
                <td data-th="Sum Insured" class="formatAmount">
                    <span class="euro">
                        <span> ${buyDetails.cover}</span>
                        </span>
                </td>
                <td data-th="Premium" class="formatDouble"><span class="euro">${buyDetails.premium}</span></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="clearfix"></div>
        <hr>
        <form action="${pageContext.request.contextPath}/submitInsuranceReg" onsubmit="return validateForm()" method="get">
         <div class="cont_blk">
        <h5><strong>Your Contact Info. (so we swoop in & help any time!)</strong></h5>
        <input  type="hidden" value="${buyDetails.age}"  id="age" name="age" required/>
        <input  type="hidden" value="${buyDetails.cover}" name="cover" required/>
        <input  type="hidden" value="${buyDetails.premium}" name="premium" required/>
        <input  type="hidden" value="${buyDetails.noOfAdult}" name="noOfAdult" required/>
         <input  type="hidden" value="${buyDetails.noOfChild}" name="noOfChild" required/>
         <input  type="hidden" value="${buyDetails.companyId}" name="companyId" required/>
        
				<span class="input input--nao">
					<input class="input__field input__field--nao"  type="text" id="proposerContactNo" name="proposerContactNo" maxlength="10" onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' type=number  required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Contact No.</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="email" id="proposerEmailId" name="proposerEmailId" required/>
					<label class="input__label input__label--nao" for="input-2">
						<span class="input__label-content input__label-content--nao">Enter Email Id</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
			
        </div>
        <div class="clearfix"></div>
        <hr>
         <div class="cont_blk">
        <h5><strong>Proposer Details</strong></h5>
        
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerFirstName" name="proposerFirstName" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">First Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerMiddleName" name="proposerMiddleName" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Middle Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerLastName" name="proposerLastName" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Last Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <div class='input-group date' id='datetimepicker1'>
                         <span class="input input--nao">
                            <input type='text' class="input__field input__field--nao" required id="proposerDob" name="proposerDob" placeholder="Date of Birth (dd/mm/yy)"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
                    </span>
                       
                </div>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerPanNo" name="proposerPanNo" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">PAN (optional)</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerAdharNo" name="proposerAdharNo" maxlength="10" onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' type=number required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Aadhar Number</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerAnualIncome" name="proposerAnualIncome" maxlength="10" onkeypress='return IsNumeric(event);' ondrop='return false;' onpaste='return false;' type=number required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Annual gross income (in Rs) </span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerTempAddress" name="proposerTempAddress" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Address</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
               
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao country" id="proposerCountryId" name="proposerCountryId" required>
                        <option>Country</option>
                        <c:forEach items="${countryList}" var = "countryList">
                             <option value="${countryList.countryId}">${countryList.countryName}</option>
                             </c:forEach>
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao state" id="proposerStateId" name="proposerStateId" required>
                        <option value="" disabled="disabled" selected >State</option>
                        
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao city" id="proposerCityId" name="proposerCityId">
                        <option>City</option>
                        
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerPincode" name="proposerPincode" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Pincode</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
               
                 <div class="clearfix"></div>
        		 <hr>
        		 <h5><strong>Permanent Address</strong></h5>
                 <div class="row">
                 <div class="col-sm-12">
                 <div class="panel-group" id="accordion">
    <div class="panel panel-default">
                 <div class="col-sm-8">
                 	<p class="text-left">PLEASE SELECT IF YOUR PERMANENT ADDRESS IS SAME AS YOUR CORRESPONDENCE ADDRESS</p>
                 </div>
                 <div class="col-sm-4">
                 
                    <div class="radio">
          <label><input type="radio" value="yes" name="verifyAddress">YES</label>
        </div>
                    <div class="radio">
          <label><input type="radio" value="no" name="verify" data-toggle="collapse" data-parent="#accordion" href="#collapse1">NO</label>
          
        </div>
                   
        </div>
        <div class="clearfix"></div>
       			 <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">
          <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerPermanentAddress" name="proposerPermanentAddress" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Address</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				<span class="input input--nao">
				<select class="selectpicker input__field input__field--nao" id="proposerPermanentStateId" name="proposerPermanentStateId">
                        <option>State</option>
                        
			    </select>
					
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				<span class="input input--nao">
					<select class="selectpicker input__field input__field--nao" id="proposerPermanentCityId" name="proposerPermanentCityId">
                        <option>City</option>
                        
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="proposerPermanentPinCode" name="proposerPermanentPinCode"/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Pincode</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
          </div>
          </div>
        			</div>
        			</div>
    			</div>
                </div>
                <div class="clearfix"></div>
        		 <hr>
        		 <h5><strong>Existing illness</strong></h5>
                 <div class="row">
                 <div class="col-sm-12">
                 <div class="col-sm-8">
                 
                 	<a href="#" data-toggle="tooltip"  data-placement="bottom" title="Select Yes if the insured person has been diagnosed with any illness"><p class="text-left">HAVE YOU OR OTHER FAMILY MEMBERS PROPOSED, EVER SUFFERED OR ARE SUFFERING FROM ANY DISEASE/AILMENT/ADVERSE MEDICAL CONDITION OF ANY KIND, ESPECIALLY HEART/STROKE/CANCER/RENAL DISORDER/ALZHEIMER'S DISEASE/PARKINSONS'S DISEASE?</p></a>
                 </div>
                 <div class="col-sm-4">
                    <div class="radio">
          <label><input class="diagnosis" name="prop" type="radio" onchange='handleChange(this);'>YES</label>
        </div>
                    <div class="radio">
          <label><input class="not" name="prop" type="radio">NO</label>
        </div>
    			</div>
                </div>
                </div>
                
        </div>
        <div class="clearfix"></div>
        <hr>
        <div class="cont_blk">
        
        <c:forEach var = "i" begin = "1" end ="${buyDetails.noOfAdult }" >
        <h5><strong>Adult ${i}</strong></h5>
        
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}adultFirstName" name="${i}adultFirstName" required />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">First Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}adultMiddleName" name="${i}adultMiddleName" required />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Middle Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}adultLastName" name="${i}adultLastName" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Last Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
                        <div class="gender_sec"> 
                       	 <div class="checkbox">
                  <label>Gender :</label>
                 
                </div>
                         <div class="checkbox">
                                   
                      <label><input type="radio" value="male"  name="${i}adultGender" >Male</label>
                      </div>
                         <div class="checkbox">
                      <label><input type="radio" value="female" name="${i}adultGender" >Female</label>
                     
                    </div>
        				</div>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao" id="${i}proposerRelation" name="${i}proposerRelation" required>
                        <option>Relation with the Proposer</option>
                        <option value="self">self </option>
                        <option value="Spouse">Spouse</option>
                        
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao" >
					<select class="selectpicker input__field input__field--nao" id="${i}adultOccupation" name="${i}adultOccupation" required>
                        <option>Occupation</option>
                        <option value="Business">Business </option>
                        <option>Professional Doctor</option>
                        <option>Professional Engineer</option>
                        <option>Professional Lawyer</option>
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <div class='input-group adult_b' id='datetimepicker1'>
                         <span class="input input--nao">
                            <input type='text' class="input__field input__field--nao" id="${i}adultDob" name="${i}adultDob" placeholder="Date of Birth (dd/mm/yy)" required/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
                    </span>
                       
                </div>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}adultHeight" name="${i}adultHeight" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Height(cms)</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}adultWeight" name="${i}adultWeight" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Weight(kgs)</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                 <div class="row">
              <div class="col-sm-12">
                 <div class="col-sm-8">
                 	<p class="text-left">DO YOU HAVE ANY HEALTH PROBLEMS?</p>
                 </div>
                 <div class="col-sm-4">
                    <div class="checkbox">
          <label><input class="diagnosis" name="adult" type="radio" onchange='handleChange(this);'>YES</label>
        </div>
                    <div class="checkbox">
          <label><input class="not" name="adult" type="radio">NO</label>
        </div>
    			</div>
                </div>
               </div>
               <div class="clearfix"></div>
        		 
        		 <h5><strong>Social Status Details</strong></h5>
                 <div class="row">
                    <div class="col-sm-12">
                 <div class="col-sm-8">
                 	<a href="#" data-toggle="tooltip"  data-placement="bottom" title="Select ‘Yes’ if your family’s social status is BPL (Below Poverty Line), you are disabled or work in an Unorganized/Informal sector."><p class="text-left">DO YOU BELONG TO A BPL FAMILY, ARE YOU DISABLED OR WORK IN AN UNORGANIZED/INFORMAL SECTOR?</p></a>
                 </div>
                 <div class="col-sm-4">
                    <div class="checkbox">
          <label><input type="radio" value="1" id="status" name="${i}status" >YES</label>
        </div>
                    <div class="checkbox">
          <label><input type="radio" value="0" id="status" name="${i}status">NO</label>
        </div>
        </div>
    			</div>
                </div>
        </c:forEach>        
                
                
                
                
                
                 <div class="clearfix"></div>
                <c:forEach var = "i" begin = "1" end ="${buyDetails.noOfChild }" >
                 <h5><strong>Child ${i}</strong></h5>
        
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}childFname" name="${i}childFname" onClick="verifyAge(${buyDetails.noOfAdult})" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">First Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				 <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}childMname" name="${i}childMname" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Middle Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}childLname" name="${i}childLname" required/>
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Last Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao" >
                        <div class="gender_sec"> 
                       	 <div class="checkbox">
                  <label>Gender :</label>
                 
                </div>
                         <div class="checkbox">
                                   
                      <label><input type="radio" name="${i}gender" value="Male">Male</label>
                      </div>
                         <div class="checkbox">
                      <label><input type="radio" name="${i}gender" value="Female">Female</label>
                     
                    </div>
        				</div>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao" id="${i}relationWithProposer" name="${i}relationWithProposer" required>
                        <option>Relation with the Proposer</option>
                        <option>Son</option>
                        <option>Daughter</option>
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <div class='input-group adult_b' id='datetimepicker1'>
                         <span class="input input--nao">
                            <input type='text' class="input__field input__field--nao" id="${i}dob" name="${i}dob" required placeholder="Date of Birth (dd/mm/yy)" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
                    </span>
                       
                </div>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}height" name="${i}height" required />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Height(cms)</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="${i}weight" name="${i}weight" required />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Enter Weight(kgs)</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <div class="clearfix"></div>
                
                 <div class="row">
              <div class="col-sm-12">
                 <div class="col-sm-8">
                 	<p class="text-left">DO YOU HAVE ANY HEALTH PROBLEMS?</p>
                 </div>
                 <div class="col-sm-4">
                    <div class="radio">
          <label><input class="diagnosis" name="child" type="radio">YES</label>
        </div>
                    <div class="radio">
          <label><input class="not" name="child" type="radio">NO</label>
        </div>
    			</div>
                </div>
               </div>
              </c:forEach>
        </div>
        <p class="text-center"><input class="bg-primary text-white" id="registration" type="submit" value="Submit"></p>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script>
  $('#datetimepicker1').datetimepicker({ format: 'YYYY-MM-DD' });
  $('.adult_b').datetimepicker({ format: 'YYYY-MM-DD' });
  function validateForm() {
    var x = document.forms["myForm"]["fname"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
}
function handleChange(cb) {
  if(cb.checked == true){
   alert('Your not Applicable');
  } else {
	  alert('Your not Applicable');
  }
}	
   $(function () {
     $('input[type=checkbox]').click(function () {
         var chks = document.getElementById('<= chkRoleInTransaction.ClientID >').getElementsByTagName('INPUT');
         for (i = 0; i < chks.length; i++) {
            chks[i].checked = false;
         }
         if (chks.length > 1)
            $(this)[0].checked = true;
     });
 }); 
   
   var specialKeys = new Array();
   specialKeys.push(8); //Backspace
   function IsNumeric(e) {
       var keyCode = e.which ? e.which : e.keyCode
       var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
      // document.getElementById("error").style.display = ret ? "none" : "inline";
       return ret;
   }
   
</script>

<script type="text/javascript">
        function verifyAge(noOfAdult){
        	//alert("h");
        	//alert(noOfAdult);
        	var adultage = document.getElementById("age").value;
        	
        	if(noOfAdult==1)
        	{
           		var comingdob = document.getElementById("1adultDob").value;
           		var dob=comingdob.replace(/-/g, ""); 
           		var adult1Age=calculateAge(dob);
           		if(adult1Age>adultage||adult1Age!=adultage)
           			{
           			alert("Age must be same as you mention before Choose company!!");
           			}
        	}
        	else
        		{
        		var comingdob1 = document.getElementById("1adultDob").value;
        		var comingdob2 = document.getElementById("2adultDob").value;
        		var dob1=comingdob1.replace(/-/g, "");
        		var dob2=comingdob2.replace(/-/g, "");
           		var adult1Age=calculateAge(dob1);
           		var adult2Age=calculateAge(dob2);
           		if(adult1Age!=adultage&&adult1Age>adultage||adult2Age!=adultage&&adult2Age>adultage)
           		{
           			alert("Age must be same as you mention before Choose company!!");
           		}
           		if(adult1Age>adultage||adult2Age>adultage)
           		{
           			alert("Age must be same as you mention before Choose company!!");	
           		}
        		      		
        		}   	
        	
        }
        
        function calculateAge(dob){
        	
        	var year = Number(dob.substr(0, 4));
        	var month = Number(dob.substr(4, 2)) - 1;
        	var day = Number(dob.substr(6, 2));
        	var today = new Date();
        	var age = today.getFullYear() - year;
        	if (today.getMonth() < month || (today.getMonth() == month && today.getDate() < day)) {
        	  age--;
        	
        		}
        	
        	return age;
        	
        }
        
        
         
</script>
<script src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
		</script>

<script type="text/javascript">

$('.diagnosis').mousedown(function() {
	//alert("came");
	
    	$("#registration").prop("disabled", true).removeClass("bg-primary text-white"); 

    	
});

$('.not').mousedown(function() {
    
    	$("#registration").prop("disabled", false);
    	
});
</script>

<script>
 $(document).ready(function() { 
		$('.country').change(
				function() {
					// alert("came");
					$.getJSON('${getStateByCountryId}', {
						countryId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose State...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].stateId + '">'
									+ data[i].stateName + '</option>';
						} 
						html += '</option>';
						$('.state').html(html);
						$(".state").trigger("chosen:updated");
						
						$('#proposerPermanentStateId').html(html);
						$("#proposerPermanentStateId").trigger("chosen:updated");
					

					});
					
				 
		
				});
	});
 
 
 $(document).ready(function() { 
		$('.state').change(
				function() {
					 
					$.getJSON('${getCityByStateId}', {
						stateId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose City...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].cityId + '">'
									+ data[i].cityName + '</option>';
						} 
						html += '</option>';
						$('.city').html(html);
						$(".city").trigger("chosen:updated");

					});
					
				 
		
				});
	});
 
 $(document).ready(function() { 
		$('#proposerPermanentStateId').change(
				function() {
					 
					$.getJSON('${getCityByStateId}', {
						stateId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose City...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].cityId + '">'
									+ data[i].cityName + '</option>';
						} 
						html += '</option>';
						$('#proposerPermanentCityId').html(html);
						$("#proposerPermanentCityId").trigger("chosen:updated");

					});
					
				 
		
				});
	});


 </script>

</body>
</html>
