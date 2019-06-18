
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
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<c:url var="deleteTest" value="/deleteTest" />
<c:url var="editTestDetails" value="/editTestDetails" />
</head>
<body onload="getDoctorProfile();getDoctorRatingDetails()">
	<jsp:include page="../include/doctorHeader.jsp" />

	<div class="clearfix"></div>
	<section class="doc_login">
	<div class="dashboard_nm text-center"><h4><span>T</span>est <span>M</span>anegement</h4></div>
	<div class="container-fluid">
		<div class="row">

			<div class="bhoechie-tab-container">
				<jsp:include page="../include/leftmenu.jsp" />
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content active">
						<div class="col-md-4 col-sm-4">
							<form action="${pageContext.request.contextPath}/saveTestDetails"
								method="POST">

								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label for="modality">Modality</label> <select
												class="form-control" name="modalityName">
												<option disabled>Search Test</option>

												<option value="X-Ray">X-Ray</option>
												<option value="Magnetic Resonance Imaging (MRI)">Magnetic
													Resonance Imaging (MRI)</option>
												<option
													value="Magnetic Resonance Angiogram
													(MRA)">Magnetic
													Resonance Angiogram (MRA)</option>
												<option value="Ultrasound">Ultrasound</option>
												<option value="Color Doppler">Color Doppler</option>
												<option value="Computed Tomography (CT Scan)">Computed
													Tomography (CT Scan)</option>
												<option value="Mammography">Mammography</option>
												<option value="PET Scan">PET Scan</option>
												<option value="Bone Density test">Bone Density test</option>
												<option value="Biopsy">Biopsy</option>
												<option value="Fluoroscopy">Fluoroscopy</option>

											</select>

										</div>

									</div>
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label for="testname">Test Name</label> <input type="text"
												class="form-control" id="testname" name="test"
												placeholder="Enter email">
										</div>

									</div>
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label for="requirement">Test Requirements</label>
											<textarea class="form-control" id="requirement"
												name="testRequirement" rows="3"></textarea>
										</div>
									</div>
									<input type="hidden"
												class="form-control" id="testId" name="testId1"
												placeholder="Enter email" value="0">

								</div>
								<input type="submit" value="submit" class="btn-fr-all">
							</form>

						</div>

						<div class="col-md-8 col-sm-8">
							<!-- <div class="row">
								<div class="col-md-12 col-sm-12">
									<form class="mar-bot0" role="search">
										<div class="input-group">
											<select class="form-control" id="modalityId">
												<option>Search Test</option>
												<option disabled>Search Test</option>

												<option value="1">X-Ray</option>
												<option value="2">Magnetic Resonance Imaging (MRI)</option>
												<option value="3">Magnetic Resonance Angiogram
													(MRA)</option>
												<option value="4">Ultrasound</option>
												<option value="5">Color Doppler</option>
												<option value="6">Computed Tomography (CT Scan)</option>
												<option value="7">Mammography</option>
												<option value="8">PET Scan</option>
												<option value="9">Bone Density test</option>
												<option value="10">Biopsy</option>
												<option value="11">Fluoroscopy</option>
											</select>
											<div class="input-group-btn">
												<button class="btn btn-default" type="submit">
													<i class="glyphicon glyphicon-search"></i>
												</button>
											</div>
										</div>
									</form>
								</div>

							</div> -->

							<script>
									  var modality=document.getElementById("modalityName");
									  var modalityName;
									  for(var i=0;i<10;i++){
										  if(modality==i){
											  
											 var modName=document.getElementById("modalityId").text;
										  }
										  
									  }
									 
							</script>
							<div class="table-responsive">
							<table width="100" border="1" class="radio-tbl tbl table table-bordered table table-hover" id="testD">
								
									<thead>
									<tr>
										<th>Sr</th>
										<th>Modality</th>
										<th>Test Name</th>
										<th>Test Requirement</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${testDetailsList}" var="testDetailsList">
										<tr>
											<td>${testDetailsList.testId}</td>
											<td id="modalityName">${testDetailsList.modalityName}</td>
											<td>${testDetailsList.test}</td>
											<td>${testDetailsList.testRequirement}</td>
											<td><a href="#myModal" data-toggle="modal"
												onclick="editTestDetails(${testDetailsList.testId})"><i
													class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
											<td><a href="#" data-toggle="modal"
												onclick="deleteTestAlert(${testDetailsList.testId})"><i
													class="fa fa-trash" aria-hidden="true"></i></a></td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>


	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Confirmation</h4>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/saveTestDetails"
						method="POST">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="testname">Modality</label>
									 <select
										class="form-control" id="modalityId1" name="modalityName">

										<option disabled>Search Test</option>

										<option value="X-Ray">X-Ray</option>
										<option value="Magnetic Resonance Imaging (MRI)">Magnetic
											Resonance Imaging (MRI)</option>
										<option value="Magnetic Resonance Angiogram (MRA)">Magnetic
											Resonance Angiogram (MRA)</option>
										<option value="Ultrasound">Ultrasound</option>
										<option value="Color Doppler">Color Doppler</option>
										<option value="Computed Tomography (CT Scan)">Computed
											Tomography (CT Scan)</option>
										<option value="Mammography">Mammography</option>
										<option value="PET Scan">PET Scan</option>
										<option value="Bone Density test">Bone Density test</option>
										<option value="Biopsy">Biopsy</option>
										<option value="Fluoroscopy">Fluoroscopy</option>
									</select>
								</div>
							</div>
							<input type="hidden" class="form-control" id="testId1"
								name="testId1" placeholder="Enter email">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="testname">Test Name</label> <input type="text"
										class="form-control" id="testname1" name="test"
										placeholder="Enter email">
								</div>
							</div>
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label for="requirement">Test Requirements</label>
									<textarea class="form-control" id="testRequirement1"
										name="testRequirement" rows="3"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">

							<input type="submit" value="Submit" class="btn-fr-all">
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	</div>

	<jsp:include page="../include/footer.jsp" />

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script>
function deleteTestAlert(testId){
	var success=confirm("Do you want to delete?");
	if(success==true){
		deleteTest(testId);
	}
	
}


</script>

	<script>
							function deleteTest(testId){
							
								$.getJSON(
										'${deleteTest}',
										{

											testId : testId,

											ajax : 'true',
										
											
										},
										function(data){
											
											$('#testD td').remove();
											location.reload();
									
								});
								
								
							}
							</script>


	<script>
							function editTestDetails(testId){
							
								
								$.getJSON(
										'${editTestDetails}',
										{

											testId : testId,

											ajax : 'true',		
											
										},
										function(data){
										
										document.getElementById("testId1").value=data.testId;		
										document.getElementById("modalityId1").value=data.modalityName;
										document.getElementById("testname1").value=data.test;
										document.getElementById("testRequirement1").value=data.testRequirement;
										
								});
								
								
							}
							</script>
</body>