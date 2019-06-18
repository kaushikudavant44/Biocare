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
<link href="${pageContext.request.contextPath}/resources/css/ie10"src/main/webapp/WEB-INF/views/doctor/doctorLoginPage.jsp"-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
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
  <body onload="initialize()"> 
  <c:url var="usernameValidation" value="/usernameValidation" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="doctorLoginProcess" value="/doctorLoginProcess" />
  <c:url var="pharmPasswordValidation" value="pharmPasswordValidation" />
  <c:url var="changePharmacyPassword" value="changePharmacyPassword" />	
<div class="clearfix"></div>
 <jsp:include page="../include/pharmacyHeader.jsp"/>
<div class="clearfix"></div>
<div class="clearfix"></div>
 <section class="log_sec">
	
	<div class="container">
	 <div class="login1_blk">
	 	<h4>Change Password</h4>
	 	<hr>
	 	<p id="errormessage" style="color:red;position:absolute; margin: 0 auto; left:0; right:0" maxlength="20"></p>
	 	<div class="form-group">
        <input type="password" id="validatePwd" name="validatePwd" placeholder="Current Password" class="capitl_none" required>
        </div>
         <div class="form-group change-pass">
        <input type="password" id="newPassword" name="newPassword"  class="capitl_none" placeholder="New Password" required >
         <a><i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i></a>
         </div>
	 	<input type="submit" name="submit" class="btn-fr-all" placeholder="Save Changes" value="Save Changes" onclick="validatePassword()">
		<a href="${pageContext.request.contextPath}/showPharmacyHomePage">Cancel</a>
	 </div>
		
	</div>
	
</section>


<jsp:include page="../include/footer.jsp" />  
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

 function validatePassword()
{
	
	var password= document.getElementById("validatePwd").value;
	

	 if(password!="" && password!=null)
		 {
			//alert(password);
	  $
		.getJSON(
				'${pharmPasswordValidation}',
				{
					password : password,
					
					ajax : 'true'
				},
				function(data) {
					
					if(data.message=="failed")
					{
					alert("wrong old password");
						location.reload();
					}
					else
						{
						changePassword();
						}

					
				});
		 }
	 else
		 {
		 alert("Please Enter Old Password");
		 }
} 

 function changePassword()
{
	
	var newPassword= document.getElementById("newPassword").value;
	
	 if(newPassword!="" && newPassword!=null)
		 {
	  $
		.getJSON(
				'${changePharmacyPassword}',
				{
					newPassword : newPassword,
					
					ajax : 'true'
				},
				function(data) {
					if(data.message=="success")
					{
						alert("password changed successfully");
					    window.open("${pageContext.request.contextPath}/showPharmacyLoginPage","_self");
					}
					else
					{
						alert("failed to change password");
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
