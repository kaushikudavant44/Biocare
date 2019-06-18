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
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
	
	
	
	
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

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>



</head>
<body>
<input type="hidden"  id="dcmFileUrl" value="${dcmFileUrl}">

	<c:url var="addMedicineToList" value="/addMedicineToList" />

	<c:url var="removeMedicineFromList" value="/removeMedicineFromList" />
	<c:url var="getBabyBornReports" value="/getBabyBornReports" />

	<c:url var="getPatientReportByPatientAndDocId"
		value="/getPatientReportByPatientAndDocId" />
	<c:url var="getFamilyHistory" value="/getFamilyHistory" />
	<c:url var="getPastMedicalHistory" value="/getPastMedicalHistory" />
	<c:url var="getPersonalHistory" value="/getPersonalHistory" />
	<c:url var="getPastMonthHistory" value="/getPastMonthHistory" />


	<c:url var="makeVideoCall" value="/makeVideoCall" />
    
    <c:url var="addDoctorVideoDetails" value="/addDoctorVideoDetails" />
    


	<jsp:include page="../include/doctorHeader.jsp" />
	<div class="clearfix"></div>
	<section class="doc_login inssurance_buy">
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/leftmenu.jsp" />

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
								<li class="${activeHistory}"><a
									<%--  target="_blank" href="${pageContext.request.contextPath}/getPatientHistoryDetails/${patientDetails.patientId}" --%> data-toggle="tab"
									href="#sectionB" onclick="getPatientHistory(${patientDetails.patientId}, ${appoitId})">Patient History</a></li>
								<li><a data-toggle="tab" href="#sectionC"
									onclick="getPatientReports()">Labs Reports</a></li>
								<li><a data-toggle="tab" href="#sectionD">Consulting</a></li>
								<!--<li><a data-toggle="tab" href="#sectionE">Labs Reports</a></li>-->

							</ul>
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


								<input type="hidden" name="appoitId" id="appoitId"
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
										class="btn btn-info" data-toggle="modal"
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
										<input type="hidden" value="${patientDetails.email}"
										name="email" id="email">
									<!--*****  Patient Id Hardcoded ****** -->

									<input type="submit" value="Submit" class="btn btn-info">
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			</div>
			</div>
			</div>
			
	</section>
	<div class="Fixed_calling-icon">
    <div class="content_img">
            <img src='${pageContext.request.contextPath}/resources/images/video_b.png' class="img-responsive show_hide" alt="video call" id="chat" class="animated-chat tada" onclick="loadChatbox()" <%--  onclick="makeCall(${patientDetails.patientId})" --%>> 
            <div class="video1">Make a video call to patient.</div>
        </div>

        <!-- Image 2 -->
        <div class="content_img">
            <img src='${pageContext.request.contextPath}/resources/images/chat_b.png' class="img-responsive" alt="chat call">
            <div class="chat1">Make a chat discussion with patient.</div>
        </div>

        <!-- Image 3 -->
        <div class="content_img">
            <img src='${pageContext.request.contextPath}/resources/images/call_b.png' class="img-responsive" alt="call call">
            <div>Make a audio call to patient.</div>
       
        </div>
</div> 

<%-- <div id="mydiv" class="slidingDiv">
  <div id="mydivheader">Click here to move</div>
 <div class="frame">
								<div class="content">
									<div class="column1 text-center">
										<p><a href="#" id="videoCallLink"  target="iframe1"><img src="${pageContext.request.contextPath}/resources/images/video_i.png" class="img-responsive" alt="video call"></a>
										<a href="${pageContext.request.contextPath}/showLoginPg" target="iframe2"><img src="${pageContext.request.contextPath}/resources/images/chat_i.png" class="img-responsive" alt="video call"></a>
										<a href="${pageContext.request.contextPath}/showLoginPg" target="iframe3"><img src="${pageContext.request.contextPath}/resources/images/call_i.png" class="img-responsive" alt="video call"></a>
									</p>
									</div>
									<div class="column2">
									     <iframe allow="geolocation; microphone; camera" id="iframe1" name="iframe1" scrolling="auto"></iframe>
									     
									</div>
									
								</div>
</div>

</div> --%>  
<!-- <div id="chat" class="animated-chat tada" onclick="loadChatbox()">Chat</div> -->
<div class="chatbox" id="chatbox">
<a href="#" onclick="show('mydiv1')" class="chat-text"><img src="${pageContext.request.contextPath}/resources/images/message.png" id="popoverOption" rel="popover" data-placement="bottom" data-original-title="chat" class="img-responsive" alt="video call"></a>
<div id="mydiv1" class="chat-window">
    <div id="mydiv-container">
        <div id="mydiv-content">
        <h4>Name</h4>
            <iframe src="http://localhost:8080/biocare/showDoctorLoginPage"></iframe>
<a href="#" onclick="hide('mydiv1')" class="chat_close"><strong>X</strong></a>

        </div>
    </div>
</div>
<script>
//<![CDATA[
document.write('<div id="smartchatbox_img901621879" style="width: 100%; height: 850px; overflow: hidden; margin: auto; padding: 0;">');
document.write('<div id="smartchatbox901621879" style="width: 100%; height: 850px; overflow: hidden; margin: auto; padding: 0; border:0; ">');
document.write('<iframe src="http://localhost:8080/biocare/showOnlineConsult" scrolling="yes" frameborder="0" width="100%" height="850px" style="border:0; margin:0; padding: 0;">');
document.write('</iframe></div></div>');
//]]>
</script>
<div id="close-chat" onclick="closeChatbox()">&times;</div>
<div id="minim-chat" onclick="minimChatbox()"><span class="minim-button">&minus;</span></div>
<div id="maxi-chat" onclick="loadChatbox()"><span class="maxi-button">&plus;</span></div>
</div>

<script>
//<![CDATA[
function loadChatbox(){var e=document.getElementById("minim-chat");e.style.display="block";var e=document.getElementById("maxi-chat");e.style.display="none";var e=document.getElementById("chatbox");e.style.margin="0";}
function closeChatbox(){var e=document.getElementById("chatbox");e.style.margin="0 0 -1500px 0";}
function minimChatbox(){var e=document.getElementById("minim-chat");e.style.display="none";var e=document.getElementById("maxi-chat");e.style.display="block";var e=document.getElementById("chatbox");e.style.margin="0 0 -850px 0";}
//]]>
</script>	
	<div id="largeModal"
		class="modal fade bs-example-modal-md prescription_mod" tabindex="-1"
		role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
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
						data-toggle="modal" onclick="addPrescription()"> <!-- <input
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
									<span id="hospitalname"></span>
								</h3></li>

							<li><h3>
									<span id="docFName"></span>
								</h3>
								<span>(<span id="docSpec"></span>)
							</span></li>
							<li><strong>Mother Name :</strong> <span id="motherName"></span>
							</li>
							<li><strong>Date of birth :</strong> <span id="dob"></span></li>
							<li><strong>Time of Birth :</strong> <span id="dobTime"></span>
							</li>
							<li><strong>Birth Weight :</strong> <span id="birthWeight"></span>
							</li>
							<li><strong>Length :</strong> <span id="length"></span></li>

							<li><strong>Head Circumference :</strong> <span
								id="headCircumference"></span></li>
							<li><strong>Blood Group :</strong> <span id="bloodGroup"></span>
							</li>


							<li><label><strong>Delivery Type : </strong> <span
									id="deliveryType"></span> </label></li>

							<li><label><strong>Sex : </strong><span id="sex"></span>
							</label></li>
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
	<div class="clearfix"></div>
	 

	<jsp:include page="../include/footer.jsp" />



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
								src="${pageContext.request.contextPath}/resources/images/pediatric.jpg"
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
								data="http://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf"
								type="application/pdf"></object>
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>



	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
		
		
	<script>
		$('#myTabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
		function show(target) {
    document.getElementById(target).style.display = 'block';
}

function hide(target) {
    document.getElementById(target).style.display = 'none';
}
	</script>
	<script>
		$('#datetimepicker1').datetimepicker({
			format : 'DD/MM/YYYY'
		});
		$('.adult_b').datetimepicker({
			format : 'DD/MM/YYYY'
		});
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

		//Canvas 13-04-2018
		/* (function() {
		var canvas = document.querySelector('#paint');
		var ctx = canvas.getContext('2d');

		var sketch = document.querySelector('#sketch');
		var sketch_style = getComputedStyle(sketch);
		canvas.width = parseInt(sketch_style.getPropertyValue('width'));
		canvas.height = parseInt(sketch_style.getPropertyValue('height'));

		var mouse = {x: 0, y: 0};
		var last_mouse = {x: 0, y: 0};

		
		canvas.addEventListener('mousemove', function(e) {
			last_mouse.x = mouse.x;
			last_mouse.y = mouse.y;
			
			mouse.x = e.pageX - this.offsetLeft;
			mouse.y = e.pageY - this.offsetTop;
		}, false);


		
		ctx.lineWidth = 5;
		ctx.lineJoin = 'round';
		ctx.lineCap = 'round';
		ctx.strokeStyle = 'black';

		canvas.addEventListener('mousedown', function(e) {
			canvas.addEventListener('mousemove', onPaint, false);
		}, false);

		canvas.addEventListener('mouseup', function() {
			canvas.removeEventListener('mousemove', onPaint, false);
		}, false);

		var onPaint = function() {
			ctx.beginPath();
			ctx.moveTo(last_mouse.x, last_mouse.y);
			ctx.lineTo(mouse.x, mouse.y);
			ctx.closePath();
			ctx.stroke();
		};

		}()); */
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
																					'<a href="#"  onclick="openReport('
																					+ reportList.reportId
																					+ ', \''
																					+ reportList.reportFileName
																					+ '\', '
																					+ reportList.patientId
																					+  ', '
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
																					'<a href="#" onclick="openReport('
																					+ reportList.reportId
																					+ ', \''
																					+ reportList.reportFileName
																					+ '\', '
																					+ reportList.patientId
																					+  ',' 
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
		function openReport(reportId,fileName,patientId,type) {

			// alert("reportId "+reportId);
			var c = document.getElementById("paint");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			var reportUrl = document.getElementById("reportUrl").value;
			if (type == 0) {

				document.getElementById("reportPdf").data =reportUrl+""+patientId+"/reports/"+fileName;
						
			} else {
				document.getElementById("reportImage").src =reportUrl+""+patientId+"/reports/"+fileName;
						
				var img = document.getElementById("reportImage");
				ctx.drawImage(img, 0, 0);
			}

		}

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
			//alert(bornReportList.hospitalName);

			document.getElementById('hospitalname').innerHTML = ""
					+ bornReportList.hospitalName;
			document.getElementById("docFName").innerHTML = bornReportList.doctorName;

			document.getElementById("docSpec").innerHTML = bornReportList.specialist;

			document.getElementById("dob").innerHTML = bornReportList.dob;
			document.getElementById("motherName").innerHTML = bornReportList.motherName;
			document.getElementById("dobTime").innerHTML = bornReportList.birthTime;
			document.getElementById("birthWeight").innerHTML = bornReportList.birthWeight;
			document.getElementById("length").innerHTML = bornReportList.length;
			document.getElementById("headCircumference").innerHTML = bornReportList.headCircumference;

			document.getElementById("deliveryType").innerHTML = bornReportList.deliveryType;
			document.getElementById("bloodGroup").innerHTML = bornReportList.bloodGroup;

			document.getElementById("sex").innerHTML = bornReportList.sex;
		}

		//Canvas 13-04-2018

		function openReport(reportId,fileName,patientId,type) {
			
			var originalModal11 = $('#myModal11').clone();
			var originalModal10 = $('#myModal10').clone();

			// alert("reportId "+reportId);
			var c = document.getElementById("paint");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			var reportUrl = document.getElementById("reportUrl").value;
			if (type == 0) {

				$('#myModal11').remove();
				 var myClone = originalModal11.clone();
				    $('body').append(myClone);
				document.getElementById("reportPdf").data = reportUrl+""+patientId+"/report/"+fileName;
						
			}else if(type==2)
				{
				window.open('${pageContext.request.contextPath}/showDcmViewer?input='+document.getElementById("dcmFileUrl").value+patientId+"/report/"+fileName, '_blank'); 
				}
			
			
			else {
				$('#myModal10').remove();
				 var myClone = originalModal10.clone();
				    $('body').append(myClone);
				document.getElementById("reportImage").src = reportUrl+""+patientId+"/report/"+fileName;

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
	
	
	
	</script>
	
	
	<script type="text/javascript">//Make the DIV (video calling) element draggagle:
	/* dragElement(document.getElementById("foo"));

	function dragElement(elmnt) {
	  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
	  if (document.getElementById(elmnt.id + "chat_window1")) {
	    /
	    document.getElementById(elmnt.id + "chat_window1").onmousedown = dragMouseDown;
	  } else {
	   
	    elmnt.onmousedown = dragMouseDown;
	  }

	  function dragMouseDown(e) {
	    e = e || window.event;
	    e.preventDefault();
	    // get the mouse cursor position at startup:
	    pos3 = e.clientX;
	    pos4 = e.clientY;
	    document.onmouseup = closeDragElement;
	    // call a function whenever the cursor moves:
	    document.onmousemove = elementDrag;
	  }

	  function elementDrag(e) {
	    e = e || window.event;
	    e.preventDefault();
	    // calculate the new cursor position:
	    pos1 = pos3 - e.clientX;
	    pos2 = pos4 - e.clientY;
	    pos3 = e.clientX;
	    pos4 = e.clientY;
	    // set the element's new position:
	    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
	    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
	  }

	  function closeDragElement() {
	   
	    document.onmouseup = null;
	    document.onmousemove = null;
	  }
	} */
	$(document).ready(function(){

		$(".slidingDiv").hide();
		$(".show_hide").show();

		$('.show_hide').click(function(){
		$(".slidingDiv").slideToggle();
		});

		});

	$('#mydiv').on('click', function() {
	    $(this).toggleClass('clicked');
	});

	</script>
	<!-- <script type="text/javascript">
	function makeCall(email)
	{
		
		
		
		
		
		
		alert("dfghjkl");
		//videoCallLink
		//https://localhost:9001/demos/One-to-One.html
		document.getElementById("iframe1").src="https://localhost:9001/demos/One-to-One.html?firstname=ganesh";
		
		
	}
	</script> -->
	
	<script type="text/javascript">
		function makeCall(patientId) {
    
			
			  var patientId = document.getElementById("patientId").value;
			  //alert(patientId);
			var email = document.getElementById("email").value;
			// alert(email);
 
			$.getJSON('${addDoctorVideoDetails}', {

				
                emailId : email,
                
                patientId : patientId,
				
				
				ajax : 'true',
			},

			function(data) {
				//videoCallLink
				//https://localhost:9001/demos/One-to-One.html
				 
				document.getElementById("iframe1").src="https://localhost:9001/demos/Cross-Domain-Screen-Capturing.html?firstname="+patientId;
				 
			});
			 

		}
		
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
	</script>
	
</body>
</html>
