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
<link href="${pageContext.request.contextPath}/resources/css/style.css"	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/radiology.css"	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body class="radiology_sec">


	<c:url var="addMedicineToList" value="/addMedicineToList" />

	<c:url var="removeMedicineFromList" value="/removeMedicineFromList" />
 

	<c:url var="getPatientReportByPatientAndDocId"
		value="/getPatientReportByPatientAndDocId" />
	<c:url var="getFamilyHistory" value="/getFamilyHistory" />
	<c:url var="getPastMedicalHistory" value="/getPastMedicalHistory" />
	<c:url var="getPersonalHistory" value="/getPersonalHistory" />
	<c:url var="getPastMonthHistory" value="/getPastMonthHistory" />
	<c:url var="getAllStateByCountryId" value="/getAllStateByCountryId" />
	<c:url var="savePndtChildrenDetails" value="/savePndtChildrenDetails" />

	<c:url var="savePndtIndicationDetails"
		value="/savePndtIndicationDetails" />

	<jsp:include page="../include/doctorHeader.jsp" />
	<div class="clearfix"></div>

	<div class="radiology">
		<section class="doc_login ">
		<div class="container-fluid">
			<div class="row">
				<div class="bhoechie-tab-container">
					<jsp:include page="../include/radiology_left_menu.jsp" />

					<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
						<div class="bhoechie-tab-content"></div>

						<div class="bhoechie-tab-content active">

						<c:set var = "class1"  value = "${openHistory}"/>
						<c:set var = "class2"  value = "${openProfile}"/>

						<input type="hidden" value="activeHistory" id="activeHistory">

							<section id="consult">
							<div class="bs-example">
								<ul class="nav nav-tabs">
									<li class="${activeProfile}"><a data-toggle="tab" href="#sectionA">Patient
										Info</a></li>
									<li><a data-toggle="tab" href="#sectionF"
										onclick="executeMultipleMethod()">PNDT Details </a></li>
									<li class="${activeHistory}">
									<a data-toggle="tab" href="#sectionB" onclick="getPatientHistory(${patientDetails.patientId}, ${appoitId})">Patient History</a></li>
								<li><a data-toggle="tab" href="#sectionC"
									onclick="getPatientReports()">Labs Reports</a></li>
								<li><a data-toggle="tab" href="#sectionD">Consulting</a></li>
								<li><a data-toggle="tab" href="#sectionE">Consulting History</a></li>
									<!--<li><a data-toggle="tab" href="#sectionE">Labs Reports</a></li>-->

								</ul>
								<script>
									function executeMultipleMethod() {

										getAllStateByCountryId();
										getDoctorDetails();

									}
								</script>
								<div class="tab-content">
									<div id="sectionA" class="tab-pane fade ${class2}">
										<div class="row">
											<div class="col-md-3 col-sm-3">
												<div class="patinet-pic">
													<img src="${patientProfile}/${patientDetails.profilePhoto}"
														class="img-responsive" alt="patinet pic">
												</div>
											</div>
											<div class="col-md-9 col-sm-9">
												<b><p>
														Patient Name : <span> ${patientDetails.fName}
															${patientDetails.mName} ${patientDetails.lName}</span>
													</p></b>
												<ul class="patinet-info">
													<li>Age:<span> ${patientDetails.age}</span></li>
													<li>Blood Group: <span>
															${patientDetails.bloodGroup}</span></li>
													<li>Sex: <span> ${patientDetails.gender} </span></li>

												</ul>
												<ul class="patinet-info">
													<li>City: <span> ${patientDetails.cityId} </span></li>
													<li>Phone No: <span>${patientDetails.contactNo}
													</span></li>
													<li>Email: <span>${patientDetails.email} </span></li>
												</ul>
											</div>
										</div>
									</div>

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

																				</select>

																			</div>
																		</div>

																		<input type="hidden"
																			value="${patientDetails.patientId}" name="patientId"
																			id="patientId">
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">4.Total Number of
																					Living children </label>
																				<div class="row">
																					<div class="col-md-6 col-sm-6 col-xs-6">
																						<input type="text" class="form-control top-space"
																							id="totalChild" name="numberOfChild"
																							placeholder="" readonly />
																					</div>
																					<div class="col-md-6 col-sm-6 col-xs-6 text-right">
																						<a href="#myModal" class="btn btn-info top-space"
																							data-toggle="modal">Add Children Details</a>
																					</div>
																				</div>

																			</div>
																		</div>
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">(a).Number of Living
																					sons with age of each living son(in years or
																					months) </label> <input type="text" class="form-control"
																					id="maleChild" name="numberOfMaleChild" readonly>
																			</div>
																		</div>
																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">(b) Number of living
																					Daughters with age of each living daughter (in
																					years of months): </label> <input type="text"
																					class="form-control" id="femaleChild"
																					name="numberOfFemaleChild" readonly>
																			</div>
																		</div>
																		<div class="clearfix"></div>
																		<hr>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">5.Husbands /wifes
																					/Fathers /Mothers Name : </label> <select
																					class="form-control" id="relation"
																					name="relativeType">
																					<option value="0" name="relation" disabled>Select
																						Relation</option>
																					<option value="husband">Husband</option>
																					<option value="wife">Wife</option>
																					<option value="father">Father</option>
																					<option value="mother">Mother</option>
																				</select> <input type="text" class="form-control top-space"
																					name="relativeName"
																					placeholder="Enter Relative Name">
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">6.Full postal address
																					of the patients with Contact Number, if any : </label> <input
																					type="text" class="form-control " name="address">
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">7.(a) Referred by (
																					Full Name and address of Doctor(s) /Genetic
																					counselling Centre) : </label> <input type="text"
																					class="form-control" name="refDoctor">
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
																					name="selfDoctor">
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">8.Last menstrual
																					period /weeks of pregnancy </label> <input type="text"
																					class="form-control form_datetime top-space-large"
																					id="nameField" value="" name="lastMenstPeriod"
																					placeholder="Last Menstrual Period" />
																			</div>

																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">&nbsp; </label> <input
																					type="text" class="form-control top-space-large"
																					name="weeksOfPregnancy" id="totWeekNDay"
																					placeholder="total Days"
																					onfocus="calculateWeeksAndDays()" />
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
																					performing the procedure</label> <select
																					class="form-control top-space" name="nameOfDoctor">
																					<option>${doctorDetails.fName}
																						${doctorDetails.lName}</option>

																				</select>
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

																							<option>Evaluation of umbilical cord â
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
																				Invasive Ultrasound </label> <select class="form-control"
																				name="nonInvasiveProc" id="nonInvasiveUltra"
																				onchange="enableInput()">
																				<option value="0">Ultrasound</option>
																				<option value="1">Any Other (Specify)</option>
																			</select> <input type="text" class="form-control mar-top"
																				name="nonInvasiveProc" id="ultraSpecify"
																				placeholder="Specify" disabled>

																		</div>
																		<div class="clearfix"></div>
																		<hr>


																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">12.Date on which
																					declaration of pregnant woman/ person was obtained
																					:</label> <input type="text"
																					class="form-control form_datetime top-space"
																					name="pregWomenObtainDate">
																			</div>
																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">13.Date on which
																					procedures carried out :</label> <input type="text"
																					class="form-control form_datetime top-space-large"
																					name="dateProcCarOut">
																			</div>
																		</div>

																		<div class="col-md-4 col-sm-4 col-xs-4">
																			<div class="xform-group">
																				<label for="nameField">14.Result of the
																					non-invasive procedure carried out :</label> <input
																					type="text" class="form-control top-space-large"
																					name="resOfNonInvasiveProc">
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
																							name="resOfPreNatalDiagnoProc">
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
																					name="indicationMTPAbnormal">
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
																			name="dateConsentOfPrgWomen" placeholder="">
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
																				<input type="text"
																					class="form-control top-space-large"
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
																			placeholder="Specify">
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
																					id="recTestSpecify" placeholder="Specify" disabled>
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
																			name="resultOfProcedure" id="" placeholder="Specify">
																	</div>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">25. Date on which
																			procedures carried out:</label> <input type="text"
																			class="form-control form_datetime top-space-large"
																			name="dateResOfProcedure" id="" placeholder="Specify">
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
																					placeholder="Specify">
																			</div>
																			<div
																				class="col-md-1 col-sm-1 col-xs-1 text-center top-space-large">On</div>
																			<div class="col-md-5 col-sm-5 col-xs-5">
																				<input type="text"
																					class="form-control form_datetime top-space-large"
																					name="invasivePreNatalDiagnoProc" id=""
																					placeholder="Specify">
																			</div>
																		</div>
																	</div>
																	<div class="col-md-6 col-sm-6 col-xs-6">
																		<label for="nameField">27. Any indication for
																			MTP as per the abnormality detected in the diagnostic
																			procedures/tests</label> <input type="text"
																			class="form-control top-space"
																			name="indicationMTPabnormality" id=""
																			placeholder="Specify">
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

									</div>


									<div id="sectionB" class="tab-pane fade ${class1}">

									<div class="tab-content">
										 

										<div role="tabpanel" class="tab-pane fade in active"
											id="profile">
											<div class="panel-group" id="accordion" role="tablist"
												aria-multiselectable="true">
												<%-- <form
													action="${pageContext.request.contextPath}/submitPatientPersonalHistoryRegProcess"
													method="POST"> --%>
												<div class="panel panel-default">
													<div class="panel-heading" role="tab" id="headingOne">
														<h4 class="panel-title">
															<a role="button" data-toggle="collapse"
																data-parent="#accordion" href="#collapseOne"
																aria-expanded="true" aria-controls="collapseOne">
																Chief or presenting Complaints </a>
														</h4>
													</div>
													<div id="collapseOne" class="panel-collapse collapse in"
														role="tabpanel" aria-labelledby="headingOne">
														<div class="panel-body">
															<textarea name="Chief" disabled="disabled">${patientHistoryChiefComplaints.complaints}</textarea>
														</div>
													</div>
												</div>
												<div class="panel panel-default">
													<div class="panel-heading" role="tab" id="headingTwo">
														<h4 class="panel-title">
															<a class="collapsed" role="button" data-toggle="collapse"
																data-parent="#accordion" href="#collapseTwo"
																aria-expanded="false" aria-controls="collapseTwo">
																Past History </a>
														</h4>
													</div>
													<div id="collapseTwo" class="panel-collapse collapse"
														role="tabpanel" aria-labelledby="headingTwo">
														<div class="panel-body">
															<strong>History of Past illness like:</strong>

															<div class="cont_blk past_history">
																<c:forEach items="${patientHistoryIllnessList}"
																	var="patientHistoryIllnessList" varStatus="count">
																	<c:choose>


																		<c:when test="${count.index%2==0}">
																			<span class="input input--nao">
																				<div class="gender_sec">
																					<div class="checkbox">
																		</c:when>
																	</c:choose>




																	<label><input type="checkbox" name="illness"
																		checked="checked" disabled="disabled">${patientHistoryIllnessList.illnessName}</label>
															</div>
															<div class="checkbox">

																<c:choose>
																	<c:when test="${count.index%2!=0}">
															</div>
														</div>
														<svg class="graphic graphic--nao" width="300%"
															height="100%" viewBox="0 0 1200 60"
															preserveAspectRatio="none"> <path
															d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0" />
														</svg>
														</span>
														</c:when>
														</c:choose>
														</c:forEach>

													</div>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingThree">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseThree"
														aria-expanded="false" aria-controls="collapseThree">
														Personal History </a>
												</h4>
											</div>
											<div id="collapseThree" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingThree">
												<div class="panel-body">
													<strong>1. Marital status with number of children</strong>
													<div class="cont_blk past_history">
														<textarea name="Maritalstatus" disabled="disabled">${patientPersonalHistory.maritalStatus}</textarea>
													</div>

													<div class="clearfix"></div>
													<hr>
													<strong>2. Occupation (nature and environment job)
														and education, unemployment</strong>
													<textarea name="Occupation" disabled="disabled">${patientPersonalHistory.occupation}</textarea>
													<hr>
													<strong>3. Income (asked indirectly) and social
														status</strong>
													<textarea name="Income" disabled="disabled">${patientPersonalHistory.anualIncome}</textarea>
													<hr>
													<strong>4. Addiction (tea, coffee, smoking,
														alcoholism, substance abuse e.g chewing tobacco, ganja,
														heroin; try to estimate the amount of consumption of
														tobacco or alcohol)</strong>
													<textarea name="Addiction" disabled="disabled">${patientPersonalHistory.addiction}</textarea>
													<hr>
													<strong>5. Dietary habit(for diagnosis of
														avitaminosis, malnutrition, obesity)</strong>
													<textarea name="Dietary" disabled="disabled">${patientPersonalHistory.dietaryHabits}</textarea>
													<hr>
													<strong>6. History of Contraception</strong>
													<textarea name="Contraception" disabled="disabled">${patientPersonalHistory.historyOfConterception}</textarea>
													<hr>
													<strong>7. High Risk behaviour (e.g IV drug abuse,
														multiple sexual partner, homosexuality etc)-important in
														hepatitis B or C infection, AIDS and SBE.</strong>
													<textarea name="HighRiskbehaviour" disabled="disabled">${patientPersonalHistory.highRiskBehaviour}</textarea>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingSix">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseSix"
														aria-expanded="false" aria-controls="collapseSix">
														Family History </a>
												</h4>
											</div>
											<div id="collapseSix" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingSix">
												<div class="panel-body">

													<textarea name="FamilyHistory" disabled="disabled">${patientFamilyHistory.familyHistory}</textarea>


												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingFour">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseFour"
														aria-expanded="false" aria-controls="collapseFour">
														Treatment History </a>
												</h4>
											</div>
											<div id="collapseFour" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingFour">
												<div class="panel-body">
													<div class="cont_blk past_history">
														<strong>1.Treatment received so far, for the
															present illness.</strong>
														<textarea name="Treatment" disabled="disabled">${patientTreatementHistoryp.treatmentReceived}</textarea>
														<div class="clearfix"></div>
														<hr>
														<strong>2.Any H/O drug allergy or reactions.</strong>
														<textarea name="drugallergy" disabled="disabled">${patientTreatementHistoryp.allergyReactions}</textarea>
														<div class="clearfix"></div>
														<hr>
														<strong>3.Any surgical intervention or H/O
															accidents in significant past.</strong>
														<textarea name="surgicalintervention" disabled="disabled">${patientTreatementHistoryp.surgicalIntervention}</textarea>
														<div class="clearfix"></div>
														<hr>
														<strong>4. Prolonged use of oral contraceptives
															(may precipitate CVA), penicillamine(used in wilson's
															disease; may develop nephrotic syndrome), vitamin C (may
															produce oxalate stone) etc.</strong>
														<textarea name="contraceptives" disabled="disabled">${patientTreatementHistoryp.useOralContraceptives}</textarea>
														<div class="clearfix"></div>
														<hr>
														<strong>5. Blood transfusion</strong>

														<textarea name="Bloodtransfusion" disabled="disabled">${patientTreatementHistoryp.bloodTransfusion}</textarea>

														<div class="clearfix"></div>
														<hr>
														<strong>6. Intake of NSAID (may produce acute
															gastric erosion, NSAID-induced asthma etc.)</strong>

														<textarea name="Intake" disabled="disabled">${patientTreatementHistoryp.intakeNsaid}</textarea>

														<div class="clearfix"></div>
														<hr>
														<strong>7. Regular user of oral contraceptives,
															vitamins, laxatives, sedatives or herbal remedies.</strong>

														<textarea name="contraceptives" disabled="disabled">${patientTreatementHistoryp.regularUsezoralContraceptives}</textarea>

														<div class="clearfix"></div>
													</div>

												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingFive">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseFive"
														aria-expanded="false" aria-controls="collapseFive">
														Psychological History </a>
												</h4>
											</div>
											<div id="collapseFive" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingFive">
												<div class="panel-body">
													<textarea name="PsychologicalHistory" disabled="disabled">${patientPsychologicalHistory.psychologicalHistory}</textarea>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingFive">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseSeven"
														aria-expanded="false" aria-controls="collapseSeven">
														Menstrual and obstetric History </a>
												</h4>
											</div>
											<div id="collapseSeven" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingSeven">
												<div class="panel-body">
													<strong>1.Menarche.</strong>
													<textarea name="Menarche" disabled="disabled">${menstrualObstetricHistory.menarche}</textarea>
													<hr>
													<strong>2.Duration of the period.</strong>
													<textarea name="durationperoid" disabled="disabled">${menstrualObstetricHistory.durationOfPeriod}</textarea>
													<hr>
													<strong>3.Quantity of blood loss(usually assessed
														by number of pads consumed or passage of clots).</strong>
													<textarea name="bloodloss" disabled="disabled">${menstrualObstetricHistory.qtyOfBloodLoss}</textarea>
													<hr>
													<strong>4.Dysmenorrhoea, amenorrhoea or other
														menstrual irregularities.</strong>
													<textarea name="Dysmenorrhoea" disabled="disabled">${menstrualObstetricHistory.menstrualErregularities}</textarea>
													<hr>
													<strong>5.Date of last menstrual period.</strong>
													<textarea name="menstrual" disabled="disabled">${menstrualObstetricHistory.dateOfLastPeriod}</textarea>
													<hr>
													<strong>6.Menopause, post-menopausal bleeding.</strong>
													<textarea name="Menopause" disabled="disabled">${menstrualObstetricHistory.menopause}</textarea>
													<hr>
													<strong>7.Obstetric history: </strong>
													<div class="clearfix"></div>
													<strong>a) No.of pregnancies</strong>
													<textarea name="pregnancies" disabled="disabled">${menstrualObstetricHistory.noOfPregnancies}</textarea>
													<hr>
													<strong> b) Outcome of pregnancies : H/O abortions
														or carried to term:live birth (male/female)</strong>
													<textarea name="Outcomepregnancies" disabled="disabled">${menstrualObstetricHistory.outcomeOfPregnancies}</textarea>
													<hr>
													<strong>c) Complications during pregnancy (e.g
														hypertension, gestational diabetes mellitus)</strong>
													<div class="cont_blk past_history">
														<textarea name="Complicationspregnancy"
															disabled="disabled">${menstrualObstetricHistory.complicationsDuringPregnancies}</textarea>
													</div>
													<div class="clearfix"></div>
													<hr>
													<strong> d) Mode of delivery (Vaginal , foreeps,
														caesaream)</strong>
													<textarea name="Modedelivery" disabled="disabled">${menstrualObstetricHistory.made_of_delivery}</textarea>
													<hr>
													<strong> e) Last child birth</strong>
													<textarea name="Lastbirth" disabled="disabled">${menstrualObstetricHistory.last_child_birth}</textarea>

												</div>
											</div>
										</div>
										<div class="clearfix"></div>
										<hr>
										<p>
											<strong>Notice:</strong> Lorem Ipsum is simply dummy text of
											the printing and typesetting industry.</label>
										</p>
										<!-- <p>
											<label><input type="checkbox" value="">
												&nbsp;<strong>I Agree</strong></label>
										</p> -->
										<div class="clearfix"></div>

										<!-- <input type="submit" class="history_sbmt" name="Submit"> -->
										</form>


									</div>
								</div>
								</div>


							</div>
							<div id="sectionC" class="tab-pane fade">

							<div class="lab_img">

								<input type="hidden" value="${reportUrl}" id="reportUrl">
								<div class="table-responsive">
									<table id="reportTable">
										<thead>
											<tr>
												<th scope="col">Sr.no</th>
												<th scope="col">Test</th>
												<th scope="col">Date</th>
												<!-- <th scope="col">View Reports</th> -->
											</tr>
										</thead>
										<tbody>

										</tbody>


									</table>

								</div>
								<div align="center" class="loader"></div>
								<!--  <a href="#" data-target="#myModal10" data-toggle="modal" class="history_sbmt">canvas</a>
  <a href="#" data-target="#myModal11" data-toggle="modal" class="history_sbmt">pdf</a> -->

							</div>
							<!-- <a href="#" data-target="#largeModal11" data-toggle="modal"
								class="history_sbmt">submit</a> -->

						</div>


							<div id="sectionD" class="tab-pane fade">
							<form id="drconsult"
								action="${pageContext.request.contextPath}/submitDoctorPatientMeeting"
								method="post">


								<input type="hidden" name="appointId" id="appointId"
									value="${appoitId}">
								<div class="form-group row">
									<label for="staticEmail" class="col-sm-3 col-form-label">Patient
										Problem :</label> <input type="text" class="" id="patientProblem"
										placeholder="Enter patient problem" name="patientProblem"
										required>
								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 col-form-label">Discussion
										:</label>
									<textarea class="" id="discussion"
										placeholder="Enter Discussion" name="discussion" rows="2"
										required></textarea>
								</div>

								<div class="form-group row">
									<label for="staticEmail" class="col-sm-3 col-form-label">Special
										Instruction :</label>
									<textarea class="" id="specInstuction"
										placeholder="Enter Special Instuction" name="specInstuction"
										rows="2" required></textarea>
								</div>
								<div class="form-group row">
									<input type="button" value="Add Prescription"
										class="btn btn-info btn-fr-all" data-toggle="modal"
										data-target="#largeModal" onclick="showAddPrescription()">
								</div>
								<div class="form-group row">
									<div class="table-responsive">
										<table width="100%" border="0"
											class="tbl table table-bordered table table-hover"
											id="medicineTable">
											<thead>
												<tr align="center">
													<th>Sr.No</th>
													<!-- <th>Time</th>
											<th>Date</th> -->
													<th>Medicine Name</th>
													<th>Quantity</th>
													<th>Instructions</th>
													<th>Timing</th>
													<th>Delete</th>
												</tr>
											</thead>
											<tbody>

											</tbody>

										</table>

									</div>


									<input type="hidden" value="${patientDetails.patientId}"
										name="patientId" id="patientId">
									<!--*****  Patient Id Hardcoded ****** -->

									<input type="submit" value="Submit" class="btn btn-info btn-fr-all">
								</div>
							</form>
						</div>
						<div id="sectionE" class="tab-pane fade">
							<div class="table-responsive consult_hist">
								<table width="100%">
									<thead>
										<tr>
											<th>Date</th>
											<th>In Time</th>
											<th>Out Time</th>
											<th>Details</th>
											<th>prescription</th>
										</tr>
									</thead>
									<tbody>
										 <tr>									
   									 		<td><p>12-07-2018</p></td>
											<td><p>4:00 PM</p></td>
											<td><p>5:00 PM</p></td>
											<td><p>Chest pain</p></td>
											<td><p><a href="#" class="collpse_anch">View</a></p></td>
											</tr>
										    <tr class="collapse_td"><td colspan="5">
												    <div class="prescrption_D">
												    
												<table width="100%" border="0" class="tbl table table-bordered table table-hover" id="prescTable8">
															<thead>
																<tr align="center">
																	<th>Sr.No</th>
																	 
																	<th>Medicine Name</th>
																	<th>Quantity</th>
																	<th>Instructions</th>
																	<th>Timing</th>
																</tr>


															</thead>

															<tbody>

															<tr><td>1</td><td>iii</td><td>45</td><td>after food</td><td>morning,afternoon,evening</td></tr><tr><td>2</td><td>xscd</td><td>12</td><td>sszs</td><td>morning</td></tr></tbody>
														</table>
												    
												    </div>
										    </td></tr>

    										<tr>									
   									 		<td><p>12-07-2018</p></td>
											<td><p>4:00 PM</p></td>
											<td><p>5:00 PM</p></td>
											<td><p>Chest pain</p></td>
											<td><p><a href="#" class="collpse_anch">View</a></p></td>
											</tr>
										    <tr class="collapse_td"><td colspan="5">
												    <div class="prescrption_D">
												    
												<table width="100%" border="0" class="tbl table table-bordered table table-hover" id="prescTable8">
															<thead>
																<tr align="center">
																	<th>Sr.No</th>
																	 
																	<th>Medicine Name</th>
																	<th>Quantity</th>
																	<th>Instructions</th>
																	<th>Timing</th>
																</tr>


															</thead>

															<tbody>

															<tr><td>1</td><td>iii</td><td>45</td><td>after food</td><td>morning,afternoon,evening</td></tr><tr><td>2</td><td>xscd</td><td>12</td><td>sszs</td><td>morning</td></tr></tbody>
														</table>
												    
												    </div>
										    </td></tr>
									</tbody>
								</table>
								
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
	</div>
	</div>
	</section>
	<div id="largeModal"
		class="modal fade bs-example-modal-md prescription_mod" tabindex="-1"
		role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clearFields()">&times;</button>
					<h4 class="modal-title">Prescription Form</h4>
				</div>
				<div class="modal-body">
					<form id="prescription-form">
						<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Medicine
								Name :</label>
							<div class="col-sm-8 medicine1">
								<input type="text" class="form-control medicine" id="medicine">
							</div>
						</div>
						<div class="form-group row">
							<label for="continuty" class="col-sm-4 col-form-label">Quantity
								:</label>
							<div class="col-sm-8">
								<input type="text" class="" id="qty">
							</div>
						</div>

						<div class="form-group row">
							<label for="staticEmail" class="col-sm-4 col-form-label">Instructions
								:</label>
							<div class="col-sm-8">
								<label class="checkbox-inline"> <input type="checkbox"
									name="instruction" id="beforeFood" value="Before food"
									class="instruction"> Before food
								</label> <label class="checkbox-inline"> <input type="checkbox"
									name="instruction" id="afterFood" value="After food"
									class="instruction"> After food 
							</div>
						</div>

						<div class="form-group row">
							<label for="staticEmail" class="col-sm-4 col-form-label">Timing
								:</label>
							<div class="col-sm-8">
								<label class="checkbox-inline"> <input type="checkbox"
									id="inlineCheckbox1" class="chk" value="Morning"
									name="timingCheck"> Morning
								</label> <label class="checkbox-inline"> <input type="checkbox"
									class="chk" id="inlineCheckbox2" value="Evening"
									name="timingCheck"> Evening
								</label> <label class="checkbox-inline"> <input type="checkbox"
									id="inlineCheckbox3" value="Night" class="chk"
									name="timingCheck"> Night
								</label>
							</div>
						</div>




					</form>
				</div>
				<div class="modal-footer">
				
				<input type="button" value="Add Prescription" class="btn btn-info"
						data-toggle="modal" onclick="clearFields()"> 
				
					<input type="button" value="Add Prescription"
						class="btn btn-info btn-fr-all" data-toggle="modal"
						onclick="addPrescription()">	 <!-- <input
						type="button" value="Submit" class="btn btn-info"
						data-toggle="modal" data-target="#largeModal"
						onclick="submitPrescription()"> -->
				</div>
			</div>
		</div>
	</div>
	<div id="largeModal11" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-body">
					<div class="baby_details card_sec">


						<div class="clearfix"></div>
						<!-- <hr>
<a href="#" class="history_sbmt">Confirm</a> -->
						<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<ul class="card_list">
							<li><h3>
									Doctor <span>Name</span>
								</h3> <span>(Gynacologist)</span></li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><label><strong>Delivery Type : </strong> Normal
									: <input type="checkbox" name="deliveryType" value="Normal">
									Vacuume : <input type="checkbox" name="deliveryType"
									value="Vacuume" checked> Forceps :<input
									type="checkbox" name="deliveryType" value="Forceps
      "
									checked> Caesarean :<input type="checkbox"
									name="deliveryType" value="Caesarean" checked> </label></li>
							<li><label><strong>sex : </strong><input
									type="checkbox" name="sex" value="Male"> Male <input
									type="checkbox" name="sex" value="Female"> Female</label></li>
						</ul>
						<div class="card_img">
							<img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								alt="logo">
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<%-- <form action="${pageContext.request.contextPath}/savePndtChildrenDetails"> --%>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Children Details</h4>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table width="100" border="1" class="radio-tbl">
							<tbody>

								<tr>
									<td><label for="gender">Gender</label></td>
									<td><label for="age">DOB</td>
									<!--   <td><label for="agetype">Age Type</td> -->

								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>



								<tr>


									<input type="hidden" value="${patientDetails.patientId}"
										name="patientId1" id="patientId1">
									<td><select class="form-control" id="gender1"
										name="gender1">
											<option value="0" name="gender" disabled>Select
												Gender</option>
											<option value="male">Male</option>
											<option value="female">Female</option>
									</select></td>
									<td><input type="text" class="form-control form_datetime"
										name="dob" id="dob" placeholder="Date Of Birth"></td>
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
					<button type="button" class="btn btn-info"
						onclick="multiFunctionCall()">Update</button>
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
					}
				</script>


			</div>
		</div>
	</div>

	<div class="lab_img">
		<div class="modal fade" id="myModal10" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">View Reports</h4>
					</div>
					<div class="modal-body">
						<div id="sketch">
							<img id="reportImage"
								src=""
								class="img-responsive" alt="Report not Available">
							<canvas id="paint" width="980" height="850"></canvas>
							<p class="text-center">
								<a href="#" id="pen"><span class="fa fa-pencil"></span>Pen</a> <a
									href="#" id="eraser"><span
									class="glyphicon glyphicon-erase"></span>Eraser</a>
							</p>
						</div>

					</div>
				</div>

			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal11" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">View Reports</h4>
					</div>
					<div class="modal-body">
						 <p>
							<object id="reportPdf"
								data=""
								type="application/pdf"></object>
						</p> 
						
					</div>
				</div>

			</div>
		</div>
	</div>
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
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>

	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>




	<script type="text/javascript">
		$('.form_datetime').datepicker({
			autoclose : true,
			format : "dd-mm-yyyy"
		})
	</script>
	<script>
		$('#myTabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
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
	<script>
		function pastMonthHistory() {

			var patientId = document.getElementById("patientId").value;

			//alert(patientId);

			//alert("getPastMonthHistory");

			$
					.getJSON(
							'${getPastMonthHistory}',
							{

								patientId : patientId,

								ajax : 'true',
							},

							function(data) {
								//alert(data);

								//$('#table1 td').remove();
								//alert(data.patientSystemHeaderList[0].header_Name);

								for (var i = 0; i < data.patientSystemHeaderList.length; i++) {
									//alert(data.patientSystemHeaderList[i].header_Name);
									/*  $.each(
												data.patientSystemHeaderList,
												function(key, patientSystemHeaderList) {
									 */

									var node1 = document.createElement("");
									var textnode1 = document
											.createTextNode(data.patientSystemHeaderList[i].header_Name);

									//  var textnode1 = document.createTextNode(data.header_Name); 

									node1.appendChild(textnode1);
									// node.appendChild(textnode1); 

									document.getElementById("pastMonthList")
											.appendChild(node1);

									$
											.each(
													data.patientSystemDetailsList,
													function(key,
															patientSystemDetailsList) {

														if (patientSystemDetailsList.headerId == data.patientSystemHeaderList[i].headerId) {
															var node = document
																	.createElement("LI");
															var textnode = document
																	.createTextNode(patientSystemDetailsList.details_Name);

															//  var textnode1 = document.createTextNode(data.header_Name); 

															node
																	.appendChild(textnode);
															// node.appendChild(textnode1); 

															document
																	.getElementById(
																			"pastMonthList")
																	.appendChild(
																			node);

														}

														/* }) */
													})
								}
							});
			$('#table1 tbody').append(tr);

		}
	</script>
	<script>
		function personalHistory() {

			var patientId = document.getElementById("patientId").value;

			//alert(patientId);

			//alert("getPersonalHistory");

			$
					.getJSON(
							'${getPersonalHistory}',
							{

								patientId : patientId,

								ajax : 'true',
							},

							function(data) {
								//alert(data);

								document.getElementById("edu").innerHTML = data.education;
								document.getElementById('marital').innerHTML = data.maritalStatus;
								document.getElementById('working').innerHTML = data.currentlyWorking;
								document.getElementById('disablity').innerHTML = data.receivedDisablity;
								document.getElementById('legalprob').innerHTML = data.legalProblem;
								document.getElementById('religion').innerHTML = data.religion;

								$('#table1 tbody').append(tr);

							});

		}
	</script>
	<script>
		function myFunction() {

			var patientId = document.getElementById("patientId").value;

			//alert(patientId);

			//alert("getFamilyHistory");

			$
					.getJSON(
							'${getFamilyHistory}',
							{

								patientId : patientId,

								ajax : 'true',
							},

							function(data) {
								//alert(data);

								document.getElementById('fage').innerHTML = data.fatherAge;
								document.getElementById('mage').innerHTML = data.motherAge;
								document.getElementById('sage').innerHTML = data.siblingsAge;
								document.getElementById('cage').innerHTML = data.childrensAge;
								document.getElementById('fps').innerHTML = data.fhealth_Psychiatric;
								document.getElementById('mps').innerHTML = data.mhealth_Psychiatric;
								document.getElementById('sps').innerHTML = data.shealth_Psychiatric;
								document.getElementById('cps').innerHTML = data.cmhealth_Psychiatric;
								document.getElementById('fdeath').innerHTML = data.fageAtDeath;
								document.getElementById('mdeath').innerHTML = data.mageAtDeath;
								document.getElementById('sdeath').innerHTML = data.sageAtDeath;
								document.getElementById('cdeath').innerHTML = data.cageAtDeath;
								document.getElementById('fcause').innerHTML = data.fcause;
								document.getElementById('mcause').innerHTML = data.mcause;
								document.getElementById('scause').innerHTML = data.scause;
								document.getElementById('ccause').innerHTML = data.ccause;

								$('#table1 tbody').append(tr);

							});

		}
	</script>


	<script>
		function pastMediHistory() {

			var patientId = document.getElementById("patientId").value;
			//alert(patientId);

			//alert("getPastMedicalHistory");

			$.getJSON('${getPastMedicalHistory}', {

				patientId : patientId,

				ajax : 'true',
			},

			function(data) {
				//alert(data);

				//$('#table1 td').remove();
				$.each(data, function(key, data) {
					var node = document.createElement("LI");
					var textnode = document.createTextNode(data.diesesName);

					node.appendChild(textnode);
					document.getElementById("myList").appendChild(node);

					/*   
					   $document.ready(function())
					  { 
					  	var li=$('</li>')
					  	
					  	 var textnode = document.createTextNode(data.diesesName); 
					  	node.appendTo(textnode); 
						.appendTo('#myList');			    	
					  	
					  	
					  } */

				})
			});
			//$('#table1 tbody').append(tr);

		}
	</script>
	<script type="text/javascript">
		function showAddPrescription() {

			$(".medicine1 .medicine").focus();

		}
		function addPrescription() {
			//alert("L");

			var medicineName = document.getElementById("medicine").value;

			var medicineQuantity = document.getElementById("qty").value;
			var after = document.getElementById("afterFood").value;
			var before = document.getElementById("beforeFood").value;
if(medicineName!="" && medicineQuantity!="")
	{
	 
			/* declare an checkbox array */
			var chkArray = [];
			/* look for all checkboes that have a class 'chk' attached to it and check if it was checked */
			$(".chk:checked").each(function() {
				chkArray.push($(this).val());
			});
			/* we join the array separated by the comma */
			var timing;
			timing = chkArray.join(',');

			var instructionArray = [];
			$(".instruction:checked").each(function() {
				instructionArray.push($(this).val());
			});
			/* we join the array separated by the comma */
			var instruction;
			instruction = instructionArray.join(',');

			$
					.getJSON(
							'${addMedicineToList}',

							{
								medicineName : medicineName,
								medicineQuantity : medicineQuantity,
								instruction : instruction,
								timing : timing,

								ajax : 'true'

							},
							function(data) {
								//	alert(data);

								$('#medicineTable td').remove();
								$
										.each(
												data,
												function(key, medicineList) {

													var tr = $('<tr></tr>');
													tr.append($('<td> jb</td>')
															.html(key + 1));
													/* 				tr.append($('<td></td>').html(medicineList.time));
																	tr.append($('<td></td>').html(medicineList.date)); */
													tr
															.append($(
																	'<td></td>')
																	.html(
																			medicineList.medicineName));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			medicineList.medicineQuantity));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			medicineList.medicineInstruction));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			medicineList.medicineTiming));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			'<span class="glyphicon glyphicon-trash" style="font-size:24px" onclick="deleteMedicine('
																					+ key
																					+ ');"></span>'));

													$('#medicineTable tbody')
															.append(tr);
												})
							});

			document.getElementById("medicine").value = "";
			document.getElementById("qty").value = "";
	}
else{
	alert("Enter Medicine details");
}
		}

		function deleteMedicine(key) {
			if (confirm("Are you sure delete Medicine!!")) {

				$.getJSON('${removeMedicineFromList}',

				{
					key : key,

					ajax : 'true'

				});

				document.getElementById("medicineTable").deleteRow(key + 1);
			}
		}

		 
	</script>

	<script type="text/javascript">
		var clickCount = 0;
		function getPatientReports() {
			
			
			
			if (clickCount == 0) {
				$('.loader').show();
				var patientId = document.getElementById("patientId").value;
				//alert(patientId);

				$
						.getJSON(
								'${getPatientReportByPatientAndDocId}',

								{
									patientId : patientId,

									ajax : 'true'

								},
								function(data) {
									$('.loader').hide();
									$('#reportTable td').remove();

									var tr = $('<tr></tr>');
									var j = 1;
									tr.append($('<td></td>').html(j));

									/* tr.append($('<td></td>').html('Birth Report Card')); */
									tr
											.append($('<td></td>')
													.html(
															'<a href="#"  onclick="getBabyBornCard('
																	+ patientId
																	+ ')">Birth Report Card</a>'));

									tr.append($('<td></td>').html(
											'Not available'));

									/* 					tr.append($('<td></td>').html('<span class="glyphicon glyphicon-list-alt" onclick="getBabyBornCard('+patientId+')"></span>'));
									 */

									$('#reportTable tbody').append(tr);

									$
											.each(
													data,
													function(key, reportList) {

														tr = $('<tr></tr>');
														tr
																.append($(
																		'<td></td>')
																		.html(
																				++j));

														/* tr.append($('<td></td>').html(reportList.labTestName)); */

														if (reportList.int1 == 0) {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					'<a href="#"   onclick="openReport('
																							+ reportList.reportId
																							+ ', \''
																							+ reportList.reportFileName
																							+ '\', '
																							+ reportList.int1
																							+ ')">'
																							+ reportList.labTestName
																							+ '</a>'));
														}

														/* if(reportList.int1==3)
														{
														tr.append($('<td></td>').html('<a href="#" data-toggle="modal" data-target="#largeModal11"  ><span class="glyphicon glyphicon-list-alt">ddd</span></a>'));
														} */
														/* 	#largeModal11 */
														else {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					'<a href="#" data-toggle="modal" data-target="#myModal10" onclick="openReport('
																							+ reportList.reportId
																							+ ', \''
																							+ reportList.reportFileName
																							+ '\', '
																							+ reportList.int1
																							+ ')">'
																							+ reportList.labTestName
																							+ '</a>'));

														}

														tr
																.append($(
																		'<td></td>')
																		.html(
																				reportList.reportDate));
														$('#reportTable tbody')
																.append(tr);
													})
								});
				clickCount = 1;
			} else {
				clickCount = 0;
			}
		}
	</script>

	<script>
		 /* function openReport(reportId, testName, type) {
		
		    alert("reportId "+reportId);
			var c = document.getElementById("paint");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			var reportUrl = document.getElementById("reportUrl").value;
			alert(reportUrl);
			alert(testName);
			if (type == 0) {

				document.getElementById("reportPdf").data = reportUrl + ""
						+ testName;
			} else {
				document.getElementById("reportImage").src = reportUrl + ""
						+ testName;

				var img = document.getElementById("reportImage");
				ctx.drawImage(img, 0, 0);
			}

		} */
 
		function getBabyBornCard(patientId) {

			
			$.getJSON('${getBabyBornReports}',

			{
				patientid : patientId,

				ajax : 'true'

			}, function(data) {
				//birthReport=data;

				//	alert(data);
				openBornReport(data);
				$('#largeModal11').modal('show');

			});

			/* if(birthReport==null)
			 alert("Report not available"); */

		}

		function openBornReport(bornReportList) {

			document.getElementById('hospitalname').innerHTML = ""
					+ bornReportList.hospitalName;
			document.getElementById("docFName").innerHTML = 'Dr.' +bornReportList.doctorName;

			document.getElementById("docSpec").innerHTML = bornReportList.specialist;

			document.getElementById("dob").innerHTML = bornReportList.dob;
			document.getElementById("motherName").innerHTML = bornReportList.motherName;
			document.getElementById("dobTime").innerHTML = bornReportList.birthTime;
			document.getElementById("birthWeight").innerHTML = bornReportList.birthWeight + 'kilograms';
			document.getElementById("height").innerHTML = bornReportList.length + 'cm';
			document.getElementById("headCircumference").innerHTML = bornReportList.headCircumference;

			document.getElementById("deliveryType").innerHTML = bornReportList.deliveryType;
			document.getElementById("bloodGroup").innerHTML = bornReportList.bloodGroup;

			document.getElementById("sex").innerHTML = bornReportList.sex;
		}

		//Canvas 13-04-2018
 
		function openReport(reportId, testName, type) {

		//alert(type);
			
			//alert("reportId "+reportId);
			var c = document.getElementById("paint");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			var reportUrl = document.getElementById("reportUrl").value;
			
			//alert(reportUrl+" "+testName);
			//alert(type);
			if (type == 0) {

				document.getElementById("reportPdf").data = reportUrl;
						
				$('#myModal11').modal('show');
			} else {
				document.getElementById("reportImage").src = reportUrl+""+testName;
						
				$('#myModal10').modal('show');
				var img = document.getElementById("reportImage");
				ctx.drawImage(img, 0, 0);
			}
			
		}
		var canvas = document.getElementById("paint");
		var ctx = canvas.getContext("2d");
		var lastX;
		var lastY;
		var strokeColor = "red";
		var strokeWidth = 5;
		var mouseX;
		var mouseY;
		var canvasOffset = $("#paint").offset();
		var offsetX = canvasOffset.left;
		var offsetY = canvasOffset.top;
		var isMouseDown = false;

		function handleMouseDown(e) {
			mouseX = parseInt(e.clientX - offsetX);
			mouseY = parseInt(e.clientY - offsetY);

			// Put your mousedown stuff here
			lastX = mouseX - 220;
			lastY = mouseY - 80;
			isMouseDown = true;
		}

		function handleMouseUp(e) {

			mouseX = parseInt(e.clientX - offsetX);
			mouseY = parseInt(e.clientY - offsetY);

			// Put your mouseup stuff here
			isMouseDown = false;
		}

		function handleMouseOut(e) {
			mouseX = parseInt(e.clientX - offsetX);
			mouseY = parseInt(e.clientY - offsetY);

			// Put your mouseOut stuff here
			isMouseDown = false;
		}

		function handleMouseMove(e) {

			mouseX = parseInt(e.clientX - offsetX) - 220;
			mouseY = parseInt(e.clientY - offsetY) - 80;

			// Put your mousemove stuff here
			if (isMouseDown) {
				ctx.beginPath();
				if (mode == "pen") {
					//alert("fg");
					ctx.globalCompositeOperation = "source-over";
					ctx.moveTo(lastX, lastY);
					ctx.lineTo(mouseX, mouseY);
					ctx.stroke();
				} else {
					ctx.globalCompositeOperation = "destination-out";
					ctx.arc(lastX, lastY, 8, 0, Math.PI * 2, false);
					ctx.fill();
				}
				lastX = mouseX;
				lastY = mouseY;
			}
		}

		$("#paint").mousedown(function(e) {
			handleMouseDown(e);
		});
		$("#paint").mousemove(function(e) {
			handleMouseMove(e);
		});
		$("#paint").mouseup(function(e) {
			handleMouseUp(e);
		});
		$("#paint").mouseout(function(e) {
			handleMouseOut(e);
		});

		var mode = "pen";
		$("#pen").click(function() {
			mode = "pen";
		});
		$("#eraser").click(function() {
			mode = "eraser";
		}); 
	</script>
	
	<script type="text/javascript">
	/* function openHistory(openHistory)
	{
		
		if(openHistory==0)
		  $("sectionB").addClass("active in");
	} */
	function getPatientHistory(patientId,appoitId)
	{
		 if($('#activeHistory').val()!='active')
			window.open("${pageContext.request.contextPath}/getPatientHistoryDetails/"+patientId+"/"+appoitId, "_self");
	}	
	$(function() {
	    $("td[colspan=5]").find(".prescrption_D").hide();
	    $("table").click(function(event) {
	        event.stopPropagation();
	        var $target = $(event.target);
	        if ( $target.closest("td").attr("colspan") > 1 ) {
	            $target.slideUp();
	        } else {
	            $target.closest("tr").next().find(".prescrption_D").slideToggle();
	        }                    
	    });
	});
	</script>
	<script>
		function addIndication() {

			//var count=1;
			//var pndtId= document.getElementById("pndtPatientId").value;
			var patientId = document.getElementById("patientId1").value;
			var indication = document.getElementById("indication").value;
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
													
													$('#indicationTable tbody').append(strVar);	
													
												})
												
												
												document.getElementById("numberOfIndication").value = count;

							});

		}
	</script>
	<script>
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
      					
      						document.getElementById("totalChild").value=count;
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


	<script>
		function getAllStateByCountryId(){
			
			var countryId=1;
			
			$.getJSON(
					'${getAllStateByCountryId}',
					{
						countryId : countryId,
						
						ajax : 'true'
					},function(data) {
						$.each(
								data,
								function(key, stateList) {
									

									var html = '<option value="" disabled="disabled" selected >Choose Sate...</option>';
									
									var len = data.length;
									for ( var i = 0; i < len; i++) {
										html += '<option value="' + data[i].stateId + '">'
												+ data[i].stateName + '</option>';
									} 
									html += '</option>';
									$('#stateId').html(html);
									$("#stateId").trigger("chosen:updated");
								})
						
						
						
						
					});
	
		}

</script>

	<script>
   $(function () { $("[data-toggle = 'tooltip']").tooltip(); });
</script>

	<script>
    
   function enableTextArea(){
	  
    var enableTextArea=document.getElementById("diseaseHistorySelect").value;
 
    if(enableTextArea=="1"){
 
    	 $("#diseaseHistory").attr("readonly", false);
    	
    }else{
    	 $("#diseaseHistory").attr("readonly", true);
    }
   }
    </script>
    
    <script type="text/javascript">
function clearFields(){
	
	document.getElementById("medicine").value="";
	document.getElementById("qty").value="";
	document.getElementById("beforeFood").checked=false;
	document.getElementById("afterFood").checked=false;
	document.getElementById("inlineCheckbox1").checked=false;
	document.getElementById("inlineCheckbox2").checked=false;
	document.getElementById("inlineCheckbox3").checked=false;
}
</script>

</body>
</html>
