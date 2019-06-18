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
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
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


<!-- <style type="text/css">
.field-icon {
	float: right;
	margin-left: -25px;
	margin-top: -25px;
	position: relative;
	z-index: 2;
}
</style> -->

</head>
<body class="login_prt">
	<c:url var="usernameValidation" value="/usernameValidation" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
	<c:url var="getStateByCountryId" value="/getStateByCountryId" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
	<c:url var="doctorLoginProcess" value="/doctorLoginProcess" />
	<c:url var="usernameValidationOfDoctor"
		value="/usernameValidationOfDoctor" />

	<div class="clearfix"></div>
	<jsp:include page="../include/homeHeader.jsp" />
	<input type="hidden" id="token" id="token">
	<div class="clearfix"></div>
	<%-- <section class="log_sec">
	<div class="container">
	 <div class="login1_blk">
	 	<h4>Doctor Login</h4>
	 	<hr>
	 		<div class="login-form">
	 			<p id="errormessage" style="color:red;position:absolute; margin: 0 auto; left:0; right:0" maxlength="20"></p>
        <input type="text" id="LogInUname" name="userName" placeholder="Username" class="capitl_none" required="required" onclick="clearMsg()" >
       <div class="loader2" style="position: fixed;margin-left: 140px" id="loader"> </div>
        <input type="password" id="LogInPasswors" name="password" class="capitl_none" placeholder="password" onkeypress="if(event.keyCode==13) {doctorLogin();}" required>
	 	
	 	<input type="submit" name="submit" class="btn-fr-all" placeholder="login" onclick="doctorLogin()" value="Login">
	<a href="${pageContext.request.contextPath}/showDoctorRegProcess">Sign Up</a><br>
	<a href="#" onclick="usrnameMsgForForgetPwd()">Forgot Password?</a>
	 		</div>
	 </div>
		
	</div>
</section> --%>
	<div class="login_screen">
		<img
			src="${pageContext.request.contextPath}/resources/images/login_bg.png"
			class="img-responsive" alt="login">
	</div>
	<div class="log_user dr-log">
		<%-- <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="logo"> --%>
		<h4 class="text-center">Doctor Login</h4>
		<div class="form-group">
			<p id="errormessage"
				style="color: red; position: absolute; margin: 0 auto; text-align: center; left: 0; right: 0"
				maxlength="20">${msg}</p>
			<input type="text" id="LogInUname" name="userName"
				placeholder="Username" class="capitl_none" required="required"
				onclick="clearMsg()">
		</div>


		<!--  <div class="form-group eye-pass">
        <input type="password" id="LogInPasswors" name="password" class="capitl_none" placeholder="Password" onkeypress="if(event.keyCode==13) {doctorLogin();}" required>
    	<a><i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i></a>
    	</div> -->

		<div class="form-group">

			<input id="password-field" type="password" class="capitl_none"
				name="password" placeholder="Password"
				onkeypress="if(event.keyCode==13) {doctorLogin();}" required>
			<span toggle="#password-field"
				class="fa fa-fw fa-eye field-icon toggle-password"></span>

		</div>

		<p class="text-center">
			<input type="submit" class="submit_b" onclick="doctorLogin()"
				value="Login">
		</p>
		<p class="text-left">
			<a href="${pageContext.request.contextPath}/ShowDoctorForgotPassword" class="link_anch"  >
				Forgot Password ?</a>
		</p>
		<p class="text-right">
			<a href="${pageContext.request.contextPath}/showDoctorRegProcess"
				class="link_anch"> Sign Up</a>
		</p>
	</div>

	<%-- <jsp:include page="../include/footer.jsp" />  --%>
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
		
		 <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/chatroom/notification_doctor.js" type="text/javascript"></script>
	<script>
$('.animate').scrolla({
		mobile: false,
		once: true
	});

</script>

	<script type="text/javascript">
//new WOW().init();
jQuery(document).ready(function() {
  var owl = jQuery('.owl-carousel');
  owl.owlCarousel({
    items: 3,
    loop: true,
    margin: 10,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: true
  });
  jQuery('.play').on('click', function() {
    owl.trigger('play.owl.autoplay', [2000])
  })
  jQuery('.stop').on('click', function() {
    owl.trigger('stop.owl.autoplay')
  })
})


jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>

	<script type="text/javascript"> 
  
  /* function usernameValidation(){
		 
		 var userName=document.getElementById("uName").value; 
		    document.getElementById("validate1").innerHTML="";
		 $
			.getJSON(
					'${usernameValidation}',
					{
						userName : userName,
						
						ajax : 'true'
					},
					function(data) {
						
						if(data.message=='Success')
							{
							document.getElementById("uName").value="";
							document.getElementById("validate").innerHTML="UserName Already Exists" ; 
							
							
							}
						else
						{
							
							
						}
						
						
					})
	 } */
  
 
function validatePassword() {
    var newPassword = document.getElementById("password").value;

    var minNumberofChars = 8;
    var maxNumberofChars = 16;
    var regularExpression  =/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
  
    if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
    	document.getElementById("password").value="";
    	document.getElementById("validate1").innerHTML="password length should be min 8"; 
        return false;
    }
    if(!regularExpression.test(newPassword)) {
       
        document.getElementById("password").value="";
        document.getElementById("validate1").innerHTML="";
    	document.getElementById("validate1").innerHTML="password should contain atleast one number and one special character"; 
        return false;
    }
    if(newPassword=username)
	{
	document.getElementById("password").value="";
    document.getElementById("validate1").innerHTML="";
	document.getElementById("validate1").innerHTML="password should not be same as username"; 
    return false;
	}
}


function resetFunction() {
    document.getElementById("reset").reset();
}
function eraseMsg()
{
	 document.getElementById("validate").innerHTML="";
	 
}
function myFunction() {
	

    var x = document.getElementById("password");
    
    if (x.type === "password") {
        x.type = "text";
        
    }
}
</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
    
	$('.datepicker').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	
</script>


	<script>
		 
	 function doctorLogin() {
		  
		 document.getElementById("loader").style.display='block';
		 var userName=document.getElementById("LogInUname").value; 
		 var password=document.getElementById("password-field").value;
		 var token=document.getElementById("token").value;
		if(userName==null || userName==''){
			 document.getElementById("errormessage").innerHTML="Enter Username.";
		}else if(password==null || password==''){
			 document.getElementById("errormessage").innerHTML="Enter Password.";
		}else{
		 
		 
		 $.getJSON(	'${doctorLoginProcess}',
																{
																	userName : userName,
																	password : password,
																	webToken : token,
																	ajax : 'true'
																},
																function(data) {
																	 
																	if(data.error)    
																		{
																		//alert("wrong");
																		 document.getElementById("errormessage").style.display='block'
																		 document.getElementById("loader").style.display='none'
																	 document.getElementById("errormessage").innerHTML=data.message; 
																		 setTimeout(function() {
																			    $('#errormessage').fadeOut('slow');
																			}, 5000);
																		}  
																	else
																		{
																		 document.getElementById("errormessage").style.display='block'
																		document.getElementById("loader").style.display='none'
																			document.getElementById("errormessage").style.color='green'
																			 document.getElementById("errormessage").innerHTML="Login Suuccessful"; 
																		window.open("${pageContext.request.contextPath}/"+data.message,"_self");

																		}
																})
		
		 
	 }
	}
	 
	 function clearMsg()
	 {
		 document.getElementById("errormessage").innerHTML="";  
	 }
	 function erasePwdMsg()
	 {
				 document.getElementById("validate1").innerHTML="";
	 }
	
	 function usrnameMsgForForgetPwd() {
		 
		 var userName=document.getElementById("LogInUname").value; 
		 
		
		
																	if(userName==""||userName==null) 
																		{
																	 document.getElementById("errormessage").innerHTML="Please enter username."; 
																		}  else{
																	
																		 $.getJSON('${usernameValidationOfDoctor}',
																					{
																						userName : userName,
																						
																						ajax : 'true',
																					},
																					function(data) {
																						      
																						 if(data.message=='failed')
																						{
																							 $('#errormessage').html('Please Enter Valid Username').css({'line-height':'17px','font-size':'12px !important','color':'red'});
																							
																							
																						} else  if(data.message=='Success')
																						{
																						//	window.parent.close();
																							
																							window.open("${pageContext.request.contextPath}/ShowDoctorForgotPassword?userName="+userName,"_self");
																							
																						}
																						
																						
																					})
																					
																					 
																		 
																		
																	
																	
																		}		
																																		
		 
	}
	  
	
	</script>
	<script type="text/javascript">
    function submitOnEnter(inputElement, event) {
        if (event.keyCode == 13) { // No need to do browser specific checks. It is always 13.
            inputElement.form.submit();
        }
    }
</script>
	<script type="text/javascript">
$(".toggle-password").click(function() {

	  $(this).toggleClass("fa-eye fa-eye-slash");
	  var input = $($(this).attr("toggle"));
	  if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	  }
	});

</script>

	<!-- <script>
                        setTimeout(function() {
    $('#errormessage').fadeOut('slow');
}, 5000);
                        </script> -->
</body>
</html>
