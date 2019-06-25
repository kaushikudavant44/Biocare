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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/alertify.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
</head>         
<body>

 

  <c:choose>
<c:when test="${sessionScope.patientDetails.patientId>0}">
<jsp:include page="include/patientHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.doctorDetails.doctorId>0}">
<jsp:include page="include/doctorHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.labDetails.labId>0}">
<jsp:include page="include/labHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.medicalDetails.medicalId>0}">
<jsp:include page="include/pharmacyHeader.jsp"/>
</c:when>
</c:choose>
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Add Advertise</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
       
        	<c:choose>
			<c:when test="${sessionScope.userType==1}">
			 
            <jsp:include page="include/patientLeftMenu.jsp"/> 
            </c:when>
            <c:when test="${sessionScope.userType==0}">
            
              
            <jsp:include page="include/leftmenu.jsp"/> 
            </c:when>
            <c:when test="${sessionScope.sessionScope==2}">
            
             
            <jsp:include page="include/labLeftMenu.jsp"/> 
            </c:when>
            <c:when test="${sessionScope.sessionScope==3}">
             
            <jsp:include page="include/pharmacyLeftMenu.jsp"/>
            </c:when>
            </c:choose>
           
            <div class="bhoechie-tab doc_profile">
            <br>
             <a href="${pageContext.request.contextPath}/showCurrentActiveAdvertise" class="serchDoc pull-right">Show My Advertise <span class="glyphicon glyphicon-chevron-right"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
        
					<div class="bhoechie-tab-content active">
						<form method="POST" action='${pageContext.request.contextPath}/addNewAdvertise'
							enctype="multipart/form-data" id="reset">
							
							 
							
							<div class="row editpg">

								  


								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Advertise Content Type</label>
										<select name="adsType">
										<option selected disabled="disabled" value="">
										Select Advertise Content Type
										</option>
										
										<option  value="1">
										Image Content
										</option>
										<option  value="2">
										GIF Content
										</option>
										<option  value="3">
										Video Content
										</option>
										</select>
										  
									</div>
								</div>
 

								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Select File</label> <input
											type="file" required class="input-text" name="fileName"
											id="fileName" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Expiry Date</label> <input
											type="text" required class="input-text datepicker" name="expDate"
											id="expDate" />
									</div>
								</div>
								 
								 
								 
								 
								 
								  
								<div class="clearfix"></div>
								 
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




 <jsp:include page="include/footer.jsp"/> 



 



<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
<!-- new alert -->
<script src="${pageContext.request.contextPath}/resources/js/alertify.min.js"></script> 
	
<!-- new alert  -->


 

<script type="text/javascript">
		
		

		
$(".datepicker").datepicker({
	 format: "dd-mm-yyyy",
	  autoclose: true
	});

		
		
	 </script>

 

 
 
</body>
</html>