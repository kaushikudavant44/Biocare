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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Validate OTP</h4>
      </div>
      <div class="modal-body">
        <section class="lab_testsec otppg">
	 	<div class="text-center">
	 	<div class="otp-pg"><p>In order to access your account you will need to verify a sign in code send to you by SMS</p>
	 	
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
	<div class="register existblk exist-user">
	<h4>Enter Your Details</h4>
	<hr>
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
					<input type="text" placeholder="OTP"  id="otpUser" onchange="verifyEnterOTP()">
					 
					<div class="clearfix"></div>
					<label>Username</label>
					<input type="text" placeholder="Username" name="username" id="username" onkeypress="return (event.charCode > 32 &amp;&amp; event.charCode < 126)">
					<p id="valida" style="color:red;position:relative; font-size: 12px !important;"></p>
					<div class="clearfix"></div>
					<label>Password</label>
					<input type="password" placeholder="Password" name="password" id="password1">
					
					<p class="text-center"><input type="submit" value="Save" id="sub" class="btn-fr-all" onclick="submitOTPandUsernameAndPwd()" disable></p>
					
					</div>
					</div>
        </div>
    </div>
</section>

    
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
					<input type="text" placeholder="OTP"  id="otpUser" onchange="verifyEnterOTP()">
					 
					<div class="clearfix"></div>
					<label>Username</label>
					<input type="text" placeholder="Username" name="username" id="username" onkeypress="return (event.charCode > 32 &amp;&amp; event.charCode < 126)">
					<p id="valida" style="color:red;position:relative; font-size: 12px !important;"></p>
					<div class="clearfix"></div>
					<label>Password</label>
					<input type="password" placeholder="Password" name="password" id="password1">
					
					<p class="text-center"><input type="submit" value="Save" id="sub" class="btn-fr-all" onclick="submitOTPandUsernameAndPwd()" disable></p>
					
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
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
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


	  
</script>
    
<script>
 /*  $('#confirm_password').on('keyup', function () {
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message').html('Matching').css('color', 'green');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	}); */
  
  /* $('#password, #confirm_password').on('keyup', function () {
	
	 
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
	  
	  }); */
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
	 
	 function submitOTPandUsernameAndPwd(){
		 
		 
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
<script>

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
				alert(data);
				if(data.message!=null){
					//$('#otp').modal('hide');
					
					//document.getElementById("verifiedMark").style.display="block";
					//document.getElementById("verifyButton").style.display="none";
					//$("#contactNo").prop("readonly",true);
					//document.getElementById("submitButton").style.display="inline";
					$('#submitButton').attr("disabled", false);
					alert(data.message);
			    	
					//document.getElementById("submitButton").disabled=false;
					//document.getElementById("otpUser").disabled=true;
					
					}else{
						alert("Invalid OTP");
					}
				
				});
	
}
	
	

</script>
</body>
</html>

