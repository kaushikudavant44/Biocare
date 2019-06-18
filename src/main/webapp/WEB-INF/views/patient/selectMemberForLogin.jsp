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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
            <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />
<script type="text/javascript">
		
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
            //document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
       
    </script>
    
    <style type="text/css">

.fa {
  margin-left: -12px;
  margin-right: 8px;
}
</style>
</head> 
  <body class="login_prt"> 
<%--   <c:url var="usernameValidation" value="/usernameValidation" /> --%>
 
<div class="clearfix"></div>
 <jsp:include page="../include/homeHeader.jsp"/> 
<div class="clearfix"></div>
 

			     
 
<div class="clearfix"></div>

 
<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>
    <div class="log_user dr-log">
  <form action="${pageContext.request.contextPath}/selectMemberLoginProcess" method="post">
    <h4 class="text-center">Family Member</h4>
    <div class="form-group">
     
    
    
    	<select class="multiSelect"    id="patientId" name="patientId"  >
					      
        <c:forEach items="${patientDetailList}" var="patientDetail" varStatus="count">
    
    <option value="${patientDetail.patientId}">${patientDetail.fName} ${patientDetail.lName}</option>
    </c:forEach>
    
    </select>
    
    	</div>
    	 <input type="hidden" id="token" name="token">
    	<p class="text-center"><i class="fa fa-spinner fa-spin"style="display:none" id="loader1" ></i><input type="submit" class="submit_b"   value="Login"></p>
       </form>
        
    </div>
    
    


<%-- <jsp:include page="../include/footer.jsp" />  --%> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
 	<script
		src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  
		  <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
 <script>
 
 var config = {
		  apiKey: "AIzaSyCUWc_nMV_StE2zLVfw9-eRmRa0euFc85c",
		    authDomain: "biocare-56c75.firebaseapp.com",
		    databaseURL: "https://biocare-56c75.firebaseio.com",
		    projectId: "biocare-56c75",
		    storageBucket: "biocare-56c75.appspot.com",
		    messagingSenderId: "922246627895"
};
firebase.initializeApp(config);

const messaging = firebase.messaging();
messaging
   .requestPermission()
   .then(function () {
      
       console.log("Notification permission granted.");
       
       // get the token in the form of promise
       console.log("Token - "+ JSON.stringify(messaging.getToken()));
    
       return messaging.getToken()
   })
   .then(function(token) {
       
       document.getElementById("token").value=token;
   })
   .catch(function (err) {
      
       console.log("Unable to get permission to notify.", err);
   });

messaging.onMessage(function(payload) {
   console.log("Message received. ", payload);
  
});
</script>
<script>
$('.animate').scrolla({
		mobile: false,
		once: true
	});

</script>

	
			<script>
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
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
    autoplayHoverPause: true
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
$(".toggle-password").click(function() {

	  $(this).toggleClass("fa-eye fa-eye-slash");
	  var input = $($(this).attr("toggle"));
	  if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	  }
	});

</script>

</body>
</html>
