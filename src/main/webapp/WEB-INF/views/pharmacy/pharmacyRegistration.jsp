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
<!-- NAVBAR
================================================== -->
  <body>
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="usernameValidationOfPharmacy" value="/usernameValidationOfPharmacy" />
  <c:url var="verifyPharmacyEmail" value="/verifyPharmacyEmail" />
  <c:url var="verifyPharmacyContactNumber" value="/verifyPharmacyContactNumber" />
    <c:url var="sendTextOtp" value="/sendTextOtp" />
  <c:url var="verifyRegOTP" value="/verifyRegOTP" />
  <c:url var="verifyReferal" value="/verifyReferal" />
  
    <jsp:include page="../include/homeHeader.jsp"/> 
<div class="clearfix"></div>
<section id="registration" class="log_sec">
	<div class="container">
	<div class="register first_resgist">
	<h4>Pharmacy Registration</h4>   
	<hr>
    	<form method="POST" action='${pageContext.request.contextPath}/submitPharmacyRegProcess' enctype="multipart/form-data" id="reset1" name="regForm" onsubmit="return validateForm()">
        	<div class="row">
        		<div class="col-sm-12">
                	<div class="form-group">
                     <label for="exampleInputEmail1" class="reqd">Pharmacy Name</label>
            		 <input type="text" required class="input-text" name="medicalName" id="medicalName" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123 || (event.charCode > 31 && event.charCode < 33))" data-rule-required="true"/>
            		 </div>
					</div>
					<div class="col-sm-12">
                	<div class="form-group">
                     <label for="exampleInputEmail1" class="reqd">Email Id</label>
            		 <input type="email" required class="input-text capitl_none" name="email" id="email" onblur="verifyEmail()"/>
            		 <span id='contactEmail' class="errormsg"></span>
            		 </div>
					</div>
				<div class="col-sm-6">
				 <div class="form-group reletive">
				                     <label for="exampleInputEmail1" class="reqd">Contact No</label>
				            	<input required type="text"  class="input-text" name="contactNo" id="contactNo" onkeypress='return IsNumeric(event);' min="10" maxlength="13" class=form-control onblur="verifyNum()">
								<span id='contactMessage' class="rederror"></span>
								<span class="show-pass"><i class="icon-checked" aria-hidden="true" id="verifiedMark" style="display:none; color:green"></i></span>
				</div>
				</div> 
				<div class="col-sm-6">
                	<div class="form-group">
                     <label for="exampleInputEmail1" class="reqd">User Name</label>
            		 <input type="text" required class="input-text capitl_none" name="userName" id="userName" autocomplete="off" onkeypress="return (event.charCode > 0 && event.charCode < 32) || (event.charCode > 33 && event.charCode < 129)" max="20" data-rule-required="true"/>
            	 <span id='userNameMessage' class="errormsg"></span>
            		 </div>
					</div>
				<div class="col-sm-6">
				 <div class="form-group reletive">
				                    	<label for="exampleInputEmail1" class="reqd">Password</label>
				    <input type="password" required class="input-text capitl_none" name="password" id="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters and one special character" maxlength="20" /><p id="validate1" style="color:red;position:absolute" maxlength="20"></p>
				                    <span class="show-pass"><i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility" aria-hidden="true" onclick="showPassword()"></i></span>
				 </div>
				  </div>
				  <div class="col-sm-6">              
			    <div class="form-group passwrd">
				                    	<label for="exampleInputEmail1" class="reqd">Confirm Password</label>
				    <input type="password" required class="input-text capitl_none" name="confirm_password" id="confirm_password" /><p style="position:absolute" id='message' class="errormsg"></p>
				                   <!--  <i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i> -->
				                    <span id='message' class="errormsg"></span> 
				  </div>
				</div>
				
				<div class="col-sm-12 text-center">
				
				 
				<div id="referalDiv" >
				  <div class="col-sm-8">   
				  <div class="form-group">
				 <input type="text" class="input-text capitl_none" name="referal" id="referal" placeholder="Enter Referal Code (If Any)"/>
					</div> </div> <div class="col-sm-4">   <div class="form-group">
				<input type="button" value="Apply" onclick="applyReferal()" >
				</div></div>
				</div>			
				
				
				</div>
				
				<div class="clearfix"></div>
                <hr> 
				<div class="col-sm-12 text-center">
				<input type="checkbox" name="terms" value="Accept"><a href="#termcon" data-toggle="modal" class="trmsCon">I Agree the terms and condition</a>
                <div class="form-group">
                        <input id="verifyButton" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()">
              			<!-- <input id="submitButton" type="submit" class="btn-fr-all" name="submit"  style="display: block"> -->
              			<input type="submit" id="submitButton" value="Submit" name="submit" class="btn-fr-all" style="display: none;">
                    	<input type="reset" value="Reset"  class="btn-fr-all">
                </div>
                </div>
            </div>
        </form>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp" /> 
<div id="termcon" class="modal fade reportsDesign" role="dialog" data-backdrop="static" data-keyboard="false" >
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body card_sec">
      <div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
       <h4 class="modal-title text-left">Terms & Conditions</h4>
                    <p>By downloading or using the app, these terms will
                    automatically apply to you- you should make sure therefore
                    that you read them carefully before using the app. You are
                    not allowed to copy, or modify the app, any part of the app,
                    or our trademarks in any way. You are not allowed to attempt
                    to extract the source code of the app, and you also
                    should not try to translate the app into other languages, or
                    make derivative versions. The app itself, and all the trade
                    marks, copyright, database rights and other intellectual
                    property rights related to it, still belong to
                    Bionische Technology Private Limited.</p>
                    <hr>
                    <p>Bionische Technology Private Limited is committed to ensuring that the app
                    is as useful and efficient as possible. For that reason, we
                    reserve the right to make changes to the app or to charge
                    for its services, at any time and for any reason. We will
                    never charge you for the app or its services without making
                    it very clear to you exactly what you are paying for.</p>
                    <hr>
                    
                    <p>The Biocare app stores and processes personal data
                    that you have provided to us, in order to provide
                    our Service. It's your responsibility to keep your
                    phone and access to the app secure. We therefore recommend
                    that you do not jailbreak or root your phone, which is the
                    process of removing software restrictions and limitations
                    imposed by the official operating system of your device. It
                    could make your phone vulnerable to
                    malware / viruses / malicious programs, compromise your phone's
                    security features and it could mean that the
                    Biocare app won't work properly or at all.</p>
                    
                    <hr>
                     <p>You should be aware that there are certain things that
                    Bionische Technology Private Limited will not take responsibility for.
                    Certain functions of the app will require the app to have an
                    active internet connection. The connection can be Wi-Fi, or
                    provided by your mobile network provider, but
                    Bionische Technology Private Limited cannot take responsibility for the
                    app not working at full functionality if you don't have
                    access to Wi-Fi, and you don't have any of your data
                    allowance left.</p>
                    <hr>
                    <p>If you are using the app outside of an area with Wi-Fi, you
                    should remember that your terms of the agreement with your
                    mobile network provider will still apply. As a result, you
                    may be charged by your mobile provider for the cost of data
                    for the duration of the connection while accessing the app,
                    or other third party charges. In using the app, you are
                    accepting responsibility for any such charges, including
                    roaming data charges if you use the app outside of your home
                    territory (i.e. region or country) without turning off data
                    roaming. If you are not the bill payer for the device on
                    which you are using the app, please be aware that we assume
                    that you have received permission from the bill payer for
                    using the app.</p>
                    <hr>
                     <p>Along the same lines, Bionische Technology Private Limited cannot always
                    take responsibility for the way you use the app i.e. You
                    need to make sure that your device stays charged - if it
                    runs out of battery and you can not turn it on to avail the
                    Service, Bionische Technology Private Limited cannot accept
                    responsibility.</p>
                    <hr>
                     <p>With respect to Bionische Technology Private Limited's responsibility for
                    your use of the app, when you are using the app, it is
                    important to bear in mind that although we endeavour to
                    ensure that it is updated and correct at all times, we do
                    rely on third parties to provide information to us so that
                    we can make it available to you.
                    Bionische Technology Private Limited accepts no liability for any loss,
                    direct or indirect, you experience as a result of relying
                    wholly on this functionality of the app.</p>
                    <hr>
                      <p>At some point, we may wish to update the app. The app is
                    currently available on Android & iOS-the requirements for
                    both systems (and for any additional systems we
                    decide to extend the availability of the app to) may change,
                    and you'll need to download the updates if you want to keep
                    using the app. Bionische Technology Private Limited does not promise that
                    it will always update the app so that it is relevant to you
                    and/or works with the Android & iOS version that you have
                    installed on your device. However, you promise to always
                    accept updates to the application when offered to you, We
                    may also wish to stop providing the app, and may terminate
                    use of it at any time without giving notice of termination
                    to you. Unless we tell you otherwise, upon any termination,
                    (a) the rights and licenses granted to you in these terms
                    will end; (b) you must stop using the app, and (if needed)
                    delete it from your device.</p>
                    <hr>
                    <h3>Changes to This Terms and Conditions</h3>
                      <p>We may update our Terms and Conditions
                    from time to time. Thus, you are advised to review this page
                    periodically for any changes. We will
                    notify you of any changes by posting the new Terms and
                    Conditions on this page. These changes are effective
                    immediately after they are posted on this page.</p>
                    <hr>
                    <h3>Contact Us</h3>
                    <p>If you have any questions or suggestions about
                    our Terms and Conditions, do not hesitate to
                    contact us at 8469292946.</p>
                    <hr>
                    
                    <button type="button" class="btn-fr-all" data-dismiss="modal">Continue</button>
        
                </div>
    </div>

  </div>
</div>
    
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
		<p class="timeoutmsg" id="timeoutmsg" style="display:none">Time Out Click on Resend OTP</p>
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

<script>
jQuery('ul.nav li.dropdown').hover(function() {
	jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
	}, function() {
	jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
	});


	
	
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
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
   <%--  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script> --%>
     
    <!--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>-->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
   
    <script src="${pageContext.request.contextPath}/resources/js/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>
  <script type="text/javascript">
  
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
    
    document.getElementById("timeoutmsg").style.display="block";
    // Do timeout stuff here
    //alert('Timeout for otp');
    document.getElementById("resendButton").disabled=false;
  }

  timer(120);
  
  }
  $('#password, #confirm_password').on('keyup', function () {
  	  if ($('#password').val() == $('#confirm_password').val()) {
  	    $('#message').html('Matching').css('color', 'green');
  	    $('#submitBtn').attr("disabled", false);
  	    
  	  } else {
  	    $('#message').html('Not Matching').css('color', 'red');
  	  $('#submitBtn').prop("disabled", "disabled");
  }
  	});
  	
  
  $('#userName').on('focus', function () {
		
	  document.getElementById("userNameMessage").innerHTML="" ; 
		// $('#userNameMessage').html('UserName cannot be null').css('color', 'red');
		 																	 	 
});  

  function showPassword() {
      var x = document.getElementById("password");
      if (x.type === "password") {
          x.type = "text";
          
      } 
    
      	 else {
      	        x.type = "password";
      	    }
      
  }

   
  	
  $('#userName').on('focusout', function () {
  	
  	 $.getJSON('${usernameValidationOfPharmacy}',
  				{
  					userName : $('#userName').val(),
  					
  					ajax : 'true',
  				},
  				function(data) {
  					
  					if(data.message=='Success')
  						{
  						
  						//document.getElementById("validate").innerHTML="UserName Already Exists" ; 
  						 $('#userNameMessage').html('UserName Already Exists').css('color', 'red');
  						 document.getElementById("userName").value="";
  						
  						}
  					else
  					{
  						 $('#userNameMessage').html('Username Available').css('color', 'green');
  						
  					}
  					
  					
  				})
  				
  				 
  	 
  	});
  
  $('#pincode-input2').pincodeInput({hidedigits:false,inputs:6,complete:function(value, e, errorElement){
		/* $("#pincode-callback").html("Complete callback from 6-digit test: Current value: " + value);
		
		$(errorElement).html("I'm sorry, but the code not correct"); */
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
  	
  </script>
<script>

function verifyEmail(){
	
	var email=document.getElementById("email").value;
	 $.getJSON('${verifyPharmacyEmail}',
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
	
}
function verifyNum(){
	 
	var contactNo=document.getElementById("contactNo").value;
	
	 if(contactNo.length<10){
		
		// document.getElementById("contactMessage").innerHTML="Wrong Contact Number";
		 $('#contactMessage').html('Wrong Contact Number').css({'line-height':'17px','font-size':'12px','color':'red'});
		 document.getElementById("contactNo").value="";
	 }else{
		 
		 $.getJSON('${verifyPharmacyContactNumber}',
					{
				contactNo : contactNo,
					
				ajax : 'true',
				},
				function(data) {
						 
					//alert(data.message);
						
					if(data.message=='Success')
					{
					
					//document.getElementById("validate").innerHTML="UserName Already Exists" ; 
					 $('#contactMessage').html('Contact Number Already Exists').css({'line-height':'17px','font-size':'12px !important','color':'red'});
					 document.getElementById("contactMessage").value="";
					 $('#submitButton').prop("disabled", "disabled");
					
					}
				
				 else
				{
					 $('#contactMessage').html('Contact Number Available').css({'line-height':'17px','font-size':'12px !important','color':'green'});
					
				} 
					
					
					});
		 
		 
		 
		 
	 }
	
}



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
					}else{
						alert("Invalid OTP");
					}
				
				});
	
}		
</script>

</body>
</html>

