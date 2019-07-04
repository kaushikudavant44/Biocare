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
    
    <style type="text/css">

.fa {
  margin-left: -12px;
  margin-right: 8px;
}
</style>
</head> 
  <body class="login_prt"> 
  <c:url var="usernameValidation" value="/usernameValidation" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="patientLoginProcess" value="/patientLoginProcess" />
<div class="clearfix"></div>
 <jsp:include page="../include/homeHeader.jsp"/> 
<div class="clearfix"></div>
<input type="hidden" value="${usrmessage}" id="message">

			     
<script type="text/javascript">
alert("ccd"+openPageHistory);
</script>
<div class="clearfix"></div>

 <%-- <section class="log_sec">
	<div class="container">
	 <div class="login1_blk">
	 	<h4>Patient Login</h4>
	 	<hr>
	 	<p id="errormessage" style="color:red;position:absolute;" maxlength="20"></p>
        <input type="text" id="LogInUname" name="userName" placeholder="Username" class="capitl_none" required="required" onclick="clearMsg()">
              <div class="loader2" style="position: fixed;margin-left: 140px" id="loader"> </div>
       
        <input type="password" id="LogInPasswors" name="password" class="capitl_none" placeholder="Password" onkeypress="if(event.keyCode==13) {patientLogin();}" required>
	 	<input type="submit" name="submit" class="btn-fr-all" value="login" onclick="patientLogin()">
	 	<a href="${pageContext.request.contextPath}/showPatientRegistrationPage">Sign Up</a><br>
	 	<a href="" onclick="usrnameMsgForForgetPwd()">Forgot Password?</a>
	 </div>
		
	</div>
</section> --%>
<div class="login_screen">
<img src="${pageContext.request.contextPath}/resources/images/patient-login.jpg" class="img-responsive" alt="login">
<%-- <img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"> --%>
</div>
    <div class="log_user dr-log">
    <%-- <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="logo"> --%>
    <h4 class="text-center">Patient Login</h4>
    <div class="form-group">
    <p id="errormessage" style="color:red;position:absolute; margin: 0 auto; text-align:center; left:0; right:0" maxlength="20">${msg}</p>
    	<input type="text" id="LogInUname" name="userName" placeholder="Username" class="capitl_none" required="required" onclick="clearMsg()" onkeypress="if(event.keyCode==13) {patientLogin();}">
    	</div>
    	<div class="form-group">
        <input type="password" id="LogInPasswors" name="password" class="capitl_none" placeholder="Password" onkeypress="if(event.keyCode==13) {patientLogin();}" required>
    	
    	<span toggle="#LogInPasswors"
				class="fa fa-fw fa-eye field-icon toggle-password"></span>
    <!-- 	<a><i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i></a> -->
    	</div>
    	<p class="text-center"><i class="fa fa-spinner fa-spin"style="display:none" id="loader1" ></i><input type="submit" class="submit_b"  onclick="patientLogin()" value="Login"></p>
        <p class="text-left"><a href="${pageContext.request.contextPath}/ShowForgotPassword" class="link_anch"  > Forgot Password ?</a></p>
        <p class="text-right"><a href="${pageContext.request.contextPath}/showPatientRegistrationPage" class="link_anch"> Sign Up</a></p>
    </div>
    
    


<%-- <jsp:include page="../include/footer.jsp" />  --%> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
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

<script>

(function () {
    var message = document.getElementById("message").value;
    if(message!="")
    	{
	alert(message);
    	}
})();


</script>


<script type="text/javascript"> 
  
  function usernameValidation(){
		 
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
	 }
  
 
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

function usrnameMsgForForgetPwd() {
	 
	 var userName=document.getElementById("LogInUname").value; 
	
	 
																if(userName==""||userName==null) 
																	{
																 alert("Please enter username."); 
																	}  
																else
																	{
	   															 window.open("${pageContext.request.contextPath}/ShowForgotPassword?userName="+userName,"_blank");
																	 
																	}																
	 
}
</script>
 	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"
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
		 
	 function patientLogin() {
		 document.getElementById("loader1").style.display='block'; 		 
		 
		 var userName=document.getElementById("LogInUname").value; 
		 var password=document.getElementById("LogInPasswors").value;
		
		 $
		 
														.getJSON(
																'${patientLoginProcess}',
																{
																	userName : userName,
																	password : password,
																	
																	ajax : 'true'
																},
																function(data) {
																	// document.getElementById("loader").style.display='none'
																	if(data.message=="wrong") 
																		{//alert("wrong");
																			document.getElementById("loader1").style.display='none';
																	 document.getElementById("errormessage").innerHTML="Invalid credential."; 
																		}  
																	else
																		{
																		window.open("${pageContext.request.contextPath}/"+data.message,"_self");

																		}
																})
		
		 
	 }
	 
	 function clearMsg()
	 {
		 document.getElementById("errormessage").innerHTML="";  
	 }
	 function erasePwdMsg()
	 {
		 document.getElementById("validate1").innerHTML="";
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

</body>
</html>
