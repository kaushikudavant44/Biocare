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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
	     <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />
</head>
<body onload="getCityList();">
	<c:url var="getOnloadCity" value="/getOnloadCity" />
	<c:url var="acceptDoctorNetworkCircleRequest" value="/acceptDoctorNetworkCircleRequest" />
	<c:url var="sendCircleRequest" value="/sendCircleRequest" />

<jsp:include page="../include/doctorHeader.jsp" />

<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center">
		<h4>Search Doctor</h4>
	</div>
		<div class="container-fluid netwkblk">
		<div class="row">
			<div class="bhoechie-tab-container">

			
        	<jsp:include page="../include/leftmenu.jsp"/>
 <div
					class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
					<div class="bhoechie-tab-content active">
 <form action="${pageContext.request.contextPath}/searchDoctorForCircle"	method="GET" id="searchDoctorForCircle">
 <div class="col-lg-6 col-md-6 col-sm-12">
   <label for="exampleInputEmail1">Specialist :</label>
										  <select class="multiSelect" multiple="multiple"  id="specId" name="specId" multiple="multiple">
										   <c:forEach items="${specializationList}" var = "specialization">
										 <c:set var="select" value=""/>
										   <c:forEach items="${specId}" var = "specId">
										 <c:choose>
										   <c:when test="${specId==specialization.specializationId}">
										    <c:set var="select" value="selected"/>
										   
										   </c:when>
										   
										   </c:choose>
										   </c:forEach>
										    <option ${select} value="${specialization.specializationId}" >${specialization.specializationType}</option>
										  
										   </c:forEach>
				          </select>
								 
 </div>
   
  <div class="col-lg-4 col-md-6 col-sm-12">
  <label for="exampleInputEmail1">City Name</label>
<input
											required type="text"
											id="autocomplete"
													size="16" placeholder="Enter City..." autocomplete="off" 	
											  
											  class="form control searchBox">
											  
											  <input type="hidden" id="cityId" name="cityId" value="${cityId}">
 </div> 
  
   <div class="col-lg-2 col-md-6 col-sm-12">
 
 <p><button class="btn-fr-all mrgn-top" onclick="searchDoctorForCircle()">Search</button></p>
 </div>
  </form>
 <div class="clearfix"></div>
 <hr>
 <div style="height: 600px;overflow-y: scroll">
  <c:forEach items="${getDoctorBasicDetailsList}" var = "getDoctorBasicDetails">
<div class="col-lg-4 col-md-6 col-sm-12">
<div class="card btnstyl">
 
  <img src="${doctorUrl}/${getDoctorBasicDetails.doctorId}/profile/${getDoctorBasicDetails.profilePhoto}" alt="Doctor Photo" class="img-responsive" >
 
  <h3>${getDoctorBasicDetails.doctorName}</h3>
  <p class="title">${getDoctorBasicDetails.specType}</p>
  <p>${getDoctorBasicDetails.cityName}</p>
  <%--  <p style="margin: 0px;">${getDoctorBasicDetails.contact}</p> --%>
  <!-- <div style="margin: 24px 0;">
    <a href="#"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="#"><i class="fa fa-linkedin"></i></a>  
    <a href="#"><i class="fa fa-facebook"></i></a> 
  </div> -->
  
  <c:choose>
  <c:when test="${getDoctorBasicDetails.status==0}">
   <p><button disabled="disabled" style="background-color: grey">Request sent</button></p>
  </c:when>
  <c:when test="${getDoctorBasicDetails.status==1}">
   <p><button disabled="disabled">Connected</button></p>
  </c:when>
   <c:when test="${getDoctorBasicDetails.status==2}">
   <p><button disabled="disabled">Rejected</button></p>
  </c:when> 
  <c:when test="${getDoctorBasicDetails.status==3}">
   <p><button onclick="acceptDoctorNetworkCircleRequest(${getDoctorBasicDetails.doctorId})">Accept Request</button></p>
  </c:when>
  <c:when test="${getDoctorBasicDetails.status==4}">
   <p><button disabled="disabled" style="background-color: grey">Connected</button></p>
  </c:when>
   <c:when test="${getDoctorBasicDetails.status==5}">
   <p><button onclick="sendRequest(${getDoctorBasicDetails.doctorId})">Connect</button></p>
  </c:when>
   <c:when test="${getDoctorBasicDetails.status==6}">
   <p><button onclick="sendRequest(${getDoctorBasicDetails.doctorId})">Connect</button></p>
  </c:when>
  </c:choose>
 
</div>
</div>
</c:forEach>
 </div>
 
 
 
 
</div>
</div>
</div>
</div>

</div>
</section>
<jsp:include page="../include/footer.jsp" /> 
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	 
	 
	 

	<script
		src='${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js'></script>
	 
			 
	 
	 
		
 	<script
		src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  
			<script
		src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>
		
				<script>
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
</script>
<script type="text/javascript">
		var currencies = [];

		function getCityList() {
 
			$.getJSON('${getOnloadCity}', {

				ajax : 'true'
			}, function(data) {

			 
				
				$.each(data, function(key, cityList) {

					currencies.push({
						value : cityList.cityName,
						data : cityList.cityId
					});
					var cityId=${cityId};
					if(cityList.cityId==cityId)
						$('#autocomplete').val(cityList.cityName);

				});

			});
		}
		</script>
		<script type="text/javascript">
		$(function() {

			$('#autocomplete')
					.autocomplete(
							{

								lookup : currencies,

								onSelect : function(suggestion) {

								 

									document.getElementById("cityId").value = suggestion.data;

									 
								}

							});

		});

	 

		 
 
	</script>
<script type="text/javascript">
function searchDoctorForCircle() {
	document.getElementById("searchDoctorForCircle").submit();
	
}

function acceptDoctorNetworkCircleRequest(fromId) {
	 
	$.getJSON('${acceptDoctorNetworkCircleRequest}', {
		fromId : fromId,
		ajax : 'true'
	}, function(data) {
		location.reload();
	});
}
function sendRequest(doctorId) {
	$.getJSON('${sendCircleRequest}', {
		doctorId : doctorId,
				ajax : 'true'
			}, function(data) {
				location.reload();
			});   
}

jQuery('ul.nav li.dropdown').hover(function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
	}, function() {
	  jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
	});
     
</script>

</body>
</html>