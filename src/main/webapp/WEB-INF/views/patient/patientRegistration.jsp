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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
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
<!-- NAVBAR
================================================== -->
  <body>
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="usernameValidation" value="/usernameValidation" />
  <c:url var="userIdValidation" value="/userIdValidation" />
  <c:url var="sendOtp" value="/sendOtp" />
  <c:url var="submitOTPandUsernameAndPwd" value="/submitOTPandUsernameAndPwd" />
    <c:url var="sendTextOtp" value="/sendTextOtp" />
  <c:url var="verifyRegOTP" value="/verifyRegOTP" />
  <c:url var="verifyPatientEmail" value="/verifyPatientEmail" />
  <c:url var="verifyPatientContactNumber" value="/verifyPatientContactNumber" />
  <c:url var="verifyReferal" value="/verifyReferal" />
  
   <jsp:include page="../include/homeHeader.jsp"/> 
 
<div class="modal fade otp-pg" id="otp" tabindex="1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h4 class="modal-title" id="myModalLabel">Validate OTP</h4> 
      </div>
      <div class="modal-body">
        <section class="lab_testsec otppg">
	 	<div class="text-center">
	 	<div class="otp-pg"><p>In order to create new account you need to verify mobile number. Please enter OTP received on mobile number : <span id="mobileVerify"></span></p>
	 	
	 	<label>Enter OTP</label>
	 	<div id="divOuter">
	<div id="divInner">
		<input type="text" id="pincode-input2"  >
		<div class="timer"><span id="timer"></span></div>
		 <input type="button" class="resndotp" id="resendButton" onclick="verifyMobileNumber()" value="Resend OTP"  disabled> 
		<div class="resndotp">
		<!-- <a  id="resendButton" href="#" onclick="verifyMobileNumber()" disabled>Resend OTP</a> -->
		<p class="timeoutmsg" id="timeoutmsg" style="display:none">Timeout for OTP! Click on Resend OTP</p>
	</div>
	</div>
<div>
	 	<a href="#" onclick="verifyEnteredOTP()" class="btn-fr-all">Verify</a>
	 	</div>
	 	</div>
	 </div>
		
	</div>
	
	
</section>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<section id="registration" class="log_sec">
	<div class="container">
	<div class="register">
	<h4>Patient Registration</h4>
	<p class="text-center exist"><strong>Existing user?</strong> &nbsp; <a href="#" data-toggle="modal" data-target="#exist">Yes</a> </p>
	<hr>
    	<form id="reset1" name="regForm" method="POST" action="${pageContext.request.contextPath}/submitPatientRegProcess" onsubmit="return validateForm()" enctype="multipart/form-data">
        	<div class="row">
               			
               			
                        <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="firstname" class="reqd">First Name</label>
    <input type="text" class="input-text" required="" id="fName" name="fName" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)">
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="middlename">Middle Name</label>
    <input type="text" class="input-text" id="mName" name="mName" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)">
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="lastname" class="reqd">Last Name</label>
    <input type="text" class="input-text" required="" id="lName" name="lName" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)">
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">Country</label>
              	 <select class="input-text" required="" id="countryId" name="countryId" onchange="getStateBYCountry()">
                             <option>--select--</option>
                             
								<c:forEach items="${countryList}" var="countryList"
									varStatus="count">
									<option value="${countryList.countryId}"><c:out
											value="${countryList.countryName}" /></option>
								</c:forEach>
                    </select>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">State</label>
              	<select class="input-text"  id="stateId" name="stateId" onchange="getCityBYStateId()">
							 
                             <option value="">--select--</option>
                          
                             
                    </select>
                    </div>
                </div>
               			 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">City</label>
              	 <select class="input-text" required="" id="cityId" name="cityId">
							 <option value="">--select--</option> 
                    </select>
                    </div> 
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">Pincode</label>
              	 <input class="input-text  capitl_none" required="" id="pincode" name="pincode"  maxlength="6" onkeypress="return IsNumeric(event);">
                    </div> 
                </div>
                <div class="col-sm-8 col-md-8">
                	<div class="form-group">
                    	<label for="state" class="reqd">Address</label>
              	 <input class="input-text  capitl_none" required="" id="address" name="address"  maxlength="50">
                    </div> 
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group reletive">
                    	<label for="contact" class="reqd">Contact</label>
    		<input type="text" required="" class="input-text  capitl_none" id="contactNo" name="contactNo" onkeypress="return IsNumeric(event);" onblur="verifyNum()" min="10" maxlength="13">
                    <span id='contactMessage' style="position: absolute;color: red; line-height: 17px; font-size: 12px !important;"></span>
                    <span class="show-pass"><i class="icon-checked" aria-hidden="true" id="verifiedMark" style="display:none; color:green"></i></span>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="contact" class="reqd">Email</label>
    		<input type="email" required="" class="input-text  capitl_none" id="email" name="email" onblur="verifyEmail()"><p style="color:red;position:absolute" id="emailValidate"></p>
                    <span id='contactEmail' class="errormsg"></span>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="dob" class="reqd">Date Of Birth</label>
    		 <input class="input-text datepicker" required="" id="birthDate" readonly=""  name="birthDate" type="text">
                </div>
                    </div>
               
                
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="age">Qualification</label>
    		<input type="text"  class="input-text  capitl_none" id="qualification" name="qualification">
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="gender" required="" class="reqd">Gender</label>
            	<select class="input-text" id="gender" name="gender">
                  <option>--select--</option>
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
                </select>
                    </div>
                </div>
                      <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                     <label for="blood">Blood Group</label>
              	 <select class="input-text"  id="bloodGroup" name="bloodGroup">
              	 <option>Select</option>
                  <option>O Positive</option>
                  <option>O Negative</option>
                  <option>AB Positive</option>
                  <option>AB Negative</option>
                  <option>A Positive</option>
                  <option>A Negative</option>
                  <option>B Positive</option>
                  <option>B Negative</option>
                </select>
                    </div>
                    </div>
                    
                    <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="age" class="reqd">User name</label>
    		           <input type="text" required class="input-text capitl_none" id="uName" minlength="4"  maxlength="20" name="uName" onkeypress="return (event.charCode > 32 &amp;&amp; event.charCode < 126)"><p id="validate2" style="color:red;position:absolute; font-size: 12px !important;"></p>
                     </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group reletive passwrd">
                    	<label for="password" class="reqd">Password</label>
    		<input type="password" class="input-text capitl_none" required id="password"  minlength="8" maxlength="20" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><p id="validate1" style="color:red;position:absolute"></p>
    		
                 <span class="show-pass"><i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility" aria-hidden="true" onclick="myFunction()"></i></span>   </div>
                </div>
                
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group passwrd">
                    	<label for="password" class="reqd">Confirm Password</label>
    		<input type="password" class="input-text  capitl_none" required="" id="confirm_password" name="confirm_password"/><p style="position:absolute" id='message' class="errormsg"></p>
                    </div>
                </div> 
              
              
              <div class="col-sm-12 text-center">
				
				 <a href="javascript:void(0);" onclick="showReferalBox();"><strong>Have You Referal?</strong></a>
				<div id="referalDiv" style="display: none">
				  <div class="col-sm-6">   
				  <div class="form-group">
				 <input type="text" class="input-text capitl_none" name="referal" id="referal" placeholder="Enter Referal Code"/>
					</div> </div> <div class="col-sm-6">   <div class="form-group">
				<input type="button" value="select" onclick="applyReferal()" >
				</div></div>
				</div>			
				
				
				</div>
                <div class="clearfix"></div>
                <hr> 
                <div class="col-sm-12 text-center">
                <input type="checkbox" name="terms" value="Accept"><a href="#termcon" data-toggle="modal" class="trmsCon">I Agree the terms and condition</a>
                <div class="form-group">
               
                    	<input id="verifyButton" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()" disabled>
              			<!-- <input id="submitButton" type="submit" class="btn-fr-all" name="submit"  style="display: block"> -->
              			<input type="submit" id="submitButton" value="Submit" name="submit" class="btn-fr-all" style="display: none;">
                    	<input type="button" value="Reset" onclick="resetFunction()" class="btn-fr-all">
                </div>
                </div>
                </div>
        </form>
        </div>
    </div>
</section>

<div id="termcon" class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><strong>Bionische Terms and Conditions</strong></h4>
                </div>
                <div class="modal-body">
                    <h3>Refund Policy</h3>
                    <p>This policy is applicable on fees paid through Bionische platforms for Video Consultation, and In-Person Consultation.</p>
                    <ul>
                    	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	
                    </ul>
                    <hr>
                    <h3>Cancellation Policy</h3>
                    <p>This policy is applicable on fees paid through Bionische platforms for Video Consultation, and In-Person Consultation.</p>
                    <ul>
                    	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	<li>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</li> 
                  	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	
                    </ul>
                    <hr>
                    <h3>Disclaimer</h3>
                    <p>This policy is applicable on fees paid through Bionische platforms for Video Consultation, and In-Person Consultation.</p>
                    <ul>
                    	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </li> 
                    	<li>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</li> 
                    	
                    </ul>
                </div>
               
            </div>
        </div>
    </div>
    
<div class="modal fade" id="exist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h4 class="modal-title" id="myModalLabel">Enter the details</h4>
      </div>
      <div class="modal-body exist-user">
       <div class="owl-carousel owl-theme">
            <div class="item">
            		<label>Enter your user id</label>
					<input type="text" placeholder="Id" id="uId" onchange="validatePatientId()">
					 <p id="validateUserId" style="color:red;font-size:12px;" ></p>
					<div class="clearfix"></div>
					<label>Contact Number</label>
					<!-- <input type="text" placeholder="Email id" id="emailId" disabled> -->
					<input type="text" required="" id="emailId" name="contactNo" onkeypress="return IsNumeric(event);" min="10" maxlength="13" readonly>
					<div class="next-owlbtn text-center"><button type="button" id="nextButton" class="next_owl" onclick="verifyMobileNum()" disabled>Next</button></div>
					
					</div>
					
					<div class="item">
					
					<label>Enter OTP</label>
					<input type="text" placeholder="OTP"  id="otpUser" onchange="verifyEnterOTP()" required>
					 
					<div class="clearfix"></div>
					<label>Username</label>
					<input type="text" placeholder="Username" name="username" id="username" onkeypress="return (event.charCode > 32 &amp;&amp; event.charCode < 126)" required>
					<p id="valida" style="color:red;position:relative; font-size: 12px !important;" ></p>
					<div class="clearfix"></div>
					<label>Password</label>
					<input type="password" placeholder="Password" name="password" id="password1" required>
					
					<p class="text-center"><input type="submit" value="Save" id="sub" class="btn-fr-all" onclick="submitOTPandUsernameAndPwd1()" ></p>
					
					</div>
					</div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp" /> 

<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
   <%--  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script> --%>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>
    <!--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>-->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
   
    <script src="${pageContext.request.contextPath}/resources/js/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
     <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>

<script>

function timeout(){
let timerOn = true;

function timer(remaining) {
  var m = Math.floor(remaining / 60);
  var s = remaining % 60;
  
  m = m < 10 ? '0' + m : m;
  s = s < 10 ? '0' + s : s;
  document.getElementById('timer').innerHTML = m + ':' + s;
  remaining -= 1;
  
  if(remaining >= 0 && timerOn) {
    setTimeout(function() {
        timer(remaining);
    }, 1000);
    return;
  }

  if(!timerOn) {
    // Do validate stuff here
    return;
  }
  
  // Do timeout stuff here
  
  
  document.getElementById("timeoutmsg").style.display="block";
  //alert('Timeout for otp');
  document.getElementById("resendButton").disabled=false;
}

timer(120);
}


jQuery(document).ready(function() {
	  var owl = jQuery('.owl-carousel');
	  owl.owlCarousel({
	    items: 1,
	    loop: false,
	    touchDrag               : false,
        mouseDrag               : false,
	    autoplay: false
	 
	  });
	  jQuery('.play').on('click', function() {
	    owl.trigger('play.owl.autoplay', [2000])
	  })
	  jQuery('.stop').on('click', function() {
	    owl.trigger('stop.owl.autoplay')
	  })
	  $('.next_owl').click(function(){
		    $('.owl-carousel').trigger('to.owl.carousel', 1)
		  });

	});
jQuery('ul.nav li.dropdown').hover(function() {
	jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
	}, function() {
	jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
	});
	
	
	

 function getStateBYCountry() {
		 
	 					 
		 var countryId=document.getElementById("countryId").value; 
		 $('#stateId option').remove();
		  
		 $.getJSON('${getStateByCountryId}',
																
																{
																	countryId : countryId,
																	
																	ajax : 'true'
																},
																function(data) {
																		
																	var len = data.length;
																	var strVar="";
																	strVar +="<option value=''>--select--<\/option>";
																	for (var i = 0; i < len; i++) {
																		
																		strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
																 
																	} 
																	 $('#stateId').append($(strVar))

																});
		 
		 
	 }
 
 

 function getCityBYStateId() {
										 
		 var stateId=document.getElementById("stateId").value; 
		
		 $('#cityId option').remove();
		 $
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : stateId,
																	
																	ajax : 'true'
																},
																function(data) {
																	
																	
																	var len = data.length;
																	var strVar="";
																	strVar +="<option value=''>--select--<\/option>";
																	for (var i = 0; i < len; i++) {
																
																		strVar += "<option value="+data[i].cityId+">"+data[i].cityName+"<\/option>";
																 
																	} 
																	 $('#cityId').append($(strVar))

																})
		 
		 
	 }
	</script>
	
	<script>

 
 
 function eraseMsg()
 {
	 document.getElementById("validate2").innerHTML="";
	 
 }
 
 function erasePwdMsg()
 {
	 document.getElementById("validate1").innerHTML="";
	 
 }
  
	</script>

<script>
function resetFunction() {
    document.getElementById("reset1").reset();
}

function myFunction() {
    var x = document.getElementById("password");
    if (x.type === "password") {
        x.type = "text";
        
    } 
  
    	 else {
    	        x.type = "password";
    	    }
    
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(100)
                .height(100);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
function emailvalidation()
{
	var email = document.getElementById("email").value;
	document.getElementById("emailValidate").innerHTML=""; 
	if(/^[a-z]+$/i.test(email.charAt(0)))
		{
		
		}
	else{
		
		document.getElementById("emailValidate").innerHTML="";
		document.getElementById("emailValidate").innerHTML="Invalid email"; 
	}
	
} 

$('.datepicker').datepicker({
	 
	  autoclose: true,
	  endDate:new Date(),
	  format: "dd-mm-yyyy"}).datepicker()
	  
</script>
    
<script>
 /*  $('#confirm_password').on('keyup', function () {
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message').html('Matching').css('color', 'green');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	}); */
  
  $('#password, #confirm_password').on('keyup', function () {
	
	 
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message').html('Matching').css('color', 'green');
	    $('#submitButton').attr("disabled", false);
 	    if($('#password').val().length>7)
	    	$('#submitButton').attr("disabled", false);
	    	else {
	    	    $('#message').html('Password should be greater than 8').css('color', 'red');
	    	    $('#submitButton').prop("disabled", "disabled");
	    	}  
	  } else {
	    $('#message').html('Not Matching').css('color', 'red');
	  $('#submitButton').prop("disabled", "disabled");
}
	  
	  });
</script>
  <script>
  /* $('#password').on('keyup', function () {
	  


	    if($('#password').val().length>3){
	    	$('#validate1').html('');
	    	$('#submitBtn').attr("disabled", false);
	    }
	    	else {
	    	    $('#validate1').html('Password should be greater than 8').css('color', 'red');
	    	    $('#submitBtn').prop("disabled", "disabled");
	    	}
	    
	 
	});
  */
  </script>
  
  <script>
  
  $('#uName').on('focusout', function () {
		
		 $.getJSON('${usernameValidation}',
					{
						userName : $('#uName').val(),
						
						ajax : 'true',
					},
					function(data) {
						
						if(data.message=='Success')
							{
							
							//document.getElementById("validate").innerHTML="UserName Already Exists" ; 
							 $('#validate2').html('UserName Already Exists').css('color', 'red');
							 document.getElementById("uName").value="";
							
							}
						else
						{
							 $('#validate2').html('Username Available').css('color', 'green');
							
						}
						
						
					})
					
					 
		 
		});
  
    
</script>

 <script>
  
  
		
	 function validatePatientId(){
	  
	
		var patientId=document.getElementById("uId").value;
		
	 	$.getJSON('${userIdValidation}',
					{
						patientId : patientId,
						
						ajax : 'true',
					},
					function(data) {
						
						
						if(data.patientId>0)
							{
							
							//document.getElementById("validate").innerHTML="UserName Already Exists" ; 
							
							 document.getElementById("nextButton").disabled=false;
							 $('#validateUserId').html('User Id Existed').css('color', 'green');
							
							 document.getElementById("emailId").value=data.contactNo;
							
							
							}
						else
						{
							 $('#validateUserId').html('Incorrect User Id').css('color', 'red');
							 document.getElementById("uId").value="";
							
						}
						
						
					});
					
					 
		 
		}
	 
	 function sendOTP(){
			var email=document.getElementById("emailId").value;
			//window.open("${pageContext.request.contextPath}/sendOtp?email="+email,"_self");  
			
			
			$.getJSON('${sendOtp}',
					{
					email : email,
						
					ajax : 'true',
					});
		}
	 
	 function submitOTPandUsernameAndPwd1(){
		 
		 
		 	var patientId=document.getElementById("uId").value;
			var username=document.getElementById("username").value;
			var password=document.getElementById("password1").value;
			var otp=document.getElementById("otpUser").value;
			//alert(username+"aa"+password+"bb"+otp);
			if(username==null || username=='' || password=='' || password==null || otp==null || otp==''){
				
				alert("Please Enter Details");
			}else{
			
			$.getJSON('${submitOTPandUsernameAndPwd}',
					{
				patientId : patientId,
				
				username : username,
				
				password : password,
				
				otp : otp,
						
				ajax : 'true',
				},
				function(data) {
						 
					if(data.message!=""){
					
					window.open("${pageContext.request.contextPath}/showPatientLoginPage","_self");
					}else{
						alert("Invalid OTP");
					}
						
					});
			}
	 }
	 $('#pincode-input2').pincodeInput({hidedigits:false,inputs:6,complete:function(value, e, errorElement){
			$("#pincode-callback").html("Complete callback from 6-digit test: Current value: " + value);
			
			
		}});
			
		var obj = document.getElementById('partitioned');
		obj.addEventListener("keydown", stopCarret); 
		obj.addEventListener("keyup", stopCarret); 

		function stopCarret() {
			if (obj.value.length > 5){
				setCaretPosition(obj, 5);
			}
		}

		function setCaretPosition(elem, caretPos) {
		    if(elem != null) {
		        if(elem.createTextRange) {
		            var range = elem.createTextRange();
		            range.move('character', caretPos);
		            range.select();
		        }
		        else {
		            if(elem.selectionStart) {
		                elem.focus();
		                elem.setSelectionRange(caretPos, caretPos);
		            }
		            else
		                elem.focus();
		        }
		    }
		}
		
		 $('#contactNo').pincodeInput({hidedigits:false,inputs:10,complete:function(value, e, errorElement){
			 var contactNo=document.getElementById("contactNo").value;
			 
			 alert(contactNo);
			 $.getJSON('${verifyContactNumber}',
						{
					contactNo : contactNo,
						
					ajax : 'true',
					},
					function(data) {
							 
						alert(data.message);
							
						});
				
			}});

		function verifyMobileNumber(){
			 
			 
		 	var contactNo=document.getElementById("contactNo").value;
		 	$('#mobileVerify').text(contactNo);
		 	document.getElementById("resendButton").disabled=true;
		 	document.getElementById("timeoutmsg").style.display="none";
		//	var otp=document.getElementById("enterOTP").value;
			//alert(contactNo);
			if(contactNo!="")
			{
				$("#otp").modal();
			$.getJSON('${sendTextOtp}',
					{
				contactNo : contactNo,
					
				ajax : 'true',
				},
				function(data) {
						 
					alert(data.message);
					timeout();
						
					});
			}else{
				alert("Enter Mobile number");
			}
		 
	 }
		
		function verifyEnteredOTP(){
			
			var enteredOTP=document.getElementById("pincode-input2").value;
			if(enteredOTP==null){
				alert("OTP is empty! Please enter OTP")
			}
		
				$.getJSON('${verifyRegOTP}',
						{
					enteredOTP : enteredOTP,
						
					ajax : 'true',
					},
					function(data) {
						
						//document.getElementById("reset1").submit();	
						
						if(data.message!=null){
							$('#otp').modal('hide');
							
							document.getElementById("verifiedMark").style.display="block";
							document.getElementById("verifyButton").style.display="none";
							$("#contactNo").prop("readonly",true);
							document.getElementById("submitButton").style.display="inline";
							alert(data.message);
							
							}else{
								alert("Invalid OTP");
							}
						
						});
			
		}
		
</script>
<script type="text/javascript">
function validateForm()
{
var agreeCheckbox = document.forms["regForm"]["terms"];
if(!agreeCheckbox.checked) {
   alert('You need to accept terms to submit');
   return false;
}
return true;
}
</script>
<script>

function verifyEmail(){
	
	var email=document.getElementById("email").value;
	if(email!=null && email!=''){
	 $.getJSON('${verifyPatientEmail}',
				{
		 	email : email,
				
			ajax : 'true',
			},
			function(data) {
					 
				//alert(data.message);
					
				if(data.message=='Success')
				{
				
				
				 $('#contactEmail').html('Email Already Exists').css({'line-height':'17px','font-size':'12px !important','color':'red'});
				 document.getElementById("email").value="";
				 $('#submitButton').prop("disabled", "disabled");
				
				}
			
			 else if(data.message=='failed')
			{
				 $('#contactEmail').html('Email Available').css({'line-height':'17px','font-size':'12px !important','color':'green'});

			} 
				
				
				});
	}else{
		$('#contactEmail').html('');
		
	}
	
}
function verifyNum(){
	 
	var contactNo=document.getElementById("contactNo").value;
	if(contactNo!=null && contactNo!=''){
	 if(contactNo.length<10){
		
		// document.getElementById("contactMessage").innerHTML="Wrong Contact Number";
		 $('#contactMessage').html('Wrong Contact Number').css({'line-height':'17px','font-size':'12px','color':'red'});
		 document.getElementById("contactMessage").value="";
	 }else{
		 
		 $.getJSON('${verifyPatientContactNumber}',
					{
				contactNo : contactNo,
					
				ajax : 'true',
				},
				function(data) {
						 
					//alert(data.message);
						
					if(data.message=='Success')
					{
						document.getElementById("verifyButton").disabled=true;
					//document.getElementById("validate").innerHTML="UserName Already Exists" ; 
					 $('#contactMessage').html('Contact Number Already Exists').css({'line-height':'17px','font-size':'12px !important','color':'red'});
					 document.getElementById("contactNo").value="";
					 $('#submitButton').prop("disabled", "disabled");
					
					}
				
				 else
				{
					 document.getElementById("verifyButton").disabled=false;
					 $('#contactMessage').html('Contact Number Available').css({'line-height':'17px','font-size':'12px !important','color':'green'});
					 
				} 
					
					
					});
		 
		 
		 
		 
	 }
	}else{
		$('#contactMessage').html('');
	}
}

</script>
<script type="text/javascript">
function verifyMobileNum(){
	 
	 
 	var contactNo=document.getElementById("emailId").value;
 	
 	//document.getElementById("resendButton").disabled=true;
 	//document.getElementById("timeoutmsg").style.display="none";
//	var otp=document.getElementById("enterOTP").value;
	//alert(contactNo);
	if(contactNo!="")
	{
	//	$("#otp").modal();
	$.getJSON('${sendTextOtp}',
			{
		contactNo : contactNo,
			
		ajax : 'true',
		},
		function(data) {
				 
			alert(data.message);
		//	timeout();
				
			});
	}else{
		alert("Enter Mobile number");
	}
 
}

</script>
<script type="text/javascript">
function verifyEnterOTP(){
	
	var enteredOTP=document.getElementById("otpUser").value;
	if(enteredOTP==null){
		alert("OTP is empty! Please enter OTP")
	}

		$.getJSON('${verifyRegOTP}',
				{
			enteredOTP : enteredOTP,
				
			ajax : 'true',
			},
			function(data) {
				
				//document.getElementById("reset1").submit();	
				//alert(data);
				if(data.message!=null){
					//$('#otp').modal('hide');
					
					//document.getElementById("verifiedMark").style.display="block";
					//document.getElementById("verifyButton").style.display="none";
					//$("#contactNo").prop("readonly",true);
					//document.getElementById("submitButton").style.display="inline";
					//$('#submitButton').attr("disabled", false);
				//	alert(data.message);
			    	
					//document.getElementById("submitButton").disabled=false;
					//document.getElementById("otpUser").disabled=true;
					
					}else{
						alert("Invalid OTP");
					}
				
				});
	
}
	
	

</script>
<script>
  var username=document.getElementById("username").value;
  if(username==null || username==''){
	  
	  $('#valida').html('');
  }
  $('#username').on('focusout', function () {
		
		 $.getJSON('${usernameValidation}',
					{
						userName : $('#username').val(),
						
						ajax : 'true',
					},
					function(data) {
						
						if(data.message=='Success')
							{
							
							//document.getElementById("validate").innerHTML="UserName Already Exists" ; 
							document.getElementById("sub").disabled=true;
							 $('#valida').html('UserName Already Exists').css('color', 'red');
							
							 document.getElementById("username").value="";
							
							}
						else
						{
							 $('#valida').html('Username Available').css('color', 'green');
							
						}
						
						
					})
					
					 
		 
		});
  
  function showReferalBox(){
		var x=document.getElementById("referalDiv");
		 if (x.style.display === "none") {
			    x.style.display = "block";
			  } else {
			    x.style.display = "none";
			  }
	}
  
  function applyReferal(){
		
		var referal=document.getElementById("referal").value;

			$.getJSON('${verifyReferal}',
					{
				referal : referal,
					
				ajax : 'true',
				},
				function(data) {
					
					//document.getElementById("reset1").submit();	
					
					if(data.message!=null){
						
						alert(data.message);
						}
					
					});
		
	}		
</script>
</body>
</html>

