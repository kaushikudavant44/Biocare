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
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/videoCall2.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css
/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
	<c:url var="getConsultingDetailsByDoctor"
		value="/getConsultingDetailsByDoctor" />
		
		
	
		
		
  <style type="text/css">
@media print
{
body * { visibility: hidden; }

#invoice1 * { visibility: visible; }
#invoice1 { position: absolute; top: 00px; left: 30px; }

#print {display: none;}
#close {display: none;}


#prescModl * { visibility: visible; }
#prescModl { position: absolute; top: 00px; left: 30px; }
#print {display: none;}
#close {display: none;}

#viewLabTestModal * { visibility: visible; }
#viewLabTestModal { position: absolute; top: 00px; left: 30px; }

#suggestion {display: none;}

#print {display: none;}
#close {display: none;}
}
</style>
		
</head>

<body onload="getDoctors();">
	<jsp:include page="../include/patientHeader.jsp" />

 
<c:url var="getConsultingBillByMeetId"
		value="/getConsultingBillByMeetId" />
	<c:url var="showDoctorProfile" value="/showDoctorProfile" />
	<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
	
	<c:url var="getPrescriptionWithDoctorByMeetId"
		value="/getPrescriptionWithDoctorByMeetId" />
	<c:url var="getDoctorsByPatientId" value="/getDoctorsByPatientId" />

	<c:url var="getDoctorsAndLabsForRating"
		value="/getDoctorsAndLabsForRating" />
	<c:url var="submitDoctorRating" value="/submitDoctorRating" />
	<c:url var="submitLabRating" value="/submitLabRating" />
	<c:url var="getSuggestLabTestFromDoctorForPatient"
		value="/getSuggestLabTestFromDoctorForPatient" />


	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>Consulted Doctor</h4>
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
								<h3>View Consulting</h3>
							</div>
							<div class="col-sm-12">
								<select class="slct_lst" id="patientId" name="patientId"
									onChange="getDoctors()">

									 
											<option value="">select member</option>
											<c:forEach items="${patientDetailList}"
												var="patientDetailList" varStatus="count">
												<c:choose>
												<c:when test="${patientDetailList.patientId==patientId}">
												<option selected value="${patientDetailList.patientId}"><c:out
														value="${patientDetailList.fName} ${patientDetailList.lName}" /></option>
														</c:when>
														<c:otherwise>
														<option value="${patientDetailList.patientId}"><c:out
														value="${patientDetailList.fName} ${patientDetailList.lName}" /></option>
														</c:otherwise>
										</c:choose>
											</c:forEach>

										 

										 
								</select>
							</div>
							<div class="clearfix"></div>
							<hr class="hidden-xs top-space-increase">
							<div class="col-sm-6" style="padding: 0">
								<div class="col-md-12 col-sm-12">
									<!-- <h3>Select Date wise</h3> -->
								</div>
								<div class="col-sm-5">
									<input type="text" name="startdate" id="startdate"
										placeholder="From Date" class="datepicker" readonly>
								</div>
								<div class="col-sm-5">
									<input type="text" name="enddate" id="enddate"
										placeholder="To Date" class="datepicker" readonly>
								</div>
								<div class="col-sm-2 text-center">
									<strong>OR</strong>
								</div>
							</div>
							<div class="col-sm-6 pad-0-md">
								<div class="col-md-12 col-sm-12 ">
									<!-- <h3>Select Doctor wise</h3> -->
								</div>
								<div class="col-sm-9 sm-full-width">
									<select class="slct_lst" id="doctorId" name="doctorId">

										<c:choose>
											<c:when test="${memberLength==1}">
												<option value="0">select doctor name</option>
												<c:forEach items="${doctorDetails}" var="doctorDetails"
													varStatus="count">
													<option value="${doctorDetails.doctorId}"><c:out
															value="${doctorDetails.fName} ${doctorDetails.lName}" /></option>
												</c:forEach>

											</c:when>
											<c:otherwise>

												<option value="0">select doctor name</option>

											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<div class="col-sm-3 text-right">
									<a href="#" class="btn-fr-all mar-top-md"
										style="line-height: 2.5"
										onClick="getConsultingHistory(${memberLength})">Search</a>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<hr>
						<%--  <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
						<div class="loader2"></div>
						<div id="consult">


<c:forEach items="${getConsultingDetailsByDoctorList}" var="getConsultingDetailsByDoctor"
													varStatus="count">
 

 
							<div class="appointment-div pat_consult prescript-Con">
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
										<div class="panel-heading reletive">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#prescription${getConsultingDetailsByDoctor.meetId}"><i>${getConsultingDetailsByDoctor.date}</i>
													<div class="dropdown">
														<h4 class="dropbtn">${getConsultingDetailsByDoctor.doctorName}</h4>
														<div class="dropdown-content dropspan_clr">
															<h3 class="content1">${getConsultingDetailsByDoctor.doctorName}</h3>
															<div class="cont-padding">
																<h6>
																	Hospital Name : <span>${getConsultingDetailsByDoctor.hospitalName}</span>
																</h6>
																<h6>
																	Patient Problem :<span>${getConsultingDetailsByDoctor.patientProblem}</span>
																</h6>
																<h6>
																	Call : <span>${getConsultingDetailsByDoctor.contactNo}</span>
																</h6>
															</div>
														</div> 
													</div> <span class="icon-prescription-1 mar-right"
													aria-hidden="true" data-target="#prescModl" data-toggle="modal" rel="popover"
													data-placement="bottom" data-original-title="Prescription"
													  onclick="showPrescription(${getConsultingDetailsByDoctor.meetId},'${getConsultingDetailsByDoctor.patientProblem}','${getConsultingDetailsByDoctor.discussion}','${getConsultingDetailsByDoctor.note}')"><i>Prescription</i></span>
												</a><a href="#" onclick="getInvoiceDetails(${getConsultingDetailsByDoctor.meetId})"><span
													class="icon-newspaper mar-right" aria-hidden="true"
													data-target="#invoice1" data-toggle="modal" rel="popover" data-placement="bottom"
													data-original-title="Invoice"> <i>Invoice</i></span></a> <a
											
													href="#" onclick="getSuggestedLabTest(${getConsultingDetailsByDoctor.meetId})"><span
													class="icon-experiment mar-right" aria-hidden="true"
													id="popoverOption" rel="popover"><i>Suggested
															Tests</i></span></a>
											</h4>
										</div>
										<%-- <div id="prescription${getConsultingDetailsByDoctor.meetId}"
											class="collapse panel-collapse presIcon"> 
											<a id="downloadButton"
												href="${pageContext.request.contextPath}/getPrescriptionByMeetId/${getConsultingDetailsByDoctor.meetId}"><span
												class="icon-download-to-storage-drive right-specing"></span></a>
											<div class="panel-body">
												<div class="row filled_prescript" id="downloadPrescription">
													<h3>Prescription</h3>
													<div class="col-sm-2">
														<label>Problem</label>
													</div>
													<div class="col-sm-10">
														<input id="medicine_nm" value="${getConsultingDetailsByDoctor.patientProblem}" type="text"
															readonly="">
													</div>
													<div class="clearfix"></div>
													<div class="col-sm-2">
														<label>Discussion</label>
													</div>
													<div class="col-sm-10">
														<input id="qnty" type="text" value="${getConsultingDetailsByDoctor.discussion}" readonly="">
													</div>
													<div class="clearfix"></div>
													<div class="col-sm-2">
														<label>Note</label>
													</div>
													<div class="col-sm-10">
														<input id="instruction" type="text" value="${getConsultingDetailsByDoctor.note}"
															readonly="">
													</div>
													<div class="clearfix"></div>
													<div class="table-responsive" id="panel-body${getConsultingDetailsByDoctor.meetId}">
														<table width="100%" border="1"
															class="tbl table table-bordered table table-hover"
															id="prescTable${getConsultingDetailsByDoctor.meetId}">
															<tbody>
																<tr align="center">
																	<th>Sr.No</th>
																	<th>Medicine</th>
																	<th>quantity</th>
																	<th>Instructions</th>
																	<th>Timing</th>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div> --%>
									</div>
								</div>
							</div>


</c:forEach>

						</div>
					</div>

					<div class="page-alerts collapse" id="alert-1"
						style="display: none"></div>
				</div>

			</div>
		</div>
	</div>
	<div id="editor"></div>


	<!-- Suggested Lab test
          -->
	<div id="viewLabTestModal"
		class="modal fade bs-example-modal-md prescription_mod reportsDesign" tabindex="-1"
		role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-body card_sec">
				<button id="close" type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
							<a  id="print" onclick="print()"><span class="icon-printer down-icon-modal"></span></a>
							<hr>
							<h4 class="modal-title">Hari Om <br> <span  id="docName">Dr. vhjghg</span></h4>
							<hr>
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
					<div id="suggestedTestDiv" style="display: none">
						<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Suggested
								Tests :</label>
							<div class="col-sm-8 medicine1">
								<p id="suggestedLabTest"></p>
							</div>
						</div>


						<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Referred by doctor :</label>
							<div class="col-sm-8 medicine1">
								<p id="referredLab"></p>
							</div>
						</div>

						<div class="form-group row" id="suggestion">
							<!-- <label for="medicine" class="col-sm-4 col-form-label">Referred Lab :</label> -->
							<div class="col-sm-8 medicine1">
								<a href="${pageContext.request.contextPath}/showBookLabAppointmentByReferrence" class="btn-fr-all">Book
									Lab Appointment</a>
							</div>
						</div>

					</div>
					<div id="emptyLabTestDiv">
						<div class="form-group row">
							<label for="medicine" class="col-sm-4 col-form-label">Not
								Suggested Tests</label>
						</div>
					</div>
					<hr>
					<div class="signB">
						Signature: <img  src="${pageContext.request.contextPath}/resources/images/sign.png" class="img-responsive img-center">
					</div>

				</div>

			</div>
		</div>

	</div>
	<div id="invoice1" class="modal fade bs-example-modal-lg reportsDesign"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<div class="modal-body card_sec" id="displayTable">
			<button id="close" type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
							<a  id="print" onclick="print()"><span class="icon-printer down-icon-modal"></span></a>
									<hr>
							<h4 class="modal-title" id="hospName"></h4>
					
							<h5 class="text-right"><strong>Dr.</strong> <span id="docName1"><br>
 </span><span id="docQualification"></span></h5>
	                				 <h5 class="text-right"><strong>Address :</strong> <span id="hospAddress"></span></h5> 
	                			<h5 class="text-right"><strong>Contact No. :</strong> <span id="contactNo"></span></h5>
	                			<h5 class="text-right"><strong>Email Id. :</strong> <span id="DocEmail"></span></h5>
							
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<hr>
					<div class="overflow-auto">
		        <div>
		            <header>
		                <div class="row">
		                    <div class="col">
		                   
		                        <a target="_blank" >
		                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" data-holder-rendered="true" />
		                            </a>
		                    </div>
		                    <hr>
		                     
		                </div>
		            </header>
		            <main>
		                <div class="row contacts text-left">
		                    <div class="col-sm-6 invoice-to">
		                        <div class="text-gray-light"><strong>INVOICE TO:</strong></div>
		                         <h4 class="to" id="patName"> </h4>
		                       <!--  <div class="email"><a >ganesh@example.com</a></div> -->
		                    </div>
		                    <div class="col-sm-6 invoice-details text-right">
		                        <div class="invoice-id"><strong>INVOICE: </strong><span id="invoiceNo"></span></div>
		                        <h5 class="date"><strong>Date of Invoice: </strong><span id="invoiceDate"></span></h5>
		                    </div>
		                </div>
		                <table border="0" cellspacing="0" cellpadding="0">
		                    <thead>
		                        <tr>
		                            <th >SR.NO.</th>
		                            <th class="text-center">Invoice For</th>
		                           
		                            <th class="right">Amount</th>
		                        </tr>
		                    </thead>
		                  
		                    <tbody>
		                     <tr>
		                            <th >1.</th>
		                            <th class="text-center">Consulting Fees</th>
		                           
		                            <th class="right"><span id="amount"></span></th>
		                        </tr>
		                     
		                    </tbody>
		                    <tfoot>
		                         
		                        
		                        <tr>
		                            
		                            <td colspan="2"> TOTAL</td>
		                            <td><span id="totalAmt"></span></td>
		                        </tr>
		                    </tfoot>
		                </table>
		                <br>
		                <div class="thanks text-center">Thank you!</div>
										<br>
		                <!-- <div class="notices">
		                    <div>NOTICE:</div>
		                    <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
		                </div> -->
		            </main>
		            <footer class="invoicefoot">
		                Invoice was created on a computer and is valid without the signature and seal.
		            </footer>
		        </div>
		        <div></div>
		    </div>
				</div>
			</div>
		</div>
	</div>
	 
	<div id="prescModl"
		class="modal fade bs-example-modal-md prescription_mod reportsDesign" tabindex="-1"
		role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-body card_sec">
				<button id="close" type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
							<a  id="print" onclick="print()"><span class="icon-printer down-icon-modal"></span></a>
							<hr>
							<h4 class="modal-title"  id="hospitalName2"> </h4>
							<h4 class="modal-title"><span  id="doctorName2"></span></h4>
							<hr>
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>

					<div class="panel-body pat_consult prescript-Con">
												<div class="row filled_prescript" id="downloadPrescription">
													<h3>Prescription</h3>
													<div class="col-sm-2">
														<label>Problem</label>
													</div>
													<div class="col-sm-10">
														<input  id="patientProblem2" type="text"
															readonly="">
													</div>
													<div class="clearfix"></div>
													<div class="col-sm-2">
														<label>Discussion</label>
													</div>
													<div class="col-sm-10">
														<input   type="text"id="disscuss2" readonly="">
													</div>
													<div class="clearfix"></div>
													<div class="col-sm-2">
														<label>Note</label>
													</div>
													<div class="col-sm-10">
														<input   type="text" id="note2"
															readonly="">
													</div>
													<div class="clearfix"></div>
													<div class="table-responsive" id="panel-body${getConsultingDetailsByDoctor.meetId}">
														<table width="100%" border="1"
															class="tbl table table-bordered table table-hover"
															id="prescTable1">
															<tbody>
																<tr align="center">
																	<th>Sr.No</th>
																	<th>Medicine</th>
																	<th>quantity</th>
																	<th>Instructions</th>
																	<th>Timing</th>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
					<hr>
					<div class="signB">
						Signature: <img id="doctorSign" class="img-responsive img-center">
					</div>

				</div>

			</div>
		</div>

	</div>
	<!-- 
	 Suggested Lab test--> <!--Doctor Payment  -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content" id="printableArea">

				<div class="modal-header pescmodl">
					<link rel="stylesheet"
						href=${pageContext.request.contextPath}/resources/css/prescription.css>
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
					<a href="#" onclick="print('printableArea')"><span
						class="icon-printer right-specing"></span></a>
					<div class="clearfix"></div>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-center pay-lab-modal">

					<div id="invoice">

						<div class="invoice overflow-auto">
							<div class="prescptPrnt">
								<header>
								<div class="row">
									<div class="col">
										<a target="_blank" class="logoimg"> <img
											src="${pageContext.request.contextPath}/resources/images/logo.png"
											data-holder-rendered="true" class="img-responsive" />
										</a>
									</div>
									<div class="col company-details">
										<h2 class="name">
											<a target="_blank"> <img
												src="${pageContext.request.contextPath}/resources/images/dr.png"
												data-holder-rendered="true" height="42" width="42" />
												<div id="drName">Dr. Kaushik Udavant</div>
											</a>
											<div id="drQual">M.B.B.S.</div>


										</h2>

										<br>
										<div id="hosp">Biocare Clinic</div>
										<div id="drMob">+91 9876543212</div>

									</div>
								</div>
								</header>

								<h1></h1>

								<main>
								<div class="row contacts">
									<div class="col invoice-to">

										<span style="font-size: 30px;">&#8478;</span>


										<h2 class="to" id="patName">Ganesh Pagar</h2>
									</div>

								</div>


								<div>
									<div class="table-responsive">
										<div class="content" id="content">



											<div class="bottomright"></div>


										</div>
									</div>
								</div>
								</main>

								<img id="sign" alt="sign" align="right" />
								<h1></h1>
								<div style="text-align: center;" id="drHospAdd"></div>

							</div>
							<div></div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Doctor Payment  --> </section>




	<%-- <jsp:include page="../include/videoCall.jsp"/> --%>
	
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
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>





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
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

/* $(document).ready(function() {    
    $("#medicine_nm").val("xyz nlkjhj"); 
    $("#qnty").val("5"); 
    $("#instruction").val("before food");
    $("#timing").val("night");
}); */
</script>
	<script>

/* $(document).ready(function(){
    $( ".time1" ).hover(function() {
           $('.bs-example-modal-lg').modal({
        show: true
    });
  });  
}); */
$(document).ready(function() {
    $(".appoint_tm > li").click(function(){
      /* $(".appoint_tm > li.highlighted").removeClass("highlighted"); */
      $(this).addClass("highlighted");
      $(".highlighted").addClass('disabled');
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
  
  /* var date = new Date();
  var today = new Date(date.getDate(),date.getMonth(), date.getFullYear());
  document.getElementById("startdate").value=today; */
  var date = new Date();
  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  
  $('.datepicker').datepicker({ format: "dd-mm-yyyy",todayHighlight: true, autoclose:"true"});
  $('.icon-prescription-1').popover({ trigger: "hover" });
  $('.datepicker').datepicker( 'setDate', today );
</script>


	<script>

 function getDoctors() {
											 
		 var patientId=document.getElementById("patientId").value; 
		 
		 $('#doctorId option').remove();
		
		 $
		 
														.getJSON(
																'${getDoctorsByPatientId}',
																{
																	patientId : patientId,
																	
																	ajax : 'true'
																},
																function(data) {
															
																																			
																	var len = data.length;
																	var strVar="";
																	strVar+="<option value=0>--select--</option>";
																	for (var i = 0; i < len; i++) {
																		
																		strVar += "<option value="+data[i].doctorId+">"+data[i].fName+" "+data[i].lName+"<\/option>";
															
																	} 
																	 $('#doctorId').append($(strVar));
																	
																	 
																})
		 
		 
	 }
	</script>
	<script>
		 
	 function getConsultingHistory(memLength) {
									 
		  $(consult).empty();  
		 var doctorId=document.getElementById("doctorId").value; 
		
		 var startdate=document.getElementById("startdate").value;
		 var enddate=document.getElementById("enddate").value;
		 var patientId=document.getElementById("patientId").value;
		
	     document.getElementById("doctorId").value=0; 	
			
	     if(patientId!="")
	     {
		  if(enddate!=null && enddate!=""||doctorId!=0){
			  
			  
		 $
		 
														.getJSON(
																'${pageContext.request.contextPath}/getConsultingDetailsByDoctor',
																{
																	doctorId : doctorId,
																	startdate : startdate,
																	enddate : enddate,
																	patientId : patientId,
																	ajax : 'true'
																},
																function(data) {
																	if(data!="")
																		{
																	var len = data.length;
																	
																	for (var i = 0; i < len; i++) {
																		
																	 
																		consultList(data[i], i);
																 
																	} 
																		}
																	else
																		{
																		var strVar="";
																		strVar += "<div class=\"notFound\">";
																		strVar += " ";
																		strVar += " 	<img src=\"${pageContext.request.contextPath}\/resources\/images\/notfound.png\" class=\"img-responsive\" alt=\"Not Found\">";
																		strVar += " 	";
																		strVar += " 	<p>Result Not Found<\/p>";
																		strVar += " ";
																		strVar += " <\/div>";
																		strVar += "     ";

																		 $('#consult').append(strVar);
																		}

																})
		  }
		 
		  else{
			  alert("Please Select Date Or  Doctor Name");
		  }
	     }
	     else
	    	 {
	    	 alert("select member");
	    	 }
		  
	 }




</script>
	<script>
function consultList(doc, i)
{
	 
	
	var doctorName=doc.doctorName;
	var doctorContact=doc.contactNo;
	var hospitalName=doc.hospitalName;
	var rating=doc.rating;
	var patientProblem=doc.patientProblem;
	var discussion=doc.discussion;
	var note=doc.note;
	var review=doc.review;
	var date=doc.date;
	var time=doc.time;
	var meetId=doc.meetId;
	var hospitalAddress=doc.address;
	var doctorQualification=doc.qualification;
	var doctorSignature=doc.signature;
	var patientName=doc.patientName;
	var strVar="";
	strVar += "<div class=\"appointment-div pat_consult prescript-Con\">";
	strVar += "  						      <div class=\"panel-group\" id=\"accordion\">";
	strVar += "							    <div class=\"panel panel-default\">";
	strVar += "							      <div class=\"panel-heading reletive\">";
	strVar += "							        <h4 class=\"panel-title\">";
	strVar += "							          <a data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#prescription"+meetId+"\"><i>Date:"+date+"<\/i> ";
	strVar += "							          <div class=\"dropdown\">";
	strVar += "										  <h4 class=\"dropbtn\">"+doctorName+"<\/h4>";
	strVar += "										  <div class=\"dropdown-content dropspan_clr\">";
	strVar += "										  <h3 class=\"content1\">"+doctorName+"<\/h3>";
	strVar += "										  <div class=\"cont-padding\">";
	strVar += "											   <h6>Hospital Name : <span>"+hospitalName+"<\/span><\/h6>";
	strVar += "											   <h6>Patient Problem :<span>"+patientProblem+"<\/span><\/h6>";
	strVar += "											   <h6>Call : <span>+91 00000335<\/span><\/h6>";
	strVar += "										   <\/div>";
	strVar += "										  <\/div>";
	strVar += "										<\/div>";
 
	 strVar += "									<span class=\"icon-prescription-1 mar-right\" aria-hidden=\"true\" data-target=\"#prescModl\" data-toggle=\"modal\" id=\"popoverOption\" rel=\"popover\" data-placement=\"bottom\" data-original-title=\"Prescription\" onClick=\"showPrescription("+meetId+",'"+patientProblem+"','"+discussion+"','"+note+"')\"><i>Prescription</i><\/span>";
	strVar += "									<a href=\"#\" onclick=\"getInvoiceDetails("+meetId+")\"><span class=\"icon-newspaper mar-right\" aria-hidden=\"true\" id=\"popoverOption\" data-target=\"#invoice1\" data-toggle=\"modal\" rel=\"popover\" data-placement=\"bottom\" data-original-title=\"Invoice\" \"> <i>Invoice<\/i><\/span><\/a>";
	strVar += "	 									<a href=\"#\" onclick=\"getSuggestedLabTest("+meetId+")\"><span class=\"icon-experiment mar-right\" aria-hidden=\"true\" id=\"popoverOption\" rel=\"popover\"   \"><i>Suggested Tests</i><\/span><\/a>";
	strVar += "									<\/a>";
	strVar += "							        <\/h4>";
	strVar += "							      <\/div>";
 
	strVar += "							    <\/div>";
	strVar += "							    <\/div>";
	strVar += "				  <\/div>";
	
	$('#consult').append($(strVar));

}



</script>

	<script>
var prescriptionData = [];

function showPrescription(meetId,patientProblem,discussion,note)
{	 
 
 document.getElementById("patientProblem2").value =patientProblem; 
	 document.getElementById("disscuss2").value =discussion; 
	 document.getElementById("note2").value =note;  
	 $
		.getJSON(
				'${getPrescriptionWithDoctorByMeetId}',
				{
					meetId : meetId,
					
					ajax : 'true'
				},
				function(data) { 
				  	
				  	document.getElementById("hospitalName2").innerHTML =data.hospitalName; 
				  	document.getElementById("doctorName2").innerHTML ="Dr. "+data.doctorName; 
				  	document.getElementById("doctorSign").src =data.signature; 
				  	
					$('#prescTable1 td').remove();
					$.each(
							data.prescriptionDetailsList,
								function(key, display) {

								var tr = $('<tr></tr>');
					tr.append($('<td></td>').html(key+1));
					tr.append($('<td></td>').html(display.medicineName));
					tr.append($('<td></td>').html(display.medicineQuantity));
					tr.append($('<td></td>').html(display.medicineInstruction));
					tr.append($('<td></td>').html(display.medicineTiming));
					
					
				
					
				 	 $('#prescTable1').append(tr);
							})

							prescriptionData=data;

				}) 
      
	 
} 


</script>

	<script>
	$('#popoverOption').popover({ trigger: "hover" });
	</script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.js"></script>
	<script>
var doc = new jsPDF();
var specialElementHandlers = {
    ".table-responsive" : function (element, renderer) {
        return true;
    }
};
/* function createPdf(meetId,problem,discussion,note,hospitalName,doctorName,address,qualification,sign,contact,patientName){
	$('#prescTabl'+meetId).remove();
	var count=1;
	var strVar="";
	strVar += "        	<table width=\"100%\" border=\"1\" class=\"tbl table table-bordered table table-hover\" id=\"prescTabl"+meetId+"\">";
	
	strVar += "   <tr align=\"center\">";
	strVar += "    <th>Sr.No<\/th>";
	strVar += "    ";
	strVar += "    <th>Medicine<\/th>";
	strVar += "    <th>quantity<\/th>";
	strVar += "    <th>Instructions<\/th>";
	strVar += "    <th>Timing<\/th>";
	strVar += "  <\/tr>";
	
	for (i = 0; i < prescriptionData.length; i++) {
		
		strVar += "   <tr align=\"center\">";
		
			 strVar += "<td>"+count+"</td>";
			 strVar += "<td>"+prescriptionData[i].medicineName+"</td>";
			 strVar += "<td>"+prescriptionData[i].medicineQuantity+"</td>";
			 strVar += "<td>"+prescriptionData[i].medicineInstruction+"</td>";
			 strVar += "<td>"+prescriptionData[i].medicineTiming+"</td>";
		 strVar += "  <\/tr>";
	count++;	
	}
	strVar += "";
	strVar += "<\/table> ";
	$('#content').append($(strVar));
	
	
	
	
	$("#drName").html(doctorName);
	$("#drQual").html(qualification);
	$("#drHospAdd").html(address);
	$("#hosp").html(hospitalName);
	$("#hosp").html(hospitalName);
	$("#drMob").html(contact);
	$("#patName").html(patientName);
	
	document.getElementById("sign").src=sign;
	//$("#sign").attr("src",sign);
	$('#myModal').modal('show'); 
	
	
} */

function printTable(tableId,hospital)
{
		    
	        var html="<html>";
	        html += "<p>"+hospital+"<\/p>";
	        html += "<hr>";
	        html += "<br>";
	        html+= document.getElementById("panel-body"+tableId).innerHTML;

	        html+="</html>";
	       

	        var printWin = window.open();
	        printWin.document.write(html);
	        printWin.document.close();
	        printWin.focus();
	        printWin.print();
	        printWin.close();
	    
}
</script>

	<!-- Feed Back -->
	<script>
 function feedBackNotification(){
	  
	  var displayDiv=document.getElementById("alert-1");
	  displayDiv.style.display="block";					
				$
				 
				.getJSON(
						'${getDoctorsAndLabsForRating}',
						{
													
							ajax : 'true'
						},
						function(data) {
														
										var len = data.doctorsInfo.length;
										var lengt = data.labInfo.length;
										
									
										var strVar="";
										var strV="";
										
										for ( var i = 0; i < len; i++) {
											
										
										strVar += "<div class=\"alert alert-Thanks For Your Feedback  page-alert\">";
										strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
										strVar += "        <strong>"+data.doctorsInfo[i].doctorName+"-"+data.doctorsInfo[i].date+"<\/strong><strong class=\"pull-right\">"+data.doctorsInfo[i].patientName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\" class=\"feed_bk\" onClick=\"openFeedBackModel('"+data.doctorsInfo[i].patientName+"',"+data.doctorsInfo[i].patintId+","+data.doctorsInfo[i].doctorId+","+data.doctorsInfo[i].meetId+")\"> Give Feedback<\/a>";
									
										strVar += "    <\/div>";

										
										}
										for ( var j = 0; j < lengt; j++) {
											
											
											strVar += "<div class=\"alert alert-Thanks For Your Feedback page-alert\">";
											strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
											strVar += "        <strong>"+data.labInfo[j].labName+"-"+data.labInfo[j].date+"<\/strong><strong class=\"pull-right\">"+data.labInfo[j].labTestName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\"  class=\"feed_bk\" onClick=\"openLabFeedBackModel('"+data.labInfo[j].patientName+"',"+data.labInfo[j].patientId+","+data.labInfo[j].labId+","+data.labInfo[j].appointId+")\"> Give Feedback<\/a>";
											strVar += "        <a href\"#\" class=\"feed_bk\"> Not Now<\/a>";
											strVar += "    <\/div>";

											
											}
										
										$('#alert-1').html(strVar);
										
										$("#alert-1").trigger("chosen:updated"); 
									
							
							
														 
						})
						
			}	

function openFeedBackModel(patientName,patientId,doctorId,meetId)
{
	document.getElementById("ratPatientName").value=patientName;
	document.getElementById("ratPatientId").value=patientId;
	document.getElementById("ratdoctorId").value=doctorId;
	document.getElementById("ratMeetId").value=meetId;
	
	  $('#ratingModal').modal('show');




}

function openLabFeedBackModel(patientName,patientId,labId,appId)
{
	
	document.getElementById("ratLPatientName").value=patientName;
	document.getElementById("ratLPatientId").value=patientId;
	document.getElementById("ratLlabId").value=labId;
	document.getElementById("ratLappId").value=appId;
	
	  $('#labRatingModal').modal('show');




}

function saveFeedBack() {
	 
	 var ratPatientId=document.getElementById("ratPatientId").value; 
	 var ratdoctorId=document.getElementById("ratdoctorId").value; 
	 var ratPatientName=document.getElementById("ratPatientName").value; 
	 var rating=document.getElementById("combostar").value; 
	 var review=document.getElementById("review").value; 
	 var ratMeetId=document.getElementById("ratMeetId").value; 
	 
	 $
													.getJSON(
															'${submitDoctorRating}',
															{
																ratPatientId : ratPatientId,
																ratdoctorId : ratdoctorId,
																ratPatientName : ratPatientName,
																rating : rating,
																review : review,
																ratMeetId : ratMeetId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("review").value=""; 
																 
																location.reload();
																

															})
	 
	 
}
function saveLabFeedBack() {
	 
	 var ratLPatientId=document.getElementById("ratLPatientId").value; 
	 var ratLlabId=document.getElementById("ratLlabId").value; 
	 var ratLPatientName=document.getElementById("ratLPatientName").value; 
	 var rating=document.getElementById("labcombostar").value; 
	 var labReview=document.getElementById("labReview").value; 
	 var ratLappId=document.getElementById("ratLappId").value; 
	 
	  
	 $
													.getJSON(
															'${submitLabRating}',
															{
																ratLPatientId : ratLPatientId,
																ratLlabId : ratLlabId,
																ratLPatientName : ratLPatientName,
																rating : rating,
																labReview : labReview,
																ratLappId : ratLappId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("labReview").value="";
																alert(data.message);
																location.reload();
																

															})
	 
	 
}  

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}
</script>

	<script type="text/javascript">
function getSuggestedLabTest(meetId) {
	
	   $('#viewLabTestModal').modal('show')
	   
	   $('#suggestedTestDiv').hide();
	   $('#emptyLabTestDiv').show();

	 
	   	
	   	
	   	 $.getJSON('${getSuggestLabTestFromDoctorForPatient}',

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



function getInvoiceDetails(meetId) {
	
	
	 $.getJSON('${getConsultingBillByMeetId}',

				{
		 meetId : meetId,

					ajax : 'true',

				}, function(data) {
					
					$("#hospName").html(data.hospitalName);
					$("#docName1").html(data.doctorName);
					$("#docQualification").html(data.qualification);
					$("#hospAddress").html(data.address);
					$("#contactNo").html(data.contactNo);
					$("#DocEmail").html(data.emailId);
					$("#patName").html(data.patientName);
					$("#invoiceNo").html(data.meetId);
					$("#invoiceDate").html(data.date);
					$("#amount").html(data.amount);
					$("#totalAmt").html(data.amount);
				});
	
}


</script>
</body>
</html>