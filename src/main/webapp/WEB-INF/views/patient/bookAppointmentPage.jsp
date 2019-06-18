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
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />  
<style>
.starChecked {
	color: orange;
}

li.selected {
	color: green;
}
</style>


<style>
p {
	display: block;
	font-size: 1.35em;
	line-height: 1.5em;
	margin-bottom: 22px;
}

a {
	color: #5a9352;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.center {
	display: block;
	text-align: center;
}

/** page structure **/
#w {
	display: block;
	width: 750px;
	margin: 0 auto;
	padding-top: 30px;
}

#content {
	display: block;
	width: 100%;
	background: #fff;
	padding: 25px 20px;
	padding-bottom: 35px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
}

#searchfield {
	display: block;
	width: 100%;
	text-align: center;
	margin-bottom: 35px;
}

#searchfield form {
	display: inline-block;
	background: #eeefed;
	padding: 0;
	margin: 0;
	padding: 5px;
	border-radius: 3px;
	margin: 5px 0 0 0;
}

#searchfield form .biginput {
	width: 600px;
	height: 40px;
	padding: 0 10px 0 10px;
	background-color: #fff;
	border: 1px solid #c8c8c8;
	border-radius: 3px;
	color: #aeaeae;
	font-weight: normal;
	font-size: 1.5em;
	-webkit-transition: all 0.2s linear;
	-moz-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

#searchfield form .biginput:focus {
	color: #858585;
}

.flatbtn {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	display: inline-block;
	outline: 0;
	border: 0;
	color: #f3faef;
	text-decoration: none;
	background-color: #6bb642;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	font-size: 1.2em;
	font-weight: bold;
	padding: 12px 22px 12px 22px;
	line-height: normal;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	text-transform: uppercase;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
	-moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
	box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}

.flatbtn:hover {
	color: #fff;
	background-color: #73c437;
}

.flatbtn:active {
	-webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
	box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
}

/* .autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto;}
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; border-bottom: 1px dashed #999; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }  */
</style>


</head>
<body onload="getCityList()">
	<jsp:include page="../include/patientHeader.jsp" />

	<c:url var="getStateByCountryId" value="/getStateByCountryId" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
	<c:url var="getOnloadCityByStateId" value="/getOnloadCityByStateId" />

	<c:url var="getDoctorsAndLabsForRating"
		value="/getDoctorsAndLabsForRating" />
	<c:url var="getDoctorsByPatientId" value="/getDoctorsByPatientId" />
	<c:url var="getRadiologistLabTests" value="/getRadiologistLabTests" />

	<c:url var="getAlldigLabTests" value="/getAlldigLabTests" />


	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>Take Appointment</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<p>
						<!-- app-dispN -->
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1" class="activestate">Doctor Appointment</a> <a
									data-toggle="collapse" data-parent="#accordion"
									href="#collapse2" onclick="getDoctorBypatientid()">Lab
									Appointment</a> <a data-toggle="collapse" data-parent="#accordion"
									href="#collapse3">View Appointment</a>
								<div id="collapse1" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="find_appoint pAppt">
											<h3>Doctor Appointment</h3>
											<form
												action="${pageContext.request.contextPath}/showBookDoctorAppointment"
												method="GET" id="doctorAppointment">
												<select class="slct_lst" id="appPatientId"
													name="appPatientId">
													<%--    <c:choose>
  			<c:when test="${memberLength>1}">	
        
      		    <option value="">select member</option> --%>
													<c:forEach items="${patientDetailList}"
														var="patientDetailList" varStatus="count">
														<option value="${patientDetailList.patientId}"><c:out
																value="${patientDetailList.fName}" /></option>
													</c:forEach>

													<%--     </c:when>
        <c:otherwise> --%>

													<%-- 	<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach> --%>
													<%--    
        </c:otherwise>
        </c:choose>	 --%>
												</select> <select class="slct_lst" id="specId" name="specId">
													<option value="">select specialist</option>
													<c:forEach items="${specializationList}"
														var="specializationList" varStatus="count">
														<option value="${specializationList.specializationId}"><c:out
																value="${specializationList.specializationType}" /></option>
													</c:forEach>
												</select> <label>Select Date</label> <input type="text" id="appDate"
													name="appDate" class="datepicker" readonly>
												<div class="cosult">
													<label class="radio-inline"> <input type="radio"
														class="consult-radio" name="consultType" id="" value="0"
														checked> Consult
													</label> <label class="radio-inline"> <input type="radio"
														class="consult-radio" name="consultType" id="" value="1">
														E-Consult
													</label>
												</div>

												<input type="text" autocomplete="no-fill" name="currency" id="autocomplete"
													size="16" placeholder="Enter City..." >
												<p id="outputcontent"></p>
												<input type="hidden" id="doctorCity" name="doctorCity">
												<div class="panel-group" id="accordion1">
													<div class="panel panel-default">
														<a data-toggle="collapse" data-parent="#accordion1"
															href="#collapse4">other cities</a>
														<div id="collapse4" class="panel-collapse collapse">
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
															</select> <select data-placeholder="Choose a State..."
																class="chosen-select form-control" id="stateId"
																name="stateId" tabindex="2">
																<option value="" selected="selected" disabled="disabled"><c:out
																		value="Select State" /></option>

															</select> <select data-placeholder="Choose a City..."
																class="chosen-select form-control" id="CityId"
																name="CityId" tabindex="2" onchange="setCityDoc()">
																<option value="" selected="selected" disabled="disabled"><c:out
																		value="Select City" /></option>

															</select>

														</div>
													</div>
												</div>

												<!-- <select class="slct_lst" id="consultType" name="consultType">
        	   	<option value="">--consulting type--</option>
      			<option value="0">Consult</option>
      			<option value="1">E-Consult</option>
      			
      		</select> -->
												<input type="button" placeholder="Submit" class="subt_appt"
													onclick="doctorAppointmentValidation()" value="submit">
											</form>
										</div>

									</div>
								</div>

								<!-- lab appointment -->
								<div id="collapse2" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="find_appoint pAppt">
											<h3>Lab Appointment</h3>
											<form action="getLabByCityAndTest" method="GET"
												id="labAppointment">
												
												<div class="cosult">
													<label class="radio-inline"> <input type="radio"
														class="consult-radio" name="labType" id="" value="0"
														checked onclick="getAllLabTest()"> Lab
													</label> <label class="radio-inline"> <input type="radio"
														class="consult-radio" name="labType" id="" value="1" onclick="getRadiologistTests()">
														Radiologist
													</label>
												</div>
												
												<select class="slct_lst" id="labAppPatientId"
													name="labAppPatientId" onchange="getDoctorBypatientid()">
													<%-- <c:choose>
  			<c:when test="${memberLength>1}">	
        
      		    <option value="">select member</option> --%>
													<c:forEach items="${patientDetailList}"
														var="patientDetailList" varStatus="count">
														<option value="${patientDetailList.patientId}"><c:out
																value="${patientDetailList.fName}" /></option>
													</c:forEach>

													<%--    </c:when>
        <c:otherwise>
       
      		         			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
       
        </c:otherwise>
        </c:choose>	 --%>
												</select>    


 							<select class="multiSelect" multiple="multiple" id="testId" name="testId">
         
       												<c:forEach items="${labTestsList}" var="labTestsList"
														varStatus="count">
														<option value="${labTestsList.labTestId}"><c:out
																value="${labTestsList.labTestName}" /></option>
													</c:forEach>
    						</select>
    						  <select id="radTestId" name="radioTestId" style="display:none"> 
    						</select>  
    						
												 
												<%-- <select class="slct_lst" id="testId" name="testId"
													multiple="multiple">
													<option value="">select Test</option>
													<c:forEach items="${labTestsList}" var="labTestsList"
														varStatus="count">
														<option value="${labTestsList.labTestId}"><c:out
																value="${labTestsList.labTestName}" /></option>
													</c:forEach>
												</select> --%> 
												 <select class="slct_lst" id="doctor_for_report" name="doctor_for_report">
													<option value="0" selected="selected">Select Doctor For Share Report (optional)</option>

												</select> <label>Select Date</label> <input type="text"
													class="datepicker" readonly name="labAppDate"> <input
													type="text" name="autocomplete1" id="autocomplete1"
													size="16" placeholder="Enter City..." autocomplete="no-fill">
												<p id="outputcontent1"></p>


												<input type="hidden" id="labCity" name="labCity">
												<div class="panel-group" id="accordion1">
													<div class="panel panel-default">
														<a data-toggle="collapse" data-parent="#accordion1"
															href="#collapse5">other cities</a>
														<div id="collapse5" class="panel-collapse collapse">
															<select data-placeholder="Choose a Country..."
																class="chosen-select form-control" id="labCountryId"
																name="labCountryId" tabindex="2">
																<option value="" selected="selected" disabled="disabled"><c:out
																		value="Select County" /></option>

																<c:forEach items="${countryList}" var="countryList"
																	varStatus="count">
																	<option value="${countryList.countryId}"><c:out
																			value="${countryList.countryName}" /></option>
																</c:forEach>
															</select> <select data-placeholder="Choose a State..."
																class="chosen-select form-control" id="labStateId"
																name="labStateId" tabindex="2">
																<option value="" selected="selected" disabled="disabled"><c:out
																		value="Select State" /></option>


															</select> <select data-placeholder="Choose a City..."
																class="chosen-select form-control" id="labCityId"
																name="labCityId" tabindex="2" onchange="setCityLab()">
																<option value="" selected="selected" disabled="disabled"><c:out
																		value="Select City" /></option>

															</select>
														</div>
													</div>
												</div>

												<input type="button" value="submit" placeholder="Submit"
													class="subt_appt" onclick="labAppointmentValidation()">
											</form>

										</div>
									</div>
								</div>



								<!-- view appointments -->
								<div id="collapse3" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="find_appoint  pAppt">
											<h3>View Appointment</h3>
											<form action="showViewAppointmentToPatient" method="GET"
												id="viewAppointment">
												<select class="slct_lst" id="viewPatientId"
													name="viewPatientId" required>
													<%-- <c:choose>
  			<c:when test="${memberLength>1}">	
        
      		    <option value="">select member</option> --%>
													<c:forEach items="${patientDetailList}"
														var="patientDetailList" varStatus="count">
														<option value="${patientDetailList.patientId}"><c:out
																value="${patientDetailList.fName}" /></option>
													</c:forEach>

													<%--   </c:when>
        <c:otherwise>
       
      		         			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
       
        </c:otherwise>
        </c:choose>	 --%>
												</select> <label>From Date</label> <input type="text" name="fromDate"
													readonly class="datepicker2" id="fromDate" size="16"
													required> <label>To Date</label> <input type="text"
													name="toDate" readonly class="datepicker2" id="toDate"
													size="16" required>

												<div class="cosult">
													<h6>select appointment type</h6>
													<label class="radio-inline"> <input type="radio"
														class="consult-radio" name="viewAppType" id="" value="0"
														required checked> Doctor
													</label> <label class="radio-inline"> <input type="radio"
														class="consult-radio" name="viewAppType" id="" value="1">
														Lab
													</label>
												</div>

												<input type="submit" value="submit" placeholder="Submit"
													class="subt_appt">
											</form>
										</div>


									</div>
								</div>
							</div>
						</div>

						<!-- Mobile -->
						<%-- <div class="app-disp">
							<div class="tab-drop">

								<select id="select-box">
									<option value="A">Doctor Appointment</option>
									<option value="B">Lab Appointment</option>
									<option value="C">View Appointment</option>

								</select>
							</div>
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div id="collapseA" class="panel-collapse1 collapse in">
										<div class="panel-body">
											<div class="find_appoint">
												<h3>Fill the Details</h3>
												<form action="showBookDoctorAppointment" method="GET"
													id="mobDocAppointment">
													<select class="slct_lst" id="mobappPatientId"
														name="appPatientId">
														<option value="">select member</option>
														<c:forEach items="${patientDetailList}"
															var="patientDetailList" varStatus="count">
															<option value="${patientDetailList.patientId}"><c:out
																	value="${patientDetailList.fName}" /></option>
														</c:forEach>
													</select> <select class="slct_lst" id="mobspecId" name="specId">
														<option value="">select specialist</option>
														<c:forEach items="${specializationList}"
															var="specializationList" varStatus="count">
															<option value="${specializationList.specializationId}"><c:out
																	value="${specializationList.specializationType}" /></option>
														</c:forEach>
													</select> <label>Select Date</label> <input type="text"
														id="appDateMob" name="appDate" class="datepicker" readonly>

													<div class="cosult">
														<label class="radio-inline"> <input type="radio"
															class="consult-radio" name="consultType" id="" value="0">
															Consult
														</label> <label class="radio-inline"> <input type="radio"
															class="consult-radio" name="consultType" id="" value="1">
															E-Consult
														</label>
													</div>

													<input type="text" name="currency" id="autocomplete2"
														size="16" placeholder="Enter City..." autocomplete="no-fill">
													<p id="outputcontent2"></p>
													<input type="hidden" id="doctorCity1" name="doctorCity">
													<div class="panel-group" id="accordion1">
														<div class="panel panel-default">
															<a data-toggle="collapse" data-parent="#accordion1"
																href="#collapseE">other cities</a>
															<div id="collapseE" class="panel-collapse collapse">
																<select data-placeholder="Choose a Country..."
																	class="chosen-select form-control" id="countryIdMOb"
																	name="countryId" tabindex="2">
																	<option value="" selected="selected"
																		disabled="disabled"><c:out
																			value="Select County" /></option>

																	<c:forEach items="${countryList}" var="countryList"
																		varStatus="count">
																		<option value="${countryList.countryId}"><c:out
																				value="${countryList.countryName}" /></option>
																	</c:forEach>
																</select> <select data-placeholder="Choose a State..."
																	class="chosen-select form-control" id="stateIdMob"
																	name="stateId" tabindex="2">
																	<option value="" selected="selected"
																		disabled="disabled"><c:out
																			value="Select State" /></option>

																</select> <select data-placeholder="Choose a City..."
																	class="chosen-select form-control" id="CityIdMob"
																	name="CityId" tabindex="2" onchange="setCityDocMob()">
																	<option value="" selected="selected"
																		disabled="disabled"><c:out
																			value="Select City" /></option>

																</select>

															</div>
														</div>
										 			</div>


													<input type="button" placeholder="Submit" value="submit"
														class="subt_appt" onclick="mobDocAppointmentValidation()">
												</form>
											</div>
 
										</div>
									</div>

									<!-- lab appointment -->
									<div id="collapseB" class="panel-collapse1 collapse">
										<div class="panel-body">
											<div class="find_appoint">
												<h3>Fill the Details</h3>
												<form action="getLabByCityAndTest" method="GET">
													<select class="slct_lst" id="labAppPatientIdMOb"
														name="labAppPatientId">
														<option>select member</option>
														<c:forEach items="${patientDetailList}"
															var="patientDetailList" varStatus="count">
															<option value="${patientDetailList.patientId}"><c:out
																	value="${patientDetailList.fName}" /></option>
														</c:forEach>
													</select> <input type="text" name="autocomplete3" id="autocomplete3"
														size="16" placeholder="Enter City..." autocomplete="no-fill">
													<p id="outputcontent3"></p>

													<input type="hidden" id="labCityMob" name="labCity">
													<div class="panel-group" id="accordion1">
														<div class="panel panel-default">
															<a data-toggle="collapse" data-parent="#accordion1"
																href="#collapseF">other cities</a>
															<div id="collapseF" class="panel-collapse collapse">
																<select data-placeholder="Choose a Country..."
																	class="chosen-select form-control" id="labCountryIdMOb"
																	name="labCountryId" tabindex="2">
																	<option value="" selected="selected"
																		disabled="disabled"><c:out
																			value="Select County" /></option>

																	<c:forEach items="${countryList}" var="countryList"
																		varStatus="count">
																		<option value="${countryList.countryId}"><c:out
																				value="${countryList.countryName}" /></option>
																	</c:forEach>
																</select> <select data-placeholder="Choose a State..."
																	class="chosen-select form-control" id="labStateIdMob"
																	name="labStateId" tabindex="2">
																	<option value="" selected="selected"
																		disabled="disabled"><c:out
																			value="Select State" /></option>


																</select> <select data-placeholder="Choose a City..."
																	class="chosen-select form-control" id="labCityIdMob"
																	name="labCityId" tabindex="2"
																	onchange="setCityLabMob()">
																	<option value="" selected="selected"
																		disabled="disabled"><c:out
																			value="Select City" /></option>

																</select>
															</div>
														</div>
													</div>
													<select class="slct_lst" id="testId" name="testId"
														multiple="multiple">
														<option>select Test</option>
														<c:forEach items="${labTestsList}" var="labTestsList"
															varStatus="count">
															<option value="${labTestsList.labTestId}"><c:out
																	value="${labTestsList.labTestName}" /></option>
														</c:forEach>
													</select> <label>Select Date</label> <input type="text"
														class="datepicker" readonly name="labAppDate"> <input
														type="submit" name="submit" placeholder="Submit"
														class="subt_appt">
												</form>

											</div>
										</div>
									</div>



									<!-- view appointments -->
									<div id="collapseC" class="panel-collapse1 collapse">
										<div class="panel-body">
											<div class="find_appoint">
												<h3>Fill the Details</h3>
												<form action="showViewAppointmentToPatient" method="GET">
													<select class="slct_lst" id="viewPatientId"
														name="viewPatientId" required>
														<option value="">select member</option>
														<c:forEach items="${patientDetailList}"
															var="patientDetailList" varStatus="count">
															<option value="${patientDetailList.patientId}"><c:out
																	value="${patientDetailList.fName}" /></option>
														</c:forEach>
													</select> <label>From Date</label> <input type="text"
														name="fromDate" readonly class="datepicker2" id="fromDate"
														size="16" required> <label>To Date</label> <input
														type="text" name="toDate" readonly class="datepicker2"
														id="toDate" size="16" required> <select
														class="slct_lst" id="viewAppType" name="viewAppType"
														required>
														<option value="">--select appointment type--</option>
														<option value="0">Doctor</option>
														<option value="1">Lab</option>

													</select> <input type="submit" value="submit" placeholder="Submit"
														class="subt_appt">
												</form>
											</div>


										</div>
									</div>
								</div>
							</div>
						</div> --%>
					</div>
					<div class="page-alerts collapse" id="alert-1"
						style="display: none"></div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
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
		src='${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>


	<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>  -->

	<%--<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script> --%>



	<!-- <script type="text/javascript" src="http://autocompletejs.com/releases/0.3.0/autocomplete-0.3.0.min.js"></script> -->

	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>

 	<script
		src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  
			<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
			<script
		src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>
		<script>
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
</script>
<script>
		$(function() {
			$('.panel-default a').click(
					function() {
						if ($(this).hasClass('activestate')) {
							$(this).removeClass('activestate');
						} else {
							$('.panel-default a').removeClass(
									'activestate');
							$(this).addClass('activestate');
						}
					});
		});
	</script>

	<script>
		$(function() {
			var codes = $('.highlight code');
			codes.each(function(ind, el) {
				hljs.highlightBlock(el);
			});

			$('.lobipanel').lobiPanel();
			$('#demoPanel11').lobiPanel();
			$('#lobipanel-basic').on('beforeUnpin.lobiPanel', function() {
				console.log("beforeClose");
			}).on('onClose.lobiPanel', function() {
				console.log("onClose");
			}).on('onTitleChange.lobiPanel', function() {
				console.log(this, arguments);

			}).lobiPanel();
			$('#lobipanel-custom-control').lobiPanel({
				reload : false,
				close : false,
				editTitle : false
			});
			$('#lobipanel-stateful').lobiPanel({
				stateful : true
			});
			$('#lobipanel-font-awesome').lobiPanel({
				reload : {
					icon : 'fa fa-refresh'
				},
				editTitle : {
					icon : 'fa fa-edit',
					icon2 : 'fa fa-save'
				},
				unpin : {
					icon : 'fa fa-arrows'
				},
				minimize : {
					icon : 'fa fa-chevron-up',
					icon2 : 'fa fa-chevron-down'
				},
				close : {
					icon : 'fa fa-times-circle'
				},
				expand : {
					icon : 'fa fa-expand',
					icon2 : 'fa fa-compress'
				}
			});
			$('#lobipanel-constrain-size').lobiPanel({
				minWidth : 300,
				minHeight : 300,
				maxWidth : 600,
				maxHeight : 480
			});
			$('#lobipanel-from-url').on(
					'loaded.lobiPanel',
					function(ev, lobiPanel) {
						var $body = lobiPanel.$el.find('.panel-body');
						$body.html('<div class="highlight"><pre><code>'
								+ $body.html() + '</code></pre></div>');
						hljs.highlightBlock($body.find('code')[0]);
					}).lobiPanel({
				loadUrl : 'bootstrap/dist/css/bootstrap.min.css',
				bodyHeight : 400
			});
			$('#lobipanel-multiple').find('.panel').lobiPanel({
				sortable : true,
				beforeTitleChange : function(lobiPanel, title) {
					console.log("beforeTitleChange", arguments);
					if (!title) {
						return false;
					}
				}
			});
		});
	</script>
	

	<script type="text/javascript">
		jQuery(document).ready(function() {
			var owl = jQuery('.owl-carousel');
			owl.owlCarousel({
				items : 1,
				loop : true,
				margin : 10,
				autoplay : true,
				autoplayTimeout : 1000,
				autoplayHoverPause : false
			});
			jQuery('.play').on('click', function() {
				owl.trigger('play.owl.autoplay', [ 2000 ])
			})
			jQuery('.stop').on('click', function() {
				owl.trigger('stop.owl.autoplay')
			})
		})
	</script>

	<!-- suggesting cities -->

	<script type="text/javascript">
		var currencies = [];

		function getCityList() {

			$.getJSON('${getOnloadCityByStateId}', {

				ajax : 'true'
			}, function(data) {

				$.each(data, function(key, cityList) {

					currencies.push({
						value : cityList.cityName,
						data : cityList.cityId
					});

				});

			});
		}

		$(function() {

			$('#autocomplete')
					.autocomplete(
							{

								lookup : currencies,

								onSelect : function(suggestion) {

									/* var thehtml = '<strong>Currency Name:</strong> '
											+ suggestion.value
											+ ' <br> <strong>Symbol:</strong> '
											+ suggestion.data; */

									document.getElementById("doctorCity").value = suggestion.data;

									/* $('#outputcontent').html(thehtml); */
								}

							});

		});

		$(function() {

			// setup autocomplete function pulling from currencies[] array
			$('#autocomplete1')
					.autocomplete(
							{

								//  source: currencies,
								lookup : currencies,
								onSelect : function(suggestion) {

								/* 	var thehtml = '<strong>Currency Name:</strong> '
											+ suggestion.value
											+ ' <br> <strong>Symbol:</strong> '
											+ suggestion.data; */
									document.getElementById("labCity").value = suggestion.data;

									/* $('#outputcontent1').html(thehtml); */
								}
							});

		});

		/* mobile */

		$(function() {

			// setup autocomplete function pulling from currencies[] array
			$('#autocomplete2')
					.autocomplete(
							{

								//  source: currencies,
								lookup : currencies,
								onSelect : function(suggestion) {

									/* var thehtml = '<strong>Currency Name:</strong> '
											+ suggestion.value
											+ ' <br> <strong>Symbol:</strong> '
											+ suggestion.data; */
									document.getElementById("doctorCity1").value = suggestion.data;

									/* $('#outputcontent2').html(thehtml); */
								}
							});

		});

		$(function() {

			// setup autocomplete function pulling from currencies[] array
			$('#autocomplete3')
					.autocomplete(
							{

								//  source: currencies,
								lookup : currencies,
								onSelect : function(suggestion) {

									/* var thehtml = '<strong>Currency Name:</strong> '
											+ suggestion.value
											+ ' <br> <strong>Symbol:</strong> '
											+ suggestion.data; */
									document.getElementById("labCityMob").value = suggestion.data;

									/* $('#outputcontent3').html(thehtml); */
								}
							});

		});
	</script>

	<script>
		$(document)
				.ready(
						function() {
							$('#countryId')
									.change(
											function() {

												$
														.getJSON(
																'${getStateByCountryId}',
																{
																	countryId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose State...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		html += '<option value="' + data[i].stateId + '">'
																				+ data[i].stateName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#stateId')
																			.html(
																					html);
																	$(
																			"#stateId")
																			.trigger(
																					"chosen:updated");

																});

											});
						});
		$(document)
				.ready(
						function() {
							$('#stateId')
									.change(
											function() {

												$
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		//alert(data[i].cityName);
																		html += '<option value="' + data[i].cityId + '">'
																				+ data[i].cityName
																				+ '</option>';
																	}
																	html += '</option>';
																	$('#CityId')
																			.html(
																					html);
																	$("#CityId")
																			.trigger(
																					"chosen:updated");

																});

											});
						});

		function setCityDoc() {
			var city = document.getElementById("CityId").value;
			document.getElementById("doctorCity").value = city;

			var cityName = $("#CityId option:selected").text();
			document.getElementById("autocomplete").value = cityName;

		}

		$(document)
				.ready(
						function() {
							$('#labCountryId')
									.change(
											function() {

												$
														.getJSON(
																'${getStateByCountryId}',
																{
																	countryId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose State...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		html += '<option value="' + data[i].stateId + '">'
																				+ data[i].stateName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#labStateId')
																			.html(
																					html);
																	$(
																			"#labStateId")
																			.trigger(
																					"chosen:updated");

																});

											});
						});
		$(document)
				.ready(
						function() {
							$('#labStateId')
									.change(
											function() {

												$
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		//alert(data[i].cityName);
																		html += '<option value="' + data[i].cityId + '">'
																				+ data[i].cityName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#labCityId')
																			.html(
																					html);
																	$(
																			"#labCityId")
																			.trigger(
																					"chosen:updated");

																});

											});
						});

		function setCityLab() {
			var city = document.getElementById("labCityId").value;
			document.getElementById("labCity").value = city;

			var cityName = $("#labCityId option:selected").text();
			document.getElementById("autocomplete1").value = cityName;

		}

		/* Mobile */

		$(document)
				.ready(
						function() {
							$('#countryIdMOb')
									.change(
											function() {

												$
														.getJSON(
																'${getStateByCountryId}',
																{
																	countryId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose State...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		html += '<option value="' + data[i].stateId + '">'
																				+ data[i].stateName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#stateIdMob')
																			.html(
																					html);
																	$(
																			'#stateIdMob')
																			.trigger(
																					"chosen:updated");

																});

											});
						});
		$(document)
				.ready(
						function() {
							$('#stateIdMob')
									.change(
											function() {

												$
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		//alert(data[i].cityName);
																		html += '<option value="' + data[i].cityId + '">'
																				+ data[i].cityName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#CityIdMob')
																			.html(
																					html);
																	$(
																			"#CityIdMob")
																			.trigger(
																					"chosen:updated");

																});

											});
						});

		function setCityDocMob() {
			var city = document.getElementById("CityIdMob").value;
			document.getElementById("doctorCity1").value = city;

			var cityName = $("#CityIdMob option:selected").text();
			document.getElementById("autocomplete2").value = cityName;

		}

		$(document)
				.ready(
						function() {
							$('#labCountryIdMob')
									.change(
											function() {

												$
														.getJSON(
																'${getStateByCountryId}',
																{
																	countryId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose State...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		html += '<option value="' + data[i].stateId + '">'
																				+ data[i].stateName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#labStateIdMob')
																			.html(
																					html);
																	$(
																			"#labStateIdMob")
																			.trigger(
																					"chosen:updated");

																});

											});
						});
		$(document)
				.ready(
						function() {
							$('#labStateIdMob')
									.change(
											function() {

												$
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';

																	var len = data.length;
																	for (var i = 0; i < len; i++) {
																		//alert(data[i].cityName);
																		html += '<option value="' + data[i].cityId + '">'
																				+ data[i].cityName
																				+ '</option>';
																	}
																	html += '</option>';
																	$(
																			'#labCityIdMob')
																			.html(
																					html);
																	$(
																			"#labCityIdMob")
																			.trigger(
																					"chosen:updated");

																});

											});
						});

		function setCityLabMOb() {
			var city = document.getElementById("labCityIdMob").value;
			document.getElementById("labCityMob").value = city;

			var cityName = $("#labCityIdMob option:selected").text();
			document.getElementById("autocomplete3").value = cityName;

		}
	</script>
	<script type="text/javascript"></script>
	<script type="text/javascript">
		$(".datepicker").datepicker({
			format : "dd-mm-yyyy",
			startDate : new Date(),
			autoclose : true
		}).datepicker("setDate", new Date);
		$(".datepicker1").datepicker({
			format : "dd-mm-yyyy",
			autoclose : true,
			startDate : new Date(),
		}).datepicker("setDate", new Date);

		$(".datepicker2").datepicker({
			format : "dd-mm-yyyy",
			autoclose : true,
		}).datepicker("setDate", new Date);
		;

		$('.panel-collapse1').hide();
		//show the first tab content
		$('#collapseA').show();

		$('#select-box').change(function() {
			dropdown = $('#select-box').val();
			//first hide all tabs again when a new option is selected
			$('.panel-collapse1').hide();
			//then show the tab content of whatever option value was selected
			$('#' + "collapse" + dropdown).addClass('in');
			$('#' + "collapse" + dropdown).show();
		});

		$(document).on('click', function(e) {
			if ($('.footer-850 .panel-collapse ').hasClass('in')) {
				$('.footer-850 .collapse').collapse('hide');
			}
		})
	</script>

	<script>
		function doctorAppointmentValidation() {

			var appPatientId = document.getElementById("appPatientId").value;
			var doctorCity = document.getElementById("doctorCity").value;
			var specId = document.getElementById("specId").value;
			var appDate = document.getElementById("appDate").value;

			if ($("input[name='consultType']:checked").length <= 0
					|| appPatientId == "" || doctorCity == "" || specId == ""
					|| appDate == "") {
				alert(" please fill all details");

			} else {
				$("#doctorAppointment").submit();
				/*  document.getElementById("doctorAppointment").submit(); */
			}

		}
		/* function labAppointmentValidation() {
			var labAppPatientId = document.getElementById("labAppPatientId").value;
			var labCity = document.getElementById("labCity").value;
			var testId = document.getElementById("testId").value;
			var radTestId = document.getElementById("radTestId").value;
		
			if (labAppPatientId == "" || labCity == "") {
			
				alert(" please fill all details");

			} else {
				$("#labAppointment").submit();

			}

		} */

		/* mobile validation */

		function mobDocAppointmentValidation() {

			var appPatientId = document.getElementById("mobappPatientId").value;
			var doctorCity = document.getElementById("doctorCity1").value;
			var specId = document.getElementById("mobspecId").value;
			var appDate = document.getElementById("appDateMob").value;

			if ($("input[name='consultType']:checked").length <= 0
					|| appPatientId == "" || doctorCity == "" || specId == ""
					|| appDate == "") {
				alert(" please fill all details");

			} else {
				$("#mobDocAppointment").submit();
				/*  document.getElementById("doctorAppointment").submit(); */
			}

		}
		function labAppointmentValidation() {
			var labAppPatientId = document.getElementById("labAppPatientId").value;
			var labCity = document.getElementById("labCity").value;
			var testId = document.getElementById("testId").value;
			var radTestId = document.getElementById("radTestId").value;
			var radioValue = $("input[name='gender']:checked").val();
			
			if (labAppPatientId == "" || labCity == "" || ((radioValue==1 && radTestId == "") || (radioValue==0 && testId == "")))
					{ 
				
				alert(" please fill all details");

			} else {
				$("#labAppointment").submit();

			}

		}

		/* 
		Get Doctor by Patient 
		 */

		function getDoctorBypatientid() {
			var patientId = document.getElementById("labAppPatientId").value;

			$
					.getJSON(
							'${getDoctorsByPatientId}',
							{
								patientId : patientId,
								ajax : 'true'
							},
							function(data) {
								var html = '<option value="0" selected >Select Doctor For Share Report</option>';

								var len = data.length;
								for (var i = 0; i < len; i++) {
									html += '<option value="' + data[i].doctorId + '">'
											+ data[i].fName
											+ ' '
											+ data[i].lName + '</option>';
								}
								html += '</option>';
								$('#doctor_for_report').html(html);
								$("#doctor_for_report").trigger(
										"chosen:updated");

							});

		}
	</script>
	<script type="text/javascript">
	
	
	
	
	function getRadiologistTests(){
		
		$('#testId').parent().hide();
	
		$('#radTestId').show();
		$
		.getJSON(
				'${getRadiologistLabTests}',
				{
					
					ajax : 'true'
				},
				function(data) {
					var html = '<option value="0" selected >Select Tests</option>';

					var len = data.length;
					for (var i = 0; i < len; i++) {
						
						html += '<option value="' + data[i].labTestId + '">'+data[i].labTestName+'</option>';
					}
					html += '</option>';
					$('#radTestId').html(html);
					$("#radTestId").trigger(
							"chosen:updated");

				});
		
		
	}
	
	
	function getAllLabTest(){
		$('#testId').parent().show();
		
		$('#radTestId').hide();
		$
		.getJSON(
				'${getAlldigLabTests}',
				{
					
					ajax : 'true'
				},
				function(data) {
					var html = '<option value="0" selected >Select Tests</option>';

					var len = data.length;
					for (var i = 0; i < len; i++) {
						
						html += '<option value="' + data[i].labTestId + '">'+data[i].labTestName+'</option>';
					}
					html += '</option>';
					$('#testId').html(html);
					$("#testId").trigger(
							"chosen:updated");

				});
	}
	</script>

</body>
</html>