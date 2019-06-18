<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/radiology.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/videoCallPat.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>
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

  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  <c:url var="passwordValidation" value="passwordValidation" />
  <c:url var="changePatientPassword" value="changePatientPassword" />	
  <c:url var="getVideoBypatientIdAndstatus" value="/getVideoBypatientIdAndstatus" />
<body>
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Patient Bank Details </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
             <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab patProfile">
                <div class="bhoechie-tab-content  active">
               
					<h4 class="detlnm"><a href="${pageContext.request.contextPath}/showAddEditPatientBankDetails" data-toggle="tooltip" title="" data-original-title="edit"  >Edit <span class="icon-user" style="color: #009fea; font-size: 20px"></span></a> </h4>
				        
				        <div class="cliHoDetl">
				       <p><strong>Bank Name :</strong> ${patientBankAccountInfo.bankName}</p> 
				        
				        <p><strong>Account Holder Name :</strong> ${patientBankAccountInfo.accHolderName}</p> 
				      
				       <p><strong>IFSC :</strong> ${patientBankAccountInfo.ifscCode}</p>
				     
				       <p> <strong>GSTIN :</strong> ${patientBankAccountInfo.gstNo}</p>
				       <p><strong>Branch Name :</strong> ${patientBankAccountInfo.bankBranch}</p> 
				       <p><strong>Account No. :</strong> ${patientBankAccountInfo.accountNo}</p> 
				        <p> <strong>PAN :</strong> ${patientBankAccountInfo.panNo}</p>
				        </div>
    
                </div>
    
</div>
        	 
            
        </div>
        
     </div>
 </div>
</section>
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 
<%-- <jsp:include page="../include/videocall.jsp"/> --%>
<jsp:include page="../include/Audiocall.jsp"/>

		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.combostars.js">
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
</body>
</html>