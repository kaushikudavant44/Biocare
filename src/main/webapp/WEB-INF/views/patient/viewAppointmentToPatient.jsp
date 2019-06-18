<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
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
	<link href="${pageContext.request.contextPath}/resources/css/videoCall2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />

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

/* .autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto; width:250px !important; }
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; border-bottom: 1px dashed #999; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; } */
</style>





</head>
<body onload="displayTable()">
	<jsp:include page="../include/patientHeader.jsp" />

	<c:url var="showDoctorProfile" value="/showDoctorProfile" />
	<c:url var="getAppointmentsTime" value="/getAppointmentsTime" />
	<c:url var="getRatingDetailsByDoctorId"
		value="/getRatingDetailsByDoctorId" />
	<c:url var="bookAppointment" value="/bookAppointment" />
	<c:url var="cancelDoctorAppointmentByPatient"
		value="/cancelDoctorAppointmentByPatient" />
	<c:url var="getLabAppointmentByDate" value="/getLabAppointmentByDate" />
	<c:url var="deleteLabAppointment" value="/deleteLabAppointment" />

	<c:url var="getDoctorsAndLabsForRating"
		value="/getDoctorsAndLabsForRating" />
	<c:url var="submitDoctorRating" value="/submitDoctorRating" />
	<c:url var="submitLabRating" value="/submitLabRating" />
		<c:url var="getLabAppointmentForPayment" value="/getLabAppointmentForPayment" />
	 

	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>Check Your Appointments</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />
 <fmt:parseDate value="${currentDate}" var="currDate" 
                              pattern="dd-MM-yyyy" />
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="filter_div">
							<div class="col-md-12 col-sm-12">
								<h3>Your Appointment</h3>
							</div>
							<input type="hidden" id="selectedAppType" name="selectedAppType"
								value="${appointmentType}">
							<form
								action="${pageContext.request.contextPath}/showViewAppointmentToPatient"
								method="GET">
								<div class="col-sm-3">
									<select class="slct_lst" id="viewPatientId"
										name="viewPatientId">
										<c:forEach items="${patientDetailList}"
											var="patientDetailList">
											<c:choose>
												<c:when test="${patientDetailList.patientId==patientId}">
													<option value="${patientDetailList.patientId}" selected>${patientDetailList.fName}
														${patientDetailList.lName}</option>
												</c:when>
												<c:otherwise>
													<option value="${patientDetailList.patientId}">${patientDetailList.fName}
														${patientDetailList.lName}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2">
									<input type="text" name="fromDate" class="datepicker"
										id="fromDate" value="${fromDate}" placeholder="From date"
										readonly>

								</div>
								<div class="col-sm-2">
									<input type="text" name="toDate" class="datepicker" id="toDate"
										value="${toDate}" placeholder="to date" readonly>

								</div>


								<div class="col-sm-3">
									<select class="slct_lst" id="viewAppType" name="viewAppType">
										<c:choose>
											<c:when test="${appointmentType==0}">
												<option value="0" selected>doctor</option>
											</c:when>
											<c:otherwise>
												<option value="0">doctor</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${appointmentType==1}">
												<option value="1" selected>lab</option>
											</c:when>
											<c:otherwise>
												<option value="1">lab</option>
											</c:otherwise>
										</c:choose>

									</select>
								</div>
								<div class="col-sm-2">
									<input type="submit" value="search" class="btn-fr-all">
								</div>
							</form>
						</div>
						<div class="clearfix"></div>
						<hr>
						<div class="reporttable">
							<div class="table-responsive" id="tab1" style='display: none'>
								<c:if test="${! empty( getAppointmentDetailsList ) }">
									<table width="100%" border="0"
										class="tbl table table-bordered table table-hover" id="table1">
										<thead>
											<tr align="center">
												<th>Sr.No</th>
												<th>Date</th>
												<th>Time</th>
												<th>Hospital</th>
												<th>Doctor</th>
												<th>Status</th>
												<th>Cancel</th>												
												<th>Payment</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${getAppointmentDetailsList}"
												var="getAppointmentDetailsList" varStatus="count">
												<fmt:parseDate value="${getAppointmentDetailsList.date}" var="apppointDate" 
                              pattern="dd-MM-yyyy" /> 
												<form
													action="${pageContext.request.contextPath}/consultingPaymentCheckout"
													method="post">
													<tr>
														<td><c:out value="${count.index+1}" /></td>
														<td><c:out value="${getAppointmentDetailsList.date}" /></td>
														<td><c:out value="${getAppointmentDetailsList.time}" /></td>
														<td><c:out
																value="${getAppointmentDetailsList.hospitalName}" /></td>
														<td><c:out
																value="${getAppointmentDetailsList.doctorName}" /></td>

                                                        <c:choose>
															<c:when test="${getAppointmentDetailsList.status==1}">
																<td><strong>Confirmed</strong></td>
															</c:when>
															<c:when test="${getAppointmentDetailsList.status==4}">
																<td><strong>Completed</strong></td>
															</c:when>
															<c:when test="${getAppointmentDetailsList.status==0}">
																<td><strong>Pending</strong></td>
															</c:when>
															<c:when test="${getAppointmentDetailsList.status==3}">
																<td><strong>Rejected</strong></td>
															</c:when>
															<c:otherwise>
																<td></td>

															</c:otherwise>

														</c:choose>

														<c:choose>
															<c:when test="${getAppointmentDetailsList.status==4}">
																<td><strong>completed</strong></td>
															</c:when>
															<c:when test="${getAppointmentDetailsList.status==2}">
																<td><strong>cancelled</strong></td>
															</c:when>
															<c:when test="${getAppointmentDetailsList.status==3}">
																<td><button class="appoinment-btn hvr-rectangle-in"
																		disabled>Cancel</button></td>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when
																		test="${getAppointmentDetailsList.paymentStatus==0}">
																		<td><input type="button" class="btn-fr-all" value="cancel" onclick="deleteAppointment(${getAppointmentDetailsList.appointId});" ></td>
																	</c:when>
																	<c:otherwise>
																		<td><a class=" " <c:out value="${delStatus}" />
																			disabled="disabled"><span
																				style="text-decoration-line: line-through;">Cancel</span></a></td>
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>

						 
														<c:choose> 
															<c:when
																test="${getAppointmentDetailsList.paymentStatus==0 && getAppointmentDetailsList.status==1 && currDate <= apppointDate}">
																<input type="hidden" name="appointId"
																	value="${getAppointmentDetailsList.appointId}">
																<input type="hidden" name="totalAmt"
																	value="${getAppointmentDetailsList.amount}">

																<td><input type="submit" class="btn-fr-all"
																	data-toggle="modal" data-target="#myModal"
																	value="Payment"></td>
															</c:when>
															<c:when
																test="${getAppointmentDetailsList.paymentStatus==1}">
																<td>Paid</td>
																</c:when>
															<c:otherwise>
																<td></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</form>
											</c:forEach>
										</tbody>



									</table>
								</c:if>
							</div>
							<div class="table-responsive" id="tab2" style='display: none'>
								<table width="100%" border="0"
									class="tbl table table-bordered table table-hover" id="table2">
									<thead>
										<tr align="center">
											<th>Sr.No</th>
											<th>Date</th>
											<th>Time</th>
											<th>Lab</th>
											<th>Test</th>
											<th>Cancel Appointment</th>
											<th>Confirmation Status</th>
<th>Invoice</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${getlabAppointmentDetailsList}"
											var="getAppointmentDetailsList" varStatus="count">
											<tr>
												<td><c:out value="${count.index+1}" /></td>
												<td><c:out value="${getAppointmentDetailsList.date}" /></td>
												<td><c:out value="${getAppointmentDetailsList.time}" /></td>
												<td><c:out value="${getAppointmentDetailsList.labName}" /></td>
												<td><c:out
														value="${getAppointmentDetailsList.labTestName}" /></td>

												<c:choose>
													<c:when test="${getAppointmentDetailsList.status==4}">
														<td><strong>Sample Collected</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==5}">
														<td><strong>Completed</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==2}">
														<td><strong>Cancelled</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==3}">
														<td><strong>Rejected</strong></td>
													</c:when>

													<c:otherwise>
														<td>
															<button class="appoinment-btn hvr-rectangle-in"
																<c:out value="${delStatus}" /> style="color: blue"
																onclick="deleteLabAppointment(${getAppointmentDetailsList.appointId});">
																<strong>Cancel</strong>
															</button>
														</td>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${getAppointmentDetailsList.status==1}">
														<td><strong>Confirmed</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==0}">
														<td><strong>Pending</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==2}">
														<td><strong>Cancelled</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==3}">
														<td><strong>Rejected</strong></td>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==4}">

														<c:if test="${getAppointmentDetailsList.paymentStatus==1}">
															<td><strong>Sample Collected & Paid</strong></td>
														</c:if>
														<c:if test="${getAppointmentDetailsList.paymentStatus==0}">
															<td><strong><a href="#myModal"
																	data-toggle="modal"
																	onclick="getReportPayment(${getAppointmentDetailsList.appointId},'${getAppointmentDetailsList.labName}')">Proceed
																		to Payment <i class="fa fa-arrow-circle-right"
																		style="font-size: 24px"></i>
																</a></strong></td>
														</c:if>
													</c:when>
													<c:when test="${getAppointmentDetailsList.status==5}">
														<c:if test="${getAppointmentDetailsList.paymentStatus==1}">
															<td><strong>Completed & Paid</strong></td>
														</c:if>
														<c:if test="${getAppointmentDetailsList.paymentStatus==0}">
															<td><strong><a href="#myModal"
																	data-toggle="modal"
																	onclick="getReportPayment(${getAppointmentDetailsList.appointId}, '${getAppointmentDetailsList.labName}')">Proceed
																		to Payment <i class="fa fa-arrow-circle-right"
																		style="font-size: 24px"></i>
																</a></strong></td>
														</c:if>
													</c:when>
													<c:otherwise>
														<td></td>

													</c:otherwise>

												</c:choose>
												<c:choose>
												<c:when test="${getAppointmentDetailsList.paymentStatus==1}">
												 
<td><a href="${pageContext.request.contextPath}/showLabBill/${getAppointmentDetailsList.appointId}">Invoice</a></td>
</c:when>
<c:otherwise>
<td></td>
</c:otherwise>
</c:choose>
											</tr>

										</c:forEach>
									</tbody>



								</table>

							</div>

						</div>


					</div>

					<div class="page-alerts collapse" id="alert-1"
						style="display: none"></div>
				</div>

			</div>
		</div>
	</div>
	</section>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Consulting Payment</h4>

				</div>
				<form
					action="${pageContext.request.contextPath}/labReportPaymentCheckout"
					method="post">
					<div class="modal-body text-center pay-lab-modal">
						<h4>you have received request regarding Consulting Payment</h4>

						<p id="labName"></p>
					 
						<p id="date"></p>
						<p id="subTotal"></p>
						<p id="discount"></p>
						<hr>
						<p id="totalAmount"></p>

						<input type="hidden" id="appointmentId" name="appointmentId"> 


					</div>
					<div class="modal-footer">
						<input type="submit" value="Pay" class="btn-fr-all">
						<!-- <input type="button" value="Decline" class="btn-fr-all"> -->
					</div>
				</form>
			</div>
		</div>
	</div>



	<!--Doctor Payment  -->
	<!-- <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Doctor Payment</h4>
       
      </div>
      <div class="modal-body text-center pay-lab-modal">
	           <h4>you have receive request regarding Doctor payment</h4>
	          
	           <p><strong>Doctor Name : </strong> Dr. Kaushik Udavant</p>
	           <p><strong>Appointment Type :</strong> Consult</p>
	           <p><strong>Date :</strong> 2018-11-12 12:34:0</p>
	           <h3><strong>Amount :</strong> <span> 500 </span></h3>

      </div>
      <div class="modal-footer">
                    <input type="button" value="Pay" class="btn-fr-all">
                   
                </div>
      </div>
    </div>
    </div> -->
	<!--Doctor Payment  -->

	<!-- Modal -->
	<!-- <div class="modal fade pay-wallet" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Make Payment</h4>
      </div>
      <div class="modal-body">
        <div class="wallet-blnc">
						<img src="/biocare/resources/images/wallet.png" class="img-responsive" alt="wallet">
						<h4>Your wallet Balance</h4>
						<h3><span>Rs.</span> 0000</h3>
					</div>
					<div class="wallet-sec">
						<input type="text" placeholder="Enter refferal code">
						<input type="text" placeholder="Enter Money to add">
						<input type="submit" class="btn-fr-all text-center" value="Add money to wallet">
					</div>
      </div>
    </div>
  </div>
</div> -->
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
$('.datepicker').datepicker({ format: "dd-mm-yyyy"});
$(function() {
	  $('.panel-default a').click(function() {
	    if ($(this).hasClass('activestate')) {
	      $(this).removeClass('activestate');
	    } else {
	      $('.panel-default a').removeClass('activestate');
	      $(this).addClass('activestate');
	    }
	  });
	});
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
  
 

</script>
	<script>
function displayTable()
{
	var type=document.getElementById("selectedAppType").value;
	if(type==0) {

        document.getElementById("tab1").style.display = 'block';
        document.getElementById("tab2").style.display = 'none';
    }
    else
    {
    	document.getElementById("tab2").style.display = 'block';
        document.getElementById("tab1").style.display = 'none';
    }
	
	
	
	
}



function deleteAppointment(id)
{
	   
	   
	   if(confirm("Are you sure cancel appointment?"))
		   {
		       
		   
		   $
			.getJSON(
					'${cancelDoctorAppointmentByPatient}',

					{
						appId : id,
						 
						 
						ajax : 'true'

					},
					function(data) {
						
						 
						  location.reload();
						});
		   
		   
		   }
	
}

function deleteLabAppointment(id)
{
	   if(confirm("Are you sure cancel appointment?"))
		   {
		       
		   
		   $
			.getJSON(
					'${deleteLabAppointment}',

					{
						appId : id,
						 
						 
						ajax : 'true'

					},
					function(data) {
					 
						location.reload();
					
		});
		   
		   
		   }
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
</script>

<script type="text/javascript">
function getReportPayment(appointmentId, labName){
$('#labName').text("Lab Name : "+labName);
//$('#labName').text(labName);
$('#appointmentId').val(appointmentId);

$

.getJSON(
		'${getLabAppointmentForPayment}',
		{
			appointmentId :appointmentId,			
			ajax : 'true'
		},
		function(data) {
			$('#date').text("Date :  "+data.labAppDate);
			$('#subTotal').text("Sub Total : "+data.amount);
			$('#discount').text("Discount % : "+data.discount);
			$('#totalAmount').text("Total : "+data.totalAmount);
		});
  

	}
</script>
</body>
</html>