<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body>
<jsp:include page="../include/patientHeader.jsp" />  

<div class="header">
<!-- Carousel================================================== -->
<%-- <div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/buy_innsurance.jpg" alt="health care">
    </div>
  </div>
 </div> --%>
<!-- /.carousel --> 
</div>
<div class="clearfix"></div>
<section class="inssurance_buy">
	<div class="container">
    	<div class="row">
    	<c:forEach items="${makePaymentList}" var = "makePaymentList">
        	<div class="col-sm-4">
            	<div class="inssurance_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/premium_logo.jpg" class="img-responsive"> 
                    <h4>${makePaymentList.companyName}</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Type of insurance :</strong> Health Insurance</li>
                        <li><strong>Annual Premium :</strong>${makePaymentList.premium}</li>
                    </ul>
                    <input type="hidden" name="appId" value="${makePaymentList.appId}">
                    <p><a href="${pageContext.request.contextPath}/showInsuranceDetailsAfterBuy/${makePaymentList.appId}" class="insurance_btn">View Details</a></p>
                </div>
            </div>
        </c:forEach>   
        </div>
    </div>
</section>

             <div class="clearfix"></div>
<jsp:include page="../include/footer.jsp" />  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
</body>
</html>
