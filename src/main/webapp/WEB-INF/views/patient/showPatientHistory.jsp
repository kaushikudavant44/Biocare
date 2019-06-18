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
	href="${pageContext.request.contextPath}/resources/css/videoCallPat.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
<script type="text/javascript">
	var specialKeys = new Array();
	specialKeys.push(8); //Backspace
	function IsNumeric(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57)
				|| specialKeys.indexOf(keyCode) != -1 || keyCode == 9);
		//document.getElementById("error").style.display = ret ? "none" : "inline";
		return ret;
	}
</script>


<style>


/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Next & previous buttons */
/* .prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	background-color: black;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
} */

/* Position the "next button" to the right */
/* .next {
	right: 0;
	border-radius: 3px 0 0 3px;
} */

/* On hover, add a black background color with a little bit see-through */
/* .prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
} */

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: black;
	font-size: 20px;
	margin-top: 25px;
	/*  padding: 8px 12px; */
	/*  position: absolute; */
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	/*  background-color: #717171; */
	
}

/* Fading animation */
.fadez {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}

.round {
	border-radius: 50%;
}

textarea {
	width: 100%;
	font-style: italic;
	background: transparent;
}

.col-sm-4 label {
	width: auto;
}

 


.bd-example-modal-lg3 .modal-dialog{
    display: table;
    position: relative;
    margin: 0 auto;
    top: calc(50% - 24px);
  }

  .bd-example-modal-lg3 .modal-dialog .modal-content{
    background-color: transparent;
    border: none;
  }
  
</style>


</head>
<body>
	<jsp:include page="../include/patientHeader.jsp" />



	<c:url var="submitChiefComplaintsHistory"
		value="/submitChiefComplaintsHistory" />
	<c:url var="submitPastHistory" value="/submitPastHistory" />
	<c:url var="submitFamilyHistory" value="/submitFamilyHistory" />
	<c:url var="submitPersonalHistory" value="/submitPersonalHistory" />

	<c:url var="submitTreatmentHistory" value="/submitTreatmentHistory" />
	<c:url var="submitPsychologicalHistory"
		value="/submitPsychologicalHistory" />
	<c:url var="submitMenstrualHistory" value="/submitMenstrualHistory" />

	<section class="doc_login">
	<div class="dashboard_nm text-center">
		<h4>Add Patient History</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">

					<div class="inssurance_buy padding_none patHistorysec">
					<div class="bhoechie-tab-content">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs newappon" role="tablist" id="historyTab">
							<li role="presentation" class="history active"><a
								href="javascript:currentSlide(1)">Chief or presenting
									Complaints</a></li>
							<li role="presentation" class="history"><a
								href="javascript:currentSlide(2)">Past History</a></li>
							<li role="presentation" class="history"><a
								href="javascript:currentSlide(3)">Personal History</a></li>
							<li role="presentation" class="history"><a
								href="javascript:currentSlide(4)">Family </a></li>
							<li role="presentation" class="history"><a
								href="javascript:currentSlide(5)">Treatment </a></li>
							<li role="presentation" class="history"><a
								href="javascript:currentSlide(6)">Psychological</a></li>
							<li role="presentation" class="history"><a
								href="javascript:currentSlide(7)">Menstrual and obstetric</a></li>

						</ul>

						<!-- Tab panes -->
						<div class="tab-content1">


							<div class="slideshow-container">
								<c:set var="disable" value="disabled" />
								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong>Chief or presenting Complaints</strong> <a
											href="javascript:editChiefCompaints()" data-toggle="tooltip"
											data-original-title="Edit" class="edit-history medi-icon"><span
											style="color: blue" class="icon-user" aria-hidden="true"></span></a>
									</div>

									<div class="panel-body">
										<form action="" id="chiefForm" name="chiefForm">
											<input type="hidden" name="patientId" value="${patientId}">
											<%-- <input type="hidden" name="chiefcomplaintsId"
												value="${patientHistoryChiefComplaints.chiefcomplaintsId}"> --%>
											<textarea placeholder="Answer" id="Chief" name="complaints"
												${disable}>${patientHistoryChiefComplaints.complaints}</textarea>
											<input type="button" class="history_sbmt btn-fr-all"
												id="chiefBtn" style="display: none" value="Save">
										</form>
									</div>
									<!--  <div class="text">Caption Two</div> -->
								</div>

								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong>Past History</strong> <a
											href="javascript:editPastHistory()" data-toggle="tooltip"
											data-original-title="Edit" class="edit-history medi-icon"><span
											class="icon-user" style="color: blue" aria-hidden="true"></span></a>
									</div>
									<div class="panel-body">
										<form action="" name="pastHistoryForm" id="pastHistoryForm">
											<strong>History of Past illness like:</strong> <input
												type="hidden" name="patientId" value="${patientId}">
											 
												
											<div class="cont_blk past_history">

											 <c:forEach
														items="${patientPastHistory}"
														var="patientPastHistoryIIlness">
														<c:set var="checkedStatus" value=""/>
														<c:if test="${patientPastHistoryIIlness.int1==1}">
															<c:set var="checkedStatus" value="checked"/>
														</c:if>
														
														
														 
														 
														
														<div class="col-sm-12">
														
														
															<label><input type="checkbox"
																name="pastHistoryIllnessId" ${checkedStatus}
																value="${patientPastHistoryIIlness.pastHistoryIllnessId}"
																${disable}>${patientPastHistoryIIlness.illnessName}</label>
														</div>


													</c:forEach> 
												
												<%-- <div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="2" ${disable}>Tuberculosis</label>
													</div>
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="3" ${disable}>Malaria</label>
													</div> <svg class="graphic graphic--nao" width="300%"
														height="100%" viewBox="0 0 1200 60"
														preserveAspectRatio="none"> <path
														d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"></path>
													</svg>
												</span> <span class="input input--nao">
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="4" ${disable}>Kala-azar</label>
													</div>
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="5" ${disable}>Jaundice</label>
													</div>
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="6" ${disable}>STD (sexually transmitted
															diseases like, Aids etc)</label>
													</div> <svg class="graphic graphic--nao" width="300%"
														height="100%" viewBox="0 0 1200 60"
														preserveAspectRatio="none"> <path
														d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"></path>
													</svg>
												</span> <span class="input input--nao">
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="7" ${disable}>H/O Contact with persons
															suffering from tuberculosis or any other disease</label>
													</div>
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="8" ${disable}>H/O exposure to STD</label>
													</div>

													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="9" ${disable}>Any illness which demanded
															'blood transfusion' e.g- accidents etc</label>
													</div> <svg class="graphic graphic--nao" width="300%"
														height="100%" viewBox="0 0 1200 60"
														preserveAspectRatio="none"> <path
														d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"></path>
													</svg>
												</span> <span class="input input--nao">
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="10" ${disable}>Childhood illness (pertusis
															etc.)</label>
													</div>

													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="11" ${disable}>Systemic hypertension</label>
													</div>
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="12">Diabetes mellitus</label>
													</div> <svg class="graphic graphic--nao" width="300%"
														height="100%" viewBox="0 0 1200 60"
														preserveAspectRatio="none"> <path
														d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"></path>
													</svg>
												</span> <span class="input input--nao">
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="13" ${disable}>Trauma or Injury</label>
													</div>
													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="14" ${disable}>Past Hospital admissions</label>
													</div>

													<div class="col-sm-4">
														<label><input type="checkbox" name="illness"
															value="15" ${disable}>Any other major medical or
															psychlatric illness in the past</label>
													</div> <svg class="graphic graphic--nao" width="300%"
														height="100%" viewBox="0 0 1200 60"
														preserveAspectRatio="none"> <path
														d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"></path>
													</svg>
												</span> --%>








											</div>
											<input type="button" class="history_sbmt btn-fr-all"
												value="Save" id="pastHistory" style="display: none">
										</form>
									</div>

								</div>

								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong> Personal History</strong> <a
											href="javascript:editPersonalHistory()" data-toggle="tooltip"
											data-original-title="Edit" class="edit-history medi-icon"><span
											class="icon-user" style="color: blue" aria-hidden="true"></span></a>
									</div>

									<div class="panel-body">
										<form action="" name="personalHistoryForm"
											id="personalHistoryForm">
											<strong>1. Marital status with number of children</strong>
											<div class="cont_blk past_history">
												<div class="gender_sec" id='form-id'>
													<input type="hidden" name="patientId" value="${patientId}">
												<%-- 	<input type="hidden" name="personalHistoryId"
														value="${patientPersonalHistory.personalHistoryId}"> --%>

<c:set var="maritalStatusDisplay" value=""/>
													<c:choose>
														<c:when
															test="${empty patientPersonalHistory.maritalStatus}">
															
															<c:set var="maritalStatusDisplay" value=""/>
															<input name='test' class="personal" type='radio'
																value="a" ${disable} />Yes  
													
    </c:when>
														<c:otherwise>
															<input name='test' checked class="personal" type='radio'
																value="a" ${disable} />Yes 
<c:set var="maritalStatusDisplay" value="disabled"/>
												 
    </c:otherwise>
													</c:choose>
													<input name='test' class="personal" type='radio' value="NO"
														${disable} /> No
												 
														<textarea    ${maritalStatusDisplay} id='show-me' placeholder="Number of children"
															class="personal" name="maritalStatus"  
															onkeypress="return IsNumeric(event);" ${disable}>${patientPersonalHistory.maritalStatus}</textarea>
												 

												</div>


											</div>

											<div class="clearfix"></div>
											<hr>
											<strong>2. Occupation (nature and environment job)
												and education, unemployment</strong>
											<textarea class="personal" placeholder="Answer"
												name="occupation" ${disable}>${patientPersonalHistory.occupation}</textarea>
											<hr>
											<strong>3. Income (asked indirectly) and social
												status</strong>
											<textarea class="personal" placeholder="Answer"
												name="anualIncome" ${disable}>${patientPersonalHistory.anualIncome}</textarea>
											<hr>
											<strong>4. Addiction (tea, coffee, smoking,
												alcoholism, substance abuse e.g chewing tobacco, ganja,
												heroin; try to estimate the amount of consumption of tobacco
												or alcohol)</strong>
											<textarea class="personal" placeholder="Answer"
												name="addiction" ${disable}>${patientPersonalHistory.addiction}</textarea>
											<hr>
											<strong>5. Dietary habit(for diagnosis of
												avitaminosis, malnutrition, obesity)</strong>
											<textarea class="personal" placeholder="Answer"
												name="dietaryHabits" ${disable}>${patientPersonalHistory.dietaryHabits}</textarea>
											<hr>
											<strong>6. History of Contraception</strong>
											<textarea class="personal" placeholder="Answer"
												name="historyOfConterception" ${disable}>${patientPersonalHistory.historyOfConterception}</textarea>
											<hr>
											<strong>7. High Risk behaviour (e.g IV drug abuse,
												multiple sexual partner, homosexuality etc)-important in
												hepatitis B or C infection, AIDS and SBE.</strong>
											<textarea class="personal" placeholder="Answer"
												name="highRiskBehaviour">${patientPersonalHistory.highRiskBehaviour}</textarea>
											<input type="button" class="history_sbmt btn-fr-all"
												id="personalBtn" style="display: none" value="Save">
										</form>
									</div>
									<!--  <div class="text">Caption Two</div> -->
								</div>

								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong> Family History</strong> <a
											href="javascript:familyHistory()" data-toggle="tooltip"
											data-original-title="Edit" class="edit-history medi-icon"><span
											class="icon-user" style="color: blue" aria-hidden="true"></span></a>
									</div>

									<div class="panel-body">
										<form action="" name="familyHistoryForm"
											id="familyHistoryForm">
											<input type="hidden" name="patientId" value="${patientId}">
											<%-- <input type="hidden" name="familyHistoryId"
												value="${patientFamilyHistory.familyHistoryId}"> --%>
											<textarea placeholder="Answer" id="familyHistory"
												name="FamilyHistory" ${disable}>${patientFamilyHistory.familyHistory}</textarea>

											<input type="button" class="history_sbmt btn-fr-all"
												id="familyBtn" style="display: none" value="Save">
										</form>

									</div>

								</div>

								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong>Treatment History</strong> <a
											href="javascript:editTreatmentHistory()"
											data-toggle="tooltip" data-original-title="Edit"
											class="edit-history medi-icon"><span class="icon-user"
											style="color: blue" aria-hidden="true"></span></a>
									</div>

									<div class="panel-body">
										<form action="" name="treatmentHistoryForm"
											id="treatmentHistoryForm">
											<input type="hidden" name="patientId" value="${patientId}">
											<%-- <input type="hidden" name="treatementHistoryId"
												value="${patientTreatementHistory.treatementHistoryId}"> --%>
											<div class="cont_blk past_history">
												<strong>1.Treatment received so far, for the
													present illness.</strong>

												<div class="gender_sec" id='form-id'>



													<c:choose>
														<c:when
															test="${empty patientTreatementHistory.treatmentReceived}">
															<input name="test1" class="treatment" type='radio'
																value="a" ${disable} />yes 

													 
														</c:when>
														<c:otherwise>
															<input name="test1" class="treatment" type='radio'
																checked value="a" ${disable} />yes  

													
														</c:otherwise>
													</c:choose>

<input name="test1"
																class="treatment" type='radio' value="NO" ${disable} />no
																 
																<textarea class="treatment" placeholder="Answer" id='show-me1'
																	name="treatmentReceived" ${disable}>${patientTreatementHistory.treatmentReceived}</textarea>
														 
												</div>




												<div class="clearfix"></div>
												<hr>
												<strong>2.Any H/O drug allergy or reactions.</strong>

												<div class="gender_sec" id='form-id'>

													<c:choose>
														<c:when
															test="${empty patientTreatementHistory.allergyReactions}">
															<input name="test2" class="treatment" type='radio'
																value="a" ${disable} />Yes 

													 
														</c:when>
														<c:otherwise>
															<input name="test2" class="treatment" type='radio'
																checked value="a" ${disable} />Yes 

												 
														</c:otherwise>
													</c:choose>


<input name="test2"
																class="treatment" type='radio' value="NO" ${disable} /> No
																<textarea placeholder="Answer" class="treatment" id='show-me2'
																	name="allergyReactions" ${disable}>${patientTreatementHistory.allergyReactions}</textarea>
														
												</div>


												<div class="clearfix"></div>
												<hr>
												<strong>3.Any surgical intervention or H/O
													accidents in significant past.</strong>
												<div class="gender_sec" id='form-id'>


													<c:choose>
														<c:when
															test="${empty patientTreatementHistory.surgicalIntervention}">
															<input name='test3' class="treatment" type='radio'
																value="a" ${disable} />Yes

													 
														</c:when>
														<c:otherwise>
															<input name='test3' class="treatment" type='radio'
																checked value="a" ${disable} />Yes  

													 
														</c:otherwise>
													</c:choose>

 <input name='test3'
																class="treatment" type='radio' value="NO" ${disable} /> No
																<textarea placeholder="Answer" class="treatment" id='show-me3'
																	name="surgicalIntervention" ${disable}>${patientTreatementHistory.surgicalIntervention}</textarea>
															
																
												</div>



												<div class="clearfix"></div>
												<hr>
												<strong>4. Prolonged use of oral contraceptives
													(may precipitate CVA), penicillamine(used in wilson's
													disease; may develop nephrotic syndrome), vitamin C (may
													produce oxalate stone) etc.</strong>
												<div class="gender_sec" id='form-id'>

													<c:choose>
														<c:when
															test="${empty patientTreatementHistory.useOralContraceptives}">

															<input name='test4' class="treatment" type='radio'
																value="a" ${disable} />Yes 

													 
														</c:when>
														<c:otherwise>

															<input name='test4' checked class="treatment"
																type='radio' value="a" ${disable} />Yes 

												 
														</c:otherwise>
													</c:choose>
<input name='test4'
																class="treatment" type='radio' value="NO" ${disable} /> No
																<textarea class="treatment" placeholder="Answer" id='show-me4'
																	name="useOralContraceptives" ${disable}>${patientTreatementHistory.useOralContraceptives}</textarea>
															
												</div>


												<div class="clearfix"></div>
												<hr>
												<div class="clearfix"></div>
												<strong>5. Blood transfusion</strong>

												<div class="panel-body">

													<textarea class="treatment" placeholder="Answer"
														name="bloodTransfusion" ${disable}>${patientTreatementHistory.bloodTransfusion}</textarea>


												</div>




												<div class="clearfix"></div>
												<hr>
												<strong>6. Intake of NSAID (may produce acute
													gastric erosion, NSAID-induced asthma etc.)</strong>

												<div class="panel-body">
													<textarea class="treatment" placeholder="Answer"
														name="intakeNsaid" ${disable}>${patientTreatementHistory.intakeNsaid}</textarea>
												</div>

												<div class="clearfix"></div>
												<hr>
												<strong>7. Regular user of oral contraceptives,
													vitamins, laxatives, sedatives or herbal remedies.</strong>



												<div class="panel-body">
													<textarea class="treatment" placeholder="Answer"
														name="regularUsezoralContraceptives" ${disable}>${patientTreatementHistory.regularUsezoralContraceptives}</textarea>
												</div>

												<div class="clearfix"></div>
											</div>
											<input type="button" class="history_sbmt btn-fr-all"
												id="treatmentBtn" style="display: none" value="Save">
										</form>
									</div>

								</div>


								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong>Psychological History</strong><a
											href="javascript:editPsychologicalHistory()"
											data-toggle="tooltip" data-original-title="Edit"
											class="edit-history medi-icon"><span class="icon-user"
											style="color: blue" aria-hidden="true"></span></a>
									</div>

									<div class="panel-body">
										<form action="" name="psychologicalHistoryForm"
											id="psychologicalHistoryForm">
											<input type="hidden" name="patientId" value="${patientId}">
											<%-- <input type="hidden" name="psychologicaLHistoryId"
												value="${patientPsychologicalHistory.psychologicaLHistoryId}"> --%>


											<textarea placeholder="Answer" id="PsychologicalHistory"
												name="psychologicalHistory" ${disable}>${patientPsychologicalHistory.psychologicalHistory}</textarea>
											<input type="submit" class="history_sbmt btn-fr-all"
												id="psychologicalBtn" style="display: none" value="Save">
										</form>
									</div>

								</div>

								<div class="mySlides1 fadez">
									<div class="numbertext">
										<strong>Menstrual and obstetric History</strong> <a
											href="javascript:editMenstrualHistory()"
											data-toggle="tooltip" data-original-title="Edit"
											class="edit-history medi-icon"><span class="icon-user"
											style="color: blue" aria-hidden="true"></span></a>
									</div>

									<div class="panel-body">
										<form action="" name="menstrualHistoryForm"
											id="menstrualHistoryForm">
											<input type="hidden" name="patientId" value="${patientId}">
									<%-- 		<input type="hidden" name="menstrualObstetricHistoryId"
												value="${menstrualObstetricHistory.menstrualObstetricHistoryId}"> --%>
											<strong>1.Menarche.</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="menarche" ${disable}>${menstrualObstetricHistory.menarche}</textarea>
											<hr>
											<strong>2.Duration of the period.</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="durationOfPeriod" ${disable}>${menstrualObstetricHistory.durationOfPeriod}</textarea>
											<hr>
											<strong>3.Quantity of blood loss(usually assessed by
												number of pads consumed or passage of clots).</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="qtyOfBloodLoss">${menstrualObstetricHistory.qtyOfBloodLoss}</textarea>
											<hr>
											<strong>4.Dysmenorrhoea, amenorrhoea or other
												menstrual irregularities.</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="menstrualErregularities" ${disable}>${menstrualObstetricHistory.menstrualErregularities}</textarea>
											<hr>
											<strong>5.Date of last menstrual period.</strong>
											<input placeholder="Answer" class="menstrual datepicker lstchild"
												name="dateOfLastPeriod" value="${menstrualObstetricHistory.dateOfLastPeriod}" ${disable}>
											<hr>
											<strong>6.Menopause, post-menopausal bleeding.</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="menopause" ${disable}>${menstrualObstetricHistory.menopause}</textarea>
											<hr>
											<strong>7.Obstetric history: </strong>
											<div class="clearfix"></div>
											<strong>a) No.of pregnancies</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="noOfPregnancies" ${disable}>${menstrualObstetricHistory.noOfPregnancies}</textarea>
											<hr>
											<strong> b) Outcome of pregnancies : H/O abortions
												or carried to term:live birth (male/female)</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="outcomeOfPregnancies" ${disable}>${menstrualObstetricHistory.outcomeOfPregnancies}</textarea>
											<hr>
											<strong>c) Complications during pregnancy (e.g
												hypertension, gestational diabetes mellitus)</strong>
											<div class="cont_blk past_history">

												<div class="gender_sec" id='form-id'>


													<c:choose>
														<c:when
															test="${empty menstrualObstetricHistory.complicationsDuringPregnancies}">
															<input name='test5' type='radio' class="menstrual"
																value="a" ${disable} />Yes  

												 
															  
														</c:when>
														<c:otherwise>
															<input name='test5' type='radio' class="menstrual" checked
																value="a" ${disable} />Yes

													 
																
														</c:otherwise>
													</c:choose>
													 <input name='test5'
																type='radio' class="menstrual" value="NO" ${disable} /> No
<textarea placeholder="Answer" class="menstrual" id='show-me5'
																	name="ComplicationspcomplicationsDuringPregnanciesregnancy"
																	${disable}>${menstrualObstetricHistory.complicationsDuringPregnancies}</textarea>
															 

												</div>
											</div>
											<div class="clearfix"></div>
											<hr>
											<strong> d) Mode of delivery (Vaginal , foreeps,
												caesaream)</strong>
											<textarea placeholder="Answer" class="menstrual"
												name="made_of_delivery" ${disable}>${menstrualObstetricHistory.made_of_delivery}</textarea>
											<hr>
											<strong> e) Last child birth</strong> <input
												placeholder="Answer" type="text"
												class="datepicker lstchild menstrual"
												value="${menstrualObstetricHistory.last_child_birth}"
												name="last_child_birth" disable> <input
												type="submit" class="history_sbmt btn-fr-all menstrual"
												id="menstrualBtn" style="display: none" value="Save"
												${disable}>
										</form>
									</div>

								</div>


							</div>



							<!--   <a class="prev round" style="float: left;width:auto;" onclick="plusSlides(-1)">&#10094;</a>
<a class="next round" style="float: left;width:auto;" onclick="plusSlides(1)">&#10095;</a> -->

							<br>

							<!-- <div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>  -->
						</div>

					</div>





				</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	 
	
	<div class="modal fade bd-example-modal-lg3 myLoader" data-backdrop="static" data-keyboard="false" tabindex="-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 48px">
            <span class="fa fa-spinner fa-spin fa-3x"></span>
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
	<script>
		$('.datepicker').datepicker({
			format : "dd-mm-yyyy",
			autoclose : true
		})
		$('#myTabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
	<script>
		/* $('#datetimepicker1').datetimepicker({ format: 'DD/MM/YYYY' });
		$('.adult_b').datetimepicker({ format: 'DD/MM/YYYY' }); */
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
		$("input[name='test']").click(
				function() {
					$('#show-me').prop('disabled',
							($(this).val() === 'a') ? false : true);
				});
		$("input[name='test1']").click(
				function() {
					$('#show-me1').prop('disabled',
							($(this).val() === 'a') ? false : true);
				});

		$("input[name='test2']").click(
				function() {
					$('#show-me2').prop('disabled',
							($(this).val() === 'a') ? false : true);
				});

		$("input[name='test3']").click(
				function() {
					$('#show-me3').prop('disabled',
							($(this).val() === 'a') ? false : true);
				});
		$("input[name='test4']").click(
				function() {
					$('#show-me4').prop('disabled',
							($(this).val() === 'a') ? false : true);
				});
		$("input[name='test5']").click(
				function() {
					$('#show-me5').prop('disabled',
							($(this).val() === 'a') ?  false : true);
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

	<!-- Feed Back -->




	<!-- <script>$('input.example').on('change', function() {
	    $('input.example').not(this).prop('checked', false);  
	});</script>
  
  -->


	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {

			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides1");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}

			var header = document.getElementById("historyTab");
			var btns = header.getElementsByClassName("history");

			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";

		}
	</script>
	<script>
		// Add active class to the current button (highlight it)
		var header = document.getElementById("historyTab");
		var btns = header.getElementsByClassName("history");
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener("click", function() {
				var current = document.getElementsByClassName("active");
				current[0].className = current[0].className.replace(" active",
						"");
				this.className += " active";
			});
		}
	</script>



	<script type="text/javascript">
		function editPastHistory() {

			var checkboxes = $("input[name='pastHistoryIllnessId']");

			//	checkboxes.prop('disabled', !checkboxes.prop('disabled'));
			document.getElementById("pastHistory").style.display = "block";
			checkboxes.removeAttr("disabled");
		}
		function editChiefCompaints() {
			document.getElementById("chiefBtn").style.display = "block";
			document.getElementById("Chief").disabled = false;
		}
		function editPersonalHistory() {

			var testElements = document.getElementsByClassName('personal');
			var testDivs = Array.prototype.filter.call(testElements, function(
					testElement) {
				testElement.disabled = false;
			});
			document.getElementById("personalBtn").style.display = "block";
		}

		function familyHistory() {
			document.getElementById("familyHistory").disabled = false;

			document.getElementById("familyBtn").style.display = "block";
		}
		function editTreatmentHistory() {

			var testElements = document.getElementsByClassName('treatment');
			var testDivs = Array.prototype.filter.call(testElements, function(
					testElement) {
				testElement.disabled = false;
			});
			document.getElementById("treatmentBtn").style.display = "block";
		}
		function editPsychologicalHistory() {

			document.getElementById("psychologicalBtn").style.display = "block";
			document.getElementById("PsychologicalHistory").disabled = false;
		}
		function editMenstrualHistory() {
			var testElements = document.getElementsByClassName('menstrual');
			var testDivs = Array.prototype.filter.call(testElements, function(
					testElement) {
				testElement.disabled = false;
			});
			document.getElementById("menstrualBtn").style.display = "block";
		}

		$(function() {

			$('#chiefBtn').click(function(e) {
				  $('.myLoader').modal('show');
				e.preventDefault();
				//	alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
				$.ajax('${submitChiefComplaintsHistory}', {
					type : "POST",

					data : $('form[name=chiefForm]').serialize(),

					success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
				   
		})
			})

		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('#pastHistory').click(function(e) {
				  $('.myLoader').modal('show');
				e.preventDefault();
				//	alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
				$.ajax('${submitPastHistory}', {
					type : "POST",

					data : $('form[name=pastHistoryForm]').serialize(),
					success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
				   
		})
			})

			$('#personalBtn').click(function(e) {
				  $('.myLoader').modal('show');
				e.preventDefault();
				//	alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
				$.ajax('${submitPersonalHistory}', {
					type : "POST",

					data : $('form[name=personalHistoryForm]').serialize(),
					success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
				   
		})
			})
			$('#familyBtn').click(function(e) {
				  $('.myLoader').modal('show');
				e.preventDefault();
				//	alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
				$.ajax('${submitFamilyHistory}', {
					type : "POST",

					data : $('form[name=familyHistoryForm]').serialize(),
					success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
				   
		})
			})

			$('#treatmentBtn').click(function(e) {
				   $('.myLoader').modal('show');
				e.preventDefault();
				//	alert("submitted  data : "+$('form[name=treatmentHistoryForm]').serialize());
				$.ajax('${submitTreatmentHistory}', {
					type : "POST",

					data : $('form[name=treatmentHistoryForm]').serialize(),
					success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
				   
		})
			})

			$('#psychologicalBtn').click(
					function(e) {
						   $('.myLoader').modal('show');
						e.preventDefault();
						//	alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
						$.ajax('${submitPsychologicalHistory}', {
							type : "POST",

							data : $('form[name=psychologicalHistoryForm]')
									.serialize(),

									
									success: function (data,status,xhr) {   // success callback function
										$('.myLoader').modal('hide');
								   },
								   error: function (jqXhr, textStatus, errorMessage) { // error callback 
									   $('.myLoader').modal('hide');
								   alert("Failed To Update");
								   }
								   
						})
					})
		});
						</script>
	<script type="text/javascript">
					$(function() {
			$('#menstrualBtn').click(function(e) {
				   $('.myLoader').modal('show');
				e.preventDefault();
					//alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
				$.ajax('${submitMenstrualHistory}', {
					type : "POST",

					data : $('form[name=menstrualHistoryForm]').serialize(),

					success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
				   
				});
			});
		});
		 
		</script>
		  
</body>
</html>
