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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 
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

<c:otherwise>
<jsp:include page="include/homeHeader.jsp"/> 
</c:otherwise>
</c:choose>

 
<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="sendReferanceMessage"
		value="/sendReferanceMessage" />
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
        
        	<c:choose>
			<c:when test="${sessionScope.patientDetails.patientId>0}">
			
			<input type="hidden" id="userType" value="1"/>
			
            <jsp:include page="include/patientLeftMenu.jsp"/> 
            </c:when>
            <c:when test="${sessionScope.doctorDetails.doctorId>0}">
            
            <input type="hidden" id="userType" value="0"/>
            <jsp:include page="include/leftmenu.jsp"/> 
            </c:when>
            <c:when test="${sessionScope.labDetails.labId>0}">
            
            <input type="hidden" id="userType" value="2"/>
            <jsp:include page="include/labLeftMenu.jsp"/> 
            </c:when>
            <c:when test="${sessionScope.medicalDetails.medicalId>0}">
            <input type="hidden" id="userType" value="3"/>
            <jsp:include page="include/pharmacyLeftMenu.jsp"/>
            </c:when>
            </c:choose>
            
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content">
	      			</div>
	 				
	                <div class="bhoechie-tab-content active">
	               
	                 <p class="text-center"><strong>Now Consult Biocare Doctors and Patients anytime, anywhere through our mobile app</strong> </p> 
	                 
	                  <div class="cosult referalblk">
													<p class="text-center"><label class="radio-inline"> <input type="radio"
														class="consult-radio" name="userProfession" id="" value="0"
														checked>For Patient
													</label> <label class="radio-inline"> <input type="radio"
														class="consult-radio" name="userProfession" id="" value="1">
														For Doctor
													</label></p>
					</div>
	                 
	                <div class="referal_sec">
	                
	                   <div class="col-sm-5"></div>
	                          <!--  <div class="col-sm-2">
				                  <div class="radiowidth"><input type="radio" name="Android" value="Android"><strong>Android</strong></div>
				               </div>
				               <div class="col-sm-2">
				                   <div class="radiowidth"><input type="radio" name="ios" value="ios"><strong>IOS</strong></div>
				               </div> -->
				                 <div class="col-sm-3"></div>
				               <div class="clearfix"></div>
				               <hr>
				                <div class="detls_input">
						              <div class="col-sm-4">
						              <input type="text" placeholder="email id" id="email" name="email">
						              </div>
						               <div class="col-sm-1 text-center">
									        	<a href="#" class="activestate">OR</a>
									   </div>
									   <div class="col-sm-4">
						              <input type="text" placeholder="Phone Number" id="phoneNo" name="phoneNo">
						              </div>
							          <div class="col-sm-2 pull-right">   
							          <input type="submit" class="btn-fr-all" value="Get Link" onclick="giveReferal('${userReferal}')">
							           </div>
						           </div> 
			           				
		                <img src="${pageContext.request.contextPath}/resources/images/referral-banner.jpg" class="img-responsive" alt="referral banner">
		                <div class="dotted-line"></div>
		                <p class="text-center">Share following promocode with your friends and family you both earn 25 Rs. Cash in your wallet</p>
		                <%--  <p class="text-center"><strong>Scan Qr Code</strong><br><img src="${pageContext.request.contextPath}/resources/images/qrcode.jpg"></p>--%>
		                <p class="text-center refrl_cd ">Referral Code : <span>${userReferal}</span></p> 
		                
		             </div>   
	                </div>
            </div>
               
            </div>
             </div>
         </div>
</section>
<!--- select time--->
<!-- <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Select Appointment time</h4>
      </div>
      <div class="modal-body">
       			<ul class="appoint_tm">
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       				<li>8:00am</li>
       			</ul>
      </div>
  </div>
</div> -->
<!--- End select time--->

<div class="clearfix"></div>
 <jsp:include page="include/footer.jsp"/> 
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
<script type="text/javascript">

function giveReferal(referal){
	

	var email= document.getElementById("email").value;
	var phoneNo= document.getElementById("phoneNo").value;
	var userProfession = $("input[name='userProfession']:checked").val();
	$
	.getJSON(
			'${sendReferanceMessage}',
			{
				email :email,
				
				phoneNo : phoneNo,
				
				referal : referal,
				
				userProfession : userProfession,
				
				ajax : 'true'
			},
			function(data) {
				
			alert("Referal Send successfully.");

				
			});
}

</script>
</body>
</html>