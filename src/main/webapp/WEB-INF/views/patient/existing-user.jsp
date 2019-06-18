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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/4.7.0/css/font-awesome.min.css">
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
  
    <div class="navbar-wrapper">
  <div class="container-fluid">
    <nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
         </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
            <li class="dropdown"> <a href="#" class="dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">  Login  <span class="caret"></span></a>
              <ul class="dropdown-menu square">
                <li><a class="hvr-sweep-to-right" data-toggle="modal" data-target="#largeModal" href="#" onclick="setUserType(2)">Doctor Login</a></li>
                <li><a class="hvr-sweep-to-right" data-toggle="modal" data-target="#largeModal" href="#" onclick="setUserType(1)">Patient Login</a></li>
                <li><a class="hvr-sweep-to-right"  data-toggle="modal" data-target="#largeModal" onclick="setUserType(3)" href="#">Lab Login</a></li>
   <!--               <li><a class="hvr-sweep-to-right"  data-toggle="modal" data-target="#largeModal" onclick="setUserType(5)" href="#">Hospital Login</a></li> -->
              <li><a class="hvr-sweep-to-right"  data-toggle="modal" data-target="#largeModal" onclick="setUserType(4)" href="#">Pharmacy Login</a></li>
              </ul>
            </li>
            <!--  <li><a href="#signup" data-toggle="modal">Sign Up</a></li> -->
            
          </ul>
        </div>
     
    </nav>
  </div>
</div>
<div class="clearfix"></div>
<section id="registration" class="log_sec">
	<div class="container">
	<div class="register">
	<h4>Existing User</h4>
	<hr>
    	<form action="${pageContext.request.contextPath}/submitPatientInformation" method="GET">
        	<div class="row">
        	<div class="col-sm-12 col-md-12 text-center">
        		<label for="yesCheck">Yes</label>
        		<input type="radio" onclick="javascript:yesnoCheck();" name="existingStatus" id="yesCheck">
       &nbsp;&nbsp;&nbsp;
        			<label for="noCheck">No</label>
        			<input type="radio" onclick="javascript:yesnoCheck();" name="existingStatus" id="noCheck">
        			
        	
        	</div>
        	
               	<div class="col-sm-12 col-md-12">
               		<div class="form-group">
                    <div id="ifYes" style="visibility:hidden">
				        <input class="input-text" type='text' id='yes' name='existingId' placeholder="Enter Id">
				    </div>
                     </div>
                </div>
               <div class="clearfix"></div>
                <hr> 
                <div class="col-sm-12 text-center">
                <div class="form-group">
                    	<input type="submit" id="submitBtn" name="Submit" class="btn-fr-all">
                </div>
                </div>
                </div>
        </form>
        </div>
    </div>
</section>



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
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
    
<jsp:include page="../include/footer.jsp" /> 
<script>
jQuery('ul.nav li.dropdown').hover(function() {
	jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
	}, function() {
	jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
	});

 function getStateBYCountry() {
											 
		 var countryId=document.getElementById("countryId").value; 
		 $('#stateId option').remove();
		  
		 $
														.getJSON(
																'${getStateByCountryId}',
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

																})
		 
		 
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
    document.getElementById("reset").reset();
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
	  
	  format: "dd-mm-yyyy"}).datepicker()
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
  $('#password').on('keyup', function () {
	  


	    if($('#password').val().length>3){
	    	$('#validate1').html('');
	    	$('#submitBtn').attr("disabled", false);
	    }
	    	else {
	    	    $('#validate1').html('Password should be greater than 8').css('color', 'red');
	    	    $('#submitBtn').prop("disabled", "disabled");
	    	}
	    
	 
	});
 
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


<script type="text/javascript">

function yesnoCheck() {
    if (document.getElementById('yesCheck').checked) {
        document.getElementById('ifYes').style.visibility = 'visible';
    }
    else document.getElementById('ifYes').style.visibility = 'hidden';

}

</script>


</body>
</html>

