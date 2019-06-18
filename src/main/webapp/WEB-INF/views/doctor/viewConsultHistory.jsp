<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="../include/doctorHeader.jsp" />


	<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />
	<c:url var="getSuggestLabTestFromDoctor"
		value="/getSuggestLabTestFromDoctor" />


	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center"><h4>Consult Patient List</h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/leftmenu.jsp" /> 
 
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="filter_div doc_fil">
						  <div class="col-md-12 col-sm-12">
							<h3>View Consulting</h3>
							</div>
							 <form action="${pageContext.request.contextPath}/showViewConsultHistory" method="get" id="consultHistoryFormId">
							<div class="col-sm-5">
							<label>From Date</label>
								<input type="text" name="fromDate" id="fromDate" placeholder="From Date"
									class="datepicker" value="${fromDate}" readonly>
							</div>
							<div class="col-sm-5">
							<label>To Date</label>
								<input type="text" name="toDate" id="toDate" placeholder="To Date" value="${toDate}"
									class="datepicker" readonly>
									
							</div>
							 
							   
							<div class="col-sm-2">
							 <input type="button" value="Search" class="btn-fr-all dspl-appt" onclick="showLoader()">	 
												<!-- <a href="#" class="btn-fr-all">Search</a> -->
							</div>
							</form>
						</div>
						<div class="clearfix"></div>
						<hr>
						 <%--  <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
       			     <div class="loader2" id="loader"> </div>
						<div class="appointment-div pat_consult">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
								
								<c:if test="${message != null}">
										<div class="notFound">
										<img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">
 										<h6>Ooop's Sorry</h6>
 										<p>Records Not Available</p>
										</div>
								</c:if>
								
								 Total Consulting : ${fn:length(consultingDetailsList)} 
								 
									<c:forEach items="${consultingDetailsList}"
										var="consultingDetail" varStatus="count">
										
										
										
										
										<div class="panel-heading mar-bot20">
											<h4 class="panel-title"></h4>
											<div class="row">
												<div class="col-sm-2">
													<i><strong>Date:</strong> &nbsp;&nbsp;${consultingDetail.date} </i> <br>
													<i><strong>Time:</strong> &nbsp;&nbsp;${consultingDetail.time}</i>
												</div>
												<div class="col-sm-5 text-left">
													<div class="dropdown">
													<%-- <a data-toggle="collapse" data-parent="#accordion"
													onclick="getPrescriptionDetails(${consultingDetail.meetId})"
													href="#collapse${consultingDetail.meetId}"> --%>
														<h4 class="dropbtn">${consultingDetail.patientName}</h4><!-- </a> -->
														<%-- <div class="dropdown-content">
															<h3 class="content1">Consult Details</h3>
															<div class="cont-padding">
																<h6><strong>patient-problem:</strong> <p>${consultingDetail.patientProblem}</p></h6>
																<h6><strong>description:</strong><p>${consultingDetail.discussion}</p></h6> 
																<h6><strong>instructions:</strong> <p>${consultingDetail.note}</p></h6>
															</div>
														</div> --%>
													</div>
													</div>
													
													<div class="col-sm-5">
													
													<a href="${pageContext.request.contextPath}/showConsultBill/${consultingDetail.meetId}">	<span class="icon-newspaper" 												
													  id="popoverOption" rel="popover" data-placement="bottom"> <i>Invoice</i>
													</span></a>
													
													
													
													
													<a href="#"><span class="icon-prescription-1" aria-hidden="true" data-toggle="collapse" data-parent="#accordion"
													onclick="getPrescriptionDetails(${consultingDetail.meetId})"
													href="#collapse${consultingDetail.meetId}" id="popoverOption" rel="popover" data-placement="bottom"> <i>Prescription</i></span>
													</a>
													<!-- data-original-title="Prescription" -->
													<a href="#"><span class="icon-experiment" aria-hidden="true" data-toggle="collapse" data-parent="#accordion"
													onclick="getSuggestedLabTest(${consultingDetail.meetId})"
													href="#collapseTest${consultingDetail.meetId}" id="" rel="popover" data-placement="bottom" data-original-title="Lab Test" data-toggle="tooltip"> <i>Suggested Tests</i></span>
													</a>
													</div>
										</div>

									</div>
									


										<div id="collapse${consultingDetail.meetId}"
											class="panel-collapse collapse">
											<div class="panel-body martopspacing">
												<div class="row filled_prescript doc_consul-list">
													<h3>Prescription</h3>
													<a id="downloadButton" href="${pageContext.request.contextPath}/getPrescriptionByMeetId/${consultingDetail.meetId}"><span class="icon-download-to-storage-drive right-specing1"></span></a>
													<input type="hidden" id="signa" value="${consultingDetail.signature}"/>
 													
 												<%-- 	<a href="#" onclick="createPdf1(${consultingDetail.meetId},'${consultingDetail.hospitalName}',)"><span class="icon-download-to-storage-drive right-specing"></span></a> --%>
										 
										
													 <div class="col-sm-4"><label>patient-problem</label></div>
							       			<div class="col-sm-8"><p>${consultingDetail.patientProblem}</p></div>
							       			<div class="clearfix"></div>
							       			<div class="col-sm-4"><label>description</label></div>
							       			<div class="col-sm-8"><p>${consultingDetail.discussion}</p></div>
							       			<div class="clearfix"></div>
							       			<div class="col-sm-4"><label>instructions</label></div>
							       			<div class="col-sm-8"><p>${consultingDetail.note}</p></div>
							       			<div class="clearfix"></div>


													<div class="table-responsive">
														<table width="100%" border="0"
															class="tbl table table-bordered table table-hover"
															id="prescTable${consultingDetail.meetId}">
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

															</tbody>
														</table>
														
													</div>
													
	


													<!-- <div class="text-center">
														<a href="#" class="btn-fr-all">Done</a>
													</div> -->
												</div>
												

											</div>
										</div>
										
										<div id="collapseTest${consultingDetail.meetId}"
											class="panel-collapse collapse">
											<div class="panel-body martopspacing">
												<div class="row filled_prescript doc_consul-list">
													<h3>Suggested Lab Test</h3>
													
													<div style="display: none" id="testDiv${consultingDetail.meetId}">
													 <div class="col-sm-4"><label>Suggested Lab Test</label></div>
							       			<div class="col-sm-8"><p id="labTest${consultingDetail.meetId}"></p></div>
							       			<div class="clearfix"></div>
							       			<div class="col-sm-4"><label>Referred Lab</label></div>
							       			<div class="col-sm-8"><p id="lab${consultingDetail.meetId}"></p></div>
							       			<div class="clearfix"></div>
							       			 </div>
			<div  id="testEmptyDiv${consultingDetail.meetId}">
			<h4>No Test Suggested </h4>
			</div>

													
													
	

 
												</div>
												

											</div>
										</div>
									</c:forEach>
								</div>

								

							</div>
						</div>


					</div>
				</div>

			</div>
		</div>
	</div>
	</section>
 <!--Doctor Payment  -->
   <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-lg" role="document">
	
    <div class="modal-content"  id="printableArea">
    
      <div class="modal-header pescmodl">
       <link rel="stylesheet" href=${pageContext.request.contextPath}/resources/css/prescription.css>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <a href="#" onclick="printDiv('printableArea')"><span class="icon-printer right-specing"></span></a>
					<div class="clearfix"></div>
					<button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body text-center pay-lab-modal" >
     
	          <div id="invoice">

      <div class="invoice overflow-auto">
          <div style="min-width: 600px">
              <header>
                  <div class="row">
                      <div class="col">
                          <a target="_blank" >
                              <img src="${pageContext.request.contextPath}/resources/images/logo.png" data-holder-rendered="true" />
                              </a>
                      </div>
                      <div class="col company-details">
                          <h2 class="name">
                              <a target="_blank">
                              
                                     <img src="${pageContext.request.contextPath}/resources/images/dr.png" data-holder-rendered="true"  height="42" width="42" />
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

<h1>
</h1>

              <main>
                  <div class="row contacts">
                      <div class="col invoice-to">

                        <span style=" font-size: 30px;" >&#8478;</span>


                          <h2 class="to" id="patName">Ganesh Pagar</h2>
                      </div>

                  </div>


<div>
                  <div class="content" id="content">

	

 <div class="bottomright" ></div>


                  </div>
</div>
</main>

 <img id="sign" alt="sign" class="img-responsive signimg" align="right"/>
<h1>
</h1>
                   <div style="text-align: center; " id="drHospAdd"> </div>

          </div>
<div></div>

      </div>
           </div>
    </div>
    </div>
    </div></div>
      <!--Doctor Payment  -->

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

var prescriptionData=[];

 function getPrescriptionDetails(meetId) { 
	 
	
	 
	 $.getJSON('${getPrescriptionByMeetingId}',

				{
		 meetId : meetId,

					ajax : 'true',

				}, function(data) {
					
					 $('#prescTable'+meetId+' td').remove();
					
					$
					.each(
							data,
							function(key, prescriptionList) {

								var tr = $('<tr></tr>');
								
								tr.append($('<td></td>').html(key+1));
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.medicineQuantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
								
								$('#prescTable'+meetId+' tbody').append(tr);
							})
							prescriptionData=data;
				});
}
 
 
 function createPdf1(meetId,hospitalName,doctorName,address,qualification,contact,patientName){
		

	 $('#prescTa'+meetId).remove();
//	 alert("counsultingDetails= "+meetId); 
	 
	 var sign=document.getElementById("signa").value;
	 
	
		
		var count=1;
		var strVar="";
		strVar += "        	<table width=\"100%\" border=\"1\" class=\"tbl table table-bordered table table-hover\" id=\"prescTa"+meetId+"\">";
		
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
	//	$("#hosp").html(hospitalName);
		$("#drMob").html(contact);
		$("#patName").html(patientName);
		
		document.getElementById("sign").src=sign;
		//$("#sign").attr("src",sign);
		$('#myModal').modal('show'); 
		
		
	}
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
  
$('.datepicker').datepicker({ format: "dd-mm-yyyy", endDate:new Date(), autoclose: true})
$('.icon-prescription-1').popover({ trigger: "hover" });
$('.icon-newspaper').popover({ trigger: "hover" });

$(document).ready(function() {    
    $("#medicine_nm").val("xyz nlkjhj"); 
    $("#qnty").val("5"); 
    $("#instruction").val("before food");
    $("#timing").val("night");
});

</script>

<script type="text/javascript">
function showLoader()
{
	var fromDate=document.getElementById("fromDate").value;
	var toDate=document.getElementById("toDate").value;
	var x = new Date(fromDate);
	var y = new Date(toDate);
	if(x>y){
		alert("Please Enter Valid Dates");
	}else{
		
		document.getElementById("consultHistoryFormId").submit();	
		document.getElementById("loader").style.display='block';	
	}
	 		
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
	
	
	 $.getJSON('${getSuggestLabTestFromDoctor}',

				{
		 meetId : meetId,

					ajax : 'true',

				}, function(data) {
					$('#testDiv'+meetId).show();
					$('#testEmptyDiv'+meetId).hide();
					
					 $("#labTest"+meetId).text(data.testNameList);
					 $("#lab"+meetId).text(data.labName);
				});
	
}
</script>
</body>
</html>