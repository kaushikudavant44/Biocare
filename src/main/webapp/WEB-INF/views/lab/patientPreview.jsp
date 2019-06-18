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
						
							<div class="col-sm-4">
							
							</div>
							<div class="clearfix"></div>
							<hr>
							<ul class="nav nav-tabs newappon">
								<li class="active"><a data-toggle="tab" href="#sectionA">Section
										A : </a></li>
								<li><a data-toggle="tab" href="#sectionB"> Section B :</a></li>
								<li><a data-toggle="tab" href="#sectionC">Section C : </a></li>
								<li><a data-toggle="tab" href="#sectionD">Section D : </a></li>
							</ul>
							<form action="${pageContext.request.contextPath}/uploadPndtPatientDetails/${pndtPatientDetails.pndtId}" method="POST">
							<div class="tab-content">
							
								<div id="sectionA" class="tab-pane fade in active">
									<div class="row">
										<h4 class="text-center">To be filled in for all
											Diagnostic Procedures/Tests</h4>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">1. State</label> 													
														<input type="text" value="${pndtPatientDetails.state}" readonly >
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
														 placeholder="" name="patientName" id="patientName"
														value="${pndtPatientDetails.patientName}" readonly></div>
														<div class="col-sm-4">
														<input type="text" class="form-control top-space"
														 placeholder="" name="patientName" id="mName"
														value="${pndtPatientDetails.mName}" readonly></div>
														<div class="col-sm-4">
															<input type="text" class="form-control top-space"
														 placeholder="" name="patientName" id="lName"
														value="${pndtPatientDetails.lName}" readonly></div>
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
														value="${pndtPatientDetails.numberOfChild}" readonly>
												</div>
												<div class="col-sm-4">
													<!-- <input type="button" value="Add Details"
														class="btn btn-info btn-fr-all" data-toggle="modal"
														data-target="#myModal78"> -->
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
														placeholder="" id="maleChild" name="numberOfMaleChild" value="${pndtPatientDetails.numberOfMaleChild}" readonly>
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
														placeholder="" value="${pndtPatientDetails.numberOfFemaleChild}" id="femaleChild" name="numberOfFemaleChild" readonly>
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
													<input type="text" value="${pndtPatientDetails.relativeType}" readonly>
												</div>
												<div class="col-sm-6">
													<input type="text" class="form-control top-space"
														placeholder="" value="${pndtPatientDetails.relativeName}" name="relativeName" readonly>
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
														placeholder="" value="${pndtPatientDetails.address}" name="address" readonly>
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
														placeholder="" value="${pndtPatientDetails.refDoctor}" name="refDoctor" readonly>
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
														placeholder="" value="${pndtPatientDetails.selfDoctor}" name="selfDoctor" readonly>
												</div>

											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">7. Last Menstrual Period
														/Weeks Of Pregnancy :</label>
												</div>
												<!-- <div class="col-sm-6">
													<input type="text"
														class="form-control form_datetime top-space-large"
														id="nameField" value="" name="lastMenstPeriod"
														placeholder="Last Menstrual Period" onchange="calculateWeeksAndDays()">
												</div> -->
												<div class="col-sm-6">
													<input type="text" class="form-control top-space"
														placeholder="" id="totWeekNDay" name="weeksOfPregnancy" value="${pndtPatientDetails.weeksOfPregnancy}" readonly>
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
														Performing The Procedure</label> <!-- <select
														class="form-control top-space" name="nameOfDoctor" id="nameOfDoctor">
														
														<option>XYZ</option>

													</select> -->
													<input type="text" value="${pndtPatientDetails.nameOfDoctor}" readonly>
													
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
															<c:choose>
															<c:when test="${pndtIndication.indicationId==pndtPatientDetails.numberOfIndication}">
															<option
																value="${pndtIndication.indicationId}" selected disabled>
																${pndtIndication.indicationName}</option>
															</c:when>
															<c:otherwise>
															<option
																value="${pndtIndication.indicationId}" disabled>
																${pndtIndication.indicationName}</option>
															</c:otherwise>
															</c:choose>
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
												<!-- <div class="col-sm-6">
													<select class="form-control" name="nonInvasiveProc"
														id="nonInvasiveUltra" onchange="enableInput()">
														<option value="0">Ultrasound</option>
														<option value="1">Any Other (Specify)</option>
													</select>
												</div> -->
												<div class="col-sm-6">
													<input type="text" class="form-control mar-top"
														name="nonInvasiveProc" id="ultraSpecify"
														placeholder="Specify" value="${pndtPatientDetails.nonInvasiveProc}" readonly>
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
														name="pregWomenObtainDate" value="${pndtPatientDetails.pregWomenObtainDate}" readonly>
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
														name="dateProcCarOut" value="${pndtPatientDetails.dateProcCarOut}" readonly>
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
														name="resOfNonInvasiveProc" value="${pndtPatientDetails.resOfNonInvasiveProc}" readonly>
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
														name="resOfPreNatalDiagnoProc" value="${pndtPatientDetails.resOfPreNatalDiagnoProc}" readonly>
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
														name="indicationMTPAbnormal" value="${pndtPatientDetails.indicationMTPAbnormal}" readonly>
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
														value="${pndtPatientDetails.nameOfDoctor}" readonly>
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
													<!-- <select class="form-control top-space" id="genDis"
														onchange="enableGenDis()">
														<option value="0">No</option>
														<option value="1">Yes</option>
													</select> -->
													
													<input type="text" value="${pndtPatientDetails.genDiseaseHistory}" readonly> 
												</div>
												<!-- <div class="col-sm-6">
													<select class="form-control top-space" id="genDisHistory"
														name="genDiseaseHistory" disabled="">
														<option>select</option>
														<option>Clinical</option>
														<option>Bio-chemical</option>
														<option>Cytogenetic</option>
														<option>other(e.g. radiological, ultrasonography,
															etc.)</option>
													</select>
												</div> -->
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-8">
													<label for="nameField">18. Indication/s For The
														Diagnosis Procedure :</label>
												</div>
												<div class="col-sm-4">
												<!-- 	<select class="form-control" name="indicationDiagnos"
														id="indicationDiagnos" onchange="enableDisableContent()">
														<option value="No">No</option>
														<option value="Yes">Yes</option>
													</select> -->
													<input type="text" value="${pndtPatientDetails.indicationDiangoProc}" readonly>
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
														value="" readonly>
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
													<!-- <select class="form-control top-space"
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
													</select> -->
													<input type="text" class="form-control top-space-large"
														name="indicationDiangoProc" id="specifyChildIndication"
														placeholder="Specify" value="${pndtPatientDetails.dateConsentOfPrgWomen}" readonly>
												</div>
												<div class="col-sm-6">
													
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
												<!-- <div class="col-sm-6">
													<select class="form-control top-space-large"
														name="invasiveProcCarOut" id="invProcCarOut"
														onchange="enableInvProcCarOut()">
														<option>i. Amniocentesis</option>
														<option>ii. Chorionic Villi aspiration</option>
														<option>iii. Fetal biopsy</option>
														<option>iv. Cordocentesis</option>
														<option value="5">v. Any other (specify)</option>
													</select>
												</div> -->
												<div class="col-sm-6">
													<input type="text" class="form-control top-space-large"
														name="invasiveProcCarOut" id="invProcCarOutSpecify"
														placeholder="Specify" value="${pndtPatientDetails.invasiveProcCarOut}" disabled="" readonly>
												</div>

											</div>
										</div>
										<!-- <div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">22(a). Any Other (Specify) :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space-large"
														name="indicationDiangoProc" id="" placeholder="Specify">
												</div>

											</div>
										</div> -->
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">23. Any Complication/S Of
														Invasive Procedure(Specify) :</label>
												</div>
												<div class="col-sm-12">
													<input type="text" class="form-control top-space"
														name="complicationInvasiveProc" id=""
														placeholder="Specify" value="${pndtPatientDetails.complicationInvasiveProc}" readonly>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="xform-group">
												<div class="col-sm-12">
													<label for="nameField">24. Additional Tests
														Recommended (Please Mention If Applicable) :</label>
												</div>
											<!-- 	<div class="col-sm-6">
													<select class="form-control top-space"
														name="additionalTestRecommended" id="recTest"
														onchange="enableRecTest()">
														<option>(i) Chromosomal studies</option>
														<option>(ii) Biochemical studies</option>
														<option>(iii) Molecular studies</option>
														<option>(iv) Pre-implantation gender diagnosis</option>
														<option value="5">(v) Any other (specify)</option>
													</select>
												</div> -->
												<div class="col-sm-6">
													<input type="text" class="form-control top-space"
														name="additionalTestRecommended" id="recTestSpecify"
														placeholder="Specify" value="${pndtPatientDetails.additionalTestRecommended}"
														disabled="" readonly>
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
														value="${pndtPatientDetails.resultOfProcedure}" readonly>
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
														value="${pndtPatientDetails.dateResOfProcedure}" readonly>
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
														placeholder="Specify" value="${pndtPatientDetails.invasivePreNatalDiagnoProc}" readonly>
												</div>
												<!-- <div class="col-sm-6">
													<input type="text"
														class="form-control form_datetime top-space-large"
														name="invasivePreNatalDiagnoProc" id="" placeholder="on">
												</div> -->

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
														placeholder="Specify" value="${pndtPatientDetails.indicationMTPabnormality}" readonly>
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
											


										</div>

									</div>
									<p class="text-center mrgntp">
										<input type="submit" class="btn btn-info btn-fr-all"
											value="Paste">
									</p>
								</div>
								
							</div>
</form>
						</div>
	</section>					
					</div>
				
				</div>
			</div>
		</div>
	</div>


	</section>



	<div class="clearfix"></div>



	

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


<script type="text/javascript">

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
					
					
					
	
				
       
</body>
</html>
