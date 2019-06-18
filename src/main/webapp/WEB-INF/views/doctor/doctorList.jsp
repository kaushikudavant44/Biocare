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
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
</head>         
<body onload="callMultipleFunction()">



<c:url var="getAppointmentsTime" value="/getAppointmentsTime" />
<c:url var="deleteDoctorAppointment" value="/deleteDoctorAppointment" />
<c:url var="editPatientAppointmentByDoctor" value="/editPatientAppointmentByDoctor" />
<c:url var="getRatingDetailsByDoctorId" value="/getRatingDetailsByDoctorId" />
<c:url var="getMaleOrFemaleDoctor" value="/getMaleOrFemaleDoctor" />
<c:url var="getDoctorSpeciality" value="/getDoctorSpeciality" />
<c:url var="getOnloadDoctorSpecialization" value="/getOnloadDoctorSpecialization" />
<c:url var="getHospitalClinicByDoctorId" value="/getHospitalClinicByDoctorId" />
<c:url var="patientLoginProcess" value="/patientLoginProcess" />
<c:url var="getClinicAvailabledTimeForAppointment" value="/getClinicAvailabledTimeForAppointment" />
<c:url var="getPatientMemberDetails" value="/getPatientMemberDetails" />
<c:url var="bookAppointment" value="/bookAppointment" />

<%-- <jsp:include page="../include/homeHeader.jsp"/>  --%>

<c:choose>
<c:when test="${sessionScope.patientDetails.patientId>0}">
<jsp:include page="../include/patientHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.doctorDetails.doctorId>0}">
<jsp:include page="../include/doctorHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.labDetails.labId>0}">
<jsp:include page="../include/labHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.medicalDetails.medicalId>0}">
<jsp:include page="../include/pharmacyHeader.jsp"/>
</c:when>

<c:otherwise>
<jsp:include page="../include/homeHeader.jsp"/> 
</c:otherwise>
</c:choose>
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Doctor List</h4></div>
<div class="container-fluid">
	<div class="doc_list">
      	<div class="doc-filt find-dr">   
      	<h3>Find Doctors</h3>
      		<div class="row"> 
      			<div class="col-sm-6">
      			<input id="locationCity" type="hidden" placeholder="Enter a location"/>
      				 <input id="location" type="text" placeholder="Enter a location" value="${currentCity}"/>  
 						<a class="detectbtn" onclick="getDoctorList()"><span class="icon-navigation"></span></a>
      			</div>
      			<div class="col-sm-6">
      				<input type="text" id="doctor" placeholder="Select Specialization" value="${specType}">
  

      				
      			</div>
      		</div>
      	</div>  
      	<hr class="margin-less">
      		<%-- <div class="filter_div filter-doc-lst"> --%>
      		<div class="filter_div filter-doc-lst">
      			<div class="row">
      				<div class="col-sm-3"><h3 class="text-right">Filters :</h3></div>
      				<!-- <div class="col-sm-2">
      					<select id="avail">
      						<option>Availability</option>
      						<option>Available today</option>
      						<option value="availdate">Available from Date</option>
      					</select>
      				</div> -->
      				<div class="col-sm-2">
      					<select onchange="getMaleOrFemaleDoctor()" id="maleFemaleDoctors" name="gender" >
      						<option value="${gender}">Gender</option>
      						<option value="Male">Male Doctor</option>
      						<option value="female">Female Doctor</option>
      					</select>
      				</div>
      				
      				<div class="col-sm-2">
      					<select onchange="getSortedResult()" id="sortedValuesByExperianceAndPrice" name="callToSort">
      						<option>Consultation fees</option>
      						<option value="2">Price High to Low</option>
      						<option value="3">Price Low to High</option>
      					</select>
      				</div>
      				<div class="col-sm-2">
      					<select onchange="getSortedExpeResult()" id="sortedValuesByExperiance" name="callToSort">
      						<option>Year Of Experience</option>
      						<option value="1">High to Low</option>
      						 <option value="4">Low to High</option>
      					</select>
      				</div>
      				<div class="col-sm-3 text-left">
      					<a href="#" class="btn-fr-all" onclick="getDoctorList()">Clear Filters</a>
      				</div>
      			</div>
      		</div>
      		<hr>
      		<div class="clearfix"></div>
      <c:forEach items="${doctorDetailsListInfo}" var="getDoctorDetailsListInfo" >
      	
      	
      	<div class="doc-detls">
      	<div class="doct-lst">
      		<img src="${getDoctorDetailsListInfo.profilePhoto}" class="img-responsive" alt="doctor">
      		<h4>Dr. ${getDoctorDetailsListInfo.fName} ${getDoctorDetailsListInfo.mName} ${getDoctorDetailsListInfo.lName}</h4>
      		<h5>${getDoctorDetailsListInfo.qualification}</h5>
      		<p>${getDoctorDetailsListInfo.yearOfExperience} Years Experience,</p>
      		<h5>${getDoctorDetailsListInfo.specializationType}</h5>
      		<%--< div class="text-center rating_doc"> 
  						    <c:forEach var = "i" begin = "1" end ="${getDoctorDetailsListInfo.rating}" >
               
          <a>   <span class="fa fa-star" aria-hidden="true" style="color:orange;float:left;"></span></a>
             
        </c:forEach>
        </div> --%>
       <div class="panel-group" id="accordion">
										<h4 class="clinicnm">${getDoctorDetailsListInfo.hospitalName}<span data-toggle="collapse" data-parent="#accordion" name="doctorId" onclick="getClinicDetails1(${getDoctorDetailsListInfo.doctorId})" href="#collapse1${getDoctorDetailsListInfo.doctorId}"> and More Clinic and Hospital</span></h4>
									</div>
           <div class="rating_doc"> 
      <%--   <c:forEach var = "i" begin = "${getDoctorDetailsListInfo.rating}" end ="4" >
               <a>   <span class="fa fa-star" aria-hidden="true" style="color:orange;float:left;"></span></a>
          <a>  <span class="fa fa-star" aria-hidden="true" style="color:#ccc;float:left;"></span></a>
             
        </c:forEach> --%>
        <a href="#" class="rateNum"><strong><span aria-hidden="true">${getDoctorDetailsListInfo.rating}</span></strong></a>
        
      	<c:forEach var="i" begin="1"
										end="${getDoctorDetailsListInfo.rating+1}">
										<c:choose>
											<c:when test="${i<getDoctorDetailsListInfo.rating+1}">
											<c:choose>
											<c:when test="${i<getDoctorDetailsListInfo.rating || i==getDoctorDetailsListInfo.rating}">
												<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
											</c:when>
											<c:otherwise>
										
												<a href="#"><span class="fa fa-star-half-o" style="color: #44b449 !important" aria-hidden="true"></span></a>
											</c:otherwise>
											</c:choose>
											
												
												
											</c:when>
										</c:choose>
									</c:forEach>
									
									<c:forEach var="i" begin="${getDoctorDetailsListInfo.rating+1}"
										end="5">
									  	<c:choose>
											<c:when test="${getDoctorDetailsListInfo.rating+1<i || getDoctorDetailsListInfo.rating+1==i}">  
										 
												<a href="#"><span class="fa fa-star greystar" aria-hidden="true"></span></a>
										 
											
												
												
											  </c:when>
										</c:choose> 
									</c:forEach>
									
									
										<div class="clearfix"></div>
									
        </div>
       
  			 <div class="panel-group" id="accordion">
          <h6 data-toggle="collapse" id="moreElement" data-parent="#accordion" href="#collapse${getDoctorDetailsListInfo.doctorId}" onclick="showReview(${getDoctorDetailsListInfo.doctorId})">Show Reviews</h6>
    </div>
      	</div>
      
      	<div class="doct-lst-r">
      	<h5><i class="icon-facebook-placeholder-for-locate-places-on-maps"></i> ${getDoctorDetailsListInfo.address}</h5>
        <h5><i class="icon-rupee-indian"></i> ${getDoctorDetailsListInfo.fees}</h5>
		<h5><i class="icon-phone-receiver"></i>${getDoctorDetailsListInfo.hospitalContactNo}</h5>
		<h5><i class="icon-calendar-page"></i>${getDoctorDetailsListInfo.availableTime}</h5>
		<c:choose>
		<c:when test="${sessionScope.patientDetails.patientId>0 || sessionScope.doctorDetails.doctorId>0 || sessionScope.labDetails.labId>0 || sessionScope.medicalDetails.medicalId>0}">
		
		<!-- <p><a class="btn-fr-all" onclick="bookDoctorAppointment()">Book Appointment</a></p> -->
		<p><a class="btn-fr-all" data-toggle="modal" data-target="#bkapp" onclick="getAvailabledTimeForClinic(${getDoctorDetailsListInfo.doctorId}, ${getDoctorDetailsListInfo.hospitalId});getPatientMemberDetails()" >Book Appointment</a></p>
    	</c:when>
    	<c:otherwise>
    	<p><a class="btn-fr-all" data-toggle="modal" data-target="#loginpopup" >Book Appointment</a></p> 
    	
    	</c:otherwise>
    	</c:choose>
      	<div class="clearfix"></div> 
      	 <div class="panel-group" id="accordion">
	      	<div id="collapse${getDoctorDetailsListInfo.doctorId}" class="panel-collapse collapse">
	      	 <hr> 
	        <div class="panel-body feedbk">
	        <h3>About Me</h3>
	        ${getDoctorDetailsListInfo.aboutMe}
	         <hr>
	      	<h3>Reviews</h3>
	      	
	      	<div id="emptyDiv${getDoctorDetailsListInfo.doctorId}">
	      	</div>
	      <!-- 	<p id="reviewsOfDoctor">n.xkfvhsdfkhfnmjjfdhf mnfvnc,gkdrg mnbjnfgjdfg  nmbjgng ds mndfkjhf kfksfgn</p>
	      	<span class="rgt-text" id="reviewsDate"></span> 
	      	<hr>-->
	      	
	      </div>
	    </div>
    </div>
    <div class="panel-group" id="accordion">
	      	<!-- <div id="collapse2" class="panel-collapse collapse">
	      	 <hr> 
	        <div class="panel-body feedbk">
		        <div class="doct-lst">
					<h4>vidya Hospital</h4>
					<h5><i class="fa fa-map-marker"></i> nashik</h5>
				</div>
				<div class="doct-lst-r">
					<h5><i class="fa fa-inr"></i>  1000.0</h5>
					<h5><i class="fa fa-phone"></i>0253-0000000</h5>
					<h5><i class="fa fa-calendar"></i>1:00 PM to 2:00 PM</h5>
						<p><a href="#" class="btn-fr-all">Book Appointment</a></p>
						<div class="clearfix"></div>
    			</div>
    			<hr>
    			
 			</div>
 
 		
 		</div> -->
 		<div id="collapse1${getDoctorDetailsListInfo.doctorId}"
											class="panel-collapse collapse">
											<div class="clearfix"></div>
											
                                          </div>
 		</div>
 		</div>
 		</div>
 </c:forEach>
 <div class="clearfix"></div>
 <div class="notFound">
 <c:if test="${message1!=null}">
 	
 	<img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">
 	<h6>Ooop's Sorry</h6>
 	<p>Doctor Not Found</p>

 </c:if>
 </div>
 </div>
 </div>
</section>
<div class="clearfix"></div>
<input type="hidden" name="appointId" id="appointId">
<input type="hidden" name="doctorId" id="doctorId">
<!--- select time--->
<div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Appointment</h4>
       <%--  </c:when>
        </c:choose> --%>
      </div>
      <div class="modal-body">
      	       <div class="row">
      	       	      <div class="col-sm-6">
       			      	<input type="text" onchange="getAppointTime(0)" class="datepicker" placeholder="select new date" id="newDate" name="newDate">
       			      </div>
       			      <div class="col-sm-6">
       			      	<select class="slct_lst" name="time" id="time">
			      		   
			      			  
			      		</select>
       			      </div>
       			</div>
       			<div class="clearfix"></div>
       			<hr>
       			<p class="text-center big-screen">
       			<a href="#" onclick="cancelAppointment()" class="btn-fr-all btn_red">Cancel Appointment</a>
       			
       			 <a href="#" onclick="editAppointment()" class="btn-fr-all">Confirm Appointment</a>
       			 </p>
       			 <p class="text-center small-screen">
       			<a href="#" onclick="cancelAppointment()" class="btn-fr-all btn_red">Cancel</a>
       			
       			 <a href="#" onclick="editAppointment()" class="btn-fr-all">Confirm</a>
       			 </p>
      </div>
  </div>
</div>
<!--- End select time--->

 <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Select Date</h4>
      </div>
      <div class="modal-body docavl">
      
       <input id="date1" class="datepicker" name="Date" placeholder="Select Date" readonly>
       <a href="#" class="btn-fr-all">Done</a>
      </div>
      </div>
      
  </div>
</div> 

<div class="modal fade" id="bkapp" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title" id="exampleModalLongTitle">Select Book
						Appoinment</h5>
					
				</div>
				<div class="modal-body inssurance_buy">
					<div role="tabpanel" class="doc-list-pop">
						<!-- Nav tabs -->
								
						 <input id="date" class="datepicker" name="Date" placeholder="Select Date" value="" readonly>
						 
						 
						 <select class="slct_lst" id="appPatientId" name="appPatientId">
									
									</select> 
						
						
									<select class="slct_lst" id="consultType" name="appPatientId">
									<option value="0">consult</option>
									<option value="1">E-consult</option>
									</select> 
						
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#morningTab"
								aria-controls="uploadTab" role="tab" data-toggle="tab">Morning</a>

							</li>
							<li role="presentation"><a href="#afterTab"
								aria-controls="afterTab" role="tab" data-toggle="tab">Afternoon</a>

							</li>
							<li role="presentation"><a href="#eveningTab"
								aria-controls="eveningTab" role="tab" data-toggle="tab">Evening</a>

							</li>
							<li role="presentation"><a href="#nightTab"
								aria-controls="nightTab" role="tab" data-toggle="tab">Night</a>

							</li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="morningTab">
								<ul class="appoint_tm" id="morningTime">
									
								</ul>
								<div class="clearfix"></div>
							</div>
							<div role="tabpanel" class="tab-pane" id="afterTab">
								<ul class="appoint_tm" id="afternoonTime">
								 
								</ul>
								<div class="clearfix"></div>
							</div>
							<div role="tabpanel" class="tab-pane" id="eveningTab">
								<ul class="appoint_tm" id="eveningTime">
									 
									
								</ul>
								<div class="clearfix"></div>
							</div>
							<div role="tabpanel" class="tab-pane" id="nightTab">
								<ul class="appoint_tm" id="nightTime">
									
								</ul>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					
					
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn-fr-all">Submit</button>
				</div> -->
			</div>
		</div>
	</div>
<div class="modal fade feedbck doclistBook" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="loginpopup">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Patient Login</h4>
        <span class="glyphicon glyphicon-triangle-bottom"></span>
      </div>
      <div class="modal-body text-center">
	          
					<div class="login1_blk">
	 		<div class="login-form">
	 			<p id="errormessage" style="color:red;position:absolute; margin: 0 auto; left:0; right:0" maxlength="20"></p>
        <input type="text" id="LogInUname1" name="userName" placeholder="Username" class="capitl_none" required="required" onclick="clearMsg()">
       <div class="loader2" style="position: fixed;margin-left: 140px" id="loader"> </div>
        <input type="password" id="LogInPasswors1" name="password" class="capitl_none" placeholder="password" onkeypress="if(event.keyCode==13) {doctorLogin();}" required="">
	 	
	 	<input type="submit" name="submit" class="btn-fr-all" placeholder="login" onclick="patientLogin()" value="Login">
	<a href="${pageContext.request.contextPath}/showpatientRegProcess">Sign Up</a><br>
	<a href="" onclick="usrnameMsgForForgetPwd()">Forgot Password?</a>
	 		</div>
	 </div>
      </div>
      </div>
    </div>
 </div>
<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/>
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDUPcyDrmpg21nIDmrhuaFvyom1uLHlIJw&libraries=places"></script>
<script src="${pageContext.request.contextPath}/resources/js/geolocation.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>



<script>
function callMultipleFunction(){
	
getSpecializationList();
initialize123();
getDoctorListPageLocation();
//var city=document.getElementById("location").value;
//window.open("${pageContext.request.contextPath}/showDoctorList?city="+city,"_self");

}
</script>

<script>
/*--------------Available Date popup---------------*/
$("#avail").on("change", function () {        
    $modal = $('.bs-example-modal-sm');
    if($(this).val() === 'availdate'){
      $modal.modal('show');
  }
});



		
		
</script>



<script type="text/javascript">

$("#date").datepicker(
  {
	  
	format: "dd-mm-yyyy",
	
	  startDate: new Date(),
	 
	  autoclose: true
	}).datepicker("setDate",new Date);
	            	
</script>

<script>
		 
function showReview(doctorId) {
	
	
//	document.getElementById("moreElement").disabled='disabled';

	
	 //alert("dd");
	// $('#collapse'+doctorId).remove();
	//$('#collapse'+doctorId).remove();
	if(!$('#collapse'+doctorId).hasClass('in'))
 {
	 $.getJSON(
															'${getRatingDetailsByDoctorId}',
															{
																doctorId : doctorId,
																																	
																ajax : 'true'
															},
															function(data) {
																
																if(data=='' || data==null){
																	$('#emptyDiv'+doctorId).empty();
																}else{
																$('#emptyDiv'+doctorId).empty();
																for(var k=0;k<data.length;k++){  
																	for(var j=0;j<data[k].getPatientReviews.length;j++)
																		{
																		
																		var strVar="";
																		
																		strVar += "   <p class=\"pull-left\"><strong>Date : "+data[k].getPatientReviews[j].createDate+" <\/strong><\/p>";
																		strVar += "   <div class=\"clearfix\"><\/div>";
																		strVar += "   <p class=\"text-left\">"+data[k].getPatientReviews[j].reviews+"<\/p>";
																	
																		 $('#emptyDiv'+doctorId).append(strVar);
																
																		}
																	
																}
																}
															})
	
 }
}
</script>	 
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>  

<script>
function getDoctorList(){
	initialize123();
	getDoctorListPageLocation();
	var city=document.getElementById("locationCity").value;
	
	if(city!=null && city!=''){
	window.open("${pageContext.request.contextPath}/showDoctorList?city="+city,"_self");
	}else{
		
		window.open("${pageContext.request.contextPath}/showDoctorList?city=Nashik,Maharashtra,IN","_self");
	}
}
</script>
<script>


var specializationList = [];
/* function getSpecialist(){
	
	var city=document.getElementById("maleFemaleDoctors").value;
	window.open("${pageContext.request.contextPath}/getDoctorSpeciality?cityId="+city,"_self"); 
	
} */


      		function getMaleOrFemaleDoctor(){
      			
      				var gender=document.getElementById("maleFemaleDoctors").value;
      				window.open("${pageContext.request.contextPath}/getMaleOrFemaleDoctor?gender="+gender,"_self");      				      				
      		}
      		
      		function getSortedResult(){
      			
      			
      			var callToSort=document.getElementById("sortedValuesByExperianceAndPrice").value;
      			
      			window.open("${pageContext.request.contextPath}/getSortedDoctorsByExperiance?callToSort="+callToSort,"_self");
      		
      		}
      		function getSortedExpeResult(){
      			
      			
      			var callToSort=document.getElementById("sortedValuesByExperiance").value;
      			
      			window.open("${pageContext.request.contextPath}/getSortedDoctorsByExperiance?callToSort="+callToSort,"_self");
      		
      		}
      		
      		
function getSpecializationList(){
	
	
      			
      			$.getJSON('${getOnloadDoctorSpecialization}', {
      				 
      				ajax : 'true'
      			}, function(data) {
      			
      			
      				  $.each(
      							data,
      							function(key, specializationDetailsList) {
      															
      								specializationList.push({ value: specializationDetailsList.specializationType, data: specializationDetailsList.specializationId });
      								
      			  })
      	 
      				});	
      		}
      		
  
      		google.maps.event.addDomListener(window, 'load', initialize);

      		function initialize() {
      			  var input = document.getElementById('location');
      			  new google.maps.places.Autocomplete(input);
      			
      		}
	
      		$(function(){ 
      		  // setup autocomplete function pulling from currencies[] array
      		  $('#doctor').autocomplete({
      			  
      			//source: currencies,
      		    lookup: specializationList,
      		    onSelect: function (suggestion) {
      		      
      		  //var specialistType=suggestion.data;
      		    var thehtml = '<strong>Currency Name:</strong> ' + suggestion.value + ' <br> <strong>Symbol:</strong> ' + suggestion.data; 
      		    document.getElementById("doctor").value=suggestion.value;
      		    
      		  
      		    $('#doctor').html(suggestion.value);
      		   
      		  getSpecializationDoctorListWithCity(suggestion.data);
      		    }
      		  }); 
      		  

   		  }); 
   		 
   		    function getSpecializationDoctorListWithCity(specId){
   		 
   		    	var cityAndStateAndCountryName=document.getElementById("location").value;
   		    	 var city=cityAndStateAndCountryName.split(",");
   		    
   		    	 var cityNameWithState=city[0]+","+city[1].trim()+","+city[2].trim();
   		    	 if(cityNameWithState=="null" || cityNameWithState==''){
   		    		cityNameWithState="Nashik,Maharashtra,In";
   		    	 }
   		    	 
   		    	 
   		  	
  				window.open("${pageContext.request.contextPath}/getSpecializationDoctorList?specId="+specId+"&cityNameWithState="+cityNameWithState,"_self");  
   		    	
   		    }
       		
          </script>
          
          
          <script>
          function bookDoctorAppointment(){
        	  
          }
          
          </script>
          
          
          
<script type="text/javascript">
function getClinicDetails1(doctorId)
{
	
	if(!$('#collapse1'+doctorId).hasClass('in'))
 {
  
 
	 $
		.getJSON(
				'${getHospitalClinicByDoctorId}',
				{
					doctorId : doctorId,
				 
					ajax : 'true'
				},
				function(data) {
					$('#collapse1'+doctorId).empty();
					
					$.each(
							data,
								function(key, clinicList) {
					
					
					var strVar="";
					strVar += "";
					strVar += "										<hr>";
					strVar += "										<div class=\"doct-lst\">";
					strVar += "";
					strVar += "											<h4>"+clinicList.hospitalName+"<\/h4>";
					strVar += "											<h5>";
					strVar += "												<i class=\"icon-facebook-placeholder-for-locate-places-on-maps\"><\/i> "+clinicList.address;
					 
					strVar += "											<\/h5>";
					strVar += "";
					strVar += "";
					strVar += "										<\/div>";
					strVar += "										<div class=\"doct-lst-r\">";
					strVar += "";
					strVar += "";
															
				//	strVar += "														<h5><i class=\"fa fa-inr\"></i>  1000.0<\/h5>"
															
					strVar += "											<h5><i class=\"icon-phone-receiver\"></i>"+clinicList.contactNo+"<\/h5>"
															
					
					strVar += "											<h5>";
					if(clinicList.availableTime!=0){								
					strVar += "												<i class=\"icon-calendar-page\"><\/i>"+clinicList.fromTime+" To "+clinicList.toTime;
					}else{
						strVar += "	<i class=\"icon-calendar-page\"><\/i>Doctor Not Available Today In Clinic";
					}
					
					strVar += "											<\/h5>";
					strVar += "											<p>";
					strVar += "												<a href=\"#\" data-toggle=\"modal\" data-target=\"#bkapp\"";
					strVar += "													 class=\"btn-fr-all\" onclick='getAvailabledTimeForClinic("+doctorId+", "+clinicList.hospitalId+")'>Book Appointment<\/a>";
					strVar += "											<\/p>";
					strVar += "											<div class=\"clearfix\"><\/div>";
					strVar += "											<div class=\"panel-group\" id=\"accordion\">";
					strVar += "												<div id=\"collapse1\" class=\"panel-collapse collapse\">";
					strVar += "													<hr>";
					strVar += "													<span class=\"lft-text\">Ahire Clinic<\/span>";
					strVar += "													<div class=\"\">";
					strVar += "														<a href=\"#\"><span class=\"fa fa-star\"";
					strVar += "															aria-hidden=\"true\"><\/span><\/a> <a href=\"#\"><span";
					strVar += "															class=\"fa fa-star\" aria-hidden=\"true\"><\/span><\/a> <a href=\"#\"><span";
					strVar += "															class=\"fa fa-star\" aria-hidden=\"true\"><\/span><\/a> <a href=\"#\"><span";
					strVar += "															class=\"fa fa-star\" aria-hidden=\"true\"><\/span><\/a> <a href=\"#\"><span";
					strVar += "															class=\"fa fa-star-half\" aria-hidden=\"true\"><\/span><\/a>";
					strVar += "													<\/div>";
					strVar += "";
					strVar += "";
					strVar += "												<\/div>";
					strVar += "											<\/div>";
					strVar += "										<\/div>";
					/* strVar += "										<div class=\"clearfix\">";
					strVar += "										<\/div>"; */
				/* 	strVar += "										<hr>"; */
					 
					$('#collapse1'+doctorId).append($(strVar));
							})
				});
	}

}


//jQuery(".panel-heading").click(function(){ jQuery(this).nextAll(".panel-collapse").slideToggle("fast"); });

jQuery(".panel-heading").click(function(){ 
	jQuery(this).next(".panel-collapse").addClass('thePanel');
	jQuery('#accordion .panel-collapse').not('.thePanel').slideUp("fast"); 
	jQuery(".thePanel").slideToggle("fast").removeClass('thePanel'); 
});





      	</script>	
      	<script>
		 
	 function patientLogin() {
		// document.getElementById("loader").style.display='block'; 		 
		 
		 var userName=document.getElementById("LogInUname1").value; 
		 var password=document.getElementById("LogInPasswors1").value;
		
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
																		//	document.getElementById("loader").style.display='none';
																	 document.getElementById("errormessage1").innerHTML="Invalid credential."; 
																		}  
																	else
																		{
																		location.reload();

																		}
																})
		
		 
	 }
	 
	 function clearMsg()
	 {
		 document.getElementById("errormessage1").innerHTML="";  
	 }
	 function erasePwdMsg()
	 {
		 document.getElementById("validate1").innerHTML="";
	 }
	
	 
	
	 function getAvailabledTimeForClinic(doctorId,hospitalId)
	 {
	 	
	 	var date=document.getElementById("date").value;
	 	 
	 	$('#nightTime').empty();
	 	$('#eveningTime').empty();
	 	$('#afternoonTime').empty();
	 	$('#morningTime').empty();
	 	
	 	 $
	 		.getJSON(
	 				'${getClinicAvailabledTimeForAppointment}',
	 				{
	 					doctorId : doctorId,
	 					hospitalId : hospitalId,
	 				 date : date,
	 					ajax : 'true'
	 				},
	 				function(data) {
	 					
	 					 
	 					$.each(
	 							data,
	 								function(key, timeList) {
	 								if(timeList.timeId<25){
	 								var strVar="";
	 								if(parseInt(timeList.string1)>timeList.int1)
	 								strVar += "<li id=\"abc\" onclick='bookAppointment("+timeList.timeId+","+doctorId+","+hospitalId+",\""+date+"\",\""+timeList.time+"\")'>"+timeList.time+"<\/li>";
	 								else
	 									strVar += "<li class=\"disable-appo\" disabled id=\"abc\">"+timeList.time+"<\/li>";
	 								$('#morningTime').append($(strVar));
	 								}
	 								else if(timeList.timeId<31)
	 									{
	 									var strVar="";
	 									if(parseInt(timeList.string1)>timeList.int1)
	 										strVar += "<li id=\"abc\" onclick='bookAppointment("+timeList.timeId+","+doctorId+","+hospitalId+",\""+date+"\",\""+timeList.time+"\")'>"+timeList.time+"<\/li>";
	 										else
	 											strVar += "<li class=\"disable-appo\" disabled id=\"abc\">"+timeList.time+"<\/li>";
	 										$('#afternoonTime').append($(strVar));
	 										}
	 								else if(timeList.timeId<41)
	 								{
	 								var strVar="";
	 								if(parseInt(timeList.string1)>timeList.int1)
	 									strVar += "<li id=\"abc\" onclick='bookAppointment("+timeList.timeId+","+doctorId+","+hospitalId+",\""+date+"\",\""+timeList.time+"\")'>"+timeList.time+"<\/li>";
	 									else
	 										strVar += "<li class=\"disable-appo\" disabled id=\"abc\">"+timeList.time+"<\/li>";
	 									$('#eveningTime').append($(strVar));
	 									}
	 								else if(timeList.timeId>40)
	 								{
	 								var strVar="";
	 								if(parseInt(timeList.string1)>timeList.int1)
	 									strVar += "<li id=\"abc\" onclick='bookAppointment("+timeList.timeId+","+doctorId+","+hospitalId+",\""+date+"\",\""+timeList.time+"\")'>"+timeList.time+"<\/li>";
	 									else
	 										strVar += "<li class=\"disable-appo\" disabled id=\"abc\">"+timeList.time+"<\/li>";
	 									$('#nightTime').append($(strVar));
	 									}
	 							})
	 				});
	 	 
	 	}
	 
	 
	 function bookAppointment(timeId,doctorId,hospitalId,date,time) {
		  
		  if(confirm("Are you sure book appointment on Date : "+date+" at time : "+time))
			{
		 
			  var patientId=document.getElementById("appPatientId").value;
			  var appointmentType=document.getElementById("consultType").value;
			  
			  alert(patientId);
			  if(patientId!=null && patientId!=""){
				  
			  
			  $
				.getJSON(
						'${bookAppointment}',
						{
							doctorId : doctorId,
							hospitalId : hospitalId,
							appointmentDate : date,
						 	appointmentTime : timeId,
						 	appointmentType : appointmentType,
						 	patientId : patientId,
							ajax : 'true'
						},
						function(data) {
							alert(data.message);
							window.open('${pageContext.request.contextPath}/showViewAppointmentToPatient?viewPatientId='+patientId+'&fromDate='+date+'&toDate='+date+'&viewAppType=0','_self');
						})
							
			} 
			 
			  else{
				  alert("Select consult type or patieint");
		}
			}
	}
	 
	 function getPatientMemberDetails(){
		 
		 $('#appPatientId option').remove();
		 
		 $
			.getJSON(
					'${getPatientMemberDetails}',
					{
						
						ajax : 'true'
					},
					function(data) {
						
						var len = data.length;
						var strVar="";
						strVar+="<option value='' selected disabled>--select--</option>";
						for (var i = 0; i < len; i++) {
							
							strVar += "<option value="+data[i].patientId+">"+data[i].fName+"<\/option>";
				
						} 
						 $('#appPatientId').append($(strVar));
					
					})
						
		}  
		 
		 
	 
	</script>
      	
      	
      	
</body>
</html>