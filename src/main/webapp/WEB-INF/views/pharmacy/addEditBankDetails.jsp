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
	<jsp:include page="../include/pharmacyHeader.jsp" />


	<div class="clearfix"></div>
	<section class="doc_login">
	<div class="dashboard_nm text-center">
		<h4>Bank Details</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">

				<jsp:include page="../include/pharmacyLeftMenu.jsp" />


				<div
					class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
					<div class="bhoechie-tab-content active">
						<form method="POST" action='${pageContext.request.contextPath}/submitPharmacyBankDetails'
							enctype="multipart/form-data" id="reset">
							<div class="row editpg">

								<input type="hidden" value="${pharmacyBankAccountInfo.id}"
									name="id">


								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Account Holder Name</label> <input
											type="text" required class="input-text"
											value="${pharmacyBankAccountInfo.accHolderName}" name="accHolderName" id="accHolderName"
											onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123 )|| (event.charCode > 31 && event.charCode < 33)"
											data-rule-required="true" />
									</div>
								</div>
 

								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Bank Name</label> <input
											type="text" required class="input-text" name="bankName"
											id="bankName" value="${pharmacyBankAccountInfo.bankName}"
											onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode > 31 && event.charCode < 33)"
											data-rule-required="true" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Baranch</label> <input
											type="text" required class="input-text" name="bankBranch"
											id="bankBranch" value="${pharmacyBankAccountInfo.bankBranch}"
											data-rule-required="true" />
									</div>
								</div>
								 
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Account Number</label> <input
											required type="text"
											value="${pharmacyBankAccountInfo.accountNo}" class="input-text"
											onkeypress='return IsNumeric(event);' name="accountNo"
											id="accountNo">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">IFSC Code</label> <input
											required type="text" class="input-text" style="text-transform: uppercase;"
											value="${pharmacyBankAccountInfo.ifscCode}" name="ifscCode"
											id="ifscCode" >  
										 
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">PAN No</label> <input required
											type="text" class="input-text" style="text-transform: uppercase;"
											value="${pharmacyBankAccountInfo.panNo}" name="panNo" id="panNo">
										 
									</div>
								</div>
								 
								 <div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">GSTIN</label> <input required
											type="text" class="input-text" style="text-transform: uppercase;"
											value="${pharmacyBankAccountInfo.gstNo}" name="gstNo" id="gstNo">
										 
									</div>
								</div>
								<div class="clearfix"></div>
								<!-- href="http://lokeshdhakar.com/projects/lightbox2/images/image-3.jpg" -->
								<hr>
								<div class="col-sm-12 text-center">
									<div class="form-group">
 										<input type="submit" name="Submit" class="btn-fr-all" value="Save"
											id="submitButton">  
									</div>
								</div>
							</div>
						</form>
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
		
		
		$(document).ready(function() {

		    $('.datepicker').datepicker({
		        format: 'dd-mm-yyyy'
		    });
		});
		
		
	 </script>
   

</body>
</html>