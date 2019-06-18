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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">


</head>         
<body>
<jsp:include page="../include/labHeader.jsp"/> 
<div class="clearfix"></div>


<div id="sectionF" class="tab-pane fade">
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
																				<label for="nameField">3. State</label> <select
																					class="form-control top-space" name="state"
																					id="stateId">
																			<c:forEach items="${stateList}" var="stateList" varStatus="count">
																				<option value="2">${stateList.stateName}</option>
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
										data-target="#myModal78" onclick="openModell()">
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

																							<option>Evaluation of umbilical cord –
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

														<!-- <div class="panel panel-default">
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
														</div> -->
													</div>
													<div class="submit-btn text-center"><input type="submit" value="Submit " class="btn-fr-all"></div>
												</div>




											</form>
										</div>

									</div>

<%-- <section class="doc_login">
<div class="dashboard_nm text-center"><h4>Bank Details</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/labLeftMenu.jsp"/> 
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
				    <div class="hospitalSec innersection lab_detl">
       
       <h4 class="detlnm"><a href="${pageContext.request.contextPath}/showAddEditLabBankDetails" data-toggle="tooltip" title="" data-original-title="edit"><span class="icon-user" style="color: #009fea; font-size: 20px"></span></a> </h4>
        
       
        
       <div class="col-sm-4 cliHoDetl">
       <p><strong>Bank Name :</strong> ${labBankAccountInfo.bankName}</p> 
        
        <p><strong>Account Holder Name :</strong> ${labBankAccountInfo.accHolderName}</p> 
      
       <p><strong>IFSC :</strong> ${labBankAccountInfo.ifscCode}</p>
     
       <p> <strong>GSTIN :</strong> ${labBankAccountInfo.gstNo}</p>
        </div>
      
       <div class="col-sm-4 cliHoDetl">
       <p><strong>Branch Name :</strong> ${labBankAccountInfo.bankBranch}</p> 
       <p><strong>Account No. :</strong> ${labBankAccountInfo.accountNo}</p> 
        <p> <strong>PAN :</strong> ${labBankAccountInfo.panNo}</p>
       </div>
       
       
       
       
      
   
</div>
</div>
</div>
</div>
</div>
</div>
</section> --%>
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
</body>
</html>