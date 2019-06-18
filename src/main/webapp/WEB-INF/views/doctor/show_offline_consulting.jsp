<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
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
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
	
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
<link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/videoCall2.css">
           <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />
<style>
.loader {
	border: 16px solid #f3f3f3;
	border-radius: 50%;
	border-top: 16px solid blue;
	border-bottom: 16px solid blue;
	width: 120px;
	height: 120px;
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}

@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform


:

 

rotate


(360
deg
);

 

}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform


:

 

rotate


(360
deg
);

 

}
}
.autocomplete-suggestions {
	border: 1px solid #999;
	background: #fff;
	cursor: default;
	overflow: auto;
	width: 450px !important;
}

.autocomplete-suggestion {
	padding: 10px 5px;
	font-size: 1.2em;
	border-bottom: 1px dashed #999;
	white-space: nowrap;
	overflow: hidden;
}

.autocomplete-selected {
	background: #f0f0f0;
}

.autocomplete-suggestions strong {
	font-weight: normal;
	color: #3399ff;
}

.hidden1,.hidden2 {
	display: none;
}


table.scroll {
     width: 100%;  
    
    
}

table.scroll tbody,
table.scroll thead { display: block; }

 

table.scroll tbody {
width: 100%; 
    max-height:500px;
    overflow-y: auto;
    overflow-x: hidden;
}

  
</style>

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
<body onload="getMedicineName()">

<input type="hidden" id="dcmFileUrl" value="${dcmFileUrl}">
	<c:url var="checkPaymentStatus" value="/checkPaymentStatus" />
	
	<c:url var="addMedicineToList" value="/addMedicineToList" />

	<c:url var="removeMedicineFromList" value="/removeMedicineFromList" />
	<c:url var="getBabyBornReports" value="/getBabyBornReports" />

	<c:url var="getPatientReportByPatientAndDocId"
		value="/getPatientReportByPatientAndDocId" />

	<c:url var="getPatientHistoryByPatientId"
		value="/getPatientHistoryByPatientId" />
		
		<c:url var="savePndtIndicationDetails"
		value="/savePndtIndicationDetails" />

<c:url var="submitConsultingPaymentByDoctor"
		value="/submitConsultingPaymentByDoctor" />

<c:url var="savePndtChildrenDetails"
		value="/savePndtChildrenDetails" />


	<c:url var="getFrequentlyUsedMedByDoctorId"
		value="/getFrequentlyUsedMedByDoctorId" />
	<c:url var="getPatientConsultedHistory"
		value="/getPatientConsultedHistory" />
	<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />
		
<c:url var="sendMessageToPatient" value="/sendMessageToPatient" />
	<c:url var="sendVideoCallToPatient" value="/sendVideoCallToPatient" />

	<c:url var="addDoctorVideoDetails" value="/addDoctorVideoDetails" />


	<c:url var="addDoctorAudioDetails" value="/addDoctorAudioDetails" />

<c:url var="updateVideoBypatientIdAndstatus" value="/updateVideoBypatientIdAndstatus" />

<c:url var="updateAudioBypatientIdAndstatus" value="/updateAudioBypatientIdAndstatus" />
<c:url var="getAllLabTests" value="/getAllLabTests" />
<c:url var="getLabByCityAndTests" value="/getLabByCityAndTests" />
<c:url var="saveTestsSuggestion" value="/saveTestsSuggestion" />
<c:url var="getSuggestLabTestFromDoctor" value="/getSuggestLabTestFromDoctor" />

 

	<jsp:include page="../include/doctorHeader.jsp" />
	
		
	
	
	
	<input type="hidden" id="url" value="${url}">
	<div class="clearfix"></div>
	<section class="doc_login inssurance_buy  consultpg-displ">
	<div class="dashboard_nm text-center">
		<h4>Consult Patient</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/leftmenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">

						<%-- <c:set var="class1" value="${openHistory}" />
						<c:set var="class2" value="${openProfile}" />
						<c:set var="class3" value="${activeLab}" />
						<c:set var="class4" value="${activeConsulting}" />
						<c:set var="class5" value="${activeConsultingHistory}" />
 --%>
						<!-- <input type="hidden" value="activeHistory" id="activeHistory"> -->
<input type="hidden" name="doctorFees" id="doctorFees" value="${sessionScope.doctorDetails.fees}">
						<section id="consult">
						<div class="bs-example">
							<ul class="nav nav-tabs consult_patient_tab">
								<li class="active"><a data-toggle="tab" href="#sectionA"
									id="patInfo" onclick="showSecA(1)">Info</a></li>
								<li><a data-toggle="tab" href="#sectionB"
									onclick="getPatientHistory(${patientDetails.patientId}, ${appoitId}); showSecA(2);">History</a></li>
							    <%--  <c:if test="${sessionScope.radiologist=='Radiologist'}">
							    	<li><a data-toggle="tab" href="#sectionF">PNDT Details </a></li>
							  </c:if> --%>
							    
							    
								<li><a data-toggle="tab" href="#sectionC"
									onclick="getPatientReports(); showSecA(3)">Reports</a></li>
								<li><a data-toggle="tab" href="#sectionD"
									onclick="showSecA(4);">Consult</a></li>
								<li><a data-toggle="tab" href="#sectionE"
									onclick="getPatientConsultedHistory(${patientDetails.patientId});showSecA(5);">Consult
										History</a></li>
								
								<!--<li><a data-toggle="tab" href="#sectionE">Labs Reports</a></li>-->

							</ul>
							<div class="tab-content">
								<div id="sectionA" class="tab-pane fade in active">
									<div class="row">
										<%-- <div class="col-md-3 col-sm-3">

											<div class="patinet-pic">
												<img src="${patientProfile}${patientDetails.profilePhoto}"
													class="img-responsive" alt="patinet pic">
											</div>
										</div> --%>
										<div class="col-lg-9 col-md-12 col-sm-9">
											<b><p>
													Patient Name : <span> ${patientDetails.fName}
														${patientDetails.mName} ${patientDetails.lName}</span>
												</p></b>
											<ul class="patinet-info">
												<li>DOB:<span> ${patientDetails.birthDate}</span></li>
												<li>Blood Group: <span>
														${patientDetails.bloodGroup}</span></li>
												<li>Sex: <span> ${patientDetails.gender} </span></li>

											</ul>
											<ul class="patinet-info">
												<li>City: <span> ${patientDetails.string1} </span></li>
												<li>Phone No: <span>${patientDetails.contactNo}
												</span></li>
												<li>Email: <span class="font-style-normal">${patientDetails.email} </span></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="sectionB" class="tab-pane fade">

									<!-- <div class="tab-content"> -->

									<div class="doc_availble dr-site">
									<div role="tabpanel" class="tab-pane fade in active"
										id="profile">
										<div class="panel-group" id="accordion" role="tablist"
											aria-multiselectable="true">
											<%-- <form
													action="${pageContext.request.contextPath}/submitPatientPersonalHistoryRegProcess"
													method="POST"> --%>
											<div class="panel-group" id="accordion">
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
														<textarea name="Chief" id="complaints" disabled="disabled">${patientHistoryChiefComplaints.complaints}</textarea>
													</div>
												</div>
											</div>
											</div>
											<div class="panel-group" id="accordion">
											<div class="panel panel-default">
												<div class="panel-heading" role="tab" id="headingTwo">
													<h4 class="panel-title">
														<a  role="button" data-toggle="collapse"
															data-parent="#accordion" href="#collapseTwo"
															aria-expanded="false" aria-controls="collapseTwo">
															Past History </a>
													</h4>
												</div>
												<div id="collapseTwo" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="headingTwo">
													<div class="panel-body" >
														<strong>History of Past illness like:</strong>

														<div class="cont_blk past_history" id="pastHistoryIllnessDiv">
															<%-- <c:forEach items="${patientHistoryIllnessList}"
																var="patientHistoryIllnessList" varStatus="count">
																<c:choose>


																	<c:when test="${count.index%2==0}">
																		<span class="input input--nao">
																			<div class="gender_sec">
																				<div class="checkbox">
																	</c:when>
																</c:choose>




																<label><input type="checkbox" name="illness"
																	checked="checked" id="illnessName" disabled="disabled">${patientHistoryIllnessList.illnessName}</label>
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
													</c:forEach> --%>

												</div>
											</div>

										</div>
									</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingThree">
											<h4 class="panel-title">
												<a role="button" data-toggle="collapse"
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
													<textarea name="Maritalstatus" id="maritalStatus"
														disabled="disabled">${patientPersonalHistory.maritalStatus}</textarea>
												</div>
											 
												<div class="clearfix"></div>
												<hr>
												<strong>2. Occupation (nature and environment job)
													and education, unemployment</strong>
												<textarea name="Occupation" id="occupation"
													disabled="disabled">${patientPersonalHistory.occupation}</textarea>
												<hr>
												<strong>3. Income (asked indirectly) and social
													status</strong>
												<textarea name="Income" id="anualIncome" disabled="disabled">${patientPersonalHistory.anualIncome}</textarea>
												<hr>
												<strong>4. Addiction (tea, coffee, smoking,
													alcoholism, substance abuse e.g chewing tobacco, ganja,
													heroin; try to estimate the amount of consumption of
													tobacco or alcohol)</strong>
												<textarea name="Addiction" id="addiction"
													disabled="disabled">${patientPersonalHistory.addiction}</textarea>
												<hr>
												<strong>5. Dietary habit(for diagnosis of
													avitaminosis, malnutrition, obesity)</strong>
												<textarea name="Dietary" id="dietaryHabits"
													disabled="disabled">${patientPersonalHistory.dietaryHabits}</textarea>
												<hr>
												<strong>6. History of Contraception</strong>
												<textarea name="Contraception" id="historyOfConterception"
													disabled="disabled">${patientPersonalHistory.historyOfConterception}</textarea>
												<hr>
												<strong>7. High Risk behaviour (e.g IV drug abuse,
													multiple sexual partner, homosexuality etc)-important in
													hepatitis B or C infection, AIDS and SBE.</strong>
												<textarea name="HighRiskbehaviour" id="highRiskBehaviour"
													disabled="disabled">${patientPersonalHistory.highRiskBehaviour}</textarea>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingSix">
											<h4 class="panel-title">
												<a  role="button" data-toggle="collapse"
													data-parent="#accordion" href="#collapseSix"
													aria-expanded="false" aria-controls="collapseSix">
													Family History </a>
											</h4>
										</div>
										<div id="collapseSix" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingSix">
											<div class="panel-body">

												<textarea name="FamilyHistory" id="familyHistory"
													disabled="disabled">${patientFamilyHistory.familyHistory}</textarea>


											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingFour">
											<h4 class="panel-title">
												<a role="button" data-toggle="collapse"
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
													<textarea name="Treatment" id="treatmentReceived"
														disabled="disabled">${patientTreatementHistoryp.treatmentReceived}</textarea>
													<div class="clearfix"></div>
													<hr>
													<strong>2.Any H/O drug allergy or reactions.</strong>
													<textarea name="drugallergy" id="allergyReactions"
														disabled="disabled">${patientTreatementHistoryp.allergyReactions}</textarea>
													<div class="clearfix"></div>
													<hr>
													<strong>3.Any surgical intervention or H/O
														accidents in significant past.</strong>
													<textarea name="surgicalintervention"
														id="surgicalIntervention" disabled="disabled">${patientTreatementHistoryp.surgicalIntervention}</textarea>
													<div class="clearfix"></div>
													<hr>
													<strong>4. Prolonged use of oral contraceptives
														(may precipitate CVA), penicillamine(used in wilson's
														disease; may develop nephrotic syndrome), vitamin C (may
														produce oxalate stone) etc.</strong>
													<textarea name="contraceptives" id="useOralContraceptives"
														disabled="disabled">${patientTreatementHistoryp.useOralContraceptives}</textarea>
													<div class="clearfix"></div>
													<hr>
													<strong>5. Blood transfusion</strong>

													<textarea name="Bloodtransfusion" id="bloodTransfusion"
														disabled="disabled">${patientTreatementHistoryp.bloodTransfusion}</textarea>
													<div class="clearfix"></div>
													<hr>
													<strong>6. Intake of NSAID (may produce acute
														gastric erosion, NSAID-induced asthma etc.)</strong>

													<textarea name="Intake" id="intakeNsaid"
														disabled="disabled">${patientTreatementHistoryp.intakeNsaid}</textarea>

													<div class="clearfix"></div>
													<hr>
													<strong>7. Regular user of oral contraceptives,
														vitamins, laxatives, sedatives or herbal remedies.</strong>

													<textarea name="contraceptives"
														id="regularUsezoralContraceptives" disabled="disabled">${patientTreatementHistoryp.regularUsezoralContraceptives}</textarea>

													<div class="clearfix"></div>
												</div>

											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingFive">
											<h4 class="panel-title">
												<a role="button" data-toggle="collapse"
													data-parent="#accordion" href="#collapseFive"
													aria-expanded="false" aria-controls="collapseFive">
													Psychological History </a>
											</h4>
										</div>
										<div id="collapseFive" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingFive">
											<div class="panel-body">
												<textarea name="PsychologicalHistory"
													id="psychologicalHistory" disabled="disabled">${patientPsychologicalHistory.psychologicalHistory}</textarea>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingFive">
											<h4 class="panel-title">
												<a role="button" data-toggle="collapse"
													data-parent="#accordion" href="#collapseSeven"
													aria-expanded="false" aria-controls="collapseSeven">
													Menstrual and obstetric History </a>
											</h4>
										</div>
										<div id="collapseSeven" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingSeven">
											<div class="panel-body">
												<strong>1.Menarche.</strong>
												<textarea name="Menarche" id="menarche" disabled="disabled">${menstrualObstetricHistory.menarche}</textarea>
												<hr>
												<strong>2.Duration of the period.</strong>
												<textarea name="durationperoid" id="durationOfPeriod"
													disabled="disabled">${menstrualObstetricHistory.durationOfPeriod}</textarea>
												<hr>
												<strong>3.Quantity of blood loss(usually assessed
													by number of pads consumed or passage of clots).</strong>
												<textarea name="bloodloss" id="qtyOfBloodLoss"
													disabled="disabled">${menstrualObstetricHistory.qtyOfBloodLoss}</textarea>
												<hr>
												<strong>4.Dysmenorrhoea, amenorrhoea or other
													menstrual irregularities.</strong>
												<textarea name="Dysmenorrhoea" id="menstrualErregularities"
													disabled="disabled">${menstrualObstetricHistory.menstrualErregularities}</textarea>
												<hr>
												<strong>5.Date of last menstrual period.</strong>
												<textarea name="menstrual" id="dateOfLastPeriod"
													disabled="disabled">${menstrualObstetricHistory.dateOfLastPeriod}</textarea>
												<hr>
												<strong>6.Menopause, post-menopausal bleeding.</strong>
												<textarea name="Menopause" id="menopause"
													disabled="disabled">${menstrualObstetricHistory.menopause}</textarea>
												<hr>
												<strong>7.Obstetric history: </strong>
												<div class="clearfix"></div>
												<strong>a) No.of pregnancies</strong>
												<textarea name="pregnancies" id="noOfPregnancies"
													disabled="disabled">${menstrualObstetricHistory.noOfPregnancies}</textarea>
												<hr>
												<strong> b) Outcome of pregnancies : H/O abortions
													or carried to term:live birth (male/female)</strong>
												<textarea name="Outcomepregnancies"
													id="outcomeOfPregnancies" disabled="disabled">${menstrualObstetricHistory.outcomeOfPregnancies}</textarea>
												<hr>
												<strong>c) Complications during pregnancy (e.g
													hypertension, gestational diabetes mellitus)</strong>
												<div class="cont_blk past_history">
													<textarea name="Complicationspregnancy"
														id="complicationsDuringPregnancies" disabled="disabled">${menstrualObstetricHistory.complicationsDuringPregnancies}</textarea>
												</div>
												<div class="clearfix"></div>
												<hr>
												<strong> d) Mode of delivery (Vaginal , foreeps,
													caesaream)</strong>
												<textarea name="Modedelivery" id="made_of_delivery"
													disabled="disabled">${menstrualObstetricHistory.made_of_delivery}</textarea>
												<hr>
												<strong> e) Last child birth</strong>
												<textarea name="Lastbirth" id="last_child_birth"
													disabled="disabled">${menstrualObstetricHistory.last_child_birth}</textarea>

											</div>
										</div>
									</div>
									<div class="clearfix"></div>
									
									
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

							

								<input type="hidden" value="${reportUrl}" id="reportUrl">
								<div class="table-responsive">
								 <input type="text" id="reportTableSearch" onkeyup="searchData()" class="form-control search" placeholder=" Search" style="float: right; width: 300px">
									<div class="clearfix"></div>
									<hr>
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

						
							<!-- <a href="#" data-target="#largeModal11" data-toggle="modal"
								class="history_sbmt">submit</a> -->

						</div>


						<div id="sectionD" class="tab-pane fade">
							<form id="drconsult"
								action="${pageContext.request.contextPath}/submitDoctorPatientMeeting"
								method="post">


								<input type="hidden" name="appointId" id="appointId"
									value="${appoitId}">
								<div class="form-group">
									<label for="staticEmail" class="col-sm-3 col-form-label">Patient
										Problem :</label> <input type="text" class="" id="patientProblem"
										placeholder="Enter patient problem" name="patientProblem" 
										required>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-sm-3 col-form-label">Discussion
										:</label>
									<textarea class="" id="discussion"
										placeholder="Enter Discussion" name="discussion" rows="2"
										required></textarea>
								</div>

								<div class="form-group">
									<label for="staticEmail" class="col-sm-3 col-form-label">Special
										Instruction :</label>
									<textarea class="" id="specInstuction"
										placeholder="Enter Special Instuction" name="specInstuction"
										rows="2" required></textarea>
								</div>
								<div class="form-group">
									<input type="button" value="Add Prescription"
										class="btn btn-info btn-fr-all" data-toggle="modal"
										data-target="#largeModal" onclick="showAddPrescription()">
										
										<input type="button" value="Suggest Tests"
										class="btn btn-info btn-fr-all" data-toggle="modal"
										data-target="#labTestModal">
										
									 
								</div>
								<div class="form-group">
									<div class="table-responsive">
										<table width="100%" border="0"
											class="tbl table table-bordered table table-hover"
											id="medicineTable"  style="display: none">
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
										name="patientId" id="patientId"> <input type="hidden"
										value="${patientDetails.email}" name="email" id="email">
									<input type="hidden" value="${doctorDetails.doctorId}"
										name="doctorId" id="doctorId"> <input type="hidden"
										value="${doctorDetails.fName}" name="fName" id="fName">
									<!--*****  Patient Id Hardcoded ****** -->
<input type="hidden" value="${hospitalId}" name="hospitalId">
									<input type="button" value="Submit"
										class="btn btn-info btn-fr-all" onclick="checkPaymentStatus1()">
								</div>
								
							</form>
						</div>
						<div id="sectionE" class="tab-pane fade">
							<div class="table-responsive consult_hist">
								<table class="table table-striped table-bordered table-hover fixed_headers" width="100%" id="consultHistory">
									<thead>
										<tr class="first-tbl-bor">
											<th>Sr. No.</th>
											<th>Date</th>
											<th>Time</th>
											<th>Details</th>
											<th>Instruction</th>
											<th>View</th>
										</tr>
									</thead>
									<tbody id="consHist">
										 
									 
							</tbody>
							</table>

						</div>
					</div>
				</div>
				<div class="clearfix"></div>

			</div>
	</section>

	<c:if test="${virtual==1}">
	<div class="Fixed_calling-icon" id="virtualBtn">
		<div class="content_img">
			<img src='${pageContext.request.contextPath}/resources/images/video_b.png'
				class="img-responsive show_hide" alt="video call"
				onclick="videoCallToPatient()"<%--  onclick="makeCall(${patientDetails.patientId})" --%>>
			<input type="hidden" id="firstUrl">
			<div class="video1">Make a video call to patient.</div>
		</div>
		<%-- <div class="content_img">
			 <img src='${pageContext.request.contextPath}/resources/images/call_b.png' class="img-responsive show_hide1" alt="chat call" onclick="audioCall(${patientDetails.patientId})">
			<div>Make a audio call to patient.</div>

		</div>  --%>
		<div class="content_img">
		<input id="txtLogin"  type="hidden" value="Dr. ${sessionScope.doctorDetails.fName} ${sessionScope.doctorDetails.lName}" class="loginInput"/>
		 
			 <img src='${pageContext.request.contextPath}/resources/images/chat_b.png' class="img-responsive show_hide1 loginInput" alt="chat call" onclick="startChatting();">
			
			<div>Chat With patient.</div>
			<input type="hidden" id="patientName" value="${patientDetails.fName} ${patientDetails.lName}">
	<input type="hidden" id="doctorName" value="${sessionScope.doctorDetails.fName} ${sessionScope.doctorDetails.lName}">
														 
		</div>
		
		</div>
		</c:if>
		
	
		 

	
	<div class="clearfix"></div>

</div>
</div>
</div>
</div>
</div>
<!-- <div class="bs-example hidden1" id="videoCallDiv">
		<div id="lobipanel-constrain-size" class="panel panel-primary">
			<div class="panel-heading">
				<div class="panel-title">
					<a class="pointer"><span
						class="glyphicon glyphicon-remove"></span></a> Video Calling
				</div>
			</div>
			<div class="panel-body videoCalling">
				<div class="tabl">
		<div class="Row">
			<div class="ri">
				<table style="width: 100%;">
					<tr>
						<td style="width: 20%;">

							<div class="videoContainer">
								<video id="localVideo" 
									oncontextmenu="return false;"></video>
								<div id="localVolume" class="volume_bar"></div>
							</div>

							<div id="remotes" style="margin-top: 5px;"></div>
							<div class="iconsBlk">
						    	<a href="#" class="endCall" onclick="endVideoCall1()"><span class="flaticon-phone"></span></a>
						    	<a href="#" class="recieveCall"><span class="flaticon-phone-hang-up"></span></a>
						    </div>
						</td>

					</tr>
				</table>

				<br>

			</div>
 
		</div>
	</div>
			</div>
		</div>
	</div>
	 
      
 -->
</section>

 
	<jsp:include page="../include/footer.jsp" />
 
<div id="largeModal" class="modal fade bs-example-modal-md prescription_mod" tabindex="-1" role="dialog" style="margin-top: 50px">
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
								<p id="outputcontent"></p>
							</div>
						</div>
						<div class="form-group row">
							<label for="continuty" class="col-sm-4 col-form-label">Quantity
								:</label>
							<div class="col-sm-8">
								<input type="text" class="" id="qty"
									onkeypress='return IsNumeric(event);' min="10" maxlength="13">
							</div>
						</div>

						<div class="form-group row">
							<label for="staticEmail" class="col-sm-4 col-form-label">Instructions
								:</label>
							<div class="col-sm-8">
								<label class="checkbox-inline"> <input type="radio"
									name="instruction" id="beforeFood" value="Before food"
									class="instruction"> Before food
								</label> <label class="checkbox-inline"> <input type="radio"
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
								</label> <label class="checkbox-inline"><input type="checkbox"
									id="inlineCheckbox3" value="Night" class="chk"
									name="timingCheck"> Night
								</label>
							</div>
						</div>
						



					</form>
				</div>
				<div class="modal-footer">
				
				<input type="button" value="Clear"
						class="btn btn-info btn-fr-all" data-toggle="modal"
						onclick="clearFields()">
					<input type="button" value="Add Prescription"
						class="btn btn-info btn-fr-all" data-toggle="modal"
						onclick="addPrescription()">
					<!-- <input
						type="button" value="Submit" class="btn btn-info"
						data-toggle="modal" data-target="#largeModal"
						onclick="submitPrescription()"> -->
				</div>
			</div>
		</div>
		
	</div>


<div id="labTestModal" class="modal fade bs-example-modal-md prescription_mod" tabindex="-1" role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clearFields()">&times;</button>
					<h4 class="modal-title">Suggest Lab Tests</h4>
				</div>
				<div class="modal-body">
					 
						<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Tests :</label>
							<div class="col-sm-8 medicine1">
								<select class="multiSelect" multiple="multiple"  id="testId" name="testId" multiple="multiple">
					      		    <c:forEach items="${labTestsList}" var = "labTestsList">
					      		      	 
      <option value="${labTestsList.labTestId}">${labTestsList.labTestName}</option>    

</c:forEach>
					      		</select>
							</div></div>
							<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label"></label>
							<div class="col-sm-8 medicine1" id="ref">
								 <a href="#" onclick="getLabByTests()">Refer a Lab</a>
							</div>
						</div>
						<div id="labDetails" style="display:none">
						  <table id="labDetailsTable" border="0" style="border-style: hidden" class="scroll">  
						 
						 <!-- <thead>
						 <tr>
						 <th>Lab Name</th>
						 <th>Address</th>
						 <th>Tests</th>
						 <th>Action</th>
						 </tr>
						 </thead> -->
						   <tbody>
   
  
						   </tbody>     
						          </table> 
						           
					 
</div>
					 
				</div>
				<div class="modal-footer">
				
				<input type="button" value="Suggest"
						class="btn btn-info btn-fr-all" data-dismiss="modal"
						onclick="saveTestsSuggestion()">
					 
					 
				</div>
			</div>
		</div>
		
	</div>
	
	
	
	
	<div id="viewLabTestModal" class="modal fade bs-example-modal-md prescription_mod" tabindex="-1" role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clearFields()">&times;</button>
					<h4 class="modal-title">Suggested Lab Tests</h4>
				</div>
				<div class="modal-body">
					 <div id="suggestedTestDiv" style="display:none">
						<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Suggested Tests :</label>
							<div class="col-sm-8 medicine1">
								 <p id="suggestedLabTest"> </p>
							</div></div>
							 
							 
							 <div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Referred Lab :</label>
							<div class="col-sm-8 medicine1">
								 <p id="referredLab"></p>
							</div></div>
							 </div>
						<div id="emptyLabTestDiv">
						    <div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Not Suggested Tests</label>
							 </div>
</div>
					 
				</div>
				 
			</div>
		</div>
		
	</div>
	
	
	

	<div class="lab_img">
		<div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">View Reports</h4>
					</div>
					<div class="modal-body">
						<div id="sketch">
						
				<canvas id="paint" width="980" height="850"></canvas> 
						
							<img id="reportImage" src="" class="img-responsive"
								alt="Report not Available">
							
							
							<p class="text-center">
								<a href="#" id="pen11" onclick="selectPen()"><span class="fa fa-pencil" ></span>Pen</a> <a
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
							<object id="reportPdf" data="" type="application/pdf"></object>
						</p>

					</div>
				</div>

			</div>
		</div>
		
		
		<!--  -->
		 
		
		
		<!--  -->
		 <!-- Modal content-->
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
	
	
  
 
	 
			
	<!-- Close model --> 
	




	<!-- Bootstrap core JavaScript================================================== -->


	<script type="text/javascript">
            

            function copyToClipboard(element) {
              var $temp = $("<input>");
              $("body").append($temp);
              $temp.val($(element).text()).select();
              document.execCommand("copy");
              $temp.remove();
              alert("Link copied!");
            }
 
        </script>

	 
 
	
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
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
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
      					//	 $('#showChildsTable td').remove();
      						
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
                    	alert("hii close");
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
		$('#myTabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>


	<script>
	$(function() {
	    $("td[colspan=3]").find("p").hide();
	    $(".collapse").click(function(event) {
	        event.stopPropagation();
	        var $target = $(event.target);
	        if ( $target.closest("td").attr("colspan") > 1 ) {
	            $target.slideUp();
	        } else {
	            $target.closest("tr").next().find("td").slideToggle();
	        }                    
	    });
	});
</script>
	<script>
		/* $('#datetimepicker1').datetimepicker({
			format : 'DD/MM/YYYY'
		});
		$('.adult_b').datetimepicker({
			format : 'DD/MM/YYYY'
		}); */
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
		function showAddPrescription() {
			
			$(".medicine1 .medicine").focus();

		}
		function addPrescription() {
			//alert("L");
$("#medicineTable").show();
$(".medicine1 .medicine").focus();
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
	$(".medicine1 .medicine").focus();
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
									var j = 0;
							 

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

														 

														if (reportList.fileType == 0) {
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					'<a href="#"   onclick="openReport('
																							+ reportList.reportId
																							+ ', \''
																							+ reportList.fileName
																							+ '\', '
																							+ reportList.patientId
																							+  ', '
																							+ reportList.fileType
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
																							+ reportList.fileName
																							+ '\', '
																							+ reportList.patientId
																							+  ',' 
																							+ reportList.fileType
																							+ ')">'
																							+ reportList.labTestName
																							+ '</a>'));

														}
														
														tr.append($('<td></td>')
																		.html(
																				reportList.date));
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

		
		var canvas = document.getElementById("paint");
		var ctx = canvas.getContext("2d");
			
		function openReport(reportId,fileName,patientId,type) {
			var originalModal11 = $('#myModal11').clone();
			var originalModal10 = $('#myModal10').clone();
			
			
			var dcmUrl=document.getElementById("dcmFileUrl").value;
			
			//Canvas 13-04-2018
 			
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			var reportUrl = document.getElementById("reportUrl").value;
			var host= window.location.hostname;
			if (type == 0) {

				$('#myModal11').remove();
				 var myClone = originalModal11.clone();
				    $('body').append(myClone);
				document.getElementById("reportPdf").data = reportUrl+""+patientId+"/reports/"+fileName;
						
				$('#myModal11').modal('show');
			}else if (type ==2) {
				window.open('${pageContext.request.contextPath}/showDcmViewer?input='+location.protocol+'//'+host+'/images/patient/'+patientId+"/reports/"+fileName, '_blank'); 

			}else if(type==3){
				
				var fileArray= fileName.split(',');
				
				
				var fileList='';
				fileArray.forEach(function(file,index, array) {
					
				
				    if (index === array.length - 1){ 

				    	fileList +="file%3D"+file+"&dwvReplaceMode=void";
					    console.log(file);
				    }else{
				    	
				    	fileList +="file%3D"+file+"%26";
					    console.log(file);
				    }


				});
				
				var protocol = location.protocol;
				var proto = protocol.substring(0, protocol.length - 1);
				var url=proto+'%3A%2F%2F'+host+'%2Fimages%2Fpatient%2F'+patientId+'%2Freports'+'%2F%3F'+fileList ;

				window.open('${pageContext.request.contextPath}/showDcmViewer?input='+url, '_blank'); 

				
			}else if (type == 8) {

				$('#myModal10').remove();
				 var myClone = originalModal10.clone();
				    $('body').append(myClone);
				document.getElementById("reportImage").src = fileName;
						
				$('#myModal10').modal('show');
				var img = document.getElementById("reportImage");
				ctx.drawImage(img, 0, 0);
			}  else {
				
				$('#myModal10').remove();
				 var myClone = originalModal10.clone();
				    $('body').append(myClone);
				document.getElementById("reportImage").src = reportUrl+""+patientId+"/reports/"+fileName;
						
				$('#myModal10').modal('show');
				var img = document.getElementById("reportImage");
				ctx.drawImage(img, 0, 0);
			}
			
		}
		
	 
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
			
			
			alert("mouse down");
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
					
					alert("fg");
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
	
		$("#pen11").click(function() {
			alert("hicc");
			mode = "pen";
		});
		$("#eraser").click(function() {
			mode = "eraser";
		}); 
		
	
	 function selectPen(){
			alert("cdc");
			mode = "pen";
		
	 } 
		
		
		
		
		
	</script>

<!-- <script type="text/javascript">

var div=document.getElementById("sketch");
var canvas = document.createElement('canvas');

div.appendChild(canvas)
var context = canvas.getContext("2d");

/* context = canvas.getContext("2d"); */
context.strokeStyle = "#ff0000";
context.lineJoin = "round";
context.lineWidth = 5;

var clickX = [];
var clickY = [];
var clickDrag = [];
var paint;

/**
 * Add information where the user clicked at.
 * @param {number} x
 * @param {number} y
 * @return {boolean} dragging
 */
function addClick(x, y, dragging) {
    clickX.push(x);
    clickY.push(y);
    clickDrag.push(dragging);
}

/**
 * Redraw the complete canvas.
 */
function redraw() {
    // Clears the canvas
    context.clearRect(0, 0, context.canvas.width, context.canvas.height);
	alert("cc");
    for (var i = 0; i < clickX.length; i += 1) {
        if (!clickDrag[i] && i == 0) {
            context.beginPath();
            context.moveTo(clickX[i], clickY[i]);
            context.stroke();
        } else if (!clickDrag[i] && i > 0) {
            context.closePath();

            context.beginPath();
            context.moveTo(clickX[i], clickY[i]);
            context.stroke();
        } else {
            context.lineTo(clickX[i], clickY[i]);
            context.stroke();
        }
    }
}

/**
 * Draw the newly added point.
 * @return {void}
 */
function drawNew() {
    var i = clickX.length - 1
    if (!clickDrag[i]) {
        if (clickX.length == 0) {
            context.beginPath();
            context.moveTo(clickX[i], clickY[i]);
            context.stroke();
        } else {
            context.closePath();

            context.beginPath();
            context.moveTo(clickX[i], clickY[i]);
            context.stroke();
        }
    } else {
        context.lineTo(clickX[i], clickY[i]);
        context.stroke();
    }
}

function mouseDownEventHandler(e) {
    paint = true;
    var x = e.pageX - canvas.offsetLeft;
    var y = e.pageY - canvas.offsetTop;
    if (paint) {
        addClick(x, y, false);
        drawNew();
    }
}

function touchstartEventHandler(e) {
    paint = true;
    if (paint) {
        addClick(e.touches[0].pageX - canvas.offsetLeft, e.touches[0].pageY - canvas.offsetTop, false);
        drawNew();
    }
}

function mouseUpEventHandler(e) {
    context.closePath();
    paint = false;
}

function mouseMoveEventHandler(e) {
    var x = e.pageX - canvas.offsetLeft;
    var y = e.pageY - canvas.offsetTop;
    if (paint) {
        addClick(x, y, true);
        drawNew();
    }
}

function touchMoveEventHandler(e) {
    if (paint) {
        addClick(e.touches[0].pageX - canvas.offsetLeft, e.touches[0].pageY - canvas.offsetTop, true);
        drawNew();
    }
}

function setUpHandler(isMouseandNotTouch, detectEvent) {
    removeRaceHandlers();
    if (isMouseandNotTouch) {
        canvas.addEventListener('mouseup', mouseUpEventHandler);
        canvas.addEventListener('mousemove', mouseMoveEventHandler);
        canvas.addEventListener('mousedown', mouseDownEventHandler);
        mouseDownEventHandler(detectEvent);
    } else {
        canvas.addEventListener('touchstart', touchstartEventHandler);
        canvas.addEventListener('touchmove', touchMoveEventHandler);
        canvas.addEventListener('touchend', mouseUpEventHandler);
        touchstartEventHandler(detectEvent);
    }
}

function mouseWins(e) {
    setUpHandler(true, e);
}

function touchWins(e) {
    setUpHandler(false, e);
}

function removeRaceHandlers() {
    canvas.removeEventListener('mousedown', mouseWins);
    canvas.removeEventListener('touchstart', touchWins);
}

canvas.addEventListener('mousedown', mouseWins);
canvas.addEventListener('touchstart', touchWins);

</script> -->
	<script>
	//This is use for show consult history 
  function getPatientConsultedHistory(patientId){
		 
		
		$('#consultHistory td').remove();
		$.getJSON('${getPatientConsultedHistory}',

				{
					patientId : patientId,

					ajax : 'true',

				}, function(data) {
					
				
					$.each(
							data,
								function(key, consultingDetailsList) {
								
					var tr = $('<tr></tr>');
					

					tr.append($('<td></td>').html(key+1));
					
					tr.append($('<td></td>').html(consultingDetailsList.date));
					tr.append($('<td></td>').html(consultingDetailsList.time));
					tr.append($('<td></td>').html(consultingDetailsList.patientProblem));
					tr.append($('<td></td>').html(consultingDetailsList.note));
					tr.append($('<td></td>').html('<p><a onclick="getPrescriptionDetailsByMeetId('+consultingDetailsList.meetId+')" class="collpse_anch">Prescription</a><a onclick="getSuggestedLabTest('+consultingDetailsList.meetId+')"    href="#">Suggested Test</a></p>'));
					/* tr.append($('<tr class=\"collapse_td\"><td colspan=\"5\">').html('<div class=\"prescrption_D\">')); */
					$('#consultHistory tbody').append(tr);
					
					var tr1=$('<tr class=\"collapse_td\"></tr>');
					tr1.append($('<td colspan=\"6\"></td>').html('<div class=\"prescrption_D\" id=\"consultHistoryDiv'+consultingDetailsList.meetId+'\"></div>'));		
				 
					 
					 $('#consultHistory tbody').append(tr1);
				
					
							
							})		 
						 
		
					
					
				 
			
				});
		
	}  
		
	function getPrescriptionDetailsByMeetId(meetId){
		//$('#consultHistoryDiv'+meetId).remove();
		//$('#prescTable td').remove();
		$('#prescTable').remove();
		var strVar="";
		strVar += "<table width=\"100%\" border=\"0\" class=\"tbl table table-bordered table table-hover\" id=\"prescTable\">";
		
		strVar += "															<thead>";
		strVar += "																<tr align=\"center\">";
		strVar += "																	<th>Sr.No<\/th>";
		strVar += "																	 ";
		strVar += "																	<th>Medicine Name<\/th>";
		strVar += "																	<th>Quantity<\/th>";
		strVar += "																	<th>Instructions<\/th>";
		strVar += "																	<th>Timing<\/th>";
		strVar += "																<\/tr>";
		strVar += "";
		strVar += "";
		strVar += "															<\/thead>";
		strVar += "															<tbody>";
		strVar += "															<\/tbody>";
		strVar += "															<\/table>";
		
		
		
		
	 	$.getJSON('${getPrescriptionByMeetingId}',

				{
					meetId : meetId,

					ajax : 'true',

				}, function(data) {
					$('#prescTable td').remove();
				
					$.each(
							data,
								function(key, prescriptionList) {
								//alert(prescriptionList.medicineName);
								var tr = $('<tr></tr>');
								
								tr.append($('<td></td>').html(key+1));
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.medicineQuantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
					
								$('#prescTable tbody').append(tr);
							})		 
							
				 		
				}); 
			
	// 	$('#prescTable').remove();
		
				$('#consultHistoryDiv'+meetId).append(strVar);	
	}
	
	function getSuggestedLabTest(meetId) {
		
		   $('#viewLabTestModal').modal('show')
		   
		   $('#suggestedTestDiv').hide();
		   $('#emptyLabTestDiv').show();

		 
		   	
		   	
		   	 $.getJSON('${getSuggestLabTestFromDoctor}',

		   				{
		   		 meetId : meetId,

		   					ajax : 'true',

		   				}, function(data) {
		   					$('#suggestedTestDiv').show();
		   					$('#emptyLabTestDiv').hide();
		   					
		   					 $("#suggestedLabTest").text(data.testNameList);
		   					 $("#referredLab").text(data.labName);
		   				});
		   	
		   
		   
	}
	
	 $(function() {
		  //  $("td[colspan=5]").find(".prescrption_D").show();
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

	<!-- suggesting cities -->
	<script type="text/javascript">
	 
	
	 var medicines = [];
		   
	function getMedicineName () {
		 
		$.getJSON('${getFrequentlyUsedMedByDoctorId}', {
		 
			ajax : 'true'
		}, function(data) {
			 
		
			  $.each(
						data,
						function(key, medicinesList) {
							
							medicines.push({ value: medicinesList.medicineName, data: medicinesList.freequantlyUsedMedicinesId });
		  });
 
			});
		
	}
	
 
	
	$(function(){
		
		  $('#medicine').autocomplete({
		    lookup: medicines,
		    onSelect: function (suggestion) {
		      /* var thehtml = '<strong>Currency Name:</strong> ' + suggestion.value + ' <br> <strong>Symbol:</strong> ' + suggestion.data; */
		     /*  document.getElementById("doctorCity").value=suggestion.data; */
		      $('#outputcontent').html(thehtml);
		    }
		  });
		  

		});
	
	
	
	</script>




	 
		 
	 
	 
	<script type="text/javascript">
	function toggle_visibility(id) {
		var e = document.getElementById(id);
		e.style.display = ((e.style.display!='none') ? 'none' : 'block');
		}
	
	function show(target) {
	    document.getElementById(target).style.display = 'block';
	}

	function hide(target) {
	    document.getElementById(target).style.display = 'none';
	}
	$('#popoverOption').popover({ trigger: "hover" });
	
	
	$(document).ready(function () {

	    $('.show_hide').on('click', function (e) {
	       
	        e.preventDefault();
	        
	        var id = $(e.target).attr('class');
		    	 $(".hidden1").hide();
		    
		        $(".hidden1").show();
		       

		    });

		});
	$(document).ready(function () {

	    $('.show_hide1').on('click', function (e) {
	       
	        e.preventDefault();
	        
	        var id = $(e.target).attr('class');
		    	 $(".hidden2").hide();
		    
		        $(".hidden2").show();
		       

		    });

		});
	</script>
	 
	<script type="text/javascript">
function showSecA(sec)
	{
	if(sec==1){
		document.getElementById("sectionD").style.display = 'none';	
		document.getElementById("sectionC").style.display = 'none';	
		 document.getElementById("sectionE").style.display = 'none';
		 document.getElementById("sectionB").style.display = 'none';
		document.getElementById("sectionA").style.display = 'block';	
			
	}
	else if(sec==2){
		
		 document.getElementById("sectionB").style.display = 'block';
		document.getElementById("sectionD").style.display = 'none';	
		document.getElementById("sectionC").style.display = 'none';	
		 document.getElementById("sectionE").style.display = 'none';
		
		document.getElementById("sectionA").style.display = 'none';	
		
			
	}
	else if(sec==3){
		document.getElementById("sectionD").style.display = 'none';	
		document.getElementById("sectionC").style.display = 'block';	
		 document.getElementById("sectionE").style.display = 'none';
		 document.getElementById("sectionB").style.display = 'none';
		document.getElementById("sectionA").style.display = 'none';	
			
	}
	else if(sec==4){
		document.getElementById("sectionD").style.display = 'block';	
		document.getElementById("sectionC").style.display = 'none';	
		 document.getElementById("sectionE").style.display = 'none';
		 document.getElementById("sectionB").style.display = 'none';
		document.getElementById("sectionA").style.display = 'none';	
			
	}
	else if(sec==5){
		document.getElementById("sectionD").style.display = 'none';	
		document.getElementById("sectionC").style.display = 'none';	
		 document.getElementById("sectionE").style.display = 'block';
		 document.getElementById("sectionB").style.display = 'none';
		document.getElementById("sectionA").style.display = 'none';	
			
	}
	}
</script>





	<script type="text/javascript">
function getPatientHistory(patientId,appoitId)
	{
 
//	


$.getJSON('${getPatientHistoryByPatientId}', {
	patientId : patientId,
			ajax : 'true'
		}, function(data) {
			 
		
			var strVar="";
			
			   $.each(
						data.patientPastHistoryIIlnessList,
						function(key, patientPastHistoryIIlnessList1) {
							
							 var checkedStatus="";
							 if(patientPastHistoryIIlnessList1.int1==1){
								 checkedStatus="checked";
							 }
							if((key+1)%2!=0)
							{
							
							strVar += "<span class=\"input input--nao\">";
							strVar += "                            <div class=\"gender_sec\">";
							strVar += "                             <div class=\"checkbox\">";
							strVar += "                             ";
							strVar += "                             ";
							strVar += "                             ";
							strVar += "                            ";
							strVar += "                          ";
							strVar += "                         ";
							strVar += "                                       ";
							strVar += "                          <label><input type=\"checkbox\" name=\"illness\" "+checkedStatus+" disabled=\"disabled\">"+patientPastHistoryIIlnessList1.illnessName+"<\/label>";
							strVar += "                          <\/div> ";
							}
							else{
							strVar += "                             <div class=\"checkbox\">";
							strVar += "                      ";
							strVar += "                          ";
							strVar += "                     ";
							strVar += "                 ";
							strVar += "         ";
							strVar += "            ";
							strVar += "            ";
							strVar += "               ";
							strVar += "            ";
							strVar += "                             ";
							strVar += "                             ";
							strVar += "                            ";
							strVar += "                          ";
							strVar += "                         ";
							strVar += "                                       ";
							strVar += "                          <label><input type=\"checkbox\" name=\"illness\" "+checkedStatus+" disabled=\"disabled\">"+patientPastHistoryIIlnessList1.illnessName+"<\/label>";
							strVar += "                          <\/div> ";
							strVar += "                             ";
							strVar += "                            <\/div>";
							strVar += "                        <svg class=\"graphic graphic--nao\" width=\"300%\" height=\"100%\" viewBox=\"0 0 1200 60\" preserveAspectRatio=\"none\">";
							strVar += "                            <path d=\"M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0\"><\/path>";
							strVar += "                        <\/svg>";
							strVar += "                    <\/span>";
							}
							
						});  
			 $('#pastHistoryIllnessDiv').append($(strVar));
							if(data.patientHistoryChiefComplaints!=null){
							document.getElementById("complaints").value=data.patientHistoryChiefComplaints.complaints;
							}
					 if(data.patientPersonalHistory!=null){
							document.getElementById("maritalStatus").value=data.patientPersonalHistory.maritalStatus;
							document.getElementById("occupation").value=data.patientPersonalHistory.occupation;
							document.getElementById("anualIncome").value=data.patientPersonalHistory.anualIncome;
							document.getElementById("addiction").value=data.patientPersonalHistory.addiction;
							document.getElementById("dietaryHabits").value=data.patientPersonalHistory.dietaryHabits;
							document.getElementById("historyOfConterception").value=data.patientPersonalHistory.historyOfConterception;
							document.getElementById("highRiskBehaviour").value=data.patientPersonalHistory.highRiskBehaviour;
					 }
							if(data.patientFamilyHistory!=null){
							document.getElementById("familyHistory").value=data.patientFamilyHistory.familyHistory;
							}
							if(data.patientTreatementHistoryp!=null){
							
							document.getElementById("treatmentReceived").value=data.patientTreatementHistoryp.treatmentReceived;
							
							document.getElementById("allergyReactions").value=data.patientTreatementHistoryp.allergyReactions;
							
							document.getElementById("surgicalIntervention").value=data.patientTreatementHistoryp.surgicalIntervention;
							
							document.getElementById("useOralContraceptives").value=data.patientTreatementHistoryp.useOralContraceptives;
							document.getElementById("bloodTransfusion").value=data.patientTreatementHistoryp.bloodTransfusion;
							document.getElementById("intakeNsaid").value=data.patientTreatementHistoryp.intakeNsaid;
							
							document.getElementById("regularUsezoralContraceptives").value=data.patientTreatementHistoryp.regularUsezoralContraceptives;
							}
							if(data.patientPsychologicalHistory!=null){
							document.getElementById("psychologicalHistory").value=data.patientPsychologicalHistory.psychologicalHistory;
							}
							if(data.menstrualObstetricHistory!=null){
							document.getElementById("menarche").value=data.menstrualObstetricHistory.menarche;
							document.getElementById("durationOfPeriod").value=data.menstrualObstetricHistory.durationOfPeriod;
							document.getElementById("qtyOfBloodLoss").value=data.menstrualObstetricHistory.qtyOfBloodLoss;
							document.getElementById("menstrualErregularities").value=data.menstrualObstetricHistory.menstrualErregularities;
							document.getElementById("dateOfLastPeriod").value=data.menstrualObstetricHistory.dateOfLastPeriod;
							document.getElementById("menopause").value=data.menstrualObstetricHistory.menopause;
							document.getElementById("noOfPregnancies").value=data.menstrualObstetricHistory.noOfPregnancies;
							document.getElementById("outcomeOfPregnancies").value=data.menstrualObstetricHistory.outcomeOfPregnancies;
							document.getElementById("complicationsDuringPregnancies").value=data.menstrualObstetricHistory.complicationsDuringPregnancies;
							document.getElementById("made_of_delivery").value=data.menstrualObstetricHistory.made_of_delivery;
							document.getElementById("last_child_birth").value=data.menstrualObstetricHistory.last_child_birth;
							}
							 
			});
	
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
<script>
document.getElementById("callDiv").style.display="none";
 
</script>

<script>
$(document).ready(function () {
    //Toggle fullscreen
    $("#panel-fullscreen").click(function (e) {
        e.preventDefault();
        
        var $this = $(this);
    
        if ($this.children('i').hasClass('glyphicon-resize-full'))
        {
            $this.children('i').removeClass('glyphicon-resize-full');
            $this.children('i').addClass('glyphicon-resize-small');
        }
        else if ($this.children('i').hasClass('glyphicon-resize-small'))
        {
            $this.children('i').removeClass('glyphicon-resize-small');
            $this.children('i').addClass('glyphicon-resize-full');
        }
        $(this).closest('.panel').toggleClass('panel-fullscreen');
    });
});




</script>
<script type="text/javascript">
function checkPaymentStatus1(){
	
	
	
	var appointId=document.getElementById("appointId").value;
	
	$.getJSON('${checkPaymentStatus}', {
		
				appointId : appointId,
				ajax : 'true'
			}, function(data) {
				
				if(data.message!=null){
					
					$("#drconsult").submit();
					
				}else{
					
					var fees=document.getElementById("doctorFees").value;
					
					if(confirm("Consulting payments of Rs. "+fees+" is pending. Please be sure that you have collected in payment in cash."))
						{
						$.getJSON('${submitConsultingPaymentByDoctor}', {
							
							appointId : appointId,
							txnAmt : fees,
							ajax : 'true'
						}, function(data) {
							$("#drconsult").submit();
						})
						}
				}
				
			});
	
	
}

</script>
	<script type="text/javascript">
 

  function searchData() {
 
	var value = $('#reportTableSearch').val().toLowerCase();
    $("#reportTable tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
}  
  
  function getLabByTests() {
	
	  
	  var testsList = '';
      $.each($("#testId option:selected"), function(){            
    	  testsList+=$(this).val()+',';
      });
      if(testsList!=''){
    	  $('#labDetails').show();
    	  $('#ref').hide();
		$.getJSON('${getLabByCityAndTests}', {

			 
			testIdList : testsList,
			
			ajax : 'true',
		},

		function(data) {
			$('#labDetailsTable tbody tr').remove();
			  $.each(
						data,
						function(key, list) {
							var tr = $('<tr></tr>');
							
						 
							tr.append($('<td></td>').html('<strong>'+list.labName+'</strong>'));
							tr.append($('<td></td>').html(list.address));
							tr.append($('<td></td>').html(list.testName));
							tr.append($('<td></td>').html('<a href="#"   onclick="referLab('+list.labId+', \''+list.teststypes+'\')">Refer a Lab</a>'));
						
							$('#labDetailsTable tbody').append(tr);
							
						})
						 
		});
	}
	else{
		alert("Select Tests first !!");
	}
}
   function saveTestsSuggestion() {
	   var patientId = document.getElementById("patientId").value;
	var labId=0;
	   var testsList = '';
	      $.each($("#testId option:selected"), function(){            
	    	  testsList+=$(this).val()+',';
	      });
	      if(testsList!=''){
	   $.getJSON('${saveTestsSuggestion}', {

		   patientId : patientId,
			testIdList : testsList,
			labId : labId,
			ajax : 'true',
		},

		function(data) {
			alert(data.message);
		});
		
	      }
	      else{
	    	  alert("Select Tests first !!");
	      }
}
   function referLab( labId, testIds) {
	   var patientId = document.getElementById("patientId").value;
	   $('#labTestModal').modal('hide')
	   $.getJSON('${saveTestsSuggestion}', {

		   patientId : patientId,
			testIdList : testIds,
			labId : labId,
			ajax : 'true',
		},

		function(data) {
			alert(data.message);
		});
	   
}
</script>

<script type="text/javascript">

function videoCallToPatient()
{
	 
	var id=document.getElementById("patientId").value;
	 
	var fromToken=document.getElementById("token").value;
	 
	var toDeviceType=document.getElementById("toDeviceType").value;
	 var doctorId = document.getElementById("doctorId").value;
	 var url = document.getElementById("url").value;
	var videoCallUrl=url+"?"+id+""+doctorId;
	
	 $
		.getJSON(
				'${sendVideoCallToPatient}',
				{
					videoCallUrl : videoCallUrl,
					 										
					toDeviceType : toDeviceType,
					fromDeviceType : 2,
					fromToken : fromToken,
					id : id,
					ajax : 'true'
				},
				function(data) {
					 
					window.open(videoCallUrl);
				});
}
function startChatting() {
	document.getElementById("messageBox").value="Hello";
	sendMessage();
}
function sendMessage()
{
	
	$('#chatingName').text($('#patientName').val());
	document.getElementById("chating").style.display = "block";
	var id=document.getElementById("patientId").value;
	var messageStr = document.getElementById("messageBox").value;
	document.getElementById("messageBox").value="";
	var fromToken=document.getElementById("token").value;
	var toToken=document.getElementById("fcmToken").value;
	var toDeviceType=document.getElementById("toDeviceType").value;
 
	
	var strVar = "";
	strVar += "<div class=\"container1 darker\">";
	//strVar += "  <img src=\"\/w3images\/avatar_g2.jpg\" alt=\"Avatar\" class=\"right\" style=\"width:100%;\">";
	strVar += "  <p>" + messageStr + "<\/p>";
	strVar += "  <span class=\"time-left\">" + getCurrentTime() + "<\/span>";
	strVar += "<\/div>";

	$('#chatingBox').append($(strVar));
	document.getElementById("messageBox").focus();
	
	
	 $
		.getJSON(
				'${sendMessageToPatient}',
				{
					message : messageStr,
					toToken : toToken,												
					toDeviceType : toDeviceType,
					fromDeviceType : 3,
					fromToken : fromToken,
					id : id,
					ajax : 'true'
				},
				function(data) {
					//alert("sent");
				});
}




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
					//	$('#indicationTable td').remove();
	 					
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
         <script type="text/javascript">
		$('.form_datetime').datepicker({
			autoclose : true,
			format : "dd-mm-yyyy"
		})
	</script>
        
</body>
</html>
