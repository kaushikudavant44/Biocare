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
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="include/doctorHeader.jsp" />


	<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />


	<div class="clearfix"></div>
<div class="header">
<!-- Carousel================================================== -->
		<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
  <div class="carousel-inner" role="listbox">
     <%--<div class="item active"><iframe src="https://www.youtube-nocookie.com/embed/Bi8ikmo1pMI?rel=0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
     </div>--%>
    <div class="item active"> <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/contactbnr.jpg" alt="health care"></div>
   </div>
<!-- /.carousel --> 
</div>

<div class="contact-pg">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<ul class="add-details">
					<li><i class="fa fa-map-marker" aria-hidden="true"></i> No.3, Viraj Corner, 2nd floor, Canda corner, Sharanpur Road, Nashik, Maharashtra 422002</li>
					<li><i class="fa fa-phone" aria-hidden="true"></i>0000000000, &nbsp; 02530000</li>
					<li><i class="fa fa-envelope" aria-hidden="true"></i>info@gmail.com</li>
				</ul>
			</div>
			<div class="col-sm-4"><div class="map">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.1310515787814!2d73.76816031529408!3d20.00301372737536!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bddeb9f6e2794b3%3A0x488f97dcd067023d!2sBionische!5e0!3m2!1sen!2sin!4v1535021351113" frameborder="0" allowfullscreen></iframe>
			</div></div>
		</div>
		<p class="text-center text-capitalize"><a href="#" data-toggle="modal" data-target="#myModal" class="btn-fr-all">get in touch</a></p>
	</div>

</div>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Have you any Query ?</h4>
      </div>
      <div class="modal-body contact-inpt">
       	<input type="text" name="fullname" placeholder="Full Name">
       	<input type="text" name="email" placeholder="Email Id">
       	<input type="text" name="phone" placeholder="Phone Number">
       	<textarea type="text" name="message" placeholder="Message"></textarea>
       	<p class="text-center"><input type="submit" name="submit" class="btn-fr-all" value="Send Message"></p> 
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<div class="clearfix"></div>
	<jsp:include page="include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
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
  
$('.datepicker').datepicker({ format: "yyyy-mm-dd",  autoclose: true})
$('#popoverOption').popover({ trigger: "hover" });

$(document).ready(function() {    
    $("#medicine_nm").val("xyz nlkjhj"); 
    $("#qnty").val("5"); 
    $("#instruction").val("before food");
    $("#timing").val("night");
});

</script>

</body>
</html>