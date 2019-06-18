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
  <c:url var="usernameValidation" value="/usernameValidation" />
  
   <jsp:include page="../include/homeHeader.jsp"/> 
<div class="clearfix"></div>
<section id="registration" class="log_sec">
	<div class="container">
	<div class="register">
	<h4>Doctor Registration</h4>   
	<hr>
    	<form method="POST" action='updateDoctorProfilesProcess' enctype="multipart/form-data" id="reset">
        	<div class="row">
        	
        	<input type="hidden" value="${doctorDetails.doctorId}" name="doctorId">
        	<input type="hidden" value="${uName}" name="uName">
        		<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1" >First Name</label>
            		 <input type="text" required class="input-text" value="${doctorDetails.fName}" name="fName" id="fName" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123 || (event.charCode > 31 && event.charCode < 33))" data-rule-required="true"/>
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Middle Name</label>
            		 <input type="text" required class="input-text" name="mName" id="mName" value="${doctorDetails.mName}" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" data-rule-required="true"/>
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Last Name</label>
            		 <input type="text" required class="input-text" name="lName" id="lName" value="${doctorDetails.lName}" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" data-rule-required="true"/>
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Gender</label>
						    <select required class="input-text" name="gender" id="gender" >
								  <option>--select--</option>
								  
								  <c:choose>
         
         <c:when test = "${doctorDetails.gender eq('Male') ||  doctorDetails.gender eq('male')}">
          <option selected value="Male">Male</option>
           <option value="Female">Female</option>
								  <option value="Other">Other</option>
         </c:when>
         
         
         <c:when test = "${doctorDetails.gender eq('Female') ||  doctorDetails.gender eq('female')}">
           <option value="Male">Male</option>
          <option selected value="Female">Female</option>
           <option value="Other">Other</option>
         </c:when>
         
        <c:otherwise>
         <option value="Female">Female</option>
								  <option value="Other">Other</option>
        </c:otherwise>
								 
								 
								   </c:choose>
							</select>
                    </div>
				    </div>
				    <div class="col-sm-4">            	
				<div class="form-group">
				                     <label for="exampleInputEmail1">Year Of Experience</label>
				            	<input required type="text" value="${doctorDetails.yearOfExperience}" class="input-text" name="yearOfExperience" id="yearOfExperience">
				</div>
				</div>
				<div class="col-sm-4">
				 <div class="form-group">
				                     <label for="exampleInputEmail1">Contact No</label>
				            	<input required type="text"  class="input-text" value="${doctorDetails.contactNo}" name="contactNo" id="contactNo" onkeypress='return IsNumeric(event);' min="10" maxlength="13" class=form-control>
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Email</label>
				            	<input required type="email"  class="input-text capitl_none" value="${doctorDetails.email}" name="email" id="email" onkeydown="emailvalidation()"><p style="color:red;position:absolute" id='emailValidate'></p>
				</div>
				</div>
				<div class="col-sm-4">            	
				<div class="form-group">
				                     <label for="exampleInputEmail1">qualification</label>
				            	<input required type="text"  class="input-text" value="${doctorDetails.qualification}" name="qualification" id="qualification">
				</div>
				</div>
				<div class="col-sm-4">            	
				<div class="form-group">
				                     <label for="exampleInputEmail1">College</label>
				            	<input required type="text"  value="${doctorDetails.college}"  class="input-text" name="college" id="college">
				</div>
				</div>
				<div class="col-sm-4">            	
				<div class="form-group">
				                     <label for="exampleInputEmail1">passing year</label>
				            	<input required type="text"  class="input-text" name="passingYear"  value="${doctorDetails.passingYear}"  id="passingYear">
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label id="otherbranch" for="exampleInputEmail1">Choose Specialization</label>
				                    <select required class="input-text chosen-select" id="specId" name="specId" >
				                      <option value="">--select--</option>
											 <c:forEach items="${specialization}" var = "specialization">
											 
											   <c:choose>
         
         <c:when test = "${specialization.specializationId==doctorDetails.specId}">
          <option selected  value ="${specialization.specializationId}">${specialization.specializationType }</option>
         </c:when>
                 <c:otherwise>
                 				                             <option  value ="${specialization.specializationId}">${specialization.specializationType }</option>
                 
                 </c:otherwise>
         
         </c:choose>
         
         
				                             </c:forEach>
				                             
				                    </select>
				</div> 
				</div>
				<div class="col-sm-4">
				  <div class="form-group">
				                <label for="exampleInputEmail1">Council Registration No</label>
				            	<input required type="text"  class="input-text" value="${doctorDetails.councilRegNo}" name="councilRegNo"  id="councilRegNo"/></td>
				</div>
				</div>
				<div class="col-sm-4">
				  <div class="form-group">
				                <label for="exampleInputEmail1">Council Name</label>
				            	<input required type="text"  class="input-text" name="councilName" value="${doctorDetails.councilName}" id="councilName"/></td>
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Country</label>
				             <select required class="input-text chosen-select" id="countryId" name="countryId" onchange="getStateBYCountry()">
				             <option  value ="">---Select Country---</option>
											 <c:forEach items="${countryList}" var = "countryList">
											 
											 
											   <c:choose>
         
         <c:when test = "${countryList.countryId==doctorDetails.countryId}">
          <option selected  value ="${countryList.countryId}">${countryList.countryName }</option>
         </c:when>
                 <c:otherwise>
                 				                             <option  value ="${countryList.countryId}">${countryList.countryName }</option>
                 
                 </c:otherwise>
                 </c:choose>
				                           <%--   <option  value ="${countryList.countryId}">${countryList.countryName }</option> --%>
				                             </c:forEach>
				                             
				                    </select>
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">State</label>
				                      <select required class="input-text chosen-select" id="stateId" name="stateId" onchange="getCityBYState()">
				                    
				                     <c:choose>
         
         <c:when test = "${doctorDetails.stateId!=0}">
          <option selected  value ="${doctorDetails.stateId}"></option>
         </c:when>
         </c:choose>
				                    
				                      </select>
				            	 
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">City</label>
				             
				            	 <select required class="input-text chosen-select" id="cityId" name="cityId" >
				            	 <c:choose>
         
         <c:when test = "${doctorDetails.cityId!=0}">
          <option selected  value ="${doctorDetails.cityId}">${doctorDetails.cityName }</option>
         </c:when>
         </c:choose>
				            	 
				                      </select>
				</div>
				</div>
				<div class="col-sm-8">
				<div class="form-group">
				                     <label for="exampleInputEmail1" >Address</label>
				            	<input required type="text" value ="${doctorDetails.address}" class="input-text" name="address" id="address"/> 
				</div>
				</div>
				<%-- <div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1" class="reqd">Username</label>
				            	<input required type="text"  value ="${doctorDetails.uName}"  class="input-text" name="Username" id="Username" disabled="disabled"/> 
				</div>
				</div> --%>
				
				<div class="col-sm-4">
				 <div class="form-group passwrd">
				                    	<label for="exampleInputEmail1" >Password</label>
				    <input type="password" required class="input-text capitl_none" name="password" id="password" onmouseover="erasePwdMsg()" onmouseleave="validatePassword()" /><p id="validate1" style="color:red;position:absolute" maxlength="20"></p>
				                    <i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i>
				 </div>
				  </div>
				  <div class="col-sm-4">              
			    <div class="form-group passwrd">
				                    	<label for="exampleInputEmail1">Confirm Password</label>
				    <input type="password" required class="input-text capitl_none" name="confirm_password" id="confirm_password" /><p style="position:absolute" id='message'></p>
				                   <!--  <i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i> -->
				  </div>
				</div>
				 <div class="col-sm-4">              
			    <div class="form-group passwrd">
				                    	<label for="exampleInputEmail1">Choose your profile photo</label>
				                    	<input type="file" value ="${doctorDetails.profilePhoto}" required name="profilePhoto" accept="image/*">
				    
				                   <!--  <i class="fa fa-eye" aria-hidden="true" onclick="myFunction()"></i> -->
				  </div>
				</div>
				
				<div class="col-sm-12">
				<div class="form-group">
				                     <label for="exampleInputEmail1">About Me</label>
				            	<input required type="text" value ="${doctorDetails.aboutMe}" class="input-text" name="aboutMe" id="aboutMe"/> 
				</div>
				</div>
				<div class="clearfix"></div>
                <hr> 
				<div class="col-sm-12 text-center">
                <div class="form-group">
                    	<input type="submit" name="Submit" class="btn-fr-all">
                    	<input type="reset" value="Reset" class="btn-fr-all">
                </div>
                </div>
            </div>
        </form>
        </div>
    </div>
</section>
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
	</script>
	
	<script>
	
	$('#password, #confirm_password').on('keyup', function () {
		  if ($('#password').val() == $('#confirm_password').val()) {
		    $('#message').html('Matching').css('color', 'green');
		  } else 
		    $('#message').html('Not Matching').css('color', 'red');
		});

 function getCityBYState() {
										 
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
	    var username = document.getElementById("uName").value;
	    var minNumberofChars = 8;
	    var maxNumberofChars = 16;
	    var regularExpression  =/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	  
	    if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
	    	document.getElementById("password").value="";
	    	document.getElementById("validate1").innerHTML="password length should be min 8 and max 16"; 
	        return false;
	    }
	    else if(!regularExpression.test(newPassword)) {
	       
	        document.getElementById("password").value="";
	        document.getElementById("validate1").innerHTML="";
	    	document.getElementById("validate1").innerHTML="password should contain atleast one number and one special character"; 
	        return false;
	    }
	    else if(newPassword==username)
	    	{
	    	document.getElementById("password").value="";
	        document.getElementById("validate1").innerHTML="";
	    	document.getElementById("validate1").innerHTML="password should not be same as username"; 
	        return false;
	    	}
	    else{
	    	
	    }
	}
 function eraseMsg()
 {
	 document.getElementById("validate").innerHTML="";
	 
 }
 
 function erasePwdMsg()
 {
	 document.getElementById("validate1").innerHTML="";
	 
 }
 
	</script>

<script>
/* function resetFunction() {
    document.getElementById("reset").reset();
} */

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
    
  

</body>
</html>

