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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">


</head>         
<body>
<jsp:include page="../include/labHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Bank Details</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/labLeftMenu.jsp"/> 
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
				    <div class="hospitalSec innersection lab_detl">
       
       <h4 class="detlnm"><a href="${pageContext.request.contextPath}/showAddEditLabBankDetails" data-toggle="tooltip" title="" data-original-title="edit">Edit <span class="icon-user" style="color: #009fea; font-size: 20px"></span></a> </h4>
        
       
        
       <div class="cliHoDetl">
       <p><strong>Bank Name :</strong> ${labBankAccountInfo.bankName}</p> 
        
        <p><strong>Account Holder Name :</strong> ${labBankAccountInfo.accHolderName}</p> 
      
       <p><strong>IFSC :</strong> ${labBankAccountInfo.ifscCode}</p>
     
       <p> <strong>GSTIN :</strong> ${labBankAccountInfo.gstNo}</p>
       <p><strong>Branch Name :</strong> ${labBankAccountInfo.bankBranch}</p> 
       <p><strong>Account No. :</strong> ${labBankAccountInfo.accountNo}</p> 
        <p> <strong>PAN :</strong> ${labBankAccountInfo.panNo}</p>
        </div>
      
      
       
       
       
       
      
   
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
</body>
</html>