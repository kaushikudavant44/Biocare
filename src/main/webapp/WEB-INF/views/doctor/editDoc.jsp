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
<link href="${pageContext.request.contextPath}/resources/css/lightbox.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
<body onload="getDoctorProfile();getDoctorRatingDetails()">
<jsp:include page="../include/doctorHeader.jsp"/> 

<c:url var="getStateByCountryId"
		value="/getStateByCountryId" />
		<c:url var="getCityByStateId"
		value="/getCityByStateId" />
		
 
<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
<c:url var="sendTextOtp"
		value="/sendTextOtp" />
		<c:url var="verifyRegOTP"
		value="/verifyRegOTP" />
		<c:url var="verifyContactNumber"
		value="/verifyContactNumber" />
  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Edit Doctor Profile</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
        <c:choose>
			<c:when test="${sessionScope.doctorDetails.cityId>0}">
<jsp:include page="../include/leftmenu.jsp"/> </c:when>
</c:choose>
            
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
					<form method="POST" action='updateDoctorProfilesProcess' enctype="multipart/form-data" id="reset">
        	<div class="row editpg">
        	
        	<input type="hidden" value="${doctorDetails.doctorId}" name="doctorId">
        	<input type="hidden" value="${doctorDetails.profilePhoto}" name="profilePhoto">
         
        		<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">First Name</label>
            		 <input type="text" required class="input-text" value="${doctorDetails.fName}" name="fName" id="fName" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123 )|| (event.charCode > 31 && event.charCode < 33)" data-rule-required="true" />
            		 </div>
					</div>
			 
					<input type="hidden"  value="${doctorDetails.hospitalId}" name="hospitalId" id=""hospitalId"" />
					
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Middle Name</label>
            		 <input type="text" required class="input-text" name="mName" id="mName" value="${doctorDetails.mName}" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode > 31 && event.charCode < 33)" data-rule-required="true" />
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1" >Last Name</label>
            		 <input type="text" required class="input-text" name="lName" id="lName" value="${doctorDetails.lName}" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode > 31 && event.charCode < 33)" data-rule-required="true" />
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1" >Gender</label>
						    <select class="input-text" name="gender" id="gender"  >
								  								  
								  <c:choose>
								  
		<c:when test = "${doctorDetails.gender eq('gender') ||  doctorDetails.gender eq('null')}">
         <option>-select--</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
		 <option value="Other">Other</option>
         </c:when>
         
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
				            	<input required type="text" value="${doctorDetails.yearOfExperience}" class="input-text" onkeypress='return IsNumeric(event);' name="yearOfExperience" id="yearOfExperience">
				</div>
				</div>
				<div class="col-sm-4">
				 <div class="form-group">
				 <input type="hidden" value="${doctorDetails.contactNo}" id="extContactNo">
				 
				                     <label for="exampleInputEmail1">Contact No</label>
				            	<input required type="text"  class="input-text" value="${doctorDetails.contactNo}" name="contactNo" id="contactNo" onkeypress='return IsNumeric(event);' onblur="verifyNum();" min="10" maxlength="13">
								<span id='contactMessage' style="position: absolute;color: red; line-height: 17px; font-size: 12px !important;"></span>
								 <i class="glyphicon glyphicon-ok verified" aria-hidden="true" id="verifiedMark" style="display:none; color:green"></i>
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
				                    <select required class="input-text chosen-select" id="specId" name="specId"  >
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
				            	<input required type="text"  class="input-text" value="${doctorDetails.councilRegNo}" name="councilRegNo"  id="councilRegNo" />
				</div>
				</div>
				<div class="col-sm-4">
				  <div class="form-group">
				                <label for="exampleInputEmail1" >Council Name</label>
				            	<input required type="text"  class="input-text" name="councilName" value="${doctorDetails.councilName}" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode > 31 && event.charCode < 33)" id="councilName" />
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
				                 <option value="">--select--</option>
                             
									   <c:forEach items="${stateList}" var = "stateList">
									   <c:choose>
                                            <c:when test = "${stateList.stateId==doctorDetails.stateId}">
                                                <option selected  value ="${stateList.stateId}">${stateList.stateName }</option>
                                            </c:when>
                                            <c:otherwise>
                 				                 <option  value ="${stateList.stateId}">${stateList.stateName }</option>
                                            </c:otherwise>
                                       </c:choose>
				                     </c:forEach>
				                     
				                    
				                      </select>
				            	 
				</div>
				</div>
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">City</label>
				             
				            	 <select required class="input-text chosen-select" id="cityId" name="cityId" >
				            	<option value="">--select--</option> 
							 <c:forEach items="${cityList}" var = "cityList">
									   <c:choose>
                                            <c:when test = "${cityList.cityId==doctorDetails.cityId}">
                                                <option selected  value ="${cityList.cityId}">${cityList.cityName }</option>
                                            </c:when>
                                            <c:otherwise>
                 				                 <option  value ="${cityList.cityId}">${cityList.cityName}
                 				                 </option>
                                            </c:otherwise>
                                       </c:choose>
				                     </c:forEach>
				                      </select>
				</div>
				</div>
				
				<div class="col-sm-8">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Address</label>
				            	<input required type="text" value ="${doctorDetails.address}"  class="input-text" max="70" name="address" id="address"/> 
				</div>
				</div>
				
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Pincode</label>
				            	<input required type="text" value ="${doctorDetails.int2}" onkeypress='return IsNumeric(event);' class="input-text" name="pincode" id="pincode"/> 
				</div>
				</div>
				 
				<div class="col-sm-8">
				<div class="form-group">
				                     <label for="exampleInputEmail1">About Me</label>
				            	<input required type="text" value ="${doctorDetails.aboutMe}" class="input-text" name="aboutMe" max="70" id="aboutMe"/> 
				</div>
				</div>
				<div class="col-sm-12">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Fees</label>
				            	<input required type="text" value ="${doctorDetails.fees}" onkeypress='return IsNumeric(event);' class="input-text" name="fees" id="fees"/> 
				</div>
				<c:choose>
				<c:when test="${doctorDetails.delStatus==0}">
			<%-- 	<input type="hidden" name="uploadCertificateStatus" value="${uploadCertificateStatus}"> --%>
			<div class="row">
			<div class="col-sm-2 col-md-2">
				<!-- <label>View Certificate</label> -->
				<div class="clearfix"></div>
				<!-- <input type='file' name="certificatePhoto" class="choosefile" required /> -->
				<a class="example-image-link" href="${documentPath}" data-lightbox="example-set"><strong>View Certificate</strong></a>
				</div>
				<div class="col-sm-2 col-md-2">
				<!-- <label>View Signature</label> -->
				<div class="clearfix"></div>
				<!-- <input type='file' name="certificatePhoto" class="choosefile" required /> -->
				<%-- <a class="example-image-link" href="${documentPath}" data-lightbox="example-set"><strong>View Signature</strong></a> --%>
				</div>
				</div>
				</c:when>
				</c:choose>
				</div>
  
				<div class="clearfix"></div><!-- href="http://lokeshdhakar.com/projects/lightbox2/images/image-3.jpg" -->
                <hr> 
				<div class="col-sm-12 text-center">
                <div class="form-group">
              <!--  <input id="verifyButton" data-toggle="modal" data-target="#otp" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()"> --> 
                    	<input type="submit" name="Submit" class="btn-fr-all" id="submitButton">
                    	<input type="reset" value="Cancel" class="btn-fr-all" onclick="gotoDoctorHomePage()">
                </div>
                </div>
            </div>
        </form>       
      			</div>          
      	    </div>
                                  
             </div>
         </div>
  </div>
 
</section>
<div class="clearfix"></div>
 
 <jsp:include page="../include/footer.jsp"/> 
<div class="modal fade otp-pg" id="otp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Verify Mobile Number</h4>
      </div>
      <div class="modal-body">
        <section class="lab_testsec otppg">
	 	<div class="text-center">
	 	<div class="otp-pg"><p>In order to create new account you need to verify mobile number. Please enter OTP received on mobile number : <span id="mobileVerify"></span></p>
	 	
	 	<label>Enter OTP</label>
	 	<div id="divOuter">
	<div id="divInner">
		<input type="text" id="pincode-input2"  >
		<div class="timer"><span id="timer"></span></div>
		 <input type="button" class="resndotp" id="resendButton" onclick="verifyMobileNumber()" value="Resend OTP"  disabled> 
		<div class="resndotp">
		<!--  <a  id="resendButton" href="#" onclick="verifyMobileNumber()" disabled>Resend OTP</a> --> 
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
 
		
<!-- Bootstrap core JavaScript================================================== --> 
 

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script> --%>


<%-- <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script> --%>


<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script> --%>
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> -->
 <script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>
  
    <!-- validations -->    

<script type="text/javascript">
  function gotoDoctorHomePage(){
  window.open("${pageContext.request.contextPath}/showDoctorHomePage","_self");
  }</script>

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
	 
	var extContactNo=document.getElementById("extContactNo").value;
	if(extContactNo===contactNo)
		{
		$('#submitButton').prop("disabled", false);
		}
	else{	
	
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
}

</script>


<script>
$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
        }
    });
});

function imageIsLoaded(e) {
    $('#myImg').attr('href', e.target.result);
};
/* sticky notes*/
(function($)
{
    /**
     * Auto-growing textareas; technique ripped from Facebook
     *
     * https://github.com/jaz303/jquery-grab-bag/tree/master/javascripts/jquery.autogrow-textarea.js
     */
    $.fn.autogrow = function(options)
    {
        return this.filter('textarea').each(function()
        {
            var self         = this;
            var $self        = $(self);
            var minHeight    = $self.height();
            var noFlickerPad = $self.hasClass('autogrow-short') ? 0 : parseInt($self.css('lineHeight')) || 0;

            var shadow = $('<div></div>').css({
                position:    'absolute',
                top:         -10000,
                left:        -10000,
                width:       $self.width(),
                fontSize:    $self.css('fontSize'),
                fontFamily:  $self.css('fontFamily'),
                fontWeight:  $self.css('fontWeight'),
                lineHeight:  $self.css('lineHeight'),
                resize:      'none',
                'word-wrap': 'break-word'
            }).appendTo(document.body);

            var update = function(event)
            {
                var times = function(string, number)
                {
                    for (var i=0, r=''; i<number; i++) r += string;
                    return r;
                };

                var val = self.value.replace(/</g, '&lt;')
                                    .replace(/>/g, '&gt;')
                                    .replace(/&/g, '&amp;')
                                    .replace(/\n$/, '<br/>&nbsp;')
                                    .replace(/\n/g, '<br/>')
                                    .replace(/ {2,}/g, function(space){ return times('&nbsp;', space.length - 1) + ' ' });

                // Did enter get pressed?  Resize in this keydown event so that the flicker doesn't occur.
                if (event && event.data && event.data.event === 'keydown' && event.keyCode === 13) {
                    val += '<br />';
                }

                shadow.css('width', $self.width());
                shadow.html(val + (noFlickerPad === 0 ? '...' : '')); // Append '...' to resize pre-emptively.
                $self.height(Math.max(shadow.height() + noFlickerPad, minHeight));
            }

            $self.change(update).keyup(update).keydown({event:'keydown'},update);
            $(window).resize(update);

            update();
        });
    };
})(jQuery);


var noteTemp =  '<div class="note">'
				+	'<a href="javascript:;" class="button remove">X</a>'
				+ 	'<div class="note_cnt">'
				+		'<textarea class="title" placeholder="Enter note title"></textarea>'
				+ 		'<textarea class="cnt" placeholder="Enter note description here"></textarea>'
				+	'</div> '
				+'</div>';

var noteZindex = 1;
function deleteNote(){
    $(this).parent('.note').hide("puff",{ percent: 133}, 250);
};

function newNote() {
  $(noteTemp).hide().appendTo("#board").show("fade", 300).draggable().on('dragstart',
    function(){
       $(this).zIndex(++noteZindex);
    });
 
	$('.remove').click(deleteNote);
	$('textarea').autogrow();
	
  $('.note')
	return false; 
};



$(document).ready(function() {
    
    $("#board").height($(document).height());
    
    $("#add_new").click(newNote);
    
    $('.remove').click(deleteNote);
    newNote();
	  
    return false;
});
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

</script>

<script type="text/javascript">
		
		
		$(document).ready(function() {

		    $('.datepicker').datepicker({
		        format: 'dd-mm-yyyy'
		    });
		});
		
		
	 </script>

<script type="text/javascript">



function openPage(pageUrl)
{
	 window.open("${pageContext.request.contextPath}/"+pageUrl,'_top');
	
	}
	
function getDoctorProfile()
{
	
	
	$
	.getJSON(
			'${showDoctorProfile}',

			{
			 
				  
				ajax : 'true'

			},
			function(data) {
				document.getElementById("docName").innerHTML='Dr. '+data.fName+' '+data.mName+' '+data.lName;
				 document.getElementById("address").innerHTML=data.address;
				 document.getElementById("docCity").innerHTML=data.cityName;
				document.getElementById("docMail").innerHTML=data.email;
				document.getElementById("phoneNo").innerHTML=data.contactNo;
				/* document.getElementById("doctorName1").innerHTML='Dr. '+data.fName+' '+data.lName; */
				 document.getElementById("docInfo").innerHTML=data.aboutMe; 
				 
				 document.getElementById("specialist").innerHTML=data.specType; 
				 document.getElementById("education").innerHTML=data.qualification+'<br/><b>From : </b>'+data.college+'.<br/><b> Passing year :</b> '+data.passingYear+'.'; 
				 document.getElementById("experience").innerHTML=data.yearOfExperience+" year."; 
				
				
			});
	}

function getDoctorRatingDetails()
{
	 
	
	$
	.getJSON(
			'${getRatingAndReviewsDetailsOfDoctor}',

			{
			 
				ajax : 'true'

			},
			function(data) {
				
				var len=data.ratingDetails.length;
				var strVar="";
				$(document).ready(function(){
					
					$("#skillbar_php").animate({width:data.fivaeStar+"%"},1500);
					$("#skillbar_asp").animate({width:data.fourStar+"%"},1500);
					$("#skillbar_jsp").animate({width:data.threeStar+"%"},1500);
					$("#skillbar_star2").animate({width:data.twoStar+"%"},1500);
					$("#skillbar_star1").animate({width:data.oneStar+"%"},1500);
					document.getElementById("five").innerHTML=data.fivaeStar+"%";
					document.getElementById("four").innerHTML=data.fourStar+"%";
					document.getElementById("three").innerHTML=data.threeStar+"%";
					document.getElementById("two").innerHTML=data.twoStar+"%";
					document.getElementById("one").innerHTML=data.oneStar+"%";
					});
				
				for (var i = 0; i < len; i++) {
				strVar = '<div class="item">'+
				'        <div class="doc_review">'+
				'            <p>'+data.ratingDetails[i].review+ ' </p>'+
				'        </div>'+
				'        </div>'; 
					
				}
				$('#doctorRev').append($(strVar));
			});
	} 
  /*---------Reviews----------*/
  $(".demo2").bootstrapNews({
            newsPerPage: 4,
            autoplay: true,
			pauseOnHover: true,
			navigation: false,
            direction: 'down',
            newsTickerInterval: 1500,
            onToDo: function () {
                //console.log(this);
            }
        });
</script>

<script>
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



function getCityBYState(){
									 
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

<!-- <script type="text/javascript">
$(document).ready(function(){
	
$("#skillbar_php").animate({width:'85'},1500);
$("#skillbar_asp").animate({width:'55'},1500);
$("#skillbar_jsp").animate({width:'75%'},1500);
$("#skillbar_star2").animate({width:'45%'},1500);
$("#skillbar_star1").animate({width:'25%'},1500);


});


</script> -->


</body>
</html>