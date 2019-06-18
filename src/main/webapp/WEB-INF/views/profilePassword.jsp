<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
 
 
 
 
 
 

  
    
   
</head> 
  
   <body>
 
  
  
  <c:url var="loginProcess" value="/loginProcess" />
  
  <c:set var="loginUserType" value=""/>
<div class="clearfix"></div>
<c:choose>
<c:when test="${sessionScope.patientDetails.patientId>0}">
<jsp:include page="include/patientHeader.jsp"/>
  <c:set var="loginUserType" value="1"/>
</c:when>
<c:when test="${sessionScope.doctorDetails.doctorId>0}">
<jsp:include page="include/doctorHeader.jsp"/>
 <c:set var="loginUserType" value="2"/>
</c:when>
<c:when test="${sessionScope.labDetails.labId>0}">
<jsp:include page="include/labHeader.jsp"/>
 <c:set var="loginUserType" value="3"/>
</c:when>
<c:when test="${sessionScope.medicalDetails.medicalId>0}">
<jsp:include page="include/pharmacyHeader.jsp"/>
 <c:set var="loginUserType" value="4"/>
</c:when>

<c:otherwise>
<jsp:include page="include/homeHeader.jsp"/> 
</c:otherwise>
</c:choose>
<div class="clearfix"></div>
 




<div id="largeModal" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-md modal-sm" style="width:25%;margin-top:10%">
				<div class="modal-content">
				  <form action="${pageContext.request.contextPath}/loginProfileProcess" method="post">  
					<div class="modal-header">
						<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->
						<h4 class="modal-title"  align="center">  Profile Login</h4>
					</div>
					<div class="modal-body">
					<p id="errormessage" style="color:red;position:absolute;" maxlength="20">${msg}</p>
						
						<p style="color: orange;">By default your profile password is same as your account password. Please change profile password if not change yet.</p>
						 
						Profile Password  <input type="password" id="LogInPasswors" name="password" placeholder="password" class="form-control" required>
						<input type="hidden" name="userType" id="userType" value="${loginUserType}">
						<input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}">
					</div>
					<div class="modal-footer" >
					<div align="center"> 
						 
						
						<input type="button" class="btn btn-warning"value="Cancel" onclick="cancelProfileLogin()"/>
						<input type="submit" class="btn btn-success"value="Login" onclick="loginProfileProcess()"/>
							</div> 
							 
					</div>
					 
				 </form>  
				</div>
			</div> 
		</div>
		 
<div class="clearfix"></div>
 

 

 
 
 
 
 

 
 
 
 
 
 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>	 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<%--  <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> --%>
 <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
 
 <!-- ads  -->
 <script>
    $(function(){
        var stickyHeaderTop = $('#stickytypeheader').offset().top;
 
        $(window).scroll(function(){
                if( $(window).scrollTop() > stickyHeaderTop ) {
                        $('#stickytypeheader').css({position: 'fixed', top: '0px'});
                        $('#sticky').css('display', 'block');
                } else {
                        $('#stickytypeheader').css({position: 'static', top: '0px'});
                        $('#sticky').css('display', 'none');
                }
                
        });
        
  });
    </script>
    
    <script>
    $(document).ready(function(c) {
    	$('.alert-close').on('click', function(c){
    		$('.ad-bg').fadeOut('slow', function(c){
    	  		$('.ad-bg').remove();
    		});
    	});	
    });
    </script>
     <!-- ads  -->

	<script>
		function callMe(){
			
			initialize123();
			init();
		}
		</script>

		 
		
<script>
$('.animate').scrolla({
		mobile: false,
		once: true
	});

</script>
<script type="text/javascript">
//new WOW().init();
jQuery(document).ready(function() {
  var owl = jQuery('.owl-carousel');
  owl.owlCarousel({
    items: 3,
    loop: true,
    margin: 10,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: true,
    responsiveClass:true,
    responsive:{
        0:{
            items:1,
            nav:true
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:3,
           /*  nav:true, */
            loop:true
        }
    }
  });
  jQuery('.play').on('click', function() {
    owl.trigger('play.owl.autoplay', [2000])
  })
  jQuery('.stop').on('click', function() {
    owl.trigger('stop.owl.autoplay')
  })
})


jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>


<script type="text/javascript">


$(document).ready(function(){
  var date_input=$('input[name="date"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  var options={
    format: 'dd/mm/yyyy',
    container: container,
    todayHighlight: true,
    autoclose: true,
  };
  date_input.datepicker(options);
});

 
 
</script>
 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"
			charset="UTF-8"></script>
    <script type="text/javascript">
    
	$('.datepicker').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	
</script>
      
       <script type="text/javascript">
    $(window).on('load',function(){
        $('#largeModal').modal('show');
    });
</script>
          <script type="text/javascript">
          function cancelProfileLogin() {
			
        	  
        	  window.history.back();
		}
          </script>
</body>
</html>