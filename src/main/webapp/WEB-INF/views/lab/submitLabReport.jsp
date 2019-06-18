<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">  
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">	

<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
	
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>


	<c:url var="addMedicineToList" value="/addMedicineToList" />
	<c:url var="savePndtChildrenDetails"
		value="/savePndtChildrenDetails" />
	 <c:url var="savePndtIndicationDetails"
		value="/savePndtIndicationDetails" />

<jsp:include page="../include/labHeader.jsp"/> 
	<div class="clearfix"></div>
	<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center"><h4>Upload Reports</h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
			  <jsp:include page="../include/labLeftMenu.jsp"/> 

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">

						<section id="consult">
						<div class="bs-example">
							<ul class="nav nav-tabs newappon">
								<li class="active"><a data-toggle="tab" href="#sectionA">
										Info</a></li>
								<li id="rep"> <a <%--  target="_blank" href="${pageContext.request.contextPath}/getPatientHistoryDetails/${patientDetails.patientId}" --%> data-toggle="tab"
									href="#sectionB"> Reports</a></li>
								 <c:if test="${sessionScope.labDetails.isRadiologist==1}">
							    	<li><a href="${pageContext.request.contextPath}/showPndtPage">PNDT Details </a></li>
							     </c:if>	
									
									
								<!-- <li id="pay"><a data-toggle="tab" href="#sectionC"
									>Payments</a></li> -->
							<!-- 	<li><a data-toggle="tab" href="#sectionD">Consulting</a></li> -->
								<!--<li><a data-toggle="tab" href="#sectionE">Labs Reports</a></li>-->

							</ul>
							
    							
							<form action="${pageContext.request.contextPath}/submitLabReports" method="post"  id="validation-form" enctype="multipart/form-data">
							<div class="tab-content">
							
							<input type="hidden" name="appoitId" value="${appoitId}">
								<div id="sectionA" class="tab-pane fade in active">
									<div class="row">
										<%-- <div class="col-md-3 col-sm-3">
											<div class="patinet-pic">
												<img
													src="${patientProfile}/${patientDetails.profilePhoto}"
													class="img-responsive" alt="patinet pic">
											</div>
										</div> --%>
										<input type="hidden" value="${patientDetails.patientId}" id="patientId" name="patientId">
										<div class="col-md-9 col-sm-9">
											<b><p>
													Patient Name : <span> ${patientDetails.fName}
														${patientDetails.mName} ${patientDetails.lName}</span>
												</p></b>
											<ul class="patinet-info">
												<li>BirthDate:<span> ${patientDetails.birthDate}</span></li>
												<li>Blood Group: <span>
														${patientDetails.bloodGroup}</span></li>
												<li>Sex: <span> ${patientDetails.gender} </span></li>

											</ul>
											<ul class="patinet-info">
												<li>City: <span> ${patientDetails.string1} </span></li>
												<li>Phone No: <span>${patientDetails.contactNo}
												</span></li>
												<li>Email: ${patientDetails.email}</li>
											</ul>
										</div>
									</div>
								</div>
								 
								 <div id="sectionB" class="tab-pane fade">
								 
								  <c:forEach items="${labTestsList}" var="labTests"
									varStatus="count">
						<div class="filter_div">
		                	<div class="col-sm-6">
		                	 <label>For Test</label>
					      		 
										<input type="text" value="${labTests.labTestName}" disabled="disabled" placeholder="Test Name">
										<input type="hidden" name="testId" id="testId" value="${labTests.labTestId}">
			                </div>
			       			<c:choose>
			       			<c:when test="${sessionScope.labDetails.isRadiologist==1}">
			       			  <div class="col-sm-6">
			                 <div class="box3">
			                 <label>Select file</label>
					<input type="file" name="radiologistFiles" id="reportFile${labTests.labTestId}" required  class="inputfile inputfile-6 chooseDisply" accept="application/pdf, .jpg, .png, .jpeg, .DCM, .dcm"  data-multiple-caption="{count} files selected" placeholder="select file"   multiple/>
					<label for="reportFile${labTests.labTestId}"><span class="upload-rep-page"></span> <strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> Browse file</strong></label>
					<input type="hidden" name="labTestId" id="labTestId" value="${labTests.labTestId}">
				</div>
			                	 
			                </div>
			       		
			       			</c:when><c:otherwise>
			                 <div class="col-sm-6">
			                 <div class="box3">
			                 <label>Select file</label>
					<input type="file" required name="reportFile${labTests.labTestId}" id="reportFile${labTests.labTestId}" required  class="inputfile inputfile-6 chooseDisply" accept="application/pdf, .jpg, .png, .jpeg, .DCM, .dcm"  data-multiple-caption="{count} files selected" placeholder="select file"   />
					<label for="reportFile${labTests.labTestId}"><span class="upload-rep-page"></span> <strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> Browse file</strong></label>
				</div>
			                	 
			                </div>
			                </c:otherwise>
			               </c:choose>
			                  
	                </div>
	               </c:forEach>
	                <div class="clearfix"></div>
	                
	                 
						<div class="lab-submit-btn"><input type="submit" class="history_sbmt btn-fr-all" value="Submit"></div>
						</div>
						
						 <%-- <div id="sectionF" class="tab-pane fade">
										<div class="row">
											<form class="form-horizontal"
												action="${pageContext.request.contextPath}/savePndtPatientDetails"
												method="post">

												<div class="bs-example">
													<div class="panel-group" id="accordion">
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapseOne">Section A : To be filled in
																		for all Diagnostic Procedures/Tests</a>
																</h4>
															</div>
															<div id="collapseOne" class="panel-collapse collapse in">
																<div class="panel-body">
																	<div class="row">
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">3. State</label> 
																			<select
																					class="form-control top-space" name="state"
																					id="stateId">
																			<c:forEach items="${stateList}" var="stateList" varStatus="count">
																				<option>${stateList.stateName}</option>
																			</c:forEach>
																			
																				</select>

																			</div>
																		</div>

																		<input type="hidden"
																			value="${patientDetails.patientId}" name="patientId"
																			id="patientId">
																	
																		<input type="hidden"
																			value="${hospitalId}" name="hospitalId"
																			id="hospitalId">		
																			
																		<input type="hidden"
																			value="${virtual}" name="virtual"
																			id="virtual">	
																	
																			<input type="hidden" name="appointId" id="appointId"
									value="${appoitId}">
																	
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">4.Total Number of
																					Living children </label>
																				<div class="row">
																					<div class="col-md-6 col-sm-6 col-xs-6">
																						<input type="text" class="form-control top-space"
																							id="totalChild" name="numberOfChild"
																							placeholder="" value="${pndtPatientDetails.numberOfChild}" readonly />
																					</div>
																					<div class="col-md-6 col-sm-6 col-xs-6 text-right">
																						<!-- <a data-target="#myModal78" data-toggle="modal" class="btn btn-info top-space">Add Children Details</a> -->
																						<input type="button" value="Add Children Details"
										class="btn btn-info btn-fr-all" data-toggle="modal"
										data-target="#myModal78">
																					</div>
																				</div>

																			</div>
																		</div>
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">(a).Number of Living
																					sons with age of each living son(in years or
																					months) </label> <input type="text" class="form-control"
																					id="maleChild" name="numberOfMaleChild" value="${pndtPatientDetails.numberOfMaleChild}" readonly>
																			</div>
																		</div>
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">(b) Number of living
																					Daughters with age of each living daughter (in
																					years of months): </label> <input type="text"
																					class="form-control" id="femaleChild"
																					name="numberOfFemaleChild" value="${pndtPatientDetails.numberOfFemaleChild}" readonly>
																			</div>
																		</div>
																		<div class="clearfix"></div>
																		<hr>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">5.Husbands /wifes
																					/Fathers /Mothers Name : </label>
																		<c:choose>
																			<c:when test="${pndtPatientDetails.relativeType!=null}">
																			 <select
																					class="form-control" id="relation"
																					name="relativeType">
																					<option value="${pndtPatientDetails.relativeType}" name="relation" disabled selected>${pndtPatientDetails.relativeType}</option>
																					
																				</select>
																			</c:when>	
																			<c:otherwise>	
																			 <select
																					class="form-control" id="relation"
																					name="relativeType">
																					<option value="0" name="relation" disabled>Select
																						Relation</option>
																					<option value="husband">Husband</option>
																					<option value="wife">Wife</option>
																					<option value="father">Father</option>
																					<option value="mother">Mother</option>
																				</select>
																				
																				</c:otherwise>
																				 
																			
																		</c:choose>	
																			<input type="text" class="form-control top-space"
																					name="relativeName"
																					placeholder="Enter Relative Name" value="${pndtPatientDetails.relativeName}">
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">6.Full postal address
																					of the patients with Contact Number, if any : </label> <input
																					type="text" class="form-control " name="address" value="${pndtPatientDetails.address}">
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">7.(a) Referred by (
																					Full Name and address of Doctor(s) /Genetic
																					counselling Centre) : </label> <input type="text"
																					class="form-control" name="refDoctor" value="${pndtPatientDetails.refDoctor}">
																			</div>

																		</div>

																		<div class="clearfix"></div>
																		<hr>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">7.(b) Self- Referral
																					by Gynaecologist/Radiologist/Registered Medical
																					Practitioner conducting the diagnostic procedures:
																				</label> <input type="text" class="form-control"
																					name="selfDoctor" value="${pndtPatientDetails.selfDoctor}">
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">8.Last menstrual
																					period /weeks of pregnancy </label> <input type="text"
																					class="form-control form_datetime top-space-large"
																					id="nameField" value="" name="lastMenstPeriod"
																					placeholder="Last Menstrual Period"  />
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">&nbsp; </label> <input
																					type="text" class="form-control top-space-large"
																					name="weeksOfPregnancy" id="totWeekNDay"
																					placeholder="total Days" value="${pndtPatientDetails.weeksOfPregnancy}"
																					onfocus="calculateWeeksAndDays()"  />
																			</div>

																		</div>

																	</div>

																</div>
															</div>
														</div>
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapseTwo">Section B : To be filled in
																		for performing non-invasive diagnostic Procedures/
																		Tests only) </a>
																</h4>
															</div>
															<div id="collapseTwo" class="panel-collapse collapse">
																<div class="panel-body">
																	<div class="row">
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">9. Name of the doctor
																					performing the procedure</label> 
																				<c:choose>
																				<c:when test="${pndtPatientDetails.nameOfDoctor!=null}">
																				<select
																					class="form-control top-space" name="nameOfDoctor">
																					<option>${pndtPatientDetails.nameOfDoctor}</option>

																				</select>
																				</c:when>	
																				<c:otherwise>
																				<select
																					class="form-control top-space" name="nameOfDoctor">
																					<option>${doctorDetails.fName}
																						${doctorDetails.lName}</option>

																				</select>
																				</c:otherwise>																				
																				</c:choose>
																			</div>
																		</div>
																		<div class="col-md-4 col-sm-4 col-xs-4">

																			<div class="row">
																				<div class="col-md-6 col-sm-6 col-xs-6">
																					<div class="xform-group">
																						<label for="nameField">10. Indications </label> <input
																							type="hidden" name="numberOfIndication"
																							id="numberOfIndication"> <select
																							class="form-control top-space" id="indication"
																							name="indication">
																							<option>To diagnose intra-uterine and/or
																								ectopic pregnancy- and confirm viability</option>
																							<option>Estimation of gestational age
																								(dating)</option>
																							<option>Detection of number of fetuses
																								and their chorionicity</option>
																							<option>Suspected pregnancy with IUCD
																								in-situ or suspected pregnancy following
																								contraceptive failure/MTP</option>

																							<option>Vaginal bleeding/leaking</option>

																							<option>Follow-up of cases of abortion</option>

																							<option>Assessment of cervical canal and
																								diameter of internal os</option>

																							<option>Discrepancy between uterine size
																								and period of amenorrhea</option>

																							<option>Any suspected adenexal or
																								uterine pathology/abnormality</option>

																							<option>Detection of chromosomal
																								abnormalities, fetal structural defects and
																								other abnormalities and their follow-up</option>

																							<option>To evaluate fetal presentation
																								and position.</option>

																							<option>Assessment of liquor amniixiii</option>

																							<option>Preterm labor / preterm
																								premature rupture of membranes</option>

																							<option>Evaluation of placental
																								position, thickness, grading and abnormalities
																								(placenta praevia, retro placental hemorrhage,
																								abnormal adherence etc.)</option>

																							<option>Evaluation of umbilical cord â€“
																								presentation, insertion, nuchal encirclement,
																								number of vessels and presence of true knot</option>

																							<option>Evaluation of previous Caesarean
																								Section scars</option>

																							<option>Evaluation of fetal growth
																								parameters, fetal weight and fetal well being</option>

																							<option>Color flow mapping and duplex
																								Doppler studies</option>

																							<option>Ultrasound guided procedures
																								such as medical termination of pregnancy,
																								external cephalic version etc. and their
																								follow-up</option>

																							<option>Adjunct to diagnostic and
																								therapeutic invasive interventions such as
																								chorionic villus sampling (CVS), amniocenteses,
																								fetal blood sampling, fetal skin biopsy,
																								amnio-infusion, intrauterine -infusion,
																								placement of shunts etc</option>

																							<option>Observation of intra-partum
																								events</option>

																							<option>Medical/surgical conditions
																								complicating pregnancy</option>

																							<option>Research/scientific studies in
																								recognized institutions</option>


																						</select>

																					</div>
																				</div>
																				<div class="col-md-6 col-sm-6 col-xs-6">
																					<br>

																					<button type="button"
																						class="btn btn-info top-space"
																						value="Add Indication" onclick="addIndication()">Add
																						Indication</button>
																				</div>


																			</div>
																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<label for="nameField">11. Procedures Carried
																				Out (Non-Invasive)</label> <label for="nameField">Non
																				Invasive Ultrasound </label> 
																			
																			
																			
																	
																			<select class="form-control"
																				name="nonInvasiveProc" id="nonInvasiveUltra"
																				onchange="enableInput()">
																				<option value="0">Ultrasound</option>
																				<option value="1">Any Other (Specify)</option>
																			</select> 
																		
																			
																			<c:choose>
																			<c:when test="${pndtPatientDetails.nonInvasiveProc!=null}">
																			<input type="text" class="form-control mar-top"
																				name="nonInvasiveProc" id="ultraSpecify"
																				placeholder="Specify" value="${pndtPatientDetails.nonInvasiveProc}" disabled>
																			</c:when>
																				<c:otherwise>
																			<input type="text" class="form-control mar-top"
																				name="nonInvasiveProc" id="ultraSpecify"
																				placeholder="Specify" disabled>
																					</c:otherwise>
																			</c:choose>
																		</div>
																		<div class="clearfix"></div>
																		<hr>


																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">12.Date on which
																					declaration of pregnant woman/ person was obtained
																					:</label> 
																					<c:choose>
																					<c:when test="${pndtPatientDetails.pregWomenObtainDate!=null}">
																					<input type="text"
																					class="form-control form_datetime top-space"
																					name="pregWomenObtainDate" value="${pndtPatientDetails.pregWomenObtainDate}">
																					</c:when>
																					<c:otherwise>
																					<input type="text"
																					class="form-control form_datetime top-space"
																					name="pregWomenObtainDate">
																					</c:otherwise>
																					</c:choose>
																			</div>
																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">13.Date on which
																					procedures carried out :</label>
																					
																					<c:choose>
																			<c:when test="${pndtPatientDetails.dateProcCarOut!=null}">
																			
																			 <input type="text"
																					class="form-control form_datetime top-space-large"
																					name="dateProcCarOut" value="${pndtPatientDetails.dateProcCarOut}">
																			</c:when>
																			<c:otherwise>
																					 <input type="text"
																					class="form-control form_datetime top-space-large"
																					name="dateProcCarOut">
																			</c:otherwise>
																			</c:choose>
																			</div>
																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">14.Result of the
																					non-invasive procedure carried out :</label> 
																					
																				<input type="text" class="form-control top-space-large"
																					name="resOfNonInvasiveProc" value="${pndtPatientDetails.resOfNonInvasiveProc}">
																			</div>
																		</div>
																		<div class="clearfix"></div>
																		<hr>

																		<div class="col-md-6 col-sm-6 col-xs-6">
																			<label for="nameField">15.The result of
																				pre-natal diagnostic procedures was conveyed to :</label>
																			<div class="row">
																				<div class="col-md-5 col-sm-5 col-xs-5">
																					<div class="xform-group">

																						<input type="text" class="form-control top-space"
																							name="resOfPreNatalDiagnoProc"  value="${pndtPatientDetails.resOfPreNatalDiagnoProc}">
																					</div>
																				</div>
																				<div class="col-md-1 col-sm-1 col-xs-1 top-space">On</div>
																				<div class="col-md-5 col-sm-5 col-xs-5 text-right">
																					<div class="xform-group">

																						<input type="text"
																							class="form-control top-space form_datetime"
																							name="resOfPreNatalDiagnoProc">
																					</div>
																				</div>
																			</div>

																		</div>

																		<div class="col-md-6 col-sm-6 col-xs-6">
																			<div class="xform-group">
																				<label for="nameField">16. Any indication
																					for MTP as per the abnormality detected in the
																					diagnostic procedures/tests :</label> <input type="text"
																					class="form-control top-space"
																					name="indicationMTPAbnormal"  value="${pndtPatientDetails.indicationMTPAbnormal}">
																			</div>
																		</div>

																		<div class="col-md-12 col-sm-12 col-xs-12">
																			<table width="100%" border="0"
																				class="indication mar-top" id="indicationTable"
																				name="indication">
																				<tbody>
																					<tr>
																						<th>Sr</th>
																						<th>Indications</th>
																					</tr>

																				</tbody>
																			</table>

																		</div>

																	</div>


																</div>
															</div>
														</div>
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapseThree">SECTION C: To be filled for
																		performing invasive Procedures/ Tests only</a>
																</h4>
															</div>
															<div id="collapseThree" class="panel-collapse collapse">
																<div class="panel-body">
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<div class="xform-group">
																			<label for="nameField">17. Name of the
																				doctor/s performing the procedure/s: </label> <input
																				type="text" class="form-control top-space" id=""
																				name="nameOfDoctor"
																				value="${doctorDetails.fName} ${doctorDetails.lName}">

																		</div>
																	</div>

																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">18.History of
																			genetic/medical disease in the family (specify): </label>
																		<div class="row">
																			<div class="col-md-6 col-sm-6 col-xs-6">
																				<select class="form-control top-space" id="genDis"
																					onchange="enableGenDis()">

																					<option value="0">No</option>
																					<option value="1">Yes</option>
																				</select>
																			</div>
																			<div class="col-md-6 col-sm-6 col-xs-6 ">
																				<select class="form-control top-space"
																					id="genDisHistory" name="genDiseaseHistory"
																					disabled>
																					<option>select</option>
																					<option>Clinical</option>
																					<option>Bio-chemical</option>
																					<option>Cytogenetic</option>
																					<option>other(e.g. radiological,
																						ultrasonography, etc.)</option>
																				</select>
																			</div>
																		</div>
																	</div>



																	<div class="clearfix"></div>
																	<hr>

																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField" class="col-md-9">19.
																			Indication/s for the diagnosis procedure : </label>
																		<div class="col-md-3 col-sm-3 col-xs-3">
																			<select class="form-control" name="indicationDiagnos"
																				id="indicationDiagnos"
																				onchange="enableDisableContent()">

																				<option value="0">No</option>
																				<option value="1">Yes</option>
																			</select>

																		</div>
																		<div class="row">
																			<div class="col-md-6 col-sm-6 col-xs-6">
																				<label for="nameField">A. Previous
																					child/children with:</label> <select
																					class="form-control top-space"
																					name="indicationDiangoProc"
																					id="prevChildIndication" disabled
																					onchange="enableAnyOtherSpecify()">
																					<option>Not Applicable</option>
																					<option>(i) Chromosomal disorders</option>
																					<option>(ii) Metabolic disorders</option>
																					<option>(iii) Congenital anomaly</option>
																					<option>(iv) Mental Disability</option>
																					<option>(v) Haemoglobinopathy</option>
																					<option>(vi) Sex linked disorders</option>
																					<option>(vii) Single gene disorder</option>
																					<option value="8">(viii) Any other
																						(specify)</option>
																				</select>
																				<script>
																					function enableAnyOtherSpecify() {
																						var prevChildIndication = document
																								.getElementById("prevChildIndication").value;
																						if (prevChildIndication == 8) {

																							document
																									.getElementById("specifyChildIndication").disabled = false;

																						} else {
																							document
																									.getElementById("specifyChildIndication").disabled = true;
																						}
																					}
																				</script>


																				<input type="text"
																					class="form-control top-space-large"
																					name="indicationDiangoProc"
																					id="specifyChildIndication" placeholder="Specify"
																					disabled>
																			</div>


																			<div class="col-md-6 col-sm-6 col-xs-6">

																				<label for="nameField" class="mar-top10">C.
																					Mother/father/sibling has genetic disease (specify)</label>

																				<select class="form-control top-space" name=""
																					id="mfsGenDis" disabled onchange="enMFS()">

																					<option value="0">Not Known</option>
																					<option value="1">Known</option>

																				</select>
																				<script>
																					function enMFS() {
																						var mfsGenDis = document
																								.getElementById("mfsGenDis").value;
																						if (mfsGenDis == 1) {

																							document
																									.getElementById("mfsSpecify").disabled = false;
																						} else {
																							document
																									.getElementById("mfsSpecify").disabled = true;
																						}
																					}
																				</script>
																				<input type="text"
																					class="form-control top-space-large"
																					name="indicationDiangoProc" id="mfsSpecify"
																					placeholder="Specify" disabled>
																			</div>

																			<div class="col-md-6 col-sm-6 col-xs-6">
																				<label for="nameField" class="mar-top10">D.
																					Other (specify)</label> <input type="text"
																					class="form-control top-space-large"
																					name="indicationDiangoProc" id=""
																					placeholder="Specify">
																			</div>

																		</div>
																	</div>

																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField"> 20. Date on which
																			consent of pregnant woman / person was obtained in
																			Form G prescribed in PC&PNDT Act, 1994: </label> <input
																			type="text"
																			class="form-control form_datetime top-space" id=""
																			name="dateConsentOfPrgWomen" placeholder="" value="${pndtPatientDetails.dateConsentOfPrgWomen}">
																	</div>

																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField" class="mar-top10">
																			21.Invasive procedures carried out </label>
																		<div class="row">
																			<div class="col-md-6 col-sm-6 col-xs-6">
																				
																				<select class="form-control top-space-large"
																					name="invasiveProcCarOut" id="invProcCarOut"
																					onchange="enableInvProcCarOut()">
																					<option>i. Amniocentesis</option>
																					<option>ii. Chorionic Villi aspiration</option>
																					<option>iii. Fetal biopsy</option>
																					<option>iv. Cordocentesis</option>
																					<option value="5">v. Any other (specify)</option>
																				</select>
																				
																				<script>
																					function enableInvProcCarOut() {
																						var invProcCarOut = document
																								.getElementById("invProcCarOut").value;
																						if (invProcCarOut == 5) {

																							document
																									.getElementById("invProcCarOutSpecify").disabled = false;
																						} else {

																							document
																									.getElementById("invProcCarOutSpecify").disabled = true;
																						}

																					}
																				</script>
																			</div>
																			<div class="col-md-6 col-sm-6 col-xs-6">
																			
																				<input type="text" class="form-control top-space-large"
																					name="invasiveProcCarOut" id="invProcCarOutSpecify"
																					placeholder="Specify" disabled>
																					
																			</div>

																		</div>

																	</div>
																	<div class="clearfix"></div>
																	<hr>

																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">22. Any complication/s
																			of invasive procedure(specify)</label> <input type="text"
																			class="form-control top-space"
																			name="complicationInvasiveProc" id=""
																			placeholder="Specify" value="${pndtPatientDetails.complicationInvasiveProc}">
																	</div>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">23. Additional tests
																			recommended (Please mention if applicable)</label>
																		<div class="row">
																			<div class="col-md-6 col-sm-6 col-xs-6">
																				<select class="form-control top-space"
																					name="additionalTestRecommended" id="recTest"
																					onchange="enableRecTest()">
																					<option>(i) Chromosomal studies</option>
																					<option>(ii) Biochemical studies</option>
																					<option>(iii) Molecular studies</option>
																					<option>(iv) Pre-implantation gender
																						diagnosis</option>
																					<option value="5">(v) Any other (specify)</option>
																				</select>

																				<script>
																					function enableRecTest() {
																						var recTest = document
																								.getElementById("recTest").value;
																						if (recTest == 5) {

																							document
																									.getElementById("recTestSpecify").disabled = false;
																						} else {
																							document
																									.getElementById("recTestSpecify").disabled = true;
																						}

																					}
																				</script>
																			</div>
																			<div class="col-md-6 col-sm-6 col-xs-6">
																				<input type="text" class="form-control top-space"
																					name="additionalTestRecommended"
																					id="recTestSpecify" placeholder="Specify" value="${pndtPatientDetails.additionalTestRecommended}" disabled>
																			</div>
																		</div>

																	</div>

																	<div class="clearfix"></div>
																	<hr>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">24. Result of the
																			Procedures/ Tests carried out (report in brief of the
																			invasive tests/ procedures carried out)</label> <input
																			type="text" class="form-control top-space"
																			name="resultOfProcedure" id="" placeholder="Specify" value="${pndtPatientDetails.resultOfProcedure}">
																	</div>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">25. Date on which
																			procedures carried out:</label> <input type="text"
																			class="form-control form_datetime top-space-large"
																			name="dateResOfProcedure" id="" placeholder="Specify" value="${pndtPatientDetails.dateResOfProcedure}">
																	</div>
																	<div class="clearfix"></div>
																	<hr>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">26. The result of
																			pre-natal diagnostic procedures was conveyed to</label>
																		<div class="row">
																			<div class="col-md-5 col-sm-5 col-xs-5">
																				<input type="text"
																					class="form-control top-space-large"
																					name="invasivePreNatalDiagnoProc" id=""
																					placeholder="Specify" value="${pndtPatientDetails.invasivePreNatalDiagnoProc}">
																			</div>
																			<div
																				class="col-md-1 col-sm-1 col-xs-1 text-center top-space-large">On</div>
																			<div class="col-md-5 col-sm-5 col-xs-5">
																				<input type="text"
																					class="form-control form_datetime top-space-large"
																					name="invasivePreNatalDiagnoProc" id=""
																					placeholder="Specify" >
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">27. Any indication for
																			MTP as per the abnormality detected in the diagnostic
																			procedures/tests</label> <input type="text"
																			class="form-control top-space"
																			name="indicationMTPabnormality" id=""
																			placeholder="Specify" value="${pndtPatientDetails.indicationMTPabnormality}">
																	</div>
																	<div class="clearfix"></div>
																	<hr>


																</div>

															</div>
														</div>

														 <div class="panel panel-default">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#accordion"
																		href="#collapseFour">Section D: Declaration</a>
																</h4>
															</div>
															<div id="collapseFour" class="panel-collapse collapse">
																<div class="panel-body">

																	<div class="row">
																		<div class="col-lg-12 text-center">
																			<form>
																				<h3>
																					Declaration Of The Person Undergoing <span>Prenatal
																						Diagnostic Test / Procedure </span>
																				</h3>
																				<p>
																					I, Mrs./Mr.<input type="text" class="letter-input">
																					declare that by undergoing <input type="text"
																						class="letter-input"> Prenatal Diagnostic
																					Test/ Procedure. I do not want to know the sex of
																					my foetus.
																				</p>
																				<div class="top-space pull-left">Date:</div>
																				<div class="top-space div-sm pull-right">Signature/Thump
																					impression of the person undergoing the Prenatal
																					Diagnostic Test/ Procedure</div>
																				<div class="clearfix"></div>
																				<hr>
																				<h6>In Case of thumb Impression:</h6>
																				Identified by (Name)<input type="text"
																					class="letter-input">Age:<input type="text"
																					class="letter-input"> Sex:<input
																					type="text" class="letter-input"> Relation
																				(if any):<input type="text" class="letter-input">
																				Address & Contact No.:
																				<textarea type="text" class="letter-input" rows="1"></textarea>
																				Signature of a person attesting thumb impression:  
																				 <input type="text" class="letter-input"><br> Date:<input
																					type="text" class="letter-input">

																				<div class="clearfix"></div>
																				<hr>

																				<h3>
																					Declaration Of Doctor / Person Conducting <span>Pre
																						Natal Diagnostic Procedure / Test</span>
																				</h3>
																				<p>
																					</>I,<input type="text" class="letter-input">(name
																					of the person conducting ultrasonography / image
																					scanning) declares that the while conducting
																					ultrasonography /image scanning on Ms/Mr<input
																						type="text" class="letter-input"> (name of
																					the pregnant woman or the person undergoing pre
																					natal diagnostic procedure/test), I have neither
																					detected nor disclosed the sex of her foetus to
																					anybody in any manner.
																				</p>
																				Date: <input type="text" class="letter-input">
																				Signature:<input type="text" class="letter-input">
																				<input type="text" class="letter-input">

																				<div class="top-space-large div-sm pull-right">
																					Name in Capitals, Registration Number with Seal of
																					the Gynaecologist/Radiologist/Registered Medical
																					Practitioner Conducting Diagnostic procedure.</div>
																				<div class="clearfix"></div>
																			</form>

																		</div>
																	</div>

																</div>

															</div>
														</div> 
													</div>
													<div class="submit-btn text-center"><input type="submit" value="Submit " class="btn-fr-all"></div>
												</div>




											</form>
										</div>

									</div> --%>

							</div>
							
							
</form>
						</div>
						
					<!-- 	Mobile -->
					<div class="bs-example app-disp">	
							<div class="tab-drop">
							<select id="select-box">
      							<option value="1"> Info</option>
      							<option value="2"> Reports</option>
      							<!-- <option value="3">Payment</option> -->
    							</select>
    							</div>
    							<div class="clearfix"></div>
    							<hr>
    							<div class="tabDrop-content">
<form action="${pageContext.request.contextPath}/submitLabRepots" method="post"  id="validation-formMob" enctype="multipart/form-data">
							
							
							<input type="hidden" name="appoitId" value="${appoitId}">
								<div id="tab1" class="tab-content1 fade in active">
									<div class="row">
										<div class="col-md-3 col-sm-3">
											<div class="patinet-pic">
												<img
													src="${patientProfile}/${patientDetails.profilePhoto}"
													class="img-responsive" alt="patinet pic">
											</div>
										</div>
										<input type="hidden" value="${patientDetails.patientId}" id="patientId" name="patientId">
										<div class="col-md-9 col-sm-9">
											<b><p>
													Patient Name : <span> ${patientDetails.fName}
														${patientDetails.mName} ${patientDetails.lName}</span>
												</p></b>
											<ul class="patinet-info">
												<li>BirthDate:<span> ${patientDetails.birthDate}</span></li>
												<li>Blood Group: <span>
														${patientDetails.bloodGroup}</span></li>
												<li>Sex: <span> ${patientDetails.gender} </span></li>

											</ul>
											<ul class="patinet-info">
												<li>City: <span> ${patientDetails.cityId} </span></li>
												<li>Phone No: <span>${patientDetails.contactNo}</span></li>
												<li>Email: <span>${patientDetails.email} </span></li>
											</ul>
										</div>
									</div>
								</div>
								 
								 <div id="tab2" class="tab-content1 fade">
								 
								 
								  <c:forEach items="${labTestsList}" var="labTests"
									varStatus="count">
						<div class="filter_div">
		                	<div class="col-sm-6">
		                	 <label>For Test</label>
					      		<%-- <select class="input-text" id="testIdMob" name="testId" required>
											<option value="">Select Test</option>
											<c:forEach items="${labTestsList}" var="labTestsList">
												<option value="${labTestsList.labTestId}">${labTestsList.labTestName}</option>
											</c:forEach>
										</select> --%>
										<input type="text" placeholder="Test Name" value="${labTests.labTestName}" disabled="disabled">
									 
										<input type="hidden" id="testIdMob" value="${labTests.labTestId}">
										
										
			                </div>
			                
			                 <div class="col-sm-6">
			                 <div class="box3">
			                 <label>Select file</label>
					<input type="file"  name="reportFile${labTests.labTestId}" id="reportFile${labTests.labTestId}" required  class="inputfile inputfile-6" accept="application/pdf, .jpg, .png, .jpeg"  data-multiple-caption="{count} files selected" placeholder="select file" />
					<label for="file-7Mob"><span></span> <strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> Choose a file &hellip;</strong></label>
				</div>
			                	<!-- <input type="file"  id="avatar" name="avatar"  accept="image/png, image/jpeg"  class="btn-fr-all"/> -->
			                </div>
			               
			                 
			              <!--   <a href="#" onclick="uploadFiles()" class="history_sbmt">submit</a> -->
			               
			                 
	                </div>
	                </c:forEach>
	               <div class="clearfix"></div>
	                
	               <%-- <div class="lab-payment">
	                <h3>Invoice</h3>
	                <div class="pat-dat">
	                	 	
	                	 	<p><strong>Patient Name</strong> : ${patientDetails.fName}
														${patientDetails.mName} ${patientDetails.lName}</p>
	                	 	<p id="currDate"><strong></strong></p>
	                	 
	                	 		
	                	 	
	                	 			<div class="col-md-6 col-sm-12">
	                	 			<div class="pat-dat">
	                	 	
	                	 	<p><strong>Patient Name</strong> : ${patientDetails.fName}
														${patientDetails.mName} ${patientDetails.lName}</p>
	                	 	
	                	 </div>
	                	 		</div>
	                	 		<div class="col-md-6 col-sm-12">
	                	 		<p class="text-right" id="currDate"><strong></strong></p>
	                	 		</div>
	                	 		
	                	 	
	                	 </div>		
	                	 <div class="lab-pay-blk">
	                	 	<div class="row">
	                	 		<div class="col-md-8 col-sm-12 col-xs-12">
	                	 			<div class="pat-name">
	                	 			<div class="table-responsive lab-pay-tbl">
                						<table width="100%" border="0">	
									<thead>
									<tr>
									<td><strong>Test Name </strong></td>
									
									<td>${labTestName}</td>
									</tr>
									</thead>
									</table>
									</div>
	                			
	                				
	                			
	                			</div>
	                	 		</div>
	                	 		<div class="col-md-4 col-sm-12 col-xs-12">
	                			<div class="table-responsive lab-pay-tbl">
                						<table width="100%" border="0">	
						<thead>
							<tr>
								<td><strong>Charges</strong></td>
								<td><input type="text" class="input-text" id="amount" name="amount" onkeyup="getTotalAmount()"></td>
							</tr>							
						</thead>
						
                    <tbody>
                    <tr>
                         <td><strong>Discount:</strong></td>
						 <td><input type="text" value="0" class="input-text" id="discount" name="discount" onkeyup="getTotalAmount()"></td>	
						 
						</tr>
						 
						 <tr>
                         <td><strong>Total:</strong></td>
                         <td><input type="text" value="0" class="input-text" id="totalAmount" name="totalAmount"></td>
						 <!-- <td ><span class="flaticon-rupee-indian"></span> <strong>0.0</strong></td> -->		
						 
						</tr>
						 
						 
					</tbody>
						</table>
                					</div>
	                		</div>
	                	 	</div>
	                	</div>
	                		<div class="row">
	                		<div class="col-md-4 col-sm-4 text-center-sm mar-top20">
	                		<input type="checkbox" name="onlinePay" value="1">&nbsp; <strong>Is this online payment?</strong></input>
	                		</div>
	                		<div class="col-md-8 col-sm-8">
	                		<div class="lab-submit-btn"><a href="#" class="history_sbmt btn-fr-all" onclick="submitReports()">submit</a></div>
	                		</div>
	                	</div>
	                </div> --%>
<div class="lab-submit-btn"><input type="submit" class="history_sbmt btn-fr-all" value="Submit"></div>
						</div>
						 
							
</form>
</div>
    				</div>
    				
</section>
						
					</div>

				</div>
			</div>
			
	</section>

	<div class="clearfix"></div>
	
									
									
	<div id="myModal78" class="modal fade" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Add Children Details</h4>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table width="100" border="1" class="radio-tbl">
							<tbody>

								<tr>
									<td><label for="gender">Gender</label></td>
									<td><label for="age">DOB</label></td>
									<!--   <td><label for="agetype">Age Type</td> -->

								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>



								<tr>


									<input type="hidden" value="1" name="patientId1" id="patientId1">
									<td><select class="form-control" id="gender1" name="gender1">
											<option value="0" name="gender" disabled="">Select
												Gender</option>
											<option value="male">Male</option>
											<option value="female">Female</option>
									</select></td>
									<td><input type="text" class="form-control form_datetime" name="dob" id="dob" placeholder="Date Of Birth"></td>
								</tr>
							</tbody>
						</table>


						<table id="showChildsTable">
							<tbody>
							</tbody>

						</table>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="multiFunctionCall()">Update</button>
					<button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
				
				
				
				<!--   </form> -->
				<script>
					var male = 0;
					var female = 0;
				</script>
				<script>
					function multiFunctionCall() {

						addChildInList();
						getMaleFemaleChild();
					}
				</script>

				<script>
					function enableDisableContent() {
						var indicationDiagnos = document
								.getElementById("indicationDiagnos").value;

						if (indicationDiagnos == 1) {

							document.getElementById("prevChildIndication").disabled = false;

							document.getElementById("mfsGenDis").disabled = false;

						} else {

							document.getElementById("prevChildIndication").disabled = true;

							document.getElementById("mfsGenDis").disabled = true;
						}
					}
				</script>


				<script>
					function enableGenDis() {

						var genDis = document.getElementById("genDis").value;
						if (genDis == 1) {

							document.getElementById("genDisHistory").disabled = false;
						} else {
							document.getElementById("genDisHistory").disabled = true;
						}

					}
				</script>
				<script>
					function enableInput() {
						var nonInvasiveUltra = document
								.getElementById("nonInvasiveUltra").value;

						if (nonInvasiveUltra == 1) {

							document.getElementById("ultraSpecify").disabled = false;
						} else {
							document.getElementById("ultraSpecify").disabled = true;
						}
					}
				</script>


				<script>
					function getMaleFemaleChild() {

						var gender = document.getElementById("gender1").value;

						if (gender == "male") {
							male++;

							document.getElementById("maleChild").value = male;
						} else if (gender == "female") {

							female++;
							document.getElementById("femaleChild").value = female;
						}
						
						var totalCount=parseInt(male)+parseInt(female);
						document.getElementById("totalChild").value=totalCount;
					}
				</script>
			
			
			
			
			

			</div>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" /> 
	
	
	<!-- Bootstrap core JavaScript================================================== -->
	<%-- <script
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
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> --%>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
		
	      	<script
		src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  		
		
	<script>
	
		function validateForm() {
			var x = document.forms["myForm"]["fname"].value;
			if (x == "") {
				alert("Name must be filled out");
				return false;
			}
		}
		$(function() {
			$('input[type=checkbox]').click(function() {
				//    for (i = 0; i < chks.length; i++) {
				//        chks[i].checked = false;
				//     }
				//     if (chks.length > 1)
				//         $(this)[0].checked = true;
			});
		});
		$(document).ready(function() {
			$('.panel-collapse').on('show.bs.collapse', function() {
				$(this).siblings('.panel-heading').addClass('active');
			});

			$('.panel-collapse').on('hide.bs.collapse', function() {
				$(this).siblings('.panel-heading').removeClass('active');
			});
		});

		$('input[name="messagetick"]').click(function() {
			$('.contactmessage').toggle(this.checked);
		});
		$('input[name="messagetick1"]').click(function() {
			$('.contactmessage1').toggle(this.checked);
		});
		$('input[name="messagetick2"]').click(function() {
			$('.contactmessage2').toggle(this.checked);
		});
		$('input[name="messagetick3"]').click(function() {
			$('.contactmessage3').toggle(this.checked);
		});
		$('input[name="messagetick4"]').click(function() {
			$('.contactmessage4').toggle(this.checked);
		});
		$('input[name="messagetick5"]').click(function() {
			$('.contactmessage5').toggle(this.checked);
		});

		$(document).ready(
				function() {
					$("div.bhoechie-tab-menu>div.list-group>a").click(
							function(e) {
								e.preventDefault();
								$(this).siblings('a.active').removeClass(
										"active");
								$(this).addClass("active");
								var index = $(this).index();
								$("div.bhoechie-tab>div.bhoechie-tab-content")
										.removeClass("active");
								$("div.bhoechie-tab>div.bhoechie-tab-content")
										.eq(index).addClass("active");
							});
				});
		//jQuery(".panel-heading").click(function(){ jQuery(this).nextAll(".panel-collapse").slideToggle("fast"); });

		jQuery(".panel-heading").click(
				function() {
					jQuery(this).next(".panel-collapse").addClass('thePanel');
					jQuery('#accordion .panel-collapse').not('.thePanel')
							.slideUp("slow");
					jQuery(".thePanel").slideToggle("slow").removeClass(
							'thePanel');
				});
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}

			[].slice.call(document.querySelectorAll('input.input__field'))
					.forEach(function(inputEl) {
						// in case the input is already filled..
						if (inputEl.value.trim() !== '') {
							classie.add(inputEl.parentNode, 'input--filled');
						}

						// events:
						inputEl.addEventListener('focus', onInputFocus);
						inputEl.addEventListener('blur', onInputBlur);
					});

			function onInputFocus(ev) {
				classie.add(ev.target.parentNode, 'input--filled');
			}

			function onInputBlur(ev) {
				if (ev.target.value.trim() === '') {
					classie.remove(ev.target.parentNode, 'input--filled');
				}
			}
		})();
	</script>
	 
	 


	 
	<script type="text/javascript">
		 

	 
  /*
	By Osvaldas Valutis, www.osvaldas.info
	Available for use under the MIT License
*/

'use strict';

;( function ( document, window, index )
{
	var inputs = document.querySelectorAll( '.inputfile' );
	Array.prototype.forEach.call( inputs, function( input )
	{
		var label	 = input.nextElementSibling,
			labelVal = label.innerHTML;

		input.addEventListener( 'change', function( e )
		{
			var fileName = '';
			if( this.files && this.files.length > 1 )
				fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
			else
				fileName = e.target.value.split( '\\' ).pop();

			if( fileName )
				label.querySelector( 'span' ).innerHTML = fileName;
			else
				label.innerHTML = labelVal;
		});

		// Firefox bug fix
		input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
		input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
	});
}( document, window, 0 ));
  
</script>


<script type="text/javascript">

function submitReports() {
	
 if($('#testId').val()=="" && $("#file-7").val()==""){
	 
	 alert("Select Report File and Test Type");

	$("#sectionC").removeClass("active in ");
	$("#pay").removeClass("active");
	$("#rep").addClass("active");
	   $("#sectionB").addClass("active in ");
	   
 }
 else
	 {
	 $("#validation-form").submit();
	
	 }
}

/* Mobile */
 
 function submitReportsMob() {
		
	 if($('#testIdMob').val()=="" && $("#file-7Mob").val()==""){
		 
		 alert("Select Report File and Test Type");

		$("#tab3").removeClass("active in ");
		
		   $("#tab2").addClass("active in ");
		   
	 }
	 else
		 {
		 $("#validation-formMob").submit();
		
		 }
	}
 

 $('.tab-content1').hide();
//show the first tab content
$('#tab1').show();

$('#select-box').change(function () {
 dropdown = $('#select-box').val();
//first hide all tabs again when a new option is selected
$('.tab-content1').hide();
//then show the tab content of whatever option value was selected
$('#' + "tab" + dropdown).addClass('in');
$('#' + "tab" + dropdown).show();
});

</script>
 <!-- <div class="tab-container">
  
  <div class="tab-navigation">              
    <select id="select-box">
      <option value="A">Option 1r</option>
      <option value="B">Option 2</option>
      <option value="C">Option 3</option>
      <option value="4">Option 4</option>
      <option value="5">Option 5</option>
    </select>
  </div>
  
  <div id="tab-1" class="tab-content1">
    This is tab 1 content.
  </div>
  <div id="tab-2" class="tab-content1">
    This is tab 2 content.
  </div>
  <div id="tab-3" class="tab-content1">
    This is tab 3 content.
  </div>
 <div id="tab-4" class="tab-content1">
    This is tab 4 content.
  </div>
  <div id="tab-5" class="tab-content1">
    This is tab 5 content.
  </div>
  
</div>
<script type="text/javascript">

$('.tab-pane').hide();
//show the first tab content
$('#sectionA').show();

$('#select-box').change(function () {
 dropdown = $('#select-box').val();
//first hide all tabs again when a new option is selected
$('.tab-pane').hide();
//then show the tab content of whatever option value was selected
$('#' + "section" + dropdown).show();                                    
});
</script> -->
<script type="text/javascript">
var d = new Date();
var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
document.getElementById("currDate").innerHTML="<strong>Date: </strong>"+strDate;
</script>
<script type="text/javascript">
function getTotalAmount(){
	
var amount=$("#amount").val();

var disc=$("#discount").val();
var totalAmount=amount-(amount*disc)/100;
document.getElementById("totalAmount").value=totalAmount;
}

</script>
<script type="text/javascript">
        function sendInvoice() {
        	
        	var patientId=document.getElementById("patientId").value;
        	var testId=document.getElementById("testId").value;
        	 var form = document.getElementById("validation-form");
        	  var formData = new FormData(form);
        	$.getJSON(
					'${sendInvoiceToPatient}',
					{
						data: formData,
					    processData: false,
					    contentType: false,
						
						patientId : patientId,
						
						testId : testId,
						
						ajax : 'true'
					},
					function(data) {
						
						alert("cdscs");
						

					})
           
        }
    </script>
    <script type="text/javascript">
		 

	 
  /*
	By Osvaldas Valutis, www.osvaldas.info
	Available for use under the MIT License
*/

'use strict';

;( function ( document, window, index )
{
	var inputs = document.querySelectorAll( '.inputfile' );
	Array.prototype.forEach.call( inputs, function( input )
	{
		var label	 = input.nextElementSibling,
			labelVal = label.innerHTML;

		input.addEventListener( 'change', function( e )
		{
			var fileName = '';
			if( this.files && this.files.length > 1 )
				fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
			else
				fileName = e.target.value.split( '\\' ).pop();

			if( fileName )
				label.querySelector( 'span' ).innerHTML = fileName;
			else
				label.innerHTML = labelVal;
		});

		// Firefox bug fix
		input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
		input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
	});
}( document, window, 0 ));
  
</script>

<script>
	
	var childsModelList=[];
	<c:forEach items="${pndtPatientDetails.childsModelList}" var="childsModelList">

	var gender = "<c:out value="${childsModelList.gender}"/>";
	
	var dob = "<c:out value="${childsModelList.dob}"/>";


	childsModelList.push(gender);
	childsModelList.push(dob);

		var strVar="";
		strVar += "<tr class='childId'>";
		strVar += " <td>"+gender+"<\/td>";
		strVar += " <td>"+dob+"<\/td>";
		strVar += " ";
		strVar += " <\/tr>";
		
	//	var list = document.getElementsByClassName("childId");
		
		$('#showChildsTable tbody').append(strVar);


	</c:forEach>
	
	
              function addChildInList(){
        
            	  var patientId=document.getElementById("patientId1").value;
            	 
            	  var gender=document.getElementById("gender1").value;
            	  
            	  var dob=document.getElementById("dob").value;
            	
            	  var count;
            	  $.getJSON('${savePndtChildrenDetails}',
      					{
      						patientId : patientId,
      						
      						gender : gender,
      						
      						dob : dob,
      						
      						ajax : 'true'
      					},function(data) {
      						 $('#showChildsTable td').remove();
      						
      						$.each(data, function(key, childsModelList) {
      						
      							var strVar="";
      							strVar += "<tr class='childId'>";
      							strVar += " <td>"+childsModelList.gender+"<\/td>";
      							strVar += " <td>"+childsModelList.dob+"<\/td>";
      							strVar += " ";
      							strVar += " <\/tr>";
      							count=key+1;
      						//	var list = document.getElementsByClassName("childId");
      							
      							$('#showChildsTable tbody').append(strVar);

      						})
      					
      						//document.getElementById("totalChild").value=count;
      					});
              }
              
              
            
              
              </script>
	

	 <script type="text/javascript">
		$('.form_datetime').datepicker({
			autoclose : true,
			format : "dd-mm-yyyy"
		})
	</script>
<script type="text/javascript">
function openModell() {
	$('#myModal78').modal('show');
}
</script>
<script type="text/javascript">



var indicationsModelList=[];
<c:forEach items="${pndtPatientDetails.indicationsModelList}" var="indicationsModelList">

var indication = "<c:out value="${indicationsModelList.indications}"/>";



indicationsModelList.push(indication);




var strVar = "";
strVar += "<tr class='indication1'>";

strVar += "<td>1<\/td>";
		
strVar += "<td>"
		+ indication
		+ "<\/td>";

strVar += " <\/tr>";

$('#indicationTable tbody').append(strVar);	


</c:forEach>


function addIndication() {

	
	//var count=1;
	//var pndtId= document.getElementById("pndtPatientId").value;
	var patientId = document.getElementById("patientId1").value;
	var indication = document.getElementById("indication").value;
	
	alert("pa"+patientId+"indi"+indication);
	$
			.getJSON(
					'${savePndtIndicationDetails}',
					{

						patientId : patientId,

						indication : indication,

						ajax : 'true'
					},
					function(data) {
			 			var count;
						var i=1;
						$('#indicationTable td').remove();
	 					
						$.each( 
										data,
										function(key,
												indicationsModelList) {
											
											var strVar = "";
											strVar += "<tr class='indication1'>";
											
											count = key+1;

											strVar += "<td>" + count
													+ "<\/td>";
													
											strVar += "<td>"
													+ indicationsModelList.indications
													+ "<\/td>";
						
											strVar += " <\/tr>";
											alert(count);
											$('#indicationTable tbody').append(strVar);	
											
										})
										
										
										document.getElementById("numberOfIndication").value = count;

					});

}

</script>

<script>
        function calculateWeeksAndDays(){
        var lastMenstPeriod=document.getElementById("nameField").value;
        
       // var lengthOfDate=""+lastMenstPeriod.length;
       
        
        	var lastDate=lastMenstPeriod.replace(/-/g,"/");
       
        
       
        
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
		
        if(dd<10) {
            dd = '0'+dd
        } 

        if(mm<10) {
            mm = '0'+mm
        } 

        today = dd + '/' + mm + '/' + yyyy;
        
        today = new Date(today.split('/')[2],today.split('/')[1]-1,today.split('/')[0]);
        
        lastDate = new Date(lastDate.split('/')[2],lastDate.split('/')[1]-1,lastDate.split('/')[0]);
        
       
        
        var timeDiff = Math.abs(lastDate.getTime() - today.getTime());
        
        var oneDay=1000 * 3600 * 24;

        var diffD=timeDiff/oneDay;
        var totalWeeks=parseInt(diffD/7);
        var totalDays=parseInt(diffD%7); 
        var totalWeeksAndDay=totalWeeks+" Weeks "+totalDays+" Days";
       
        document.getElementById("totWeekNDay").value=totalWeeksAndDay;
        }
        </script>
</body>
</html>
