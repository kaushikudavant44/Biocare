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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>

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
<jsp:include page="../include/patientHeader.jsp"/> 
<c:url var="getCityByStateId" value="/getCityByStateId" />
<c:url var="getStateByCountryId" value="/getStateByCountryId" />

<div class="clearfix"></div>
<c:url var="sendTextOtp"
		value="/sendTextOtp" />
		<c:url var="verifyRegOTP"
		value="/verifyRegOTP" />
		<c:url var="verifyContactNumber"
		value="/verifyContactNumber" />

<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Edit Patient Profile </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
             <jsp:include page="../include/patientLeftMenu.jsp"/>  
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
                <form action="${pageContext.request.contextPath}/updatePatientEditProcess" enctype="multipart/form-data" method="POST">
				     <div class="row editpg">
               
                        <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                	<input type="hidden" name="editPatientId" value="${editPatientDetails.patientId}">
                    	<label for="firstname">First Name</label>
    <input type="text" class="input-text" required="" id="fName" value="${editPatientDetails.fName}" name="fName" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)" >
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="middlename">Middle Name</label>
    <input type="text" class="input-text" required="" id="mName" name="mName" value="${editPatientDetails.mName}" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)" >
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="lastname">Last Name</label>
    <input type="text" class="input-text" required="" id="lName" name="lName" value="${editPatientDetails.lName}" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)" >
                    </div>
                </div>
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="mothername">Mother Name</label>
    <input type="text" class="input-text" required="" id="mother" name="motherName" value="${editPatientDetails.motherName}" onkeypress="return (event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123)" >
                    </div>
                </div>
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="gender">Gender</label>
            	<select class="input-text" id="gender" name="gender" >
                 <option>--select--</option>
								  
								  <c:choose>
         
         <c:when test = "${editPatientDetails.gender eq('Male') ||  editPatientDetails.gender eq('male')}">
          <option selected value="Male">Male</option>
           <option value="Female">Female</option>
								  <option value="Other">Other</option>
         </c:when>
         
         
         <c:when test = "${editPatientDetails.gender eq('Female') ||  editPatientDetails.gender eq('female')}">
           <option value="Male">Male</option>
          <option selected value="Female">Female</option>
           <option value="Other">Other</option>
         </c:when>
         
        <c:otherwise>
         <option value="Male">Male</option>
         <option value="Female">Female</option>
								  <option value="Other">Other</option>
        </c:otherwise>
								 
								 
								   </c:choose>
                </select>
                    </div>
                </div>
                      <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                     <label for="blood">Blood Group</label>
              	 <select class="input-text"  id="bloodGroup" name="bloodGroup">
              	 <option>Select</option>
                 
								<c:forEach items="${bloodGroup}" var="bloodGroup"
									varStatus="count">
									 <c:choose>
         
         <c:when test = "${bloodGroup==editPatientDetails.bloodGroup}">
          <option selected  value ="${bloodGroup}">${bloodGroup}</option>
         </c:when>
                 <c:otherwise>
                 				                             <option  value ="${bloodGroup}">${bloodGroup}</option>
                 
                 </c:otherwise>
         
         </c:choose>
         
								</c:forEach>
                </select>
                    </div>
                    </div>
                    <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="dob" class="reqd">Date Of Birth</label>
    		   <input class="input-text" id="birthDate"  name="birthDate" type="text" value="${editPatientDetails.birthDate}" readonly>  
    		 <div class="clearfix"></div>
    		
                </div>
                    </div>
                    <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="contact">Contact No.</label>
    		<input type="text" class="input-text" id="contactNo" name="contactNo" onkeypress="return IsNumeric(event);" onblur="verifyNum();" min="10" maxlength="13" value="${editPatientDetails.contactNo}">
               <span id='contactMessage' style="position: absolute;color: red; line-height: 17px; font-size: 12px !important;"></span>
                  <i class="glyphicon glyphicon-ok verified" aria-hidden="true" id="verifiedMark" style="display:none; color:green"></i> 
                    </div>
                </div> 
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="contact">Email</label>
    		<input type="email"  class="input-text capitl_none" id="email" name="email" value="${editPatientDetails.email}">
                    </div>
                </div>  
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="age">Qualification</label>
    		<input type="text"  class="input-text" id="qualification" name="qualification" value="${editPatientDetails.qualification}">
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="contact">Relation</label>
 <select class="input-text"  id="relation" name="relation">
              	 <option>Select Relation</option>
                 
								<c:forEach items="${patientMemberRelation}" var="patientMemberRelation"
									varStatus="count">
									 <c:choose>
         
         <c:when test = "${patientMemberRelation.relationType==editPatientDetails.string2}">
          <option selected  value ="${patientMemberRelation.relationType}">${patientMemberRelation.relationType}</option>
         </c:when>
                 <c:otherwise>
                 				                             <option  value ="${patientMemberRelation.relationType}">${patientMemberRelation.relationType}</option>
                 
                 </c:otherwise>
         
         </c:choose>
         
								</c:forEach>
                </select>                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="age">Profile Photo</label>
    		<input type="file"  class="input-text  capitl_none" name="profilePhoto">
                    </div>
                </div>
                 <div class="col-sm-8 col-md-8">
                
                	<div class="form-group">
                    	<label for="state">Address</label>
              	 <textarea class="input-text" id="address" name="address">${editPatientDetails.address}</textarea>
                    </div> 
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state">City</label>
              	 <select class="input-text" id="cityId" name="cityId">
							 <option value="">--select--</option> 
							 <c:forEach items="${cityList}" var = "cityList">
									   <c:choose>
                                            <c:when test = "${cityList.cityId==editPatientDetails.cityId}">
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
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state">State</label>
              	<select class="input-text"  id="stateId" name="stateId" onchange="getCityBYState()">
							 
                             <option>--select--</option>
                             
									   <c:forEach items="${stateList}" var = "stateList">
									   <c:choose>
                                            <c:when test = "${stateList.stateId==editPatientDetails.stateId}">
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
             <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state">Country</label>
              	 <select class="input-text" required="" id="countryId" name="countryId" onchange="getStateBYCountry()">
                             <option>--select--</option>
                             
									 <c:forEach items="${countryList}" var = "countryList">
									   <c:choose>
                                            <c:when test = "${countryList.countryId==editPatientDetails.countryId}">
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
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state">Pincode</label>
                 		<input type="text" required="" class="input-text" id="pincode" name="pincode" onkeypress="return IsNumeric(event);" value="${editPatientDetails.int2}">
                    	
                    </div> 
                </div>
                
                
                <%-- <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="dob">Date Of Birth</label>
    		 <input class="input-text datepicker" id="birthDate"   name="birthDate" type="text" value="${editPatientDetails.birthDate}" >
                </div>
                    </div> --%>
				
                <div class="clearfix"></div>
                <hr> 
                <div class="col-sm-12">
                <div class="form-group text-center">
                 <input type="submit" value="submit" class="btn-fr-all">
                 </div>
               <%--  <div class="form-group text-center">
                <!-- <input id="verifyButton" data-toggle="modal" data-target="#otp" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()"> -->
                    	<input type="submit" name="Submit" class="btn-fr-all" >
                    	<a class="card-btn" href="${pageContext.request.contextPath}/showPatientHomePage">Cancel</a> --%>
               <!--  </div> -->
                </div>
                </div>  
                
                </form>
                </div>
            </div>
        </div>
    </div>
  </div>
</section>
<%-- <jsp:include page="../include/videoCall.jsp"/> --%>
<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 
 
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
  
  
  <script type="text/javascript">
		$(".datepicker").datepicker({
			format : "dd-mm-yyyy",
			  endDate:new Date(),
			autoclose : true
		}).datepicker();
		</script>
<script>
function getStateBYCountry() {
	 
	 var countryId=document.getElementById("countryId").value; 
	 alert(countryId);
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
</body>
</html>