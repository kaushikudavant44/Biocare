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

 
<c:url var="deleteDoctorLeave"
		value="/doctorAvailableTime/deleteDoctorLeave" />
  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Set Leave </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
                <div class="filter_div vacciinput"> 
	               <form action="${pageContext.request.contextPath}/doctorAvailableTime/insertDoctorLeave" method="POST">
      	       	     <div class="col-sm-10">
      	       	      <label>Select Leave Date</label>
       			      	<input type="text" class="datepicker" readonly placeholder="Date" name="date"
													id="date" value="${date}" >
       			      	<p style="color:red; font-size: 14px !important; margin: 0; line-height: 20px;">${message}</p>
      	       	     </div>
      	       	     
       			      	<div class="col-sm-2">
       			       <input type="submit" value="Submit" class="btn-fr-all dspl-appt baby-vacci" > 
       			       
	                 </div>
       			       </form>
       			      </div> 
       			      <div class="clearfix"></div>
       			      <hr>
       			      	<h4 class="text-center">Leaves Details</h4>
       			      	 
       			      	 
       			      	 
       			        
       			      
       			     
					<div class="td-page-content tabel-responsive">
					<table width="100%">
				 
					<thead>
					<tr>
					<th>Sr. No.</th>
					<th>Leave Date </th>
					<th>Action </th>
					</tr>
					 
			</thead>
				 
				<tbody>
				 <c:forEach items="${doctorLeavesDetailsList}" var="doctorLeavesDetails" varStatus="count">	
				
				 <tr>
					<td>${count.index+1}</td>
			 	<td>${doctorLeavesDetails.date}</td>
			 	<td><a href="#" onclick="deleteDoctorLeave(${doctorLeavesDetails.leaveId})">Delete</a></td>
			 	 </tr>
				 
				</c:forEach> 
				
					</tbody>
					</table>
</div>       

 
       			     <div class="loader2"> </div>
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
 function deleteDoctorLeave(leaveId)
 {
	 $
		.getJSON(
				'${deleteDoctorLeave}',
				{
					leaveId : leaveId,
					 
					ajax : 'true'
				},
				function(data) {
					location.reload();
				});
					  
 }
 </script>
deleteDoctorLeave
</body>
</html>