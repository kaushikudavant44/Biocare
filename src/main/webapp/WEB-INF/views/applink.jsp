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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 
</head>         
<body>
<jsp:include page="include/doctorHeader.jsp"/> 


<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />

  
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="include/appmenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content">
	      			</div>
	 
	                <div class="bhoechie-tab-content">
	                <div class="filter_div radio_appsec">
	                 <div class="col-sm-6">
		               <p><strong>Now Consult Bionische Doctors and Patients anytime, anywhere through our  mobile app</strong> </p> 
		               <h3>For Android :</h3>	
		               <div class="col-sm-8">
				               <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="doctor" value="Doctor"><strong>Doctors</strong></div>
				               </div>
				               <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="patient" value="Patient"><strong>Patients</strong></div>
				               </div>
				                <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="patient" value="Patient"><strong>Lab</strong></div>
				               </div>
				                <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="patient" value="Patient"><strong>Pharmacy</strong></div>
				               </div>
		               </div>
		                <div class="col-sm-4">
		                		<img src="${pageContext.request.contextPath}/resources/images/playstore.jpg">
		                </div>
		               <div class="clearfix"></div>
		               <hr>
		                <h3>For IOS :</h3>	
		                 <div class="col-sm-8">
				               <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="doctor" value="Doctor"><strong>Doctors</strong></div>
				               </div>
				               <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="patient" value="Patient"><strong>Patients</strong></div>
				               </div>
				                <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="patient" value="Patient"><strong>Lab</strong></div>
				               </div>
				                <div class="col-sm-6">
				               <div class="radiowidth"><input type="radio" name="patient" value="Patient"><strong>Pharmacy</strong></div>
				               </div>
		               </div>
		                <div class="col-sm-4">
		                		<img src="${pageContext.request.contextPath}/resources/images/appstore.jpg">
		                </div>
		               
		              <div class="clearfix"></div>
		              <hr>
		              <div class="detls_input">
		              <div class="col-sm-5">
		              <input type="text" placeholder="email id">
		              </div>
		               <div class="col-sm-2 text-center">
					        	<a href="#" class="activestate">OR</a>
					   </div>
					   <div class="col-sm-5">
		              <input type="text" placeholder="Phone Number">
		              </div>
			           <div class="clearfix"></div>
			           <hr>     
			           <p class="submit_input text-center"><input type="submit" class="btn-fr-all" value="Get Link"></p>
			           </div>     
	                </div>
	                 <div class="col-sm-6 qr_code">
	                 <p><strong>Scan Qr Code </strong></p>
	                 	<img src="${pageContext.request.contextPath}/resources/images/qrcode.jpg">
	                 
	                 </div>
	                </div>
	                
	       </div>
            </div>
               
            </div>
             </div>
         </div>
</section>
<!--- select time--->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
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
</div>
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
  
  $('.datepicker').datepicker({ format: "yyyy-mm-dd"}).datepicker("setDate", "0")

</script>

</body>
</html>