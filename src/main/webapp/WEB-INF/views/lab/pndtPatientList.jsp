<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="../include/labHeader.jsp" />





	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>Pndt Patients List</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
		<fmt:parseDate value="${currentDate}" var="currDate" 
                              pattern="dd-MM-yyyy" />
                              
                              
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/labLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						
						
						<div class="bs-example">
    <ul class="nav nav-tabs mar-top20">
    <li  class="active"><a data-toggle="tab" href="#sectionB">Pending to Upload</a></li>
     <li><a data-toggle="tab" href="#sectionA">Uploaded on govn.</a></li>
     <li><a data-toggle="tab" href="#sectionC">Not uploaded</a></li>
        
    </ul>
    

    <div class="tab-content mar-bot15">
  
    <div id="sectionB" class="tab-pane fade in active">
        ${msg}
        <input id="myInput" type="text" placeholder="Search..">     
        <br>
        <br>
		<div class="table-responsive tbl_labHistry">
							<table width="100%" border="0" id="pendUploadPatient"
								class="tbl table table-bordered table table-hover">
								<thead>
									
										
											<tr align="center">
												<th>Sr.No</th>
												<th>Patient Name</th>
												<th>State</th>
												<th>Pndt Upload status</th>
												<th>Date</th>
												<th>Action</th>
											</tr>
									

								</thead>

								<tbody>
									<c:forEach items="${pndtPatientsList}" var="pndtPatients" varStatus="count">
										
										<%--  <fmt:parseDate value="${pndtPatients.createdDate}" var="createdDate" 
                              pattern="dd-MM-yyyy" /> --%>
                             
                              		<%-- 	<c:out value="${createdDate}"></c:out> --%>
										<c:if test="${pndtPatients.status==0}">
										<c:if test="${pndtPatients.dateStatus==1}">
										<tr align="center">
											<td>${count.index+1}</td>
											<td>${pndtPatients.patientName}</td>
											<td>${pndtPatients.state}</td>
											<c:choose>
											<c:when test="${pndtPatients.status==0}">
											<td>Pending</td>
											</c:when>
											<c:otherwise>
											<td>Uploaded</td>
											</c:otherwise>
											</c:choose>
											<td>${pndtPatients.createdDate}</td>
											<td><strong><a
														href="${pageContext.request.contextPath}/showPndtPatientPreview/${pndtPatients.pndtId}"><i
														class="fa fa-print" title="Preview And Paste"></i> <span class="text-muted"></span></a></strong></td>
											
											
										</tr>
										</c:if>
										</c:if>
									</c:forEach>

								
								</tbody>
							</table>
							<div class="notFound">
								<c:if test="${message==0}">

									<img
										src="${pageContext.request.contextPath}/resources/images/notfound.png"
										class="img-responsive" alt="Not Found">
									<h6>Ooop's Sorry</h6>
									<p>Data Not Available on this Date</p>
								</c:if>

							</div>
						</div>
		

        </div>
    
    
    
    
        <div id="sectionA" class="tab-pane fade">
            
            <div class="table-responsive tbl_labHistry">
							<table width="100%" border="0"
								class="tbl table table-bordered table table-hover">
								<thead>
									
										
											<tr align="center">
												<th>Sr.No</th>
												<th>Patient Name</th>
												<th>State</th>
												<th>Pndt Upload status</th>
												<th>Date</th>
												<th>Action</th>
											</tr>
									

								</thead>

								<tbody>
									<c:forEach items="${pndtPatientsList}" var="pndtPatients" varStatus="count">
										
										<c:if test="${pndtPatients.status==1}">
										<tr align="center">
											<td>${count.index+1}</td>
											<td>${pndtPatients.patientName}</td>
											<td>${pndtPatients.state}</td>
											<c:choose>
											<c:when test="${pndtPatients.status==0}">
											<td>Pending</td>
											</c:when>
											<c:otherwise>
											<td>Uploaded</td>
											</c:otherwise>
											</c:choose>
											<td>${pndtPatients.createdDate}</td>
											<td><strong><a
														href="${pageContext.request.contextPath}/showPndtPatientPreview/${pndtPatients.pndtId}"><i
														class="fa fa-print" title="Print And Preview"></i> <span class="text-muted"></span></a></strong></td>
											
											
										</tr>
										
										</c:if>
									</c:forEach>

								
								</tbody>
							</table>
							<div class="notFound">
								<c:if test="${message==0}">

									<img
										src="${pageContext.request.contextPath}/resources/images/notfound.png"
										class="img-responsive" alt="Not Found">
									<h6>Ooop's Sorry</h6>
									<p>Data Not Available on this Date</p>
								</c:if>

							</div>
						</div>
		
            
     </div>         		
            
 	<div id="sectionC" class="tab-pane fade">
            
            <div class="table-responsive tbl_labHistry">
							<table width="100%" border="0"
								class="tbl table table-bordered table table-hover">
								<thead>
									
										
											<tr align="center">
												<th>Sr.No</th>
												<th>Patient Name</th>
												<th>State</th>
												<th>Pndt Upload status</th>
												<th>Date</th>
												<th>Action</th>
											</tr>
									

								</thead>

								<tbody>
									<c:forEach items="${pndtPatientsList}" var="pndtPatients" varStatus="count">
										
										<c:if test="${pndtPatients.status==0}">
										<c:if test="${pndtPatients.dateStatus==2}">
										<tr align="center" style=>
											<td>${count.index+1}</td>
											<td>${pndtPatients.patientName}</td>
											<td>${pndtPatients.state}</td>
											<c:choose>
											<c:when test="${pndtPatients.status==0}">
											<td>Pending</td>
											</c:when>
											<c:otherwise>
											<td>Uploaded</td>
											</c:otherwise>
											</c:choose>
											<td>${pndtPatients.createdDate}</td>
											<td><strong><a
														href="${pageContext.request.contextPath}/showPndtPatientPreview/${pndtPatients.pndtId}"><i
														class="fa fa-print" title="Print And Preview"></i> <span class="text-muted"></span></a></strong></td>
											
											
										</tr>
										</c:if>
										</c:if>
										
									</c:forEach>

								
								</tbody>
							</table>
							<div class="notFound">
								<c:if test="${message==0}">

									<img
										src="${pageContext.request.contextPath}/resources/images/notfound.png"
										class="img-responsive" alt="Not Found">
									<h6>Ooop's Sorry</h6>
									<p>Data Not Available on this Date</p>
								</c:if>

							</div>
						</div>
		
            
     </div>         		
            
  
         </div>   
       
    </div>
						
						
						<%-- <div class="filter_div labhistory">
							<div class="col-md-12 col-sm-12">
								<h3>View Lab History</h3>
							</div>
							<input type="hidden" value="${reportUrl}" id="reportUrl">
							<form action="${pageContext.request.contextPath}/showLabHistory"
								method="GET">div class="col-sm-4"> <label>Select
								Test</label> <select class="input-text" id="testId"
								name="testId" required> <c:forEach items="${labTestsList}"
								var="labTestsList"> <c:choose> <c:when
								test="${labTestsList.labTestId==testId}"> <option
								value="${labTestsList.labTestId}"
								selected>${labTestsList.labTestName}</option> </c:when>
								<c:otherwise> <option
								value="${labTestsList.labTestId}">${labTestsList.labTestName}</option>
								</c:otherwise> </c:choose> </c:forEach> </select> </div>
								<div class="col-sm-3"> <label>From Date</label> <input
								type="text" autocomplete="off" name="startdate" id="startdate"
								placeholder="from Date" class="datepicker" value="${fromDate}">
								</div> <div class="col-sm-3"> <label>To Date</label> <input
								type="text" autocomplete="off" name="enddate" id="enddate"
								placeholder="to Date" class="datepicker" value="${toDate}">
								</div> <div class="col-sm-2"> <input type="submit"
								class="btn-fr-all" value="search"> </div></form>
						</div> --%>
						<div class="clearfix"></div>
						<hr>
						
						<%-- <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
						<div class="loader2"></div>
					</div>
				
				
				
				
				
				
				
				</div>

			</div>
		</div>
	</div>
	</section>

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
					<div class="modal-body">
						<div id="sketch">
							<img id="reportImage" src="" class="img-responsive"
								alt="Report not Available">
							<canvas id="paint" width="980" height="850"></canvas>
							<!-- <p class="text-center">
								<a href="#" id="pen"><span class="flaticon-fountain-pen-close-up"></span>Pen</a> <a
									href="#" id="eraser"><span
									class="flaticon-eraser"></span>Eraser</a>
							</p> -->
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

  
  $('.datepicker').datepicker({ format: "dd-mm-yyyy", autoclose:"true"}).datepicker()
  
  
  /*  function openReport(reportId,fileName,patientId,type) {
	  		
		    var originalModal11 = $('#myModal11').clone();
			var c = document.getElementById("paint");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			var reportUrl = document.getElementById("reportUrl").value;
			//alert(reportUrl);
			 var host= window.location.hostname;
			if (type == 0) {

				
				$('#myModal11').remove();
				 var myClone = originalModal11.clone();
				    $('body').append(myClone);
				document.getElementById("reportPdf").data = reportUrl+""+patientId+"/reports/"+fileName;
						
				$('#myModal11').modal('show');
			} 
			else if(type == 2)
				{
				window.open('${pageContext.request.contextPath}/showDcmViewer?input='+location.protocol+'//'+host+'/images/patient/'+patientId+"/reports/"+fileName, '_blank'); 
				}
			else {
				document.getElementById("reportImage").src = reportUrl+""+patientId+"/reports/"+fileName;
						
				$('#myModal10').modal('show');
				var img = document.getElementById("reportImage");
				ctx.drawImage(img, 0, 0);
			}
			
			$('.fa fa-eye-slash').click(function(e) {
			    e.preventDefault();
			  if(type==0){
				  $('#myModal11').modal({
				        show: true, 
				        backdrop: 'static',
				        keyboard: true
				     })
			  }else{
			    $('#myModal10').modal({
			        show: true, 
			        backdrop: 'static',
			        keyboard: true
			     })
			     }
			});  
			
		} */
		
		/* function openReport(reportId,fileName,patientId,type) {

			//	alert(reportId+"reportId "+reportUrl);
			var originalModal11 = $('#myModal11').clone();
			var originalModal10 = $('#myModal10').clone();
				var c = document.getElementById("paint");
				var ctx = c.getContext("2d");
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				var reportUrl = document.getElementById("reportUrl").value;
			//	var dcmUrl=document.getElementById("dcmFileUrl").value;
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
					$('#myModal10').remove();
					 var myClone = originalModal10.clone();
					    $('body').append(myClone);
					document.getElementById("reportImage").src = fileName;
					$('#myModal10').modal('show');
					var img = document.getElementById("reportImage");
					ctx.drawImage(img, 0, 0);
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
				
				   
				/* $('#reportPdf').click(function(e) {
				    e.preventDefault()
				  
				    $('#myModal11').modal({
				        show: true, 
				        backdrop: 'static',
				        keyboard: true
				     })
				}); */  

</script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#pendUploadPatient tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>
