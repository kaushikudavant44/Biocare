<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
<body>
<c:url var="getPatientDetailsById" value="/getPatientDetailsById" />
	<jsp:include page="../include/doctorHeader.jsp" />


	<div class="clearfix"></div>
	<section class="doc_login">
	<div class="dashboard_nm text-center">
		<h4>Upload Video</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">

			
        	<jsp:include page="../include/leftmenu.jsp"/>
       


				<div
					class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
					<div class="bhoechie-tab-content active">
						
							<div class="row upldvid">
								<div class="col-sm-10">
									<div class="form-group">
										<label for="exampleInputEmail1">Enter Patient Id</label> <input
											type="text" required  name="patientId" id="patientId" />
									</div>
								</div>
								
  
							<div class="col-sm-2">
									<div class="form-group">
 										<input type="button" name="Submit" class="btn-fr-all mrgn-top" value="Search"
										 onclick="getPatientDetails()">  
									</div>
								</div>
								<div  class="clearfix"></div>
								<hr>
				<div class="col-sm-6">
									<div>							
									<label>Patient Name :  <span id="patientName"></span></label>
									</div>
									</div>
									<div class="col-sm-6">
																		<div>
									<label>Contact No :  <span id="contactNo"></span></label>
									</div>
									</div>
									<hr>
								 <form method="POST" action='${pageContext.request.contextPath}/uploadVideo'
							enctype="multipart/form-data" id="reset">
							
							
							 <input type="hidden" name="patientId" id="patient" required/>
											  
											 
								 <div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Video File (accepted only mp4/3gp)</label> 
										<input type="file" name="file" accept="video/mp4, video/3gp" id="file" disabled="disabled" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Title</label>
										 <input type="text" name="title" id="title" disabled="disabled" required>
										 
									</div>
								</div> 
								
								<div class="clearfix"></div>
								<!-- href="http://lokeshdhakar.com/projects/lightbox2/images/image-3.jpg" -->
								<hr>
								<div class="col-sm-5"></div>
								<div class="col-sm-2 text-center">
									<div class="form-group">
 										<input type="submit" name="Submit" class="btn-fr-all" value="Save"
											id="submitButton" disabled="disabled">  
									</div>
								</div>
								<div class="col-sm-5"></div>
							</form>
								 
								 
								 
								 
								 
								
							</div>
						 
					</div>
				</div>

			</div>
		</div>
	</div>

	</section>
	<div class="clearfix"></div>

	<jsp:include page="../include/footer.jsp" />
	 

	<!-- Bootstrap core JavaScript================================================== -->


	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script> --%>


	<%-- <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script> --%>


	<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script> --%>
	<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> -->
	<script
		src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>

	<!-- validations -->

	<script type="text/javascript">
  function gotoDoctorHomePage(){
  window.open("${pageContext.request.contextPath}/showDoctorHomePage","_self");
  }</script>

	<script type="text/javascript">
  
  
		
	var obj = document.getElementById('partitioned');
	obj.addEventListener("keydown", stopCarret); 
	obj.addEventListener("keyup", stopCarret); 

	function stopCarret() {
		if (obj.value.length > 5){
			setCaretPosition(obj, 5);
		}
	}

	function setCaretPosition(elem, caretPos) {
	    if(elem != null) {
	        if(elem.createTextRange) {
	            var range = elem.createTextRange();
	            range.move('character', caretPos);
	            range.select();
	        }
	        else {
	            if(elem.selectionStart) {
	                elem.focus();
	                elem.setSelectionRange(caretPos, caretPos);
	            }
	            else
	                elem.focus();
	        }
	    }
	}
  </script>

 

	 
   <script type="text/javascript">
   function getPatientDetails() {
	   
	   $.getJSON(
				'${getPatientDetailsById}',

				{
				 
					patientId : $('#patientId').val(),
					 
					ajax : 'true'

				},
				function(data) {

					if(data!=null)
						{
						document.getElementById("submitButton").disabled=false;
						document.getElementById("file").disabled=false;
						document.getElementById("title").disabled=false;
						
					$('#patientName').text(data.fName+' '+data.lName);
					$('#contactNo').text(data.contactNo);
					$('#patient').val(data.patientId);
						}
					else{
						document.getElementById("file").disabled=true;
						document.getElementById("submitButton").disabled=true;
						document.getElementById("title").disabled=true;
						
					}
				});
		
}
  
   </script>

</body>
</html>