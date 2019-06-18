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
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/default.min.css"
	rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/alertify.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
<!-- <style>
p {
	display: block;
	font-size: 1.35em;
	line-height: 1.5em;
	margin-bottom: 22px;
}

</style> -->



</head>
<body onload="getCityList()">
	<jsp:include page="../include/patientHeader.jsp" />
	<c:url var="getOnloadCityByStateId" value="/getOnloadCityByStateId" />
	<c:url var="showDoctorProfile" value="/showDoctorProfile" />
	<c:url var="getAppointmentsTime" value="/getAppointmentsTime" />
	<c:url var="getRatingDetailsByDoctorId"
		value="/getRatingDetailsByDoctorId" />
	<c:url var="bookAppointment" value="/bookAppointment" />
	<c:url var="getStateByCountryId" value="/getStateByCountryId" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />

	<c:url var="getDoctorsAndLabsForRating"
		value="/getDoctorsAndLabsForRating" />
	<c:url var="submitDoctorRating" value="/submitDoctorRating" />
	<c:url var="submitLabRating" value="/submitLabRating" />

	<c:url var="getHospitalClinicByDoctorIdAndAvailDate"
		value="/getHospitalClinicByDoctorIdAndAvailDate" />
	<c:url var="getClinicAvailabledTimeForAppointment"
		value="/getClinicAvailabledTimeForAppointment" />
<c:url var="getHospitalClinicByDoctorIdWithFixSchedule"
		value="/getHospitalClinicByDoctorIdWithFixSchedule" />

 

	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>Book Doctor Appointment</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
			<jsp:include page="../include/patientLeftMenu.jsp" />
			
			

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="filter_div">
						<div class="col-md-12 col-sm-12">
							<h3>Make An Appointment</h3>
							</div>
							<form action="${pageContext.request.contextPath}/showBookDoctorAppointment"	method="GET">
								<div class="col-md-3">
									<select class="slct_lst" id="appPatientId" name="appPatientId">
										<c:forEach items="${patientDetailList}"
											var="patientDetailList">
											<c:choose>
												<c:when test="${patientDetailList.patientId==appPatientId}">
													<option value="${patientDetailList.patientId}" selected>${patientDetailList.fName}
														${patientDetailList.lName}</option>
												</c:when>
												<c:otherwise>
													<option value="${patientDetailList.patientId}">${patientDetailList.fName}
														${patientDetailList.lName}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-3">
									<select class="slct_lst" id="specId" name="specId">
										<c:forEach items="${specializationList}"
											var="specializationList">
											<c:choose>
												<c:when
													test="${specializationList.specializationId==specId}">
													<option value="${specializationList.specializationId}"
														selected>${specializationList.specializationType}</option>
												</c:when>
												<c:otherwise>
													<option value="${specializationList.specializationId}">${specializationList.specializationType}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-2">
									<input id="appDate" class="datepicker" name="appDate"
										value="${appDateApp}" readonly>
								</div>
								<div class="col-md-2">
									<select class="slct_lst" id="consultType" name="consultType">
										<c:choose>
											<c:when test="${consultType==0}">
												<option value="0" selected>Consult</option>
											</c:when>
											<c:otherwise>
												<option value="0">Consult</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${consultType==1}">
												<option value="1" selected>E-Consult</option>
											</c:when>
											<c:otherwise>
												<option value="1">E-Consult</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<div class="col-md-2">
									<input type="text" name="currency" id="autocomplete" size="16"
										placeholder="Enter City..." value="${cityName}" autocomplete="no-fill">
									<p id="outputcontent"></p>
									<input type="hidden" id="doctorCity" name="doctorCity" value="${cityId}">
								</div>
								<div class="clearfix"></div>
								<div class="panel-group filter_cities" id="accordion1">
									<div class="panel panel-default">
										<div class="col-sm-12 text-center" style="margin-bottom: 5px">
											<a data-toggle="collapse" data-parent="#accordion1"
												href="#collapse6">other cities</a>
										</div>
										<div id="collapse6" class="panel-collapse collapse">
											<div class="col-sm-4">
												<select data-placeholder="Choose a Country..."
													class="chosen-select form-control" id="countryId"
													name="countryId" tabindex="2">
													<option value="" selected="selected" disabled="disabled"><c:out
															value="Select County" /></option>

													<c:forEach items="${countryList}" var="countryList"
														varStatus="count">
														<option value="${countryList.countryId}"><c:out
																value="${countryList.countryName}" /></option>
													</c:forEach>
												</select>
											</div>
											<div class="col-sm-4">
												<select data-placeholder="Choose a State..."
													class="chosen-select form-control" id="stateId"
													name="stateId" tabindex="2">
													<option value="" selected="selected" disabled="disabled"><c:out
															value="Select State" /></option>

												</select>
											</div>
											<div class="col-sm-4">
												<select data-placeholder="Choose a City..."
													class="chosen-select form-control" id="CityId"
													name="CityId" tabindex="2" onchange="setCityDoc()">
													<option value="" selected="selected" disabled="disabled"><c:out
															value="Select City" /></option>

												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-5"></div>
								<div class="col-sm-2">
									<input type="submit" value="search" class="btn-fr-all">
								</div>
								<div class="col-sm-5"></div>
							</form>
						</div>
						<div class="clearfix"></div>
						<hr>

						<!-- <div class="loader2" style="position: fixed;margin-left: 140px;" id="loader" > </div> -->
						<!-- <input type="text" class="input-text" placeholder="Search for Doctor Names.."> -->
						<br>

                        <c:choose>
                              <c:when test="${empty getDoctorListForAppointmentList}">
                              
						<div class="notFound">												
					     <img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">																		
			         	 <p>Result Not Found</p>																		
			            </div>	
			            			
				</c:when>		
                 <c:otherwise>
						<c:forEach items="${getDoctorListForAppointmentList}"
							var="getDoctorListForAppointment">


							<div class="doc-detls">
								<div class="doct-lst dr-clinic">
								<c:choose>
								<c:when test="${not  empty  getDoctorListForAppointment.profilePhoto}">
								
									<img src="${profileUrl}${getDoctorListForAppointment.doctorId}/profile/${getDoctorListForAppointment.profilePhoto}" class="img-responsive" alt="doctor">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/resources/images/profile-p.jpg" class="img-responsive" alt="doctor">
								
									</c:otherwise>
									</c:choose>
									<div class="panel-group" >
										<h4>Dr.
											${getDoctorListForAppointment.fName}
											${getDoctorListForAppointment.lName}</h4>
									</div>
									<h5>${getDoctorListForAppointment.qualification}</h5>
									<p>${getDoctorListForAppointment.yearOfExperience} year of
										Experience</p>
									<h5>${getDoctorListForAppointment.specType}</h5>
									<div class="panel-group" id="accordion${getDoctorListForAppointment.doctorId}">
										<c:choose>
										<c:when test="${empty getDoctorListForAppointment.availableTime}">
										<h4 class="clinicnm">${getDoctorListForAppointment.hospitalName} <span data-toggle="collapse" data-parent="#accordion${getDoctorListForAppointment.doctorId}"
											onclick="getAllClinicDetails(${getDoctorListForAppointment.doctorId})"
											<%-- onclick="getClinicDetails(${getDoctorListForAppointment.doctorId})" --%>
											href="#collapse${getDoctorListForAppointment.doctorId}" id="moreClinic${getDoctorListForAppointment.doctorId}">and  More Clinic and Hospital</span></h4>
											</c:when>
											<c:otherwise>
											<h4 class="clinicnm">${getDoctorListForAppointment.hospitalName} <span data-toggle="collapse" data-parent="#accordion${getDoctorListForAppointment.doctorId}"
											onclick="getClinicDetails(${getDoctorListForAppointment.doctorId})"
											href="#collapse${getDoctorListForAppointment.doctorId}" id="moreClinic${getDoctorListForAppointment.doctorId}">and  More Clinic and Hospital</span></h4>
											</c:otherwise>
											</c:choose>
									</div>
									<a href="#" class="rateNum"><span aria-hidden="true">${getDoctorListForAppointment.rating}</span></a>
									
									
									
									<c:forEach var="i" begin="1"
										end="${getDoctorListForAppointment.rating+1}">
										<c:choose>
											<c:when test="${i<getDoctorListForAppointment.rating+1}">
											<c:choose>
											<c:when test="${i<getDoctorListForAppointment.rating || i==getDoctorListForAppointment.rating}">
												<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
											</c:when>
											<c:otherwise>
										
												<a href="#"><span class="fa fa-star-half-o" style="color: #44b449 !important" aria-hidden="true"></span></a>
											</c:otherwise>
											</c:choose>
											
												
												
											</c:when>
										</c:choose>
									</c:forEach>
									
									<c:forEach var="i" begin="${getDoctorListForAppointment.rating+1}"
										end="5">
									  	<c:choose>
											<c:when test="${getDoctorListForAppointment.rating+1<i || getDoctorListForAppointment.rating+1==i}">  
										 
												<a href="#"><span class="fa fa-star greystar" aria-hidden="true"></span></a>
										 
											
												
												
											  </c:when>
										</c:choose> 
									</c:forEach>
									
									
									

									<!-- <a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
									<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
									<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
									<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
									<a href="#"><span class="fa fa-star"
										aria-hidden="true"></span></a> -->
										<div class="clearfix"></div>
										
									
									
									<div class="panel-group" id="accordionn${getDoctorListForAppointment.doctorId}">
						<%-- <input type="button" value="Review" onclick="showReview(${getDoctorListForAppointment.doctorId})"> --%>
								<p class="riveDoc"><a data-toggle="collapse" data-parent="#accordionn${getDoctorListForAppointment.doctorId}" onclick="showReview(${getDoctorListForAppointment.doctorId})" href="#collapsee${getDoctorListForAppointment.doctorId}">Reviews</a></p>
								</div>
								</div>
								
								<div class="doct-lst-r dr-clinic">
									<h5>
										<!-- <i class="icon-facebook-placeholder-for-locate-places-on-maps"></i> <strong>D'souza
										Colony, Nashik</strong> -->
									</h5>
									<h5><span class="icon-facebook-placeholder-for-locate-places-on-maps"></span> ${getDoctorListForAppointment.hospitalAddress},  ${getDoctorListForAppointment.cityName}</h5>
									<h5>
										<span class="icon-rupee-indian"></span>  ${getDoctorListForAppointment.fees}
									</h5>
									<h5><span class="icon-phone-receiver"></span> ${getDoctorListForAppointment.hospitalContactNo} </span>
									<h5>
										<span class="icon-calendar-with-a-clock-time-tools"></span> ${getDoctorListForAppointment.fromTime} To ${getDoctorListForAppointment.toTime}
									</h5>
									<input type="hidden" id="hospId${getDoctorListForAppointment.doctorId}" value="${getDoctorListForAppointment.hospitalId}">
									<p>
									<c:choose>
										<c:when test="${empty getDoctorListForAppointment.availableTime}">
										
										 <a href="#" data-toggle="modal" data-target="#bkapp"
										class="btn-fr-all" onclick="getAvailabledTimeForClinic(${getDoctorListForAppointment.doctorId}, ${getDoctorListForAppointment.hospitalId},1)">Book Appointment</a>
										
										</c:when>
										<c:otherwise>
										 <a href="#" data-toggle="modal" data-target="#bkapp"
										class="btn-fr-all" onclick="getAvailabledTimeForClinic(${getDoctorListForAppointment.doctorId}, ${getDoctorListForAppointment.hospitalId},0)">Book Appointment</a>
										</c:otherwise>
										</c:choose>
										 
									</p>
									<div class="clearfix"></div>
									<div class="panel-group" >
									
										<div id="collapse${getDoctorListForAppointment.doctorId}"
											class="panel-collapse collapse">
											<div class="clearfix"></div>
											<hr>
                                          </div>


									</div>
									<div class="panel-group" >
										<div id="collapsee${getDoctorListForAppointment.doctorId}" class="panel-collapse collapse" aria-expanded="true">
										<hr>
										<h5 class="doc-RevPAt1">Reviews</h5>
										<div id="reviewDiv${getDoctorListForAppointment.doctorId}">
										
										</div>
										
									<!-- 	<div class="doc-RevPAt">	
										<h4>Pateint Name</h4>
										<h6><strong>Date</strong> :19-10-2018</h6>	
										<div class="clearfix"></div>										
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>	
										</div>	
										<hr>
										<div class="doc-RevPAt">	
										<h4>Pateint Name</h4>
										<h6><strong>Date</strong> :19-10-2018</h6>	
										<div class="clearfix"></div>										
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>	
										</div>	 -->
                                  </div>
                                   </div>
								</div>
							</div>
						</c:forEach>
						</c:otherwise>
						 
						</c:choose>
						
						<br>

					</div>
					<div class="page-alerts collapse" id="alert-1"
						style="display: none"></div>
				</div>

			</div>
		</div>
	</div>
	
	</section>
	
	

	<!--book appoinment  -->

	<!-- Modal -->
	 

	<div class="modal fade" id="bkapp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		
		<div class="modal-dialog" role="document">
		
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title" id="exampleModalLongTitle">Book Doctor Appoinment</h5>
					
				</div>
				<div class="modal-body inssurance_buy">
				
					<div role="tabpanel" onload="myFunction()" style="margin:0;">
				<div class="reletive">	
				 <div id="overlay" style="display:none;"><span><img src="${pageContext.request.contextPath}/resources/images/b_logo.png" alt="loader with logo"></span>
						<div id="loading"></div>
					</div>  
				</div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active animate-bottom" xstyle="display:none;" id="myDiv">
							<a href="#morningTab" aria-controls="uploadTab" role="tab" data-toggle="tab">Morning</a>

							</li>
							<li role="presentation"><a href="#afterTab" aria-controls="afterTab" role="tab" data-toggle="tab">Afternoon</a>

							</li>
							<li role="presentation"><a href="#eveningTab"
								aria-controls="eveningTab" role="tab" data-toggle="tab">Evening</a>

							</li>
							<li role="presentation"><a href="#nightTab"
								aria-controls="nightTab" role="tab" data-toggle="tab">Night</a>

							</li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content" >
							<div role="tabpanel" class="tab-pane active" id="morningTab">
								<ul class="appoint_tm" id="morningTime">
									 
								</ul>
								<div class="clearfix"></div>
								
							</div>
							<div role="tabpanel" class="tab-pane animate-bottom" id="afterTab" >
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
				
			</div>
		</div>
	</div>

	<!--book appoinment  -->
	
	

	<!--- select time--->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="appint_modal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-header">
				<input type="hidden" id="hospId"> <input type="hidden"
					id="docAppId">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Select Appointment
					time</h4>
			</div>
			<div class="modal-body">
				<ul class="appoint_tm" id="appTimes">

				</ul>
				<div class="clearfix"></div>
				<p class="text-center">
					<input type="submit" class="btn-fr-all appointTm"
						onclick="bookAppointment()">
				</p>
				
			</div>

		</div>
	
	</div>
 
	<!--- End select time--->
	
	<!--select time aleart  -->
	
        
	<!--select time aleart  -->
	
	
	
	
	<%--  <jsp:include page="../include/videoCall.jsp"/>  --%>
	
	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
	
	
 
	<!-- Bootstrap core JavaScript================================================== -->
	

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
		
		
		 <!-- new alert -->
       <script src="${pageContext.request.contextPath}/resources/js/alertify.min.js"></script>
       <!-- new alert  --> 
		
			<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>


	
 <script type="text/javascript">
 $(function(){
	    $('.datepicker').datepicker({ 
	        "setDate": new Date(),
	        "format": "dd-mm-yyyy",
	        "autoclose": true
	    });
	  });

 </script>
		 <script>
		 
		 var myVar;

		function myFunction() {
			alert("lkjhg");
		    myVar = setTimeout(showPage, 1000);
		}

		function showPage() {
		    document.getElementById("loading").style.display = "none";
		    document.getElementById("myDiv").style.display = "block";
		}
		</script> 
		


	<script>
        $(function(){
            var codes = $('.highlight code');
            codes.each(function (ind, el) {
                hljs.highlightBlock(el);
            });

            $('.lobipanel').lobiPanel();
            $('#demoPanel11').lobiPanel();
            $('#lobipanel-basic')
                    .on('beforeUnpin.lobiPanel', function () {
                        console.log("beforeClose");
                    })
                    .on('onClose.lobiPanel', function () {
                        console.log("onClose");
                    })
                    .on('onTitleChange.lobiPanel', function () {
                        console.log(this, arguments);

                    })
                    .lobiPanel();
            $('#lobipanel-custom-control').lobiPanel({
                reload: false,
                close: false,
                editTitle: false
            });
            $('#lobipanel-stateful').lobiPanel({
                stateful: true
            });
            $('#lobipanel-font-awesome').lobiPanel({
                reload: {
                    icon: 'fa fa-refresh'
                },
                editTitle: {
                    icon: 'fa fa-edit',
                    icon2: 'fa fa-save'
                },
                unpin: {
                    icon: 'fa fa-arrows'
                },
                minimize: {
                    icon: 'fa fa-chevron-up',
                    icon2: 'fa fa-chevron-down'
                },
                close: {
                    icon: 'fa fa-times-circle'
                },
                expand: {
                    icon: 'fa fa-expand',
                    icon2: 'fa fa-compress'
                }
            });
            $('#lobipanel-constrain-size').lobiPanel({
                minWidth: 300,
                minHeight: 300,
                maxWidth: 600,
                maxHeight: 480
            });
            $('#lobipanel-from-url').on('loaded.lobiPanel', function (ev, lobiPanel) {
                var $body = lobiPanel.$el.find('.panel-body');
                $body.html('<div class="highlight"><pre><code>' + $body.html() + '</code></pre></div>');
                hljs.highlightBlock($body.find('code')[0]);
            }).lobiPanel({
                loadUrl: 'bootstrap/dist/css/bootstrap.min.css',
                bodyHeight: 400
            });
            $('#lobipanel-multiple').find('.panel').lobiPanel({
                sortable: true,
                beforeTitleChange: function(lobiPanel, title){
                    console.log("beforeTitleChange", arguments);
                    if (!title) {
                        return false;
                    }
                }
            });
        });
    </script>
	<script>
 $(document).ready(function() { 
		$('#countryId').change(
				function() {
					 
					$.getJSON('${getStateByCountryId}', {
						countryId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose State...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].stateId + '">'
									+ data[i].stateName + '</option>';
						} 
						html += '</option>';
						$('#stateId').html(html);
						$("#stateId").trigger("chosen:updated");

					});
					
				 
		
				});
	});
 $(document).ready(function() { 
		$('#stateId').change(
				function() {
					 
					$.getJSON('${getCityByStateId}', {
						stateId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose City...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].cityId + '">'
									+ data[i].cityName + '</option>';
						} 
						html += '</option>';
						$('#CityId').html(html);
						$("#CityId").trigger("chosen:updated");

					});
					
				 
		
				});
	});
 
 </script>


	<script type="text/javascript">
jQuery(document).ready(function() {
    var owl = jQuery('.owl-carousel');
    owl.owlCarousel({
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 1000,
      autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
  
  

</script>

	<script type="text/javascript"> 
	
	 var currencies = [];
	 
	 function setCityDoc()
	 {
		 var city=document.getElementById("CityId").value;
		 document.getElementById("doctorCity").value=city;
		 
		 var cityName=$("#CityId option:selected").text();		
		 document.getElementById("autocomplete").value=cityName;
		 
	 } 
	 
	function getCityList() {
		 
		$.getJSON('${getOnloadCityByStateId}', {
		 
			ajax : 'true'
		}, function(data) {
			 
		
			  $.each(
						data,
						function(key, cityList) {
													
							currencies.push({ value: cityList.cityName, data: cityList.cityId });
		  });
 
			});
		
	}
	
 
	
	$(function(){
		 
		  // setup autocomplete function pulling from currencies[] array
		  $('#autocomplete').autocomplete({
		    lookup: currencies,
		    onSelect: function (suggestion) {
		      /* var thehtml = '<strong>Currency Name:</strong> ' + suggestion.value + ' <br> <strong>Symbol:</strong> ' + suggestion.data; */
		      document.getElementById("doctorCity").value=suggestion.data;
		 /*      $('#outputcontent').html(thehtml); */
		    }
		  });
		  

		});
	 
	</script>

	<script>
function showReview(doctorId) {
    /*  $('#collapse'+doctorId).remove();   */
	 /*  $('#collapse'+doctorId).html("");   */ 	
	 $('#reviewDiv'+doctorId).empty();
	 $
	 
													.getJSON(
															'${getRatingDetailsByDoctorId}',
															{
																doctorId : doctorId,
																																	
																ajax : 'true'
															},
															function(data) {
															 
																for(var k=0;k<data.length;k++){  
																	for(var j=0;j<data[k].getPatientReviews.length;j++)
																		{
																		 
																		var strVar="";
																		strVar += "<div class=\"doc-RevPAt\">	";
																		/* strVar += "										<h4>"+data[k].getPatientReviews[j].patientName+"<\/h4>"; */
																		strVar += "										<h6><strong>Date<\/strong> :"+data[k].getPatientReviews[j].createDate+"<\/h6>	";
																		strVar += "										<div class=\"clearfix\"><\/div>										";
																		strVar += "										<p>"+data[k].getPatientReviews[j].reviews+".<\/p>	";
																		strVar += "										<\/div>	";
																		strVar += "										<hr>";

																		 
																		  $('#reviewDiv'+doctorId).append(strVar); 
																
																		}
																 
																	
																}
																 
																if(data.length<1){
																	var strVar="";
																strVar += "<div class=\"notFound\">";
																strVar += "										<img src=\"${pageContext.request.contextPath}\/resources\/images\/notfound.png\" class=\"img-responsive\" alt=\"Not Found\">";
																strVar += " 										<h6>Ooop's Sorry<\/h6>";
																strVar += " 										<p>Records Not Available<\/p>";
																strVar += "										<\/div>";
																 $('#reviewDiv'+doctorId).append(strVar); 
																}
															})
	
	 
}
	 
//book Appointment
	 function bookAppointment()
     {
    	 if($("#selectedAppTime").val()!="" && $("#selectedAppTime").val()!=null)
    		 {
    			 
    		
    	var appointmentTime= document.getElementById("selectedAppTime").value;
    	var patientId= document.getElementById("appPatientId").value;
    	var appointmentDate=document.getElementById("appDate").value;
    	var appointmentType= document.getElementById("consultType").value;
    	 var doctorId=document.getElementById("docAppId").value;
    	 var hospitalId=document.getElementById("hospId").value;
    	 var appType=0; 	
    	  $
			.getJSON(
					'${bookAppointment}',
					{
						doctorId : doctorId,
						appointmentDate : appointmentDate,
						appointmentTime : appointmentTime,
						hospitalId : hospitalId,
						patientId: patientId,
						appointmentType: appointmentType,
						 
						ajax : 'true'
					},
					function(data) {
						
						
						window.open("${pageContext.request.contextPath}/showViewAppointmentToPatient?viewPatientId="+patientId+"&fromDate="+appointmentDate+"&toDate="+appointmentDate+"&viewAppType="+appType,"_self");

						
					});
    		 }
    	 else
    		 {
    		 alert("Please Select Time for Appoinrment");
    		 }
     }
     
     
     //get appointment time 
    /*  
     function getAppointmentTime(doctorId)
         {
    	 $('#appTimes li').remove();
        	 
         var appointmentDate=document.getElementById("appDate").value;
               
         if(appointmentDate!=null && appointmentDate!=""){
         $
			.getJSON(
					'${getAppointmentsTime}',
					{
						doctorId : doctorId,
						appointmentDate : appointmentDate,
						 
						ajax : 'true'
					},
					function(data) {
						var allLen=data.allAppointmentTimeList.length;
						alert(data.allAppointmentTimeList.length);
						for(var k=0;k<47;k++){
							var	temp=0;
							  $.each(
										data.appointmentTimeList,
										function(key, timeList) {
								
											if(timeList.timeId==(k+1)){
												temp=1;
	         var node = document.createElement("LI");
	        
	         var textnode = document.createTextNode(timeList.time);
	         node.setAttribute("id", timeList.timeId);
	         node.setAttribute("onclick", "setAppointMentTime(this, "+timeList.timeId+","+doctorId+")");
	         node.appendChild(textnode);
	         document.getElementById("appTimes").appendChild(node);
	    //  var blankNode = document.createElement("LI");
	       //  document.getElementById("appTimes").appendChild(blankNode); 
	         
										}
											 
										});
							  if(temp==0)
								  {
								  
								  
								  var node = document.createElement("LI");
							        
							         var textnode = document.createTextNode(data.allAppointmentTimeList[k].time);
							         node.setAttribute("id", (k+1));
							         node.setAttribute("class","disabled booked");
							         node.setAttribute("style"," color:red !important");
							        /*  node.setAttribute("onclick", "setAppointMentTime(this, "+(k+1)+","+doctorId+")"); */
							         /* node.appendChild(textnode);
							         document.getElementById("appTimes").appendChild(node); */
							        /*  var blankNode = document.createElement("LI");
							         document.getElementById("appTimes").appendChild(blankNode); 
							       */
							/* 	  }
							}
							
						});
	         }
         else{
        	 alert("Select Appointment Date");
         }
           
         }  */
         

         function getAppointmentTime(doctorId,hospitalId)
             {
        	 $('#appTimes li').remove();
            	 
             var appointmentDate=document.getElementById("appDate").value;
             document.getElementById("hospId").value= hospitalId;     
             document.getElementById("docAppId").value= doctorId;     
             if(appointmentDate!=null && appointmentDate!=""){
            	
            	 
            	 
             $
    			.getJSON(
    					'${getAppointmentsTime}',
    					{
    						doctorId : doctorId,
    						appointmentDate : appointmentDate,
    						 
    						ajax : 'true'
    					},
    					function(data) {
    						
    						
    							if(data.allAppointmentTimeList!=null)
    								{
    								$('#appint_modal').modal('show');
    						
    						$.each(
    										data.allAppointmentTimeList,
    										function(key, allTimeList) {
    											
    										 var temp=0;
    							  $.each(
    										data.appointmentTimeList,
    										function(key, timeList) {
    										
    											if(timeList.timeId==allTimeList.timeId){
    												temp=1;
    		  var node = document.createElement("LI");
    		 
    		  var textnode = document.createTextNode(timeList.time);
    		  node.setAttribute("id", timeList.timeId);
    		  node.setAttribute("onclick", "setAppointMentTime(this, "+timeList.timeId+","+doctorId+")");
    		  node.appendChild(textnode);
    		  document.getElementById("appTimes").appendChild(node);
    		  
    		  
    											}
    										});
    							  if(temp==0)
    								  {
    								 
    								 var node = document.createElement("LI");
    						          
    					           var textnode = document.createTextNode(allTimeList.time);
    					           node.setAttribute("id", allTimeList.timeId);
    					         node.setAttribute("style"," color:red !important");
    					       node.setAttribute("class","disabled booked");
    					        /*    node.setAttribute("onclick", "setAppointMentTime("+allTimeList.timeId+","+labId+")"); */
    					           node.appendChild(textnode);
    					           document.getElementById("appTimes").appendChild(node);
    					          
    								  }
    							  
    							  
    										});
    						
    								}
    							else
    								{
    								 
    								document.getElementById("remove"+doctorId).removeAttribute("onclick"); 	
    	    						
    	    						document.getElementById("remove"+doctorId).innerHTML="not available"; 
    								}
    					
    					
    					
    					
    					});
    			
    		}
    		 else{
    			 alert("Select Appointment Date");
    		 }
    			  
    		}  

    		
      function setAppointMentTime(a){
    	 
         var time= arguments[1];
         var docId= arguments[2];
        
    	 document.getElementById("selectedAppTime").value=time;
    	
          var i;	   
    	  var list = document.getElementById("appTimes").getElementsByTagName('li');
    	  for(i=0; i<list.length; i++)
	        {
	            list[i].style.background = '#fff';
	            list[i].style.color = '#000';
	        }
	        
    	  a.style.background = '#008abd';
    	  a.style.color = '#fff';
     
     } 
     //select time
      /* function setAppointMentTime(a)
	    {
    	 alert(arguments.length);
    	 var i;
    	 var x;
    	  for(i = 0; i < arguments.length; i++) {
    	        
    		 x = arguments[i];
    		 alert(x);
    	        } 
	        var list = document.getElementById("appTimes").getElementsByTagName('li');
	        
	        for(i=0; i<list.length; i++)
	        {
	            list[i].style.background = '#fff';
	            list[i].style.color = '#000';
	        }
	        
	        a.style.background = '#008abd';
	        a.style.color = '#fff';
	        
	    }    */
      
    		</script>


	 
	<!-- Feed Back -->
	

	<script type="text/javascript">
function getClinicDetails(doctorId)
{
	if(!$('#collapse'+doctorId).hasClass('in'))
 {
  
  var date=document.getElementById("appDate").value;
	 $
		.getJSON(
				'${getHospitalClinicByDoctorIdAndAvailDate}',
				{
					doctorId : doctorId,
				    date : date,
					ajax : 'true'
				},
				function(data) {
					
					if(data.length>1)
					{
					$('#collapse'+doctorId).empty();
					
					$.each(
							data,
								function(key, clinicList) {
					
								
								var hopsId=$("#hospId"+doctorId).val();
								
								if(hopsId!=clinicList.hospitalId){
								
					var strVar="";
					strVar += "";
					strVar += "										<hr>";
					strVar += "										<div class=\"doct-lst dr-clinic\">";
					strVar += "";
					strVar += "											<h4>"+clinicList.hospitalName+"<\/h4>";
					strVar += "											<h5>";
					strVar += "												<i class=\"icon-facebook-placeholder-for-locate-places-on-maps\"><\/i> "+clinicList.address+", "+clinicList.cityName;
					 
					strVar += "											<\/h5>";
					strVar += "";
					strVar += "";
					strVar += "										<\/div>";
					strVar += "										<div class=\"doct-lst-r\">";
					strVar += "";
					strVar += "";
															
					/* strVar += "														<h5><i class=\"fa fa-inr\"></i>  1000.0<\/h5>"; */
															
					strVar += "											<h5><i class=\"icon-phone-receiver\"></i>"+clinicList.contactNo+"<\/h5>";
															
					
					strVar += "											<h5>";
					strVar += "												<i class=\"icon-calendar-page\"><\/i>"+clinicList.fromTime+" To "+clinicList.toTime;
					strVar += "											<\/h5>";
					strVar += "											<p>";
					strVar += "												<a href=\"#\" data-toggle=\"modal\" data-target=\"#bkapp\"";
					strVar += "													href=\"#\" class=\"btn-fr-all\" onclick='getAvailabledTimeForClinic("+doctorId+", "+clinicList.hospitalId+",0)'>Book Appointment<\/a>";
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
					 
					$('#collapse'+doctorId).append($(strVar));
								}
							})
					}
					else
						{
						document.getElementById("moreClinic"+doctorId).innerHTML="not available";
						}
							
							
							
				});
	}

}


function getAllClinicDetails(doctorId)
{
	if(!$('#collapse'+doctorId).hasClass('in'))
	 {
	  
	   
		 $
			.getJSON(
					'${getHospitalClinicByDoctorIdWithFixSchedule}',
					{
						doctorId : doctorId,
						clinicId : $("#hospId"+doctorId).val(),
						ajax : 'true'
					},
					function(data) {
						
						if(data.length>0)
						{
						$('#collapse'+doctorId).empty();
					
						$.each(
								data,
									function(key, clinicList) {
						
									
									var hopsId=$("#hospId"+doctorId).val();
									
									if(hopsId!=clinicList.hospitalId){
									
						var strVar="";
						strVar += "";
						strVar += "										<hr>";
						strVar += "										<div class=\"doct-lst dr-clinic\">";
						strVar += "";
						strVar += "											<h4>"+clinicList.hospitalName+"<\/h4>";
						strVar += "											<h5>";
						strVar += "												<i class=\"icon-facebook-placeholder-for-locate-places-on-maps\"><\/i> "+clinicList.address+", "+clinicList.cityName;
						 
						strVar += "											<\/h5>";
						strVar += "";
						strVar += "";
						strVar += "										<\/div>";
						strVar += "										<div class=\"doct-lst-r\">";
						strVar += "";
						strVar += "";
																
						/* strVar += "														<h5><i class=\"fa fa-inr\"></i>  1000.0<\/h5>"; */
																
						strVar += "											<h5><i class=\"icon-phone-receiver\"></i>"+clinicList.contactNo+"<\/h5>";
																
						
						strVar += "											<h5>";
						strVar += "												<i class=\"icon-calendar-page\"><\/i>"+clinicList.fromTime+" To "+clinicList.toTime;
						strVar += "											<\/h5>";
						strVar += "											<p>";
						strVar += "												<a href=\"#\" data-toggle=\"modal\" data-target=\"#bkapp\"";
						strVar += "													href=\"#\" class=\"btn-fr-all\" onclick='getAvailabledTimeForClinic("+doctorId+", "+clinicList.hospitalId+",1)'>Book Appointment<\/a>";
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
						 
						$('#collapse'+doctorId).append($(strVar));
									}
								})
						}
						else
							{
							document.getElementById("moreClinic"+doctorId).innerHTML="not available";
							}
								
								
								
					});
		}
	}

function getAvailabledTimeForClinic(doctorId,hospitalId, scheduleType)
{
	
	var date=document.getElementById("appDate").value;
	 
	$('#nightTime').empty();
	$('#eveningTime').empty();
	$('#afternoonTime').empty();
	$('#morningTime').empty();
	
	//let today = new Date().toISOString().slice(0, 10)

	
	 
	let today = new Date();
var dd = today.getDate();

var mm = today.getMonth()+1; 
var yyyy = today.getFullYear();
if(dd<10) 
{
    dd='0'+dd;
} 

if(mm<10) 
{
    mm='0'+mm;
} 
today = dd+'-'+mm+'-'+yyyy;
console.log(today)
	 
	 $
		.getJSON(
				'${getClinicAvailabledTimeForAppointment}',
				{
					doctorId : doctorId,
					hospitalId : hospitalId,
					scheduleType : scheduleType,
					date : date,
					ajax : 'true'
				},
				function(data) {
					
					 
					$.each(
							data,
								function(key, timeList) {
								
								//console.log(timeList.timeId)
								console.log("String "+timeList.string1)
								console.log("Int "+timeList.int1)
								var d = new Date();
								  var n = d.getHours();
								 
									  if(today==date)
										 {
										 
										  n=n+n+2;
										  if(n<timeList.timeId){			
								
								
								if(timeList.timeId<25){
									var strVar="";
									if(parseInt(timeList.string1)>timeList.int1)
									strVar += "<li id=\"abc\" onclick='bookAppointment("+timeList.timeId+","+doctorId+","+hospitalId+",\""+date+"\",\""+timeList.time+"\")'>"+timeList.time+"<\/li>";
									else
										strVar += "<li class=\"disable-appo\" disabled id=\"abc\">"+timeList.time+"<\/li>";
									$('#morningTime').append($(strVar));
									}
									else if(timeList.timeId<35)
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
										 }
										 }
									  else{									  
								if(timeList.timeId<25){
								var strVar="";
								if(parseInt(timeList.string1)>timeList.int1)
								strVar += "<li id=\"abc\" onclick='bookAppointment("+timeList.timeId+","+doctorId+","+hospitalId+",\""+date+"\",\""+timeList.time+"\")'>"+timeList.time+"<\/li>";
								else
									strVar += "<li class=\"disable-appo\" disabled id=\"abc\">"+timeList.time+"<\/li>";
								$('#morningTime').append($(strVar));
								}
								else if(timeList.timeId<35)
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
								
									  
							}
							})
				});
	 
	}
	
	/* function bookAppointment(timeId,doctorId,hospitalId,date,time) {
		  
		  if(confirm("Are you sure book appointment on Date : "+date+" at time : "+time))
			{
		 
			  var patientId=document.getElementById("appPatientId").value;
			  var appointmentType=document.getElementById("consultType").value;
			  
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
	} */
	function getReview(doctorId) {
		
		  $
			.getJSON(
					
					'${getRatingDetailsByDoctorId}',
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
					})
		
	}
	</script>
	
	
	
	
      <script type="text/javascript">
  
function bookAppointmentt(timeId,doctorId,hospitalId,date,time) {
		  
	  var message_alert = $('<p>Are you sure book appointment on Date : '+date+' at time : '+time+' </p>').dialog({
          buttons: {
              "Yes": function() {
            	  
            	  var patientId=document.getElementById("appPatientId").value;
    			  var appointmentType=document.getElementById("consultType").value;
    			  
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
    							   			
    							  var message_alert1 = $('<p>'+data.message+'</p>').dialog({
    				                    buttons: {
    				                        "Yes": function() {
    				                        	window.open('${pageContext.request.contextPath}/showViewAppointmentToPatient?viewPatientId='+patientId+'&fromDate='+date+'&toDate='+date+'&viewAppType=0','_self');
    				                        	},
    				                       
    				                    }
    				                 });
    							
       							
    							
    						})
              
              
              
              },
             
              "Cancel":  function() {
                 
                  message_alert.dialog('close');
              }
          }
       });
	
	}
 
      
function bookAppointment(timeId,doctorId,hospitalId,date,time) {
	  
	
	alertify.confirm("Are you sure book appointment on Date : "+date+" at time :"+time, function (e) {
	    if (e) {
	    	document.getElementById("overlay").style.display = "block";
          	  var patientId=document.getElementById("appPatientId").value;
  			  var appointmentType=document.getElementById("consultType").value;
  			  
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
  							document.getElementById("overlay").style.display = "none";
  							alertify.confirm(data.message, function (e) {
  								if (e) {
  							          								
  				                    	window.open('${pageContext.request.contextPath}/showViewAppointmentToPatient?viewPatientId='+patientId+'&fromDate='+date+'&toDate='+date+'&viewAppType=0','_self');
  								}} ); 				                       
  				                       });
  							
	    }					
  						
	else {
        alertify.alert("File is safe!");
    }
	});
}

</script>
 <script>
function JSalert(){
// A confirm dialog
alertify.confirm("Are you sure, you want to delete this file?", function (e) {
    if (e) {
        alertify.alert("File is Removed!");
    } else {
        alertify.alert("File is safe!");
    }
});
}
</script> 
 
</body>
</html>