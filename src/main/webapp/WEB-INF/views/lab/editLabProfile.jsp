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
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/resources/css/set2.css" />
	<link href="${pageContext.request.contextPath}/resources/css/lightbox.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

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
<body>
	<c:url var="getStateByCountryId" value="/getStateByCountryId" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
	<c:url var="usernameValidation" value="/usernameValidation" />
	<c:url var="sendTextOtp" value="/sendTextOtp" />
		<c:url var="verifyRegOTP" value="/verifyRegOTP" />
		<c:url var="verifyContactNumber" value="/verifyContactNumber" />
		
	<jsp:include page="../include/labHeader.jsp" />
	<div class="clearfix"></div>
	<section class="doc_login">
		<div class="dashboard_nm text-center"><h4>Edit Lab Profile</h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<c:choose>
			<c:when test="${sessionScope.labDetails.cityId>0}">
				<jsp:include page="../include/labLeftMenu.jsp" />
</c:when>
</c:choose>
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content active">
						<form method="POST" action='${pageContext.request.contextPath}/updateLabProfilesProcess' enctype="multipart/form-data" id="reset">
							<div class="row editpg">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">lab Name</label>
										  
											<input type="text" required
											class="input-text" name="labName" id="labName"
											value="${labName}"
											onkeypress="return (event.charCode > 64 && event.charCode < 91 ) || (event.charCode > 96 && event.charCode < 123 ) || (event.charCode==32) || (event.charCode > 31 && event.charCode < 33)"
											data-rule-required="true"  readonly/>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Owner
											Name</label> 
											<input type="text" required class="input-text"
											name="owner" id="owner" value="${ownerName}"
											onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode==32) || (event.charCode > 31 && event.charCode < 33)"
											data-rule-required="true" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">license
											Number</label> <input type="text" required
											class="input-text capitl_none"
											value="${licenseNo}" name="licenceNo"
											id="licenceNo"  />
									</div>
								</div>
								
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Contact No</label> 
										<input required type="text" class="input-text" value="${contactNo}" name="contact" id="contactNo"  
											onkeypress='return IsNumeric(event);' min="10" maxlength="13"
											class=form-control>
											
											
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Email</label> <input
											required type="email" class="input-text capitl_none" name="email"
											id="email" value="${email}"
											onkeydown="emailvalidation()">
										<p style="color: red; position: absolute" id='emailValidate'></p>
									</div>
								</div>
								<div class="col-sm-4">
                                  	<div class="form-group">
										<label for="exampleInputEmail1">Lab From-Time</label>
											<select required class="input-text chosen-select" id="fromTime" name="fromTime" >
											<option>--select time--</option>
											<c:forEach items="${appointmentTime}" var="appointmentTime">
												<c:choose>

													<c:when test="${fromTime==appointmentTime.timeId}">
														<option selected value="${appointmentTime.timeId}">
															${appointmentTime.time}</option>
													</c:when>
													<c:otherwise>
                 				                 <option  value ="${appointmentTime.timeId}">${appointmentTime.time}
                 				                 </option>
                                            </c:otherwise>
												</c:choose>
											</c:forEach>

										</select>
									</div>
                                  
                                  </div>
								
								<div class="col-sm-4">
								
									<div class="form-group">
										<label for="exampleInputEmail1">Lab To-Time</label> 
										<select required class="input-text chosen-select" id="toTime" name="toTime" >
											<option>--select time--</option>
											<c:forEach items="${appointmentTime}" var="appointmentTime">
												<c:choose>

													<c:when test="${toTime==appointmentTime.timeId}">
														<option selected value="${appointmentTime.timeId}">
															${appointmentTime.time}</option>
													</c:when>
													<c:otherwise>
                 				                 <option  value ="${appointmentTime.timeId}">${appointmentTime.time}
                 				                 </option>
                                            </c:otherwise>
												</c:choose>
											</c:forEach>

										</select>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Address</label> <input
											required type="text" class="input-text"
											value="${address}" name="address" id="address" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">City</label> 
										<select required class="input-text chosen-select" id="cityId" name="cityId" >
											<option>--select city--</option>
											<c:forEach items="${cityList}" var="cityList">
												<c:choose>

													<c:when test="${cityId==cityList.cityId}">
														<option selected value="${cityList.cityId}">
															${cityList.cityName}</option>
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
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">State</label> <select
											required class="input-text chosen-select" id="stateId"
											name="stateId" onchange="getCityBYState()">
											<option>--select state--</option>
											<c:forEach items="${stateList}" var="stateList">
												<c:choose>
													<c:when test="${stateId==stateList.stateId}">
														<option selected value="${stateList.stateId}">${stateList.stateName}</option>
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
										<label for="exampleInputEmail1">Country</label> <select
											required class="input-text chosen-select" id="countryId" name="countryId" onchange="getStateBYCountry()">
                                                   <option>--select country--</option>
											<c:forEach items="${countryList}" var="countryList">
												<c:choose>

													<c:when
														test="${countryId==countryList.countryId}">
														<option selected value="${countryList.countryId}">${countryList.countryName}</option>
														
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
										<label for="exampleInputEmail1">Pincode</label> <input
											required type="text" class="input-text"
											value="${pinCode}" name="pincode" id="pincode" />
									</div>
								</div>
								<div class="col-sm-2">
								<input type="hidden" name="uploadCertificateStatus" value="">
				<c:if test="${delStatus==2}">
				<label>Upload Certificate</label>
				<input type='file' name="certificatePhoto" class="choosefile" required />
				</c:if>
				<a class="example-image-link" href="${labUrl}/${labId}/documents/${certificate}" data-lightbox="example-set"><strong>View Certificate</strong></a>
				
				</div>
				<div class="col-sm-2 col-md-2">
				<!-- <label>View Signature</label> -->
				<div class="clearfix"></div>
				<%-- <c:if test="${empty signature}">
				   <input type='file' name="certificatePhoto" class="choosefile" required />  
				   </c:if>
				<a class="example-image-link" href="${labUrl}/${labId}/documents/${signature}" data-lightbox="example-set"><strong>View Signature</strong></a> --%>
				</div>
								<div class="clearfix"></div>
								
								<hr>
								
								<div class="col-sm-12 text-center">
									<div class="form-group">
									<!-- <input id="verifyButton" data-toggle="modal" data-target="#otp" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()"> -->
										<input type="submit" name="Submit" class="btn-fr-all" id="submitButton" value="Submit">
									<!-- <input type="button" value="Cancel" class="btn-fr-all" onclick="gotoLabHomePage()"> -->
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


	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
			
	<script	src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>


	<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script> 
    
    <!-- validations -->    
  <script type="text/javascript">
  function gotoLabHomePage(){
  window.open("${pageContext.request.contextPath}/showLabHomePage","_self");
  }
  </script>
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

$('.datepicker').datepicker({ format: "yyyy-mm-dd"})
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


</body>
</html>