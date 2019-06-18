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
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 
</head>         
<body>
 <jsp:include page="../include/homeHeader.jsp"/> 

<c:url var="updtaeLabNewPassword" value="updtaeLabNewPassword" />
<div class="clearfix"></div>

<section class="log_sec">
	<div class="container">
	 <div class="login1_blk">
	 	<h4>Set New Password</h4>
	 	<hr>
	
	 	<p id="errormessage" style="color:red;position:absolute; margin: 0 auto; left:0; right:0" maxlength="20"></p>
	 	<div class="form-group reletive">
       <input type="hidden" name="userName" id="userName" value="${userName}">
        <input type="password" id="password" name="password" placeholder="Enter Password"  class="capitl_none" required><p id="validate1" style="color:red;position:absolute"></p>
                  <span class="show-pass"><i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i></span>
                 </div>
          <div class="form-group">       
        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password
        "  class="capitl_none" required><p style="position:absolute" id='message'></p>
        </div>
	 	<input type="submit" name="submit" class="btn-fr-all" placeholder="save changes" onclick="changePassword()" value="Continue">
	 	
	 </div>
	</div>
</section>
         

<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
<script>
  $('#confirm_password').on('keyup', function () {
	  if ($('#password').val() == $('#confirm_password').val()) {
	    $('#message').html('Matching').css('color', 'green');
	  } else 
	    $('#message').html('Not Matching').css('color', 'red');
	});
  </script>
<script>
  /* $('#password').on('keyup', function () {
	  


	    if($('#password').val().length>3){
	    	$('#validate1').html('');
	    	$('#submitBtn').attr("disabled", false);
	    }
	    	else {
	    	    $('#validate1').html('Password should be greater than 3').css('color', 'red');
	    	    $('#submitBtn').prop("disabled", "disabled");
	    	}
	    
	 
	}); */
  function myFunction() {
	    var x = document.getElementById("password");
	    if (x.type === "password") {
	        x.type = "text";
	        
	    } 
	  
	    	 else {
	    	        x.type = "password";
	    	    }
	    
	} 
  
  

  function changePassword()
 {
 	
 	var newPassword= document.getElementById("password").value;
 	var userName= document.getElementById("userName").value;
 	
 	 if(newPassword!="" && newPassword!=null)
 		 {
 		
 	  $
 		.getJSON(
 				'${updtaeLabNewPassword}',
 				{
 					newPassword : newPassword,
 					userName : userName,
 					ajax : 'true'
 				},
 				function(data) {
 					
 					if(data.message=="success")
 					{	
 					 alert("Password updated successfully");
 					 window.open("${pageContext.request.contextPath}/showLabLoginPage","_self");
 					}
 					else
 					{
 					alert("failed!!!");
 					location.reload(); 						
 					}
 					
 				});
 		 }
 	 else
 		 {
 		 alert("Please Enter New Password");
 		 }
 } 
  </script>  
</body>
</html>