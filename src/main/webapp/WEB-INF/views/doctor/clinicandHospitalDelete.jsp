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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style type="text/css">

.autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto;}
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; border-bottom: 1px dashed #999; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }

</style>
</head>         
<body onload="getHospitalDetails()">
<jsp:include page="../include/doctorHeader.jsp"/> 

<c:url var="getStateByCountryId"
		value="/getStateByCountryId" />
		<c:url var="getCityByStateId"
		value="/getCityByStateId" />
		
 
<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
<c:url var="sendTextOtp" value="/sendTextOtp" />
  <c:url var="verifyRegOTP" value="/verifyRegOTP" />
  <c:url var="verifyContactNumber" value="/verifyContactNumber" />
  <c:url var="getAllHospitalByType" value="/getAllHospitalByType" />
  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Hospital and Clinic List</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
					<div class="table-responsive">
						<table width="100%" border="0" class="table table-striped table-hover table-bordered table-hd" id="addedMedicine">	
						<thead>
							<tr>
								<th>Sr No.</th>
								<th>Clinic Name</th>
							    <th>Delete</th>
							    <th>Hospital Name</th>
							    <th>Delete</th>
								
							</tr>							
						</thead>
					
                    	<tr>
                         <td>1</td>
						 <td>Om Clinic</td>		
						<td><a href="#"><span class="flaticon-rubbish-bin"></span></a></td> 
						 <td>Swami Samarth Hospital</td>		
						<td><a href="#"><span class="flaticon-rubbish-bin"></span></a></td> 
						</tr>
						<tr>
                         <td>2</td>
						 <td>Om Clinic</td>		
						<td><a href="#"><span class="flaticon-rubbish-bin"></span></a></td> 
						 <td>Swami Samarth Hospital</td>		
						<td><a href="#"><span class="flaticon-rubbish-bin"></span></a></td> 
						</tr>
						<tr>
                         <td>3</td>
						 <td>Om Clinic</td>		
						<td><a href="#"><span class="flaticon-rubbish-bin"></span></a></td> 
						 <td>Swami Samarth Hospital</td>		
						<td><a href="#"><span class="flaticon-rubbish-bin"></span></a></td> 
						</tr>
						
						
						</table>
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
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</body>
</html>