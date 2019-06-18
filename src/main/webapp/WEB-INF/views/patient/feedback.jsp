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
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 
</head>         
<body>
 <jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Give Feedback</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content active">
	                
	                 <c:forEach items="${getDocAndLabForRating.doctorsInfo}" var="doctorsInfo" varStatus="count">
	                <div class="feedbktodc">
			                <div class="docnmFeed">
			                <div class="row">
			                   <div class="col-sm-8">
			                	   <h4>Dr.${doctorsInfo.doctorName}</h4>
			                	</div>
			                	 <div class="col-sm-4">
						                	<!-- RATING - Form -->
												<form class="rating-form" action="#" method="post" name="rating-movie">
												  <fieldset class="form-group">
												    
												    <legend class="form-legend">Rating:</legend>
												    
												    <div class="form-item">
												      
												      <input id="rating-5" name="rating" type="radio" value="5" />
												      <label for="rating-5" data-value="5">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">5</span>
												      </label>
												      <input id="rating-4" name="rating" type="radio" value="4" />
												      <label for="rating-4" data-value="4">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">4</span>
												      </label>
												      <input id="rating-3" name="rating" type="radio" value="3" />
												      <label for="rating-3" data-value="3">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">3</span>
												      </label>
												      <input id="rating-2" name="rating" type="radio" value="2" />
												      <label for="rating-2" data-value="2">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">2</span>
												      </label>
												      <input id="rating-1" name="rating" type="radio" value="1" />
												      <label for="rating-1" data-value="1">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">1</span>
												      </label>
												      
												     <!--  <div class="form-action">
												        <input class="btn-reset" type="reset" value="Reset" />   
												      </div> -->
												
												      <!-- <div class="form-output">
												        ? / 5
												      </div> -->
												      
												    </div>
												    
												  </fieldset>
												</form>
												</div>
								</div>
			         </div>
			         <div class="discriptReview">
			         	<textarea rows="4" cols="50" placeholder="Enter your Feedback"></textarea>
			         	<div class="clearfix"></div>
			         	<p class="text-right"><a href="#" class="btn-fr-all" data-toggle="tooltip" title="Send" onclick="saveFeedBack(${doctorsInfo.patintId},${doctorsInfo.doctorId},${doctorsInfo.patientName},${doctorsInfo.meetId}"><span class="glyphicon glyphicon-share-alt"></span></a></p>
			         </div>
	                
	                
	                </div>
	                 <hr>
	         </c:forEach>      	                
	                
	                <c:forEach items="${getDocAndLabForRating.labInfo}" var="labInfo" varStatus="count">
	               
	                <div class="feedbktodc">
			                <div class="docnmFeed">
			                <div class="row">
			                   <div class="col-sm-8">
			                	   <h4>${labInfo.labName}</h4>
			                	</div>
			                	 <div class="col-sm-4">
						                	<!-- RATING - Form -->
												<form class="rating-form" action="#" method="post" name="rating-movie">
												  <fieldset class="form-group">
												    
												    <legend class="form-legend">Rating:</legend>
												    
												    <div class="form-item">
												      
												      <input id="rating-10" name="rating" type="radio" value="10" />
												      <label for="rating-10" data-value="10">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">5</span>
												      </label>
												      <input id="rating-9" name="rating" type="radio" value="9" />
												      <label for="rating-9" data-value="9">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">4</span>
												      </label>
												      <input id="rating-8" name="rating" type="radio" value="8" />
												      <label for="rating-8" data-value="8">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">3</span>
												      </label>
												      <input id="rating-7" name="rating" type="radio" value="7" />
												      <label for="rating-7" data-value="7">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">2</span>
												      </label>
												      <input id="rating-6" name="rating" type="radio" value="6" />
												      <label for="rating-6" data-value="6">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">1</span>
												      </label>
												      
												     <!--  <div class="form-action">
												        <input class="btn-reset" type="reset" value="Reset" />   
												      </div> -->
												
												      <!-- <div class="form-output">
												        ? / 5
												      </div> -->
												      
												    </div>
												    
												  </fieldset>
												</form>
												</div>
								</div>
			         </div>
			         <div class="discriptReview">
			         	<textarea rows="4" cols="50" placeholder="Enter your Feedback"></textarea>
			         	<div class="clearfix"></div>
			         	<p class="text-right"><a href="#" class="btn-fr-all" data-toggle="tooltip" title="Send"><span class="glyphicon glyphicon-share-alt"></span></a></p>
			         </div>
	                
	                
	                </div>
	                <hr>
	                </c:forEach>
						
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
<script>

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>

<script>

function saveFeedBack(ratPatientId,ratdoctorId,ratPatientName,ratMeetId) {
	 
	 /* var ratPatientId=document.getElementById("ratPatientId").value; 
	 var ratdoctorId=document.getElementById("ratdoctorId").value; 
	 var ratPatientName=document.getElementById("ratPatientName").value;  */
	 var rating=document.getElementById("combostar").value; 
	 var review=document.getElementById("review").value; 
	/*  var ratMeetId=document.getElementById("ratMeetId").value;  */
	 
	 $
													.getJSON(
															'${submitDoctorRating}',
															{
																ratPatientId : ratPatientId,
																ratdoctorId : ratdoctorId,
																ratPatientName : ratPatientName,
																rating : rating,
																review : review,
																ratMeetId : ratMeetId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("review").value=""; 
																 
																location.reload();
																

															})
	 
	 
}

</script>
</body>
</html>