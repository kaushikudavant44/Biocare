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

</head>         
<body>
<jsp:include page="../include/labHeader.jsp"/> 
  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Dashboard</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/labLeftMenu.jsp"/> 
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
                	<div class="col-sm-3">
	                	 <div class="dashbox">
	                	 	 <div class="dashCircle"><span class="icon-calendar-page"></span></div>
	                	 	 <p class="text-center">${appointmentCount.totalApp}</p>
	                	 	 <div class="taskBlk">Total Appointment</div>
	                	 </div>
                	 </div>
                	 <div class="col-sm-3">
	                	 <div class="dashbox">
	                	 	 <div class="dashCircle"><span class="icon-calendar-page"></span></div>
	                	 	 <p class="text-center">${appointmentCount.completedApp}</p>
	                	 	 <div class="taskBlk">Completed Appointment</div>
	                	 </div>
                	 </div>
                	 
                	 <div class="col-sm-3">
	                	 <div class="dashbox">
	                	 	 <div class="dashCircle"><span class="icon-calendar-page"></span></div>
	                	 	 <p class="text-center"></p>
	                	 	 <div class="taskBlk">Total Collection</div>
	                	 </div>
                	 </div>
                	 <div class="gapDash"></div>
                	 <h4 class="dashtext text-center">Last Month Total Appointment</h4>
                	 <div class="table-responsive dashboardTbl">
                	 	<table width="100%" border="0" class="tbl table table-bordered table table-hover" >
								<thead>
								
									<tr align="center">
										<th>Sr.No</th>
										<th>Date</th>
										<th>Total Appointment</th>
									</tr>
								</thead>								
								<tbody>
								 <c:forEach items="${appOfLastThirtyDays}" var="appOfLastThirtyDays" varStatus="count">
									<tr>
								
										<td>${count.index+1}</td>
	     								<td>${appOfLastThirtyDays.appDate}</td>
										<td>${appOfLastThirtyDays.totalApp}</td>
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