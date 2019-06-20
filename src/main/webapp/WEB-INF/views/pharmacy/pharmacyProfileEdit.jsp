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
<link href="${pageContext.request.contextPath}/resources/css/lightbox.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
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
  <c:url var="sendTextOtp"
		value="/sendTextOtp" />
		<c:url var="verifyRegOTP"
		value="/verifyRegOTP" />
		<c:url var="verifyContactNumber"
		value="/verifyContactNumber" />
<jsp:include page="../include/pharmacyHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Edit Pharmacist Profile</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
             <c:choose>
			<c:when test="${sessionScope.medicalDetails.cityId>0}">
             <jsp:include page="../include/pharmacyLeftMenu.jsp"/>  
             </c:when>
</c:choose>
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
    	<form method="POST" action='${pageContext.request.contextPath}/updatePharmacyProfilesProcess' enctype="multipart/form-data" id="reset">
        	<div class="row editpg">
        		<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Pharmacy Name</label>
                    <input type="hidden"  class="input-text" name="medicalId" id="medicalId" value="${medicalDetails.medicalId}"/>
                    <input type="hidden"  class="input-text" name="profilePhoto" id="profilePhoto" value="${medicalDetails.photo}"/>
                    <input type="hidden"  class="input-text" name="uName" id="uName" value="${medicalDetails.userName}"/>
                    <input type="hidden"  class="input-text" name="password" id="password" value="${medicalDetails.password}"/>
                     
            		 <input type="text" required class="input-text" name="labName" id="labName" value="${pharmacyName}" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123 || (event.charCode > 31 && event.charCode < 33))" data-rule-required="true" />
            		 </div>
					</div>
					
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">license Number</label>
            		 <input type="text" required class="input-text" value="${licenceNo}" name="licenceNo" id="licenceNo" >
            		 </div>
					</div>
					
				<div class="col-sm-4">
				 <div class="form-group">
				                     <label for="exampleInputEmail1" >Contact No</label>
				            	<input type="text" class="input-text" value="${contactNo}" name="contact" id="contactNo"  onkeypress='return IsNumeric(event);' onblur="verifyNum();" min="10" maxlength="13"/>
								<span id='contactMessage' style="position: absolute;color: red; line-height: 17px; font-size: 12px !important;"></span>
								<i class="glyphicon glyphicon-ok verified" aria-hidden="true" id="verifiedMark" style="display:none; color:green"></i>
				</div>
				</div>
				 <div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Email</label>
				            	<input required type="email"  class="input-text capitl_none" value="${emailId}"  name="email" id="email" onkeydown="emailvalidation()"><p style="color:red;position:absolute" id='emailValidate'></p>
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Address</label>
				            	<input required type="text"  class="input-text" value="${address}" name="address" id="address"/> 
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Country</label>
<select  required aria-required="true" class="input-text chosen-select" id="countryId" name="countryId" onchange="getStateBYCountry()" required>
				             <option>---Select Country---</option>
											 <c:forEach items="${countryList}" var = "countryList">
								            <c:choose>
         
                                               <c:when test = "${countryList.countryId==countryId}">
                                                   <option selected  value ="${countryList.countryId}">${countryList.countryName }</option>
                                               </c:when>
                                               <c:otherwise>
                                                    <option  value ="${countryList.countryId}">${countryList.countryName }</option>   
                                               </c:otherwise>
                                              </c:choose>
				                             </c:forEach>
				                </select>			
				                </div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">State</label>
                              <select  required aria-required="true" class="input-text chosen-select" id="stateId" name="stateId" onchange="getCityBYState()">
                              <option>--select--</option>				                    
				                     <c:forEach items="${stateList}" var = "stateList">
									   <c:choose>
                                            <c:when test = "${stateList.stateId==stateId}">
                                                <option selected  value ="${stateList.stateId}">${stateList.stateName }</option>
                                            </c:when>
                                            <c:otherwise>
                 				                 <option  value ="${stateList.stateId}">${stateList.stateName }</option>
                                            </c:otherwise>
                                       </c:choose>
				                     </c:forEach>
				                                         
				            </select>				</div>
				</div>
				
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">City</label>
                         <select required aria-required="true" class="input-text chosen-select" id="cityId" name="cityId" >
				            	<option>--select--</option>
				            	 <c:forEach items="${cityList}" var = "cityList">
									   <c:choose>
                                            <c:when test = "${cityList.cityId==cityId}">
                                                <option selected  value ="${cityList.cityId}">${cityList.cityName }</option>
                                            </c:when>
                                            <c:otherwise>
                 				                 <option  value ="${cityList.cityId}">${cityList.cityName}
                 				                 </option>
                                            </c:otherwise>
                                       </c:choose>
				                     </c:forEach> 
				                      </select>				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Pincode</label>
				            	<input required type="text"  class="input-text" value="${pinCode}" name="pincode" id="pincode" onkeypress='return IsNumeric(event);'/> 
				</div>
				</div>
				
				<div class="col-sm-5">
				 <label >Home Delivery</label>
				<div class="form-group radioinput">
				                    
				                      <c:choose>
                                            <c:when test = "${delivery==0}">
				                    <div class="col-sm-4"> 
				            	<input  type="radio"  class="input-text" name="delivery" value="0" checked="checked"/>Yes 
				            	</div>
				            	<div class="col-sm-4">
				            	<input  type="radio"  class="input-text" name="delivery" value="1"/> No
				            </div>
				            </c:when>
				            <c:otherwise>
				           
				                    <div class="col-sm-4"> 
				            	<input  type="radio"  name="delivery" value="0"/>Yes 
				            	</div>
				            	<div class="col-sm-4">
				            	<input  type="radio"  name="delivery" value="1" checked="checked"/> No
				            </div>
				            
				            </c:otherwise>
				            </c:choose>
				</div>
				</div>
			
				<div class="clearfix"></div>
				<hr>
				
				<div class="col-sm-12">
								<input type="hidden" name="uploadCertificateStatus" value="">
								<c:choose>
								<c:when test="${delStatus==2}">
				<label>Upload Certificate</label>
				<input type='file' name="certificatePhoto" class="choosefile" required />
				</c:when>
				</c:choose>
			<%-- 	${pharmacyUrl}/${medicalId}/documents$certificate} --%>
				<a class="example-image-link" href="${pharmacyUrl}/${medicalId}/documents/${certificate}" data-lightbox="example-set"><strong>View Certificate</strong></a>
				
				</div>
				
				
				<div class="clearfix"></div>
                <hr> 
				<div class="col-sm-12 phrm-edit text-center">
                <div class="form-group">
              <!--   <input id="verifyButton" data-toggle="modal" data-target="#otp" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()"> -->
                    	<input type="submit" name="Submit" class="pharm-submit-btn" id="submitButton">
                    	<a href="${pageContext.request.contextPath}/showPharmacyHomePage" class="pharm-submit-btn">Cancel</a>
                    	
                </div>
                <div class="clearfix"></div>
                </div>
            </div>
        </form>
      </div>
      </div>
      </div>
    </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp" /> 

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
<div>
	 	<a href="#" onclick="verifyEnteredOTP()" class="btn-fr-all" >Verify</a>
	 	</div>
	 	</div>
	 </div>
	</div>	
	</div>
	
	
</section>
      </div>
    </div>
  </div>
</div>

 
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
     <script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script> 
    
    <!-- validations -->    
  
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
    
    // Do timeout stuff here
    //alert('Timeout for otp');
    document.getElementById("timeoutmsg").style.display="block";
    document.getElementById("resendButton").disabled=false;
  }

  timer(120);
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
  </script>
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
 
 

 
 
	</script>
	
	<script type="text/javascript">

var contactNo=document.getElementById("contactNo").value;

function verifyMobNum(){
	var enterContact=document.getElementById("contactNo").value;
	
	
	if(enterContact.length>=10){
	if(contactNo==enterContact){
		//alert("No changes");
		
	}else{
		document.getElementById("submitButton").disabled=true;
		var r = confirm("Do you want to verify mobile number?");
		if(r==true){
			verifyMobileNumber();
			document.getElementById("submitButton").disabled=false;
		}else{
			document.getElementById("contactNo").value=contactNo;
		}
		
		
	}
	}else{
		
		alert("Please Check contact number is wrong");
		document.getElementById("contactNo").value=contactNo;
	}
}


function verifyMobileNumber(){
	 
	 
 	var contactNo=document.getElementById("contactNo").value;
 	
 //	document.getElementById("resendButton").disabled=true;
 	//document.getElementById("timeoutmsg").style.display="none";
//	var otp=document.getElementById("enterOTP").value;
	//alert(contactNo);
	if(contactNo!="")
	{
		$('#otp').modal();
	
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
				//	$("#contactNo").prop("readonly",true);
					document.getElementById("submitButton").style.display="inline";
					alert(data.message);
					
					}else{
						alert("Invalid OTP");
					}
				
				});
	
}


function verifyNum(){
	 
	var contactNo=document.getElementById("contactNo").value;
	
	 if(contactNo.length<10){
		
		// document.getElementById("contactMessage").innerHTML="Wrong Contact Number";
		 $('#contactMessage').html('Wrong Contact Number').css({'line-height':'17px','font-size':'12px','color':'red'});
		 document.getElementById("contactMessage").value="";
	 }else{
		 
		 $.getJSON('${verifyContactNumber}',
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
					 document.getElementById("contactNo").value=contactNo;
					 $('#submitButton').prop("disabled", "disabled");
					
					}
				
				 else if(data.message=='failed' && contactNo!="")
				{
					 $('#contactMessage').html('Contact Number Available').css({'line-height':'17px','font-size':'12px !important','color':'green'});
					 verifyMobNum();
				} 
					
					
					});
		 
		 
		 
		 
	 }
	
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
</script>
  

</body>
</html>

 