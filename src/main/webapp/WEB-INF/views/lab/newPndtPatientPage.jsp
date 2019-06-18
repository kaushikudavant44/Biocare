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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">

<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-multiselect.css"
	rel="stylesheet">
</head>
<body>


	<c:url var="addMedicineToList" value="/addMedicineToList" />
	<c:url var="savePndtChildrenDetails" value="/savePndtChildrenDetails" />
	<c:url var="savePndtIndicationDetails"
		value="/savePndtIndicationDetails" />
			<c:url var="getPndtPatientDetails"
		value="/getPndtPatientDetails" />
		
		

	<jsp:include page="../include/labHeader.jsp" />
	<div class="clearfix"></div>
	<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center">
		<h4>Upload Reports</h4>
	</div>
	<div class="container-fluid labelPndt">
	
	
  		
  
 
	
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/labLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">

						<section id="consult">
						<div class="bs-example">
						
							
							<div class="clearfix"></div>
							<hr>
							<ul class="nav nav-tabs newappon">
								<li class="active"><a data-toggle="tab" href="#sectionA">Section
										A : </a></li>
								<li><a data-toggle="tab" href="#sectionB"> Section B :</a></li>
								<li><a data-toggle="tab" href="#sectionC">Section C : </a></li>
								<li><a data-toggle="tab" href="#sectionD">Section D : </a></li>
							</ul>
							<form action="${pageContext.request.contextPath}/savePndtPatientDetails" method="POST">
							<div class="tab-content">
							
								<div id="sectionA" class="tab-pane fade in active">
									<div class="row">
										<h4 class="text-center">To be filled in for all
											Diagnostic Procedures/Tests</h4>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">1. State</label> <select
														class="form-control top-space" name="state" id="stateId">
													<c:forEach items="${stateList}" var="stateList" >
														<option value="${stateList.stateName}">${stateList.stateName}</option>
													</c:forEach>	
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">2. Patient Name</label>
												</div>
												<div class="col-sm-12">
												<div class="col-sm-4">
													<input type="text" class="form-control top-space"
														 placeholder="First Name" name="patientName" id="patientName"
														value="${newPndtPatientDetails.patientName}" readonly></div>
													
													<div class="col-sm-4">
													<input type="text" class="form-control top-space"
														 placeholder="Middle Name" name="mName" id=""
														value="${newPndtPatientDetails.mName}" readonly>
													
													</div>	
														
														<div class="col-sm-4">
														<input type="text" class="form-control top-space"
														 placeholder="Last Name" name="lName" id=""
														value="${newPndtPatientDetails.lName}" readonly></div>
														
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">3. Total Number Of Living
														Children</label>
												</div>
												<div class="col-sm-8">
													<input type="text" class="form-control top-space"
														id="totalChild" name="numberOfChild" placeholder=""
														value="" readonly>
												</div>
												<div class="col-sm-4">
													<input type="button" value="Add Details"
														class="btn btn-info btn-fr-all" data-toggle="modal"
														data-target="#myModal78">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">3(a). Number Of Living Sons
														With Age Of Each Living Son (In Years Or Months)</label>
												</div>
												<div class="col-sm-4">
													<input type="text" class="form-control top-space"
														placeholder="" id="maleChild" name="numberOfMaleChild" value="" readonly>
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">3(b). Number Of Living
														Daughters With Age Of Each Living Daughter (In Years Of
														Months):</label>
												</div>
												<div class="col-sm-4">
													<input type="text" class="form-control top-space"
														placeholder="" value="" id="femaleChild" name="numberOfFemaleChild" readonly>
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">4. Husbands /Wifes /Fathers
														/Mothers Name :</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control" id="relation"
														name="relativeType">
														<option value="husband" name="relation"
															selected="">Husband</option>
														<option value="wife" name="relation"
															>Wife</option>
															<option value="father" name="relation"
															>Father</option>
															<option value="Mother" name="relation"
															>Mother</option>
													</select>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space"
														placeholder="" value="" name="relativeName">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">5. Full Postal Address Of
														The Patients With Contact Number, If Any :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space"
														placeholder="" value="" name="address">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">6(a). Referred By ( Full
														Name And Address Of Doctor(S) /Genetic Counselling Centre)
														:</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space"
														placeholder="" value="" name="refDoctor">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">6(b). Self- Referral By
														Gynaecologist/Radiologist/Registered Medical Practitioner
														Conducting The Diagnostic Procedures:</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space"
														placeholder="" value="" name="selfDoctor">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">7. Last Menstrual Period
														/Weeks Of Pregnancy :</label>
												</div>
												<div class="col-sm-6">
													<input type="text"
														class="form-control form_datetime top-space-large"
														id="nameField" value="" name="lastMenstPeriod"
														placeholder="Last Menstrual Period" onchange="calculateWeeksAndDays()">
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space"
														placeholder="" id="totWeekNDay" name="weeksOfPregnancy" value="" readonly>
												</div>
											</div>
										</div>

									</div>

								</div>
								<div id="sectionB" class="tab-pane fade in">
									<div class="row">
										<h4 class="text-center">To be filled in for performing
											non-invasive diagnostic Procedures/ Tests only)</h4>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">8. Name Of The Doctor
														Performing The Procedure</label> <select
														class="form-control top-space" name="nameOfDoctor" id="nameOfDoctor">
														
														<option>XYZ</option>

													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">9. Indications</label>
												</div>
												<div class="col-sm-8">
													
														<select id="chkveg" multiple="multiple" name="indications">
															<c:forEach items="${pndtIndication}" var="pndtIndication">
															<option
																value="${pndtIndication.indicationId}">
																${pndtIndication.indicationName}</option>
															</c:forEach>
														</select>
													
												</div>
												<!-- <div class="col-sm-4">
													<input type="button" class="btn btn-info btn-fr-all"
														value="Add Indication" onclick="addIndication()">
												</div> -->
											</div>
										</div>
										<!-- <div class="col-sm-12">
											<div class="col-sm-12">
												<table width="100%" border="0" class="indication mar-top"
													id="indicationTable" name="indication">
													<tbody>
														<tr>
															<th>Sr</th>
															<th>Indications</th>
														</tr>

														<tr class="indication1">
															<td>1</td>
															<td>To diagnose intra-uterine and/or ectopic
																pregnancy- and confirm viability</td>
														</tr>
														<tr class="indication1">
															<td>2</td>
															<td>To diagnose intra-uterine and/or ectopic
																pregnancy- and confirm viability</td>
														</tr>
													</tbody>
												</table>
											</div>

										</div> -->
										<div class="clearfix"></div>
										<hr>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">10. Procedures Carried Out
														(Non-Invasive)Non Invasive Ultrasound :</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control" name="nonInvasiveProc"
														id="nonInvasiveUltra" onchange="enableInput()">
														<option value="0">Ultrasound</option>
														<option value="1">Any Other (Specify)</option>
													</select>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control mar-top"
														name="nonInvasiveProc" id="ultraSpecify"
														placeholder="Specify" value="0" disabled="">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">11. Date On Which
														Declaration Of Pregnant Woman/ Person Was Obtained :</label>
												</div>
												<div class="col-sm-12">
													<input type="text"
														class="form-control form_datetime top-space"
														name="pregWomenObtainDate" value="14-03-2019">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">12. Date On Which Procedures
														Carried Out :</label>
												</div>
												<div class="col-sm-12">
													<input type="text"
														class="form-control form_datetime top-space-large"
														name="dateProcCarOut" value="11-03-2019">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">13. Result Of The
														Non-Invasive Procedure Carried Out :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space-large"
														name="resOfNonInvasiveProc" value="">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">14. The Result Of Pre-Natal
														Diagnostic Procedures Was Conveyed To :</label>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space-large"
														name="resOfPreNatalDiagnoProc" value="">
												</div>
												<div class="col-sm-6">
													<input type="text"
														class="form-control top-space form_datetime"
														name="resOfPreNatalDiagnoProc" value="On">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">15. Any Indication For MTP
														As Per The Abnormality Detected In The Diagnostic
														Procedures/Tests :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space"
														name="indicationMTPAbnormal" value="">
												</div>

											</div>
										</div>


									</div>
								</div>
								<div id="sectionC" class="tab-pane fade in">
									<div class="row">
										<h4 class="text-center">To be filled for performing
											invasive Procedures/ Tests only</h4>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label>16. Name Of The Doctor/s
														Performing The Procedure/s:</label> <input type="text"
														class="form-control top-space" id="" name="nameOfDoctor"
														value=" ">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label>17. History Of
														Genetic/Medical Disease In The Family (Specify):</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control top-space" id="genDis"
														onchange="enableGenDis()">
														<option value="0">No</option>
														<option value="1">Yes</option>
													</select>
												</div>
												<div class="col-sm-6">
													<select class="form-control top-space" id="genDisHistory"
														name="genDiseaseHistory" disabled="">
														<option>select</option>
														<option>Clinical</option>
														<option>Bio-chemical</option>
														<option>Cytogenetic</option>
														<option>other(e.g. radiological, ultrasonography,
															etc.)</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">18. Indication/s For The
														Diagnosis Procedure :</label>
												</div>
												<div class="col-sm-4">
													<select class="form-control" name="indicationDiagnos"
														id="indicationDiagnos" onchange="enableDisableContent()">
														<option value="No">No</option>
														<option value="Yes">Yes</option>
													</select>
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">19. Date On Which Consent Of
														Pregnant Woman / Person Was Obtained In Form G Prescribed
														In PC&PNDT Act, 1994:</label>
												</div>
												<div class="col-sm-4">
													<input type="text"
														class="form-control form_datetime top-space" id=""
														name="dateConsentOfPrgWomen" placeholder=""
														value="13-03-2019">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">20. Previous Child/Children
														With:</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control top-space"
														name="indicationDiangoProc" id="prevChildIndication"
														 onchange="enableDisableContent()">
														<option>Not Applicable</option>
														<option>(i) Chromosomal disorders</option>
														<option>(ii) Metabolic disorders</option>
														<option>(iii) Congenital anomaly</option>
														<option>(iv) Mental Disability</option>
														<option>(v) Haemoglobinopathy</option>
														<option>(vi) Sex linked disorders</option>
														<option>(vii) Single gene disorder</option>
														<option value="8">(viii) Any other (specify)</option>
													</select>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space-large"
														name="indicationDiangoProc" id="specifyChildIndication"
														placeholder="Specify" disabled="">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">21. Mother/Father/Sibling
														Has Genetic Disease (Specify) :</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control top-space" name=""
														id="mfsGenDis" onchange="enMFS()">

														<option value="0">Not Known</option>
														<option value="1">Known</option>

													</select>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space-large"
														name="indicationDiangoProc" id="mfsSpecify"
														placeholder="Specify" disabled="">

												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">22. Invasive Procedures
														Carried Out :</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control top-space-large"
														name="invasiveProcCarOut" id="invProcCarOut"
														onchange="enableInvProcCarOut()">
														<option>i. Amniocentesis</option>
														<option>ii. Chorionic Villi aspiration</option>
														<option>iii. Fetal biopsy</option>
														<option>iv. Cordocentesis</option>
														<option value="5">v. Any other (specify)</option>
													</select>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space-large"
														name="invasiveProcCarOut" id="invProcCarOutSpecify"
														placeholder="Specify" disabled="">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">22(a). Any Other (Specify) :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space-large"
														name="indicationDiangoProc" id="" placeholder="Specify">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">23. Any Complication/S Of
														Invasive Procedure(Specify) :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space"
														name="complicationInvasiveProc" id=""
														placeholder="Specify" value="kkkkkkkkkk">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">24. Additional Tests
														Recommended (Please Mention If Applicable) :</label>
												</div>
												<div class="col-sm-6">
													<select class="form-control top-space"
														name="additionalTestRecommended" id="recTest"
														onchange="enableRecTest()">
														<option>(i) Chromosomal studies</option>
														<option>(ii) Biochemical studies</option>
														<option>(iii) Molecular studies</option>
														<option>(iv) Pre-implantation gender diagnosis</option>
														<option value="5">(v) Any other (specify)</option>
													</select>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space"
														name="additionalTestRecommended" id="recTestSpecify"
														placeholder="Specify" value="(i) Chromosomal studies"
														disabled="">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">25. Result Of The
														Procedures/ Tests Carried Out (Report In Brief Of The
														Invasive Tests/ Procedures Carried Out) :</label>
												</div>
												<div class="col-sm-4">
													<input type="text" class="form-control top-space"
														name="resultOfProcedure" id="" placeholder="Specify"
														value="">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">26. Date On Which Procedures
														Carried Out :</label>
												</div>
												<div class="col-sm-12">
													<input type="text"
														class="form-control form_datetime top-space-large"
														name="dateResOfProcedure" id="" placeholder="Specify"
														value="">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">27. The Result Of Pre-Natal
														Diagnostic Procedures Was Conveyed To :</label>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space-large"
														name="invasivePreNatalDiagnoProc" id=""
														placeholder="Specify" value="">
												</div>
												<div class="col-sm-6">
													<input type="text"
														class="form-control form_datetime top-space-large"
														name="invasivePreNatalDiagnoProc" id="" placeholder="on">
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">28. Any Indication For MTP
														As Per The Abnormality Detected In The Diagnostic
														Procedures/Tests :</label>
												</div>
												<div class="col-sm-4">
													<input type="text" class="form-control top-space"
														name="indicationMTPabnormality" id=""
														placeholder="Specify" value="">
												</div>


											</div>
										</div>

									</div>
								</div>
								<div id="sectionD" class="tab-pane fade in">
									<a href="#" class="serchDoc"><span
										class="icon-printer serchDoc pull-right"> print</span></a>
									<div class="row">
										<h4 class="text-center">
											Declaration Of The Person Undergoing <strong>Prenatal
												Diagnostic Test / Procedure</strong>
										</h4>

										<div class="row">

											
												<p>
													I, Mrs./Mr.<input type="text" class="form-control">
													declare that by undergoing <input type="text"
														class="form-control"> Prenatal Diagnostic Test/
													Procedure. I do not want to know the sex of my foetus.
												</p>
												<div class="top-space pull-left">
													<p>
														Date: <input type="text"
															class="form-control form_datetime top-space" value="">
													</p>
												</div>
												<div class="top-space div-sm pull-right mrgntp">Signature/Thump
													impression of the person undergoing the Prenatal Diagnostic
													Test/ Procedure</div>
												<div class="clearfix"></div>
												<hr>
												<h5>In Case of thumb Impression:</h5>
												<p>
													Identified by (Name)<input type="text" class="form-control">Age:<input
														type="text" class="form-control"> Sex:<input
														type="text" class="form-control"> Relation (if
													any):<input type="text" class="form-control">
													Address & Contact No.:
													<textarea type="text" class="form-control" rows="1"></textarea>
													Signature of a person attesting thumb impression: <input
														type="text" class="form-control"><br> Date:<input
														type="text" class="form-control">
												</p>
												<div class="clearfix"></div>
												<hr>
												<div class="text-center">
													<h4 class="text-center">
														Declaration Of Doctor / Person Conducting <strong>Pre
															Natal Diagnostic Procedure / Test</strong>
													</h4>
													<p>
														I,<input type="text" class="form-control">(name of
														the person conducting ultrasonography / image scanning)
														declares that the while conducting ultrasonography /image
														scanning on Ms/Mr<input type="text" class="form-control">
														(name of the pregnant woman or the person undergoing pre
														natal diagnostic procedure/test), I have neither detected
														nor disclosed the sex of her foetus to anybody in any
														manner.
													</p>
													<p>
														Date: <input type="text" class="form-control">
														Signature:<input type="text" class="form-control">
														<input type="text" class="form-control">
													</p>
													<div class="top-space-large mrgntp">Name in Capitals,
														Registration Number with Seal of the
														Gynaecologist/Radiologist/Registered Medical Practitioner
														Conducting Diagnostic procedure.</div>
												</div>
												<div class="clearfix"></div>
											<input type="hidden" value="${newPndtPatientDetails.pndtPatientId}" name="patientId1"
										id="patientId1"> 
										<input type="hidden" value="${userType}" name="patientType"
										id="patientType"> 


										</div>

									</div>
									<p class="text-center mrgntp">
										<input type="submit" class="btn btn-info btn-fr-all"
											value="Submit">
									</p>
								</div>
								
							</div>
</form>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>


	</section>



	<div class="clearfix"></div>



	<div id="myModal78" class="modal fade" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
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
								<!-- <tr>
									<td colspan="3">&nbsp;</td>
								</tr> -->



								<tr>


									 
									<td><select class="form-control" id="gender1"
										name="gender1">
											<option value="0" name="gender" disabled="">Select
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
					<button type="button" class="btn btn-info btn-fr-all"
						onclick="multiFunctionCall()">Update</button>
					<!-- <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button> -->

				</div>



				<!--   </form> -->
				


			


			



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

	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
		<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> --%>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	

	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
		
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script> --%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
	
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/multiselect.js"></script>


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
					function getMaleFemaleChild() {

						var gender = document.getElementById("gender1").value;

						if (gender == "male") {
							male++;

							document.getElementById("maleChild").value = male;
						} else if (gender == "female") {

							female++;
							document.getElementById("femaleChild").value = female;
						}

						var totalCount = parseInt(male) + parseInt(female);
						document.getElementById("totalChild").value = totalCount;
					}
				</script>



	<script type="text/javascript">
		/*
		By Osvaldas Valutis, www.osvaldas.info
		Available for use under the MIT License
		 */

		'use strict';

		;
		(function(document, window, index) {
			var inputs = document.querySelectorAll('.inputfile');
			Array.prototype.forEach
					.call(
							inputs,
							function(input) {
								var label = input.nextElementSibling, labelVal = label.innerHTML;

								input
										.addEventListener(
												'change',
												function(e) {
													var fileName = '';
													if (this.files
															&& this.files.length > 1)
														fileName = (this
																.getAttribute('data-multiple-caption') || '')
																.replace(
																		'{count}',
																		this.files.length);
													else
														fileName = e.target.value
																.split('\\')
																.pop();

													if (fileName)
														label
																.querySelector('span').innerHTML = fileName;
													else
														label.innerHTML = labelVal;
												});

								// Firefox bug fix
								input.addEventListener('focus', function() {
									input.classList.add('has-focus');
								});
								input.addEventListener('blur', function() {
									input.classList.remove('has-focus');
								});
							});
		}(document, window, 0));
	</script>


	<script type="text/javascript">
		function submitReports() {

			if ($('#testId').val() == "" && $("#file-7").val() == "") {

				alert("Select Report File and Test Type");

				$("#sectionC").removeClass("active in ");
				$("#pay").removeClass("active");
				$("#rep").addClass("active");
				$("#sectionB").addClass("active in ");

			} else {
				$("#validation-form").submit();

			}
		}

		/* Mobile */

		function submitReportsMob() {

			if ($('#testIdMob').val() == "" && $("#file-7Mob").val() == "") {

				alert("Select Report File and Test Type");

				$("#tab3").removeClass("active in ");

				$("#tab2").addClass("active in ");

			} else {
				$("#validation-formMob").submit();

			}
		}

		$('.tab-content1').hide();
		//show the first tab content
		$('#tab1').show();

		$('#select-box').change(function() {
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
		var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
				+ d.getDate();
		document.getElementById("currDate").innerHTML = "<strong>Date: </strong>"
				+ strDate;
	</script>
	<script type="text/javascript">
		function getTotalAmount() {

			var amount = $("#amount").val();

			var disc = $("#discount").val();
			var totalAmount = amount - (amount * disc) / 100;
			document.getElementById("totalAmount").value = totalAmount;
		}
	</script>
	<script type="text/javascript">
		function sendInvoice() {

			var patientId = document.getElementById("patientId").value;
			var testId = document.getElementById("testId").value;
			var form = document.getElementById("validation-form");
			var formData = new FormData(form);
			$.getJSON('${sendInvoiceToPatient}', {
				data : formData,
				processData : false,
				contentType : false,

				patientId : patientId,

				testId : testId,

				ajax : 'true'
			}, function(data) {

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

		;
		(function(document, window, index) {
			var inputs = document.querySelectorAll('.inputfile');
			Array.prototype.forEach
					.call(
							inputs,
							function(input) {
								var label = input.nextElementSibling, labelVal = label.innerHTML;

								input
										.addEventListener(
												'change',
												function(e) {
													var fileName = '';
													if (this.files
															&& this.files.length > 1)
														fileName = (this
																.getAttribute('data-multiple-caption') || '')
																.replace(
																		'{count}',
																		this.files.length);
													else
														fileName = e.target.value
																.split('\\')
																.pop();

													if (fileName)
														label
																.querySelector('span').innerHTML = fileName;
													else
														label.innerHTML = labelVal;
												});

								// Firefox bug fix
								input.addEventListener('focus', function() {
									input.classList.add('has-focus');
								});
								input.addEventListener('blur', function() {
									input.classList.remove('has-focus');
								});
							});
		}(document, window, 0));
	</script>

	<script>
		var childsModelList = [];
		<c:forEach items="${pndtPatientDetails.childsModelList}" var="childsModelList">

		var gender = "<c:out value="${childsModelList.gender}"/>";

		var dob = "<c:out value="${childsModelList.dob}"/>";

		childsModelList.push(gender);
		childsModelList.push(dob);

		var strVar = "";
		strVar += "<tr class='childId'>";
		strVar += " <td>" + gender + "<\/td>";
		strVar += " <td>" + dob + "<\/td>";
		strVar += " ";
		strVar += " <\/tr>";

		//	var list = document.getElementsByClassName("childId");

		$('#showChildsTable tbody').append(strVar);

		</c:forEach>

		function addChildInList() {

			var patientId = document.getElementById("patientId1").value;

			var gender = document.getElementById("gender1").value;

			var dob = document.getElementById("dob").value;

			var count;
			$.getJSON('${savePndtChildrenDetails}', {
				patientId : patientId,

				gender : gender,

				dob : dob,

				ajax : 'true'
			}, function(data) {
				$('#showChildsTable td').remove();

				$.each(data, function(key, childsModelList) {

					var strVar = "";
					strVar += "<tr class='childId'>";
					strVar += " <td>" + childsModelList.gender + "<\/td>";
					strVar += " <td>" + childsModelList.dob + "<\/td>";
					strVar += " ";
					strVar += " <\/tr>";
					count = key + 1;
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
		var indicationsModelList = [];
		<c:forEach items="${pndtPatientDetails.indicationsModelList}" var="indicationsModelList">

		var indication = "<c:out value="${indicationsModelList.indications}"/>";

		indicationsModelList.push(indication);

		var strVar = "";
		strVar += "<tr class='indication1'>";

		strVar += "<td>1<\/td>";

		strVar += "<td>" + indication + "<\/td>";

		strVar += " <\/tr>";

		$('#indicationTable tbody').append(strVar);

		</c:forEach>

		function addIndication() {

			//var count=1;
			//var pndtId= document.getElementById("pndtPatientId").value;
			var patientId = document.getElementById("patientId1").value;
			var indication = document.getElementById("indication").value;

			alert("pa" + patientId + "indi" + indication);
			$.getJSON('${savePndtIndicationDetails}', {

				patientId : patientId,

				indication : indication,

				ajax : 'true'
			}, function(data) {
				var count;
				var i = 1;
				$('#indicationTable td').remove();

				$.each(data, function(key, indicationsModelList) {

					var strVar = "";
					strVar += "<tr class='indication1'>";

					count = key + 1;

					strVar += "<td>" + count + "<\/td>";

					strVar += "<td>" + indicationsModelList.indications
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
        
        /*multi select*/
        
        
        $(function() {

        	$('#chkveg').multiselect({

        	includeSelectAllOption: true

        	});

        	$('#btnget').click(function() {

        	alert($('#chkveg').val());

        	})

        	});
        </script>
        <script type="text/javascript">
        
        var availableTags = [];
        
        <c:forEach items="${pndtPatientDetails1}" var="pndtPatientDetails1">
        
        availableTags.push('${pndtPatientDetails1.patientName}');
        
        </c:forEach>
      
        $("#selector").autocomplete({
            source: availableTags
        });

         $('#selector').change(function () {
            alert($('#selector').val());
        }); 
        
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
				
				<script type="text/javascript">
				
				function getPndtPatientData(){
				
					var patientName=document.getElementById("selector").value;
					
					$.getJSON('${getPndtPatientDetails}', {
						
						
						patientName:patientName,
						ajax : 'true'
						
					}, function(data) {
						
						document.getElementById("patientName").value=data.patientName;
						
						document.getElementById("patientId1").value=data.pndtPatientId;
						
					});
					
				}
				</script>
				
       
</body>
</html>
