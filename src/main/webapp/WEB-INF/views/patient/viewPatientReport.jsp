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
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />



</head>
<body>

	<input type="hidden" id="dcmFileUrl" value="${dcmFileUrl}">

	<jsp:include page="../include/patientHeader.jsp" />
	<c:url var="sharePatientReportWithDoc"
		value="/sharePatientReportWithDoc" />
	<c:url var="getBabyBornReports" value="/getBabyBornReports" />
	<c:url var="getDoctorsAndLabsForRating"
		value="/getDoctorsAndLabsForRating" />
	<c:url var="getBabyBornReports" value="/getBabyBornReports" />
	<c:url var="getBabyReportByReportId" value="/getBabyReportByReportId" />

	<div class="clearfix"></div>
	<section class="doc_login doc_filter inssurance_buy" id="medicine">
	<div class="dashboard_nm text-center">
		<h4>Patient Reports</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">

					<div class="bhoechie-tab-content active card">
						<div class="filter_div">
							<input type="hidden" value="${reportUrl}" id="reportUrl">
							<div class="col-md-12 col-sm-12">
								<h4>Send Reports To Doctor</h4>
							</div>
							<div class="col-sm-5">
								<input type="hidden" value="${patientId}" id="patId"> <select
									class="slct_lst" id="doctorId" name="doctorId">
									<option value="0">select doctor</option>
									<c:forEach items="${doctorDetails}" var="doctorDetails"
										varStatus="count">
										<option value="${doctorDetails.doctorId}"><c:out
												value="${doctorDetails.fName} ${doctorDetails.lName}" /></option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-2">
								<input type="button" class="btn-fr-all" value="send"
									onclick="printChecked()">
							</div>
						</div>

						<div class="clearfix"></div>
						<hr>
						<c:choose>
							<c:when test="${empty getPatientReportsList}">

								<div class="notFound">
									<img
										src="${pageContext.request.contextPath}/resources/images/notfound.png"
										class="img-responsive" alt="Not Found">
									<p>Result Not Found</p>
								</div>

							</c:when>
							<c:otherwise>
								<div class="bs-example appontlist">
									<ul class="nav nav-tabs consult_patient_tab report">
										<li class="active"><a data-toggle="tab" href="#sectionA">Reports</a></li>
										<li style="float: right;"></li>
										<!--  <li><a data-toggle="tab" href="#sectionB">Payment Requests</a></li>
			        <li><a data-toggle="tab" href="#sectionC">Invoice</a></li> -->
									</ul>
								</div>
								<div class="tab-content">
									<div id="sectionA" class="tab-pane fade in active">
										<div class="table-responsive">
											<input type="text" id="reportTableSearch"
												onkeyup="searchData()" class="form-control search"
												placeholder=" Search" style="float: right; width: 300px">
											<div class="clearfix"></div>
											<hr>
											<table width="100%" border="0"
												class="tbl table table-bordered table table-hover"
												id="reportTable">
												<thead>
													<tr align="center">
														<th>Select To Share</th>
														<th>Sr.No</th>
														<th>Test</th>
														<th>Lab Name</th>
														<th>Date</th>
														<th>Report File</th>
													</tr>
												</thead>
												<tbody>


													<c:forEach items="${getPatientReportsList}"
														var="getPatientReports" varStatus="myIndex">

														<tr align="center">
															<c:choose>
																<c:when test="${getPatientReports.status==1}">
																	<td><input type="checkbox" name="acs"
																		value="${getPatientReports.reportId}"></td>
																</c:when>
																<c:otherwise>
																	<td></td>
																</c:otherwise>
															</c:choose>
															<td>${myIndex.index+1}</td>
															<td>${getPatientReports.labTestName}</td>
															<td>${getPatientReports.labName}</td>
															<td>${getPatientReports.date}</td>
															<c:choose>
																<c:when test="${getPatientReports.status==1}">
																	<td><a href="#"
																		onclick="openReport(${getPatientReports.reportId},'${getPatientReports.fileName}',${getPatientReports.patientId},${getPatientReports.fileType})">${getPatientReports.labTestName}
																			<i class="fa fa-file-o" style="font-size: 15px"></i>
																	</a></td>

																</c:when>
																<c:otherwise>
																	<td><a
																		href="${pageContext.request.contextPath}/labReportPaymentByAppointmentId/${getPatientReports.appointmentId}">Proceed
																			to Payment <i class="fa fa-arrow-circle-right"
																			style="font-size: 24px"></i>
																	</a></td>

																</c:otherwise>
															</c:choose>
														</tr>

													</c:forEach>

												</tbody>

											</table>
										</div>
									</div>
									<%-- <div id="sectionB" class="tab-pane fade in">
            <div class="row">
	                	<div class="col-md-12 col-sm-12">
	                	
	                		<div class="table-responsive">
	                		<table width="100%" border="0">	
									<thead>
									<tr>
										<th>Sr</th>
										<th>Date</th>
										<th>Lab Name</th>
										<th>Report</th>
										<th>Status</th>
										
									</tr>
									<c:forEach items="${pateintReportPaymentDetailsList}" var="pateintReportPaymentDetailsList" varStatus="count">
									<tr>
								
										<td>${count.index+1}</td>
										<td>${pateintReportPaymentDetailsList.reportDate}</td>
										<td>${pateintReportPaymentDetailsList.labName}</td>
										<td><a href="#myModal" data-toggle="modal" onclick="paymentReport(${pateintReportPaymentDetailsList.reportId},${pateintReportPaymentDetailsList.txnTableId},'${pateintReportPaymentDetailsList.labName}','${pateintReportPaymentDetailsList.labTestName}','${pateintReportPaymentDetailsList.createdDate}', ${pateintReportPaymentDetailsList.totalAmount})">${pateintReportPaymentDetailsList.reportFileName}</a></td>
										<td>Unpaid</td>
										 
									</tr>
								</c:forEach>	
									</thead>
							</table>
	                		</div>
	                	 	
	             
	                	</div>
	                </div>
        </div>
         --%>
									<%-- <div id="sectionC" class="tab-pane fade in">
            <div class="row">
	                	<div class="col-md-12 col-sm-12">
	                	
	                		<div class="table-responsive">
	                		<table width="100%" border="0">	
									<thead>
									<tr>
										<th>Sr</th>
										<th>Date</th>
										<th>Lab Name</th>
										<th>Report</th>
										
										<th>Invoice</th>
									</tr>
								 <c:forEach items="${paidPateintReportPaymentDetailsList}" var="paidPateintReportPaymentDetailsList" varStatus="count">
									<tr>
								
										<td>${count.index+1}</td>
										<td>${paidPateintReportPaymentDetailsList.reportDate}</td>
										<td>${paidPateintReportPaymentDetailsList.labName}</td>
										<td><a href="#myModal" data-toggle="modal" onclick="paymentReport(${paidPateintReportPaymentDetailsList.reportId},${paidPateintReportPaymentDetailsList.txnTableId},'${paidPateintReportPaymentDetailsList.labName}','${paidPateintReportPaymentDetailsList.labTestName}','${paidPateintReportPaymentDetailsList.createdDate}', ${paidPateintReportPaymentDetailsList.totalAmount})">${paidPateintReportPaymentDetailsList.reportFileName}</a></td>
										
										<td>
										 <a href="${pageContext.request.contextPath}/showLabBill/${paidPateintReportPaymentDetailsList.txnTableId}">	<span class="icon-prescription-1" 												
													 class="icon-prescription-1" data-placement="bottom" data-original-title="Lab Invoice">	</span>View Invoice</a>
											</td>
									</tr>
								</c:forEach>	 
									</thead>
							</table>
	                		</div>
	                	 	
	             
	                	</div>
	                </div>
        </div> --%>


								</div>

							</c:otherwise>
						</c:choose>


					</div>
					<div class="page-alerts collapse" id="alert-1"
						style="display: none"></div>

				</div>

			</div>
		</div>
	</div>
	</section>
	<!-- Baby Report -->
	<div id="largeModal11" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-body" id="report">
					<input type="button" onclick="closeModel()" value="x">
					<div class="baby_details card_sec">


						<div class="clearfix"></div>

						<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<ul class="card_list">
							<li>
								<h3 id="hospitalN"></h3> <span></span>
							</li>

							<li><h3>
									<span id="docFName"></span>
								</h3> <span>(<span id="docSpec"></span>)
							</span></li>
							<li><strong>Mother Name :</strong> <span id="motherN"
								name="motherName"></span></li>
							<li><strong>Date of birth :</strong> <span id="dobirth"
								name="dob"></span></li>
							<li><strong>Time of Birth :</strong> <span id="dobT"
								name="dobTime"></span></li>
							<li><strong>Birth Weight :</strong> <span id="birthW"
								name="birthWeight"></span></li>
							<li><strong>Height :</strong> <span id="len" name="height"></span></li>

							<li><strong>Head Circumference :</strong> <span id="headC"
								name="headCircumference"></span></li>
							<li><strong>Blood Group :</strong> <span id="bloodG"
								name="bloodGroup"></span></li>


							<li><label><strong>Delivery Type : </strong> <span
									id="deliveryT" name="deliveryType"></span> </label></li>

							<li><label><strong>Gender : </strong><span
									id="gender" name="sex"></span> </label></li>
						</ul>
						<input type="hidden" id='doctorId' name="doctorId">
						<div class="card_img">
							<img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								alt="logo">
						</div>
						<!-- <input type="button" class="history_sbmt" id="mkImage" value="Send To Patient"> -->
					</div>

				</div>

			</div>
		</div>
	</div>
	<!--  -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Lab Payment</h4>

				</div>
				<form
					action="${pageContext.request.contextPath}/labReportPaymentCheckout"
					method="post">
					<div class="modal-body text-center pay-lab-modal">
						<h4>you have received request regarding lab payment</h4>

						<p id="labName"></p>
						<p id="testName"></p>
						<p id="date"></p>
						<h3 id="totalAmount"></h3>

						<input type="hidden" id="txnTableId" name="txnTableId"> <input
							type="hidden" id="reportId" name="reportId"> <input
							type="hidden" id="amount" name="amount">


					</div>
					<div class="modal-footer">
						<input type="submit" value="Pay" class="btn-fr-all">
						<!-- <input type="button" value="Decline" class="btn-fr-all"> -->
					</div>
				</form>
			</div>
		</div>
	</div>




	<div class="lab_img">
		<div class="modal fade" id="myModal10" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<div class="logoCircle">
							<img
								src="${pageContext.request.contextPath}/resources/images/logocircle.png"
								class="img-responsive" alt="Bionische">
						</div>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">View Reports</h4>
					</div>

					<div class="modal-body" id="sketchDiv">
						<a onclick="printTable()"><span
							class="icon-printer down-icon-modal"></span></a>

						<div id="sketch">
							<img id="reportImage" src="" class="img-responsive"
								alt="Report not Available">
							<canvas id="paint" width="980" height="850"></canvas>

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
						<div class="logoCircle">
							<img
								src="${pageContext.request.contextPath}/resources/images/logocircle.png"
								class="img-responsive" alt="Bionische">
						</div>
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
	</div>
	<%-- 	<jsp:include page="../include/videoCall.jsp"/> --%>

	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
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

	<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'> -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>


	<script>
function paymentReport(reportId,txnTableId,labName,testName,date,totalAmount){
	document.getElementById("reportId").value=reportId;
	document.getElementById("txnTableId").value=txnTableId;
	document.getElementById("amount").value=totalAmount;
	
	 
	
	document.getElementById("labName").innerHTML="<strong>Lab Name :</strong>"+labName;
	document.getElementById("testName").innerHTML="<strong>Test Name :</strong>"+testName;
	document.getElementById("date").innerHTML="<strong>Date :</strong>"+date;
	document.getElementById("totalAmount").innerHTML="<strong>Amount : </strong> <span>"+totalAmount+" </span>";
}

function printCheckedd()
{
	alert("hi");
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
</script>


	<script>
//Chat and video
$(".messages").animate({ scrollTop: $(document).height() }, "fast");

$("#profile-img").click(function() {
	$("#status-options").toggleClass("active");
});

$(".expand-button").click(function() {
  $("#profile").toggleClass("expanded");
	$("#contacts").toggleClass("expanded");
});

$("#status-options ul li").click(function() {
	$("#profile-img").removeClass();
	$("#status-online").removeClass("active");
	$("#status-away").removeClass("active");
	$("#status-busy").removeClass("active");
	$("#status-offline").removeClass("active");
	$(this).addClass("active");
	
	if($("#status-online").hasClass("active")) {
		$("#profile-img").addClass("online");
	} else if ($("#status-away").hasClass("active")) {
		$("#profile-img").addClass("away");
	} else if ($("#status-busy").hasClass("active")) {
		$("#profile-img").addClass("busy");
	} else if ($("#status-offline").hasClass("active")) {
		$("#profile-img").addClass("offline");
	} else {
		$("#profile-img").removeClass();
	};
	
	$("#status-options").removeClass("active");
});

function newMessage() {
	message = $(".message-input input").val();
	if($.trim(message) == '') {
		return false;
	}
	$('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
	$('.message-input input').val(null);
	$('.contact.active .preview').html('<span>You: </span>' + message);
	$(".messages").animate({ scrollTop: $(document).height() }, "fast");
};

$('.submit').click(function() {
  newMessage();
});

$(window).on('keydown', function(e) {
  if (e.which == 13) {
    newMessage();
    return false;
  }
});

</script>

	<script type="text/javascript">
			function printChecked(){
				
				var patId=document.getElementById("patId").value;
				var doctorId=document.getElementById("doctorId").value;
				var items=document.getElementsByName('acs');
				var selectedItems="";

				var newStr;
				
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox' && items[i].checked==true)
						selectedItems+=items[i].value+",";
					newStr = selectedItems.substring(0, selectedItems.length-1);
				}
				
				if(doctorId!=0&&selectedItems!=0)
					{
					
				$
				 
				.getJSON(
						'${sharePatientReportWithDoc}',
						{
							patId : patId,
							doctorId : doctorId,
							newStr : newStr,
							
							ajax : 'true'
						},
						function(data) {
					     if(data.isError)
					    	 {
					    	 alert("failed to share");
					     location.reload();
					    	 }
					     else
					    	 {
					    	  alert("Shared Successfully");
					    	
					    	 location.reload();
					    	 }
							
						})		
					}
				else
					{
					
					alert("please select preferred doctor and Reports")
					location.reload();
					}
				
				
			}	
			
		  
			 
			 
			 
			 
			 function openReport(reportId,fileName,patientId,type) {

				//	alert(reportId+"reportId "+reportUrl);
				var originalModal11 = $('#myModal11').clone();
				var originalModal10 = $('#myModal10').clone();
					var c = document.getElementById("paint");
					var ctx = c.getContext("2d");
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					var reportUrl = document.getElementById("reportUrl").value;
					var dcmUrl=document.getElementById("dcmFileUrl").value;
				 var host= window.location.hostname;
					if (type == 0) {

						$('#myModal11').remove();
						 var myClone = originalModal11.clone();
						    $('body').append(myClone);
						document.getElementById("reportPdf").data = reportUrl+""+patientId+"/reports/"+fileName;
						
						$('#myModal11').modal('show');
					}
					else if (type ==2) {
						window.open('${pageContext.request.contextPath}/showDcmViewer?input='+location.protocol+'//'+  host+'/images/patient/'+patientId+"/reports/"+fileName, '_blank'); 

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

						
					}
					
					else if(type==8){
						/* $('#myModal10').remove();
						 var myClone = originalModal10.clone();
						    $('body').append(myClone);
						document.getElementById("reportImage").src = fileName;
						$('#myModal10').modal('show');
						var img = document.getElementById("reportImage");
						ctx.drawImage(img, 0, 0); */
						
						$
						 
						.getJSON(
								'${getBabyReportByReportId}',
								{
									reportId : reportId,
									
									ajax : 'true'
								},
								function(data) {
							     
									document.getElementById("dobT").innerHTML=data.birthTime;
									document.getElementById("motherN").innerHTML=data.motherName;
									document.getElementById("birthW").innerHTML=data.birthWeight;
									document.getElementById("bloodG").innerHTML=data.bloodGroup;
									document.getElementById("deliveryT").innerHTML=data.deliveryType;
									document.getElementById("dobirth").innerHTML=data.dob;
									document.getElementById("headC").innerHTML=data.headCircumference;
									document.getElementById("len").innerHTML=data.length;
									document.getElementById("gender").innerHTML=data.sex;
									document.getElementById("hospitalN").innerHTML=data.hospitalName;
									document.getElementById("docSpec").innerHTML="Dr. "+data.string1;
									document.getElementById("doctorId").value=data.doctorId;
									
									
									
								})
								$('#largeModal11').modal({
    backdrop: 'static',
    keyboard: false
})
								$('#largeModal11').modal('show');
						
						
						
					}
					else {
						$('#myModal10').remove();
						 var myClone = originalModal10.clone();
						    $('body').append(myClone);
						document.getElementById("reportImage").src = reportUrl+""+patientId+"/reports/"+fileName;
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
/* 
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
				}); */
				
				 function printTable()
				{
					
				
						  pwin = window.open(document.getElementById("reportImage").src,"_blank");
						  pwin.onload = function () {window.print();} 
						  
						/*   popup = window.open();
						  popup.document.write("imagehtml");
						  popup.focus(); //required for IE
						  popup.print(); */
					
					
					      /*   var html="<html>";
					        html+= $('#reportImage').attr('src');

					        html+="</html>";

					        var printWin = window.open('','','left=1,top=1,width=1,height=1,toolbar=0,scrollbars=0,status  =0');
					        printWin.document.write($('#reportImage').attr('src'));
					        printWin.document.close();
					        printWin.focus();
					        printWin.print();
					        printWin.close();  */
					    
				} 
		
</script>


	<script type="text/javascript">
 
  function searchData() {
 
	var value = $('#reportTableSearch').val().toLowerCase();
    $("#reportTable tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
} 
  
  
  function closeModel(){
	  
	  document.getElementById("dobT").innerHTML="";
		document.getElementById("motherN").innerHTML="";
		document.getElementById("birthW").innerHTML="";
		document.getElementById("bloodG").innerHTML="";
		document.getElementById("deliveryT").innerHTML="";
		document.getElementById("dobirth").innerHTML="";
		document.getElementById("headC").innerHTML="";
		document.getElementById("len").innerHTML="";
		document.getElementById("gender").innerHTML="";
		document.getElementById("hospitalN").innerHTML="";
		document.getElementById("docSpec").innerHTML="";
		document.getElementById("doctorId").value="";
	  $('#largeModal11').modal('toggle'); 
  }
</script>

</body>
</html>