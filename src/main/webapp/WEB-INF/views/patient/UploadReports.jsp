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
<link href="${pageContext.request.contextPath}/resources/css/videoCall2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 
</head>         
<body>
<jsp:include page="../include/patientHeader.jsp"/> 


<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
		<c:url var="getConsultingDetailsByDoctor" value="/getConsultingDetailsByDoctor" />
  <c:url var="getPrescriptionByMeetingId" value="/getPrescriptionByMeetingId" />
  <c:url var="getDoctorsByPatientId" value="/getDoctorsByPatientId" />

 <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  <c:url var="submitDoctorRating" value="/submitDoctorRating" />		
  <c:url var="submitLabRating" value="/submitLabRating" />	
  
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content">
	      			</div>
	 
	                <div class="bhoechie-tab-content active">
	                <div class="filter_div">
	                <h3>View Consulting</h3>
		                	<div class="col-sm-3">
			                	<select class="slct_lst" id="patientId" name="patientId" onChange="getDoctors()">
					      		    <option>select member</option>
      			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
					      		</select>
			                </div>
			                <div class="col-sm-2">
			                	<input type="text" name="startdate" id="startdate" placeholder="from Date" class="datepicker">
			                </div>
			                 <div class="col-sm-2">
			                	<input type="text" name="enddate" id="enddate" placeholder="to Date" class="datepicker">
			                </div>
			                <div class="col-sm-1 text-center">
					        	<a href="#" class="activestate">OR</a>
					        </div>
			                 <div class="col-sm-3">
			                	<select class="slct_lst" id="doctorId" name="doctorId" >
					      		    <option value="0">select doctor name</option>
					      		</select>
			                </div>
			                 <div class="col-sm-1">
			                	<a href="#" class="btn-fr-all" onClick="searchDoctor()">Search</a>
			                </div>
	                </div>
	                <div class="clearfix"></div>
	                <hr>
	                <div id="consult">
  					
				</div>
	       </div>
	       
	       <div class="page-alerts collapse" id="alert-1" style="display:none">
    
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

<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
<script>
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

$(document).ready(function() {    
    $("#medicine_nm").val("xyz nlkjhj"); 
    $("#qnty").val("5"); 
    $("#instruction").val("before food");
    $("#timing").val("night");
});
</script>
<script>

/* $(document).ready(function(){
    $( ".time1" ).hover(function() {
           $('.bs-example-modal-lg').modal({
        show: true
    });
  });  
}); */
$(document).ready(function() {
    $(".appoint_tm > li").click(function(){
      /* $(".appoint_tm > li.highlighted").removeClass("highlighted"); */
      $(this).addClass("highlighted");
      $(".highlighted").addClass('disabled');
    });
});


</script>

<script type="text/javascript">
jQuery(document).ready(function() {
    var owl = jQuery('.owl-carousel');
    owl.owlCarousel({
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 1000,
      autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
  
  $('.datepicker').datepicker({ format: "dd-mm-yyyy"}).datepicker("setDate", "0")

</script>

 <!-- Feed Back -->
  <script>
 function feedBackNotification(){
	  
	  var displayDiv=document.getElementById("alert-1");
	  displayDiv.style.display="block";					
				$
				 
				.getJSON(
						'${getDoctorsAndLabsForRating}',
						{
													
							ajax : 'true'
						},
						function(data) {
														
										var len = data.doctorsInfo.length;
										var lengt = data.labInfo.length;
										
									
										var strVar="";
										var strV="";
										
										for ( var i = 0; i < len; i++) {
											
										
										strVar += "<div class=\"alert alert-Thanks For Your Feedback  page-alert\">";
										strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
										strVar += "        <strong>"+data.doctorsInfo[i].doctorName+"-"+data.doctorsInfo[i].date+"<\/strong><strong class=\"pull-right\">"+data.doctorsInfo[i].patientName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\" class=\"feed_bk\" onClick=\"openFeedBackModel('"+data.doctorsInfo[i].patientName+"',"+data.doctorsInfo[i].patintId+","+data.doctorsInfo[i].doctorId+","+data.doctorsInfo[i].meetId+")\"> Give Feedback<\/a>";
									
										strVar += "    <\/div>";

										
										}
										for ( var j = 0; j < lengt; j++) {
											
											
											strVar += "<div class=\"alert alert-Thanks For Your Feedback page-alert\">";
											strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
											strVar += "        <strong>"+data.labInfo[j].labName+"-"+data.labInfo[j].date+"<\/strong><strong class=\"pull-right\">"+data.labInfo[j].labTestName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\"  class=\"feed_bk\" onClick=\"openLabFeedBackModel('"+data.labInfo[j].patientName+"',"+data.labInfo[j].patientId+","+data.labInfo[j].labId+","+data.labInfo[j].appointId+")\"> Give Feedback<\/a>";
											strVar += "        <a href\"#\" class=\"feed_bk\"> Not Now<\/a>";
											strVar += "    <\/div>";

											
											}
										
										$('#alert-1').html(strVar);
										
										$("#alert-1").trigger("chosen:updated"); 
									
							
							
														 
						})
						
			}	

function openFeedBackModel(patientName,patientId,doctorId,meetId)
{
	document.getElementById("ratPatientName").value=patientName;
	document.getElementById("ratPatientId").value=patientId;
	document.getElementById("ratdoctorId").value=doctorId;
	document.getElementById("ratMeetId").value=meetId;
	
	  $('#ratingModal').modal('show');




}

function openLabFeedBackModel(patientName,patientId,labId,appId)
{
	
	document.getElementById("ratLPatientName").value=patientName;
	document.getElementById("ratLPatientId").value=patientId;
	document.getElementById("ratLlabId").value=labId;
	document.getElementById("ratLappId").value=appId;
	
	  $('#labRatingModal').modal('show');




}

function saveFeedBack() {
	 
	 var ratPatientId=document.getElementById("ratPatientId").value; 
	 var ratdoctorId=document.getElementById("ratdoctorId").value; 
	 var ratPatientName=document.getElementById("ratPatientName").value; 
	 var rating=document.getElementById("combostar").value; 
	 var review=document.getElementById("review").value; 
	 var ratMeetId=document.getElementById("ratMeetId").value; 
	 
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
function saveLabFeedBack() {
	 
	 var ratLPatientId=document.getElementById("ratLPatientId").value; 
	 var ratLlabId=document.getElementById("ratLlabId").value; 
	 var ratLPatientName=document.getElementById("ratLPatientName").value; 
	 var rating=document.getElementById("labcombostar").value; 
	 var labReview=document.getElementById("labReview").value; 
	 var ratLappId=document.getElementById("ratLappId").value; 
	 
	  
	 $
													.getJSON(
															'${submitLabRating}',
															{
																ratLPatientId : ratLPatientId,
																ratLlabId : ratLlabId,
																ratLPatientName : ratLPatientName,
																rating : rating,
																labReview : labReview,
																ratLappId : ratLappId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("labReview").value="";
																alert(data.message);
																location.reload();
																

															})
	 
	 
}  
</script> 
       
	

</body>
</html>