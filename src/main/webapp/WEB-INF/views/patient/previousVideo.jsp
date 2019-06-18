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
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/videoCall2.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />



</head>
<body>
<jsp:include page="../include/patientHeader.jsp" />
	<section class="doc_login doc_filter inssurance_buy">
	<div class="dashboard_nm text-center">
		<h4>All Videos</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
				
		<%-- 		
<select id="patientId" name="patientId">
					<c:forEach items="${patientDetailList}" var="patientDetail" varStatus="count">
					<c:set value="" var="sel"/>
					<c:if test="${patientId==patientDetail.patientId}">
					<c:set value="selected" var="sel"/>
					</c:if>
					<option ${sel} value="${patientDetail.patientId}"> ${patientDetail.fName} ${patientDetail.lName}</option>
					</c:forEach>
					</select>
					
					<input type="button" value="Search" onclick="searchSharedVideo()">
				  --%>
					<div class="bhoechie-tab-content active">
					 
					
					<c:forEach items="${videoSharingList}" var="videoSharing" varStatus="count">
													
					
						<div class="col-sm-4">
							<div class="videoShared allvd">
								<video controls>
		  							<source src="${videoLink}${videoSharing.videoFileName}" type="video/mp4"></source>
		  						</video>
		  						<h4>Title: <a href="${pageContext.request.contextPath}/viewVideoSharedByDoctor/${videoSharing.videoId}">${videoSharing.title}</a></h4>
		  						<p><strong>by: Dr. ${videoSharing.doctorName}</strong></p>
		  					</div>
	  					</div>
	  					</c:forEach>
	  					 
	  					 
	  					 
	  					 
	  					 
					</div>
					
				</div>

			</div>
		</div>
	</div>
	</section>
	
	
	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->


	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>


	<script>
$(function() {
	  $('.panel-default a').click(function() {
	    if ($(this).hasClass('activestate')) {
	      $(this).removeClass('activestate');
	    } else {
	      $('.panel-default a').removeClass('activestate');
	      $(this).addClass('activestate');
	    }
	  });
	});
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
</script>

<script type="text/javascript">
function searchSharedVideo() {
	
	var patientId=document.getElementById("patientId").value;
	window.open("${pageContext.request.contextPath}/showPreviousSharedVideo/"+patientId,'_self');
}
</script>

</body>
</html>