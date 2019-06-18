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
       <form action="${pageContext.request.contextPath}/saveRadiologistPndtUsernameAndPassword" method="POST">
    	<div class="row editpg">
       <h4 class="detlnm"><a href="javascript:enableTextEditor()" data-toggle="tooltip" title="" data-original-title="edit"><span class="icon-user" style="color: #009fea; font-size: 20px"></span></a> </h4>
        
       
        
       <div class="col-sm-4 cliHoDetl">
     <!--   <p><strong>User Name :</strong><input type="text" id="userName" name="userName" readonly></p> 
        
       <p><strong>Password :</strong><input type="text" id="password" name="password" readonly></p>  -->
      
     						<input type="hidden" value="${radiologistPndtDetails.id }" name="id" >
     						
     							<div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">User Name</label> <input
											type="text" required class="input-text"
											 name="userName" id="userName" value="${radiologistPndtDetails.userName}"
				
											data-rule-required="true" readonly />
									</div>
								</div>
 

								<div class="col-sm-6">
									<div class="form-group">
										<label for="exampleInputEmail1">Password</label> <input
											type="text" required class="input-text" name="password" value="${radiologistPndtDetails.password}"
											id="password"
											
											data-rule-required="true" readonly/>
									</div>
								</div>
								
								<div class="col-sm-12 text-center">
									<div class="form-group">
 										<input type="submit" name="Submit" class="btn-fr-all" value="Save"
											id="submitButton">  
									</div>
								</div>
     
       </div>
       
       </div>
       </form>
       
      
   
</div>
</div>
</div>
</div>
</div>
</div>
</section>

<div id="passwordModel" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog" >
			<div class="modal-dialog modal-md modal-sm" style="width:25%;margin-top:10%">
				<div class="modal-content">
				  <form action="${pageContext.request.contextPath}/changeDoctorProfilePassword" method="post">  
					<div class="modal-header">
						<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->
						<h4 class="modal-title"  align="center">Enter OTP</h4>
					</div>
					<div class="modal-body">
					<p id="errormessage"  style="color:red; position:absolute; text-align:center; margin-bottom: 10px" maxlength="20">${msg}</p>
						
						OTP  <input type="password" id="LogInPasswors" name="password" placeholder="password" class="form-control" required>
					 
					</div>
					<div class="modal-footer" >
					<div align="center"> 
						 
						
						<input type="button" class="btn btn-warning"value="Cancel" onclick="cancelChangePassword()"/>
						<input type="submit" class="btn btn-success"value="Submit" />
							</div> 
							 
					</div>
					 
				 </form>  
				</div>
			</div> 
		</div>

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

<script>
function enableTextEditor(){
	$("#userName").prop('readonly', false);
	$("#password").prop('readonly', false);
	
}





</script>
</body>


</html>