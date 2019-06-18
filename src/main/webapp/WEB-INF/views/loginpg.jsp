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
  <body onload="initialize()"> 
  <c:url var="usernameValidation" value="/usernameValidation" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="loginProcess" value="/loginProcess" />
<div class="clearfix"></div>
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
             <li><a href="#">Help</a></li>
          </ul>
        </div>
     
    </nav>
  </div>
</div>
<div class="clearfix"></div>

<div id="largeModal" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog">
			<div class="modal-dialog modal-md modal-sm" style="width:25%;margin-top:10%">
				<div class="modal-content">
				<!-- <form action="loginProcess" method="post"> -->
					<div class="modal-header">
						<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->
						<h4 class="modal-title"  align="center">Sign In</h4>
					</div>
					<div class="modal-body">
					<p id="errormessage" style="color:red;position:absolute;" maxlength="20"></p>
						 User Name <input type="text" id="LogInUname" name="userName" placeholder="Username" class="form-control" required="required" onclick="clearMsg()">
						Password  <input type="password" id="LogInPasswors" name="password" placeholder="password" class="form-control" required>
						<input type="hidden" name="userType" id="userType">
					</div>
					<div class="modal-footer" >
					<div align="center"> 
						<!-- <button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button> -->
						<input type="submit" class="btn btn-info"value="Login" onclick="loginProcess()"/>
							</div>
							<div align="center" id="signupId" > 
						
						<a   href="" id="signupId"  >Not Registered? <strong>Sign up</strong></a> 
							</div>
					</div>
					<input type="hidden" id="currentLocation" name="currentLocation">
					<!-- </form> -->
				</div>
			</div>
		</div>
			<!--           signup form-->
      <form action="submitPatientRegProcess" method="post" enctype="multipart/form-data" id="reset">
     <div id="signup" class="modal fade member">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Patient Registration</h4>
                </div>
                <div class="modal-body">
                   
                    	<div class="row">
                          <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="username" class="reqd">User Name</label>
    <input type="text" class="input-text" required id="uName" name="uName" maxlength="20" onmouseleave="usernameValidation()" placeholder="User Name" onmouseover="eraseMsg()"><p id="validate" style="color:red;position:absolute;" ></p>
                    </div>
                </div>
                
               			 <div class="col-sm-6 col-md-6">
                	<div class="form-group passwrd">
                    	<label for="password" class="reqd">Password</label>
    		<input type="password"  class="input-text" required id="password" maxlength="20" name="password" placeholder="Password" onmouseover="erasePwdMsg()" onmouseleave="validatePassword()"><p id="validate1" style="color:red;position:absolute"></p>
                 <i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i>   </div>
                </div>
                
                 <div class="col-sm-6 col-md-6">
                	<div class="form-group passwrd">
                    	<label for="password" class="reqd">Confirm Password</label>
    		<input type="password"  class="input-text" required id="confirm_password" name="confirm_password" placeholder="Password"><p style="position:absolute" id='message'></p>
                    </div>
                </div>
              
                        <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="firstname" class="reqd">First Name</label>
    <input type="text" class="input-text"  required id="fName" name="fName"placeholder="First Name" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="middlename" class="reqd">Middle Name</label>
    <input type="text" class="input-text" required id="mName" name="mName" placeholder="Middle Name" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="firstname" class="reqd">Last Name</label>
    <input type="text" class="input-text" required id="lName" name="lName" placeholder="Last Name" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="state" class="reqd">Country</label>
              	 <select  class="input-text" required id="countryId" name="countryId" onChange="getStateBYCountry()">
                             <option>--select--</option>
							 <c:forEach items="${countryList}" var = "countryList">
                             <option value="${countryList.countryId}">${countryList.countryName}</option>
                             </c:forEach>
                             
                    </select>
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="state" class="reqd">State</label>
              	<select  class="input-text" required id="stateId" name="stateId" onChange="getCityBYStateId()">
							 
                             <option value="">--select--</option>
                          
                             
                    </select>
                    </div>
                </div>
               			 <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="state" class="reqd">City</label>
              	 <select  class="input-text" required id="cityId" name="cityId" >
							 <option value="">--select--</option> 
                    </select>
                    </div>
                </div>
                
                 
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="contact" class="reqd">Contact</label>
    		<input type="text" required class="input-text" id="contactNo" name="contactNo" placeholder="Contact" onkeypress='return IsNumeric(event);' min="10" maxlength="13">
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="contact" class="reqd">Email</label>
    		<input type="email" required class="input-text" id="email" name="email" placeholder="email" onkeydown="emailvalidation()"><p style="color:red;position:absolute" id='emailValidate'></p>
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="dob" class="reqd">Date Of Birth</label>
    		 <input class="input-text datepicker" required id="date" readonly data-date-format="yyyy-mm-dd" data-link-field="dtp_input1" name="birthDate" placeholder="Date of Birth" type="text"/>
                </div>
                    </div>
               
                
                 <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="age" class="reqd">Age</label>
    		<input type="text" required class="input-text" id="age" name="age" onkeypress='return IsNumeric(event);' placeholder="Age">
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="gender" required class="reqd">Gender</label>
            	<select class="input-text" id="gender" name="gender">
                  <option>--select--</option>
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
                </select>
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="age" required class="reqd">Qualification</label>
    		<input type="text" class="input-text" id="qualification" name="qualification" placeholder="Qualification">
                    </div>
                </div>
                
                      <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                     <label for="blood" class="reqd">Blood Group</label>
              	 <select class="input-text" required id="bloodGroup" name="bloodGroup">
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

						
                        <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="address" class="reqd">Address</label>
            <textarea class="input-textarea" required id="address" name="address" placeholder="Address"></textarea>
            
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                	<div class="form-group">
                    	<label for="registrationdate" class="reqd">upload photo</label>
    		<input type="file" required class="input-text" id="profilePhoto" name="profilePhoto" onchange="readURL(this);" accept="image/*" placeholder="Registration Date"><span>(JPEG,PNG)</span>
                    </div>
                </div>
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	
					  <img id="blah" src="#" alt="your image" />  
				    </div>
                </div>
                </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">Submit</button>
                    <button type="button" class="btn btn-info" onclick="resetFunction()">Reset</button>
                </div>
              </div> 
            </div>
        </div>
    </form>
<!--signup over-->
<div class="clearfix"></div>
 <section class="log_sec">
	<div class="container">
	 <div class="login1_blk">
	 	<h4>Login to view the Reports</h4>
	 	<hr>
	 	<input type="text" name="usernm" placeholder="Username">
	 	<input type="password" name="pwd" placeholder="password">
	 	<input type="submit" name="submit" class="btn-fr-all" placeholder="login">
	 </div>
		
	</div>
</section>


<jsp:include page="include/footer.jsp" />  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<%--  <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> --%>
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


<script type="text/javascript">


$(document).ready(function(){
  var date_input=$('input[name="date"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  var options={
    format: 'dd/mm/yyyy',
    container: container,
    todayHighlight: true,
    autoclose: true,
  };
  date_input.datepicker(options);
})

function setUserType(userType)
{
	document.getElementById("userType").value=userType;
	$("#signupId").empty();
	if(userType==1){
		
		var signup='<a   href="#signup"   data-toggle="modal" >Not Registered? <strong>Sign up</strong></a>';
	 //document.getElementById("signupId").href="#signup"; 
	 //document.getElementById("signupId").data-toggle="modal";
	 $('#signupId').append($(signup));
	 
	}
  else if(userType==2){
	  var signup='<a   href="${pageContext.request.contextPath}/showDoctorRegProcess"    >Not Registered? <strong>Sign up</strong></a>';	
		 $('#signupId').append($(signup));
  }
	
  else if(userType==3){
	  var signup='<a   href="${pageContext.request.contextPath}/showLabRegProcess"    >Not Registered? <strong>Sign up</strong></a>';	
		 $('#signupId').append($(signup));
  }
	
  else if(userType==4){
	  var signup='<a   href="${pageContext.request.contextPath}/showMedicalRegProcess"    >Not Registered? <strong>Sign up</strong></a>';	
		 $('#signupId').append($(signup));
  }
	} 

 
</script>


<!--For Current Location  -->
<script type="text/javascript"> 
  var geocoder;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
} 
//Get the latitude and the longitude;
function successFunction(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    codeLatLng(lat, lng)
}

function errorFunction(){
    alert("Geocoder failed");
}

  function initialize() {
    geocoder = new google.maps.Geocoder();



  }
  function resetFunction() {
	    document.getElementById("reset").reset();
	}
  function codeLatLng(lat, lng) {

    var latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      console.log(results)
        if (results[1]) {
         //formatted address
        // alert(results[5].formatted_address)
        //find country name
             for (var i=0; i<results[0].address_components.length; i++) {
            for (var b=0;b<results[0].address_components[i].types.length;b++) {

            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
                if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
                    //this is the object you are looking for
                    city= results[0].address_components[4];
                    alert(city.long_name);
                    document.getElementById("currentLocation").value=city.long_name;
                    break;
                }
            }
        }
        //city data
      //  alert(city.short_name + " 111111 " + city.long_name)


        } else {
          alert("No results found");
        }
      } else {
        alert("Geocoder failed due to: " + status);
      }
    });
  }
  
  
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
 	
 	</script>
<script>
function getCityBYStateId()
{

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
		 
	 function loginProcess() {
										 
		 var userName=document.getElementById("LogInUname").value; 
		 var password=document.getElementById("LogInPasswors").value;
		 var userType=document.getElementById("userType").value;
		 					    
		 $
		 
														.getJSON(
																'${loginProcess}',
																{
																	userName : userName,
																	password : password,
																	userType : userType,
																	ajax : 'true'
																},
																function(data) {
																	
																	if(data.message=="wrong") 
																		{
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
	 
	 /* confirm password */
	 $('#password, #confirm_password').on('keyup', function () {
		  if ($('#password').val() == $('#confirm_password').val()) {
		    $('#message').html('Matching').css('color', 'green');
		  } else 
		    $('#message').html('Not Matching').css('color', 'red');
		});
	 
	 
	 function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function (e) {
		            $('#blah')
		                .attr('src', e.target.result)
		                .width(80)
		                .height(80);
		        };

		        reader.readAsDataURL(input.files[0]);
		    }
		}
	</script>


</body>
</html>