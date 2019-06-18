   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
</head>         
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 

 
<c:url var="getPatientReportByPatientAndDocId"
		value="/getPatientReportByPatientAndDocId" />
  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Patient Shared Reports </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
                <div class="filter_div vacciinput"> 
	               
      	       	     <div class="col-sm-10">
      	       	      <label>Enter Patient Id</label>
       			      	<input type="text" class=" "   placeholder="Patient Id" name="patientId"
													id="patientId">
       			      	<p style="color:red; font-size: 14px !important; margin: 0; line-height: 20px;">${message}</p>
      	       	     </div>
      	       	     
       			      	<div class="col-sm-2">
       			       <input type="submit" value="Search" class="btn-fr-all dspl-appt baby-vacci"  onclick="getPatientReports()"> 
       			       
	                 </div>
       			       
       			      </div> 
       			      <div class="clearfix"></div>
       			     
       			  
       			      <div class="shrdrpt">
					<div class="td-page-content tabel-responsive">
				<!-- 	 <div class="lab_img"> -->

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
								<div align="center" style="display: none" class="loader"></div>
								<!--  <a href="#" data-target="#myModal10" data-toggle="modal" class="history_sbmt">canvas</a>
  <a href="#" data-target="#myModal11" data-toggle="modal" class="history_sbmt">pdf</a> -->

							<!-- </div> -->
							
</div>       
</div>
 <div class="notFound" id="notfound">
 
 	
 	<img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">
 	<h6>Ooop's Sorry</h6>
 	<p>Reports Not Found</p>

 
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
							<img id="reportImage" src="" class="img-responsive"
								alt="Report not Available">
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
							<object id="reportPdf" data="" type="application/pdf"></object>
						</p>

					</div>
				</div>

			</div>
		</div>
	</div>
  </div>
 
</section>
<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 

 
		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'> 
</script>-->
 	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
 	</script>
 	<script type="text/javascript">
 $('.datepicker').datepicker({ format: "dd-mm-yyyy", startDate:new Date(), autoclose: true}).datepicker();

 </script>
 <script type="text/javascript">
 var input = document.getElementById("patientId");
 input.addEventListener("keyup", function(event) {
   if (event.keyCode === 13) {
	   getPatientReports();
   }
 });
	 
	 
	 
	 
 
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

														 

														 
															tr
																	.append($(
																			'<td></td>')
																			.html(
																					'<a href="#"  onclick="openReport('
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

														 
														
														tr.append($('<td></td>')
																		.html(
																				reportList.date));
														$('#reportTable tbody')
																.append(tr);
														
														$("#notfound").hide();
													})
								});
				clickCount = 1;
			} else {
				clickCount = 0;
			}
		}
		
		function openReport(reportId,fileName,patientId,type) {
			var originalModal11 = $('#myModal11').clone();
			var originalModal10 = $('#myModal10').clone();
			
			var c = document.getElementById("paint");
			var ctx = c.getContext("2d");
		 
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

				
			}
			
			
			else if (type == 8) {

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
		function searchData() {
			 
			var value = $('#reportTableSearch').val().toLowerCase();
		    $("#reportTable tbody tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		}  
	</script>
 <script type="text/javascript">
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
</body>
</html>