<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <jsp:useBean id='fCurrentDate' class='java.util.Date'/>
    
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>


<c:url var="checkPromoCode"
		value="/checkPromoCode" />
		
<%-- <jsp:include page="../include/doctorHeader.jsp"/> --%>

<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center"><h4>Our Packages</h4></div>
	
<div class="container-fluid">
<div class="col-lg-10 col-md-10 col-md-offset-1">
        	<div class="bs-example renewAcc">
        	 	<c:forEach items="${packageDetailsList}" var="packageDetailsList">	
<form action="${pageContext.request.contextPath}/doctorSuscriptionCheckoutPage" method="post">

							
	            		          
	            		           	
	            		           		<input type="hidden" value="${packageDetailsList.packageId}" id="packageId"  name="packageId">
	            		           	 <input class="month-pack" type="hidden" name="durationType" value="${packageDetailsList.durationType}">
	            		           	 <input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
	            		           	<!--new plan design -->
	            		           		<div class="col-lg-4 col-md-6 col-sm-6">
	            		           			<div class="plan-blk">
	            		           				<div class="plan-head-blk">
	            		           				 <%-- <img src="${pageContext.request.contextPath}/resources/images/basic.jpg" class="img-responsive" alt="free trial">  --%>
	            		           					<h3></h3>
	            		           					<div class="plan-duration">
	            		           						<input class="permonth" type="text" readonly value="${packageDetailsList.packageName}" >
	            		           					</div>
	            		           					
	            		           				</div>
	            		           				<div class="plan-details">
	            		           				<ul>
	            		           					<li><div class="row">
	            		           					<div class="col-md-7 col-sm-7">
	            		           						<div class="form-group">
	            		           					<!-- <input type="text" class="input-promo" value=""> -->
	            		           					<input type="text" class="input-promo" placeholder="Enter Promo Code" name="promo_code" id="promo_code">
	            		           						<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
												</div>
	            		           					</div>
	            		           					<div class="col-md-5 col-sm-5">
	            		           					<a href="#" class="promo-btn" onclick="checkPromoCode(${packageDetailsList.packageId})">Apply <!-- Promo Code --></a>
	            		           				<input type="hidden" value="${packageDetailsList.packageCost}" id="payableAmount${packageDetailsList.packageId}" name="amount" readonly>
	            		           						
	            		           					</div>
	            		           					<div class="clearfix"></div>
	            		           					<p  id="promoMsg${packageDetailsList.packageId}" class="text-center"></p>
	            		           				</div></li>
	            		           				<li>
	            		           				<input type="hidden"  value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" >
	            		           				<input  type="hidden"  value="${packageDetailsList.packageDuration}" id="duration" name="duration">
	            		           				<p><span>Rs.${packageDetailsList.packageCost} / ${packageDetailsList.packageDuration}</span> 
	            		           				
	            		           					<c:choose>
									 		 <c:when test="${packageDetailsList.durationType==0}">
									 		 Days
									 		 </c:when>
									 <c:otherwise>
									 Months
									  </c:otherwise>
									 </c:choose></p>
	            		           				</li>
	            		           				
	            		           				<%-- <li><div class="row">
	            		           					<div class="col-md-6 col-sm-6">
	            		           						<p ><span>Rs.<input class="duration-text" type="text" readonly value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" > / </span> </p>
	            		           					</div>
	            		           					<div class="col-md-6 col-sm-6">
	            		           						<p><span> <input  type="text" readonly value="${packageDetailsList.packageDuration}" id="duration" name="duration"></span></p>
	            		           					</div>
	            		           				</div>
	            		           				<c:choose>
									 		 <c:when test="${packageDetailsList.durationType==0}">
									 		 Days
									 		 </c:when>
									 <c:otherwise>
									 Months
									  </c:otherwise>
									 </c:choose>
	            		           				</li> --%>
	            		           				<%-- 	<li>
	            		           					
	            		           					<p ><span>Rs.<input class="duration-text" type="text" readonly value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" > / </span> </p><p><span> <input  type="text" readonly value="${packageDetailsList.packageDuration}" id="duration" name="duration"></span></p>
	            		           					
	            		           					<c:choose>
									 		 <c:when test="${packageDetailsList.durationType==0}">
									 		 Days
									 		 </c:when>
									 <c:otherwise>
									 Months
									  </c:otherwise>
									 </c:choose>
	            		           					</li>  
	            		           				 --%>
	            		           				
	            		           				<li><button class="pay-btn martop15" type="submit" ><span id="payableAmt${packageDetailsList.packageId}">Rs.${packageDetailsList.packageCost}  </span>  Pay</button></li>
	            		           				</ul>
											</div>
	            		           			</div>
	            		           		
	            		           		</div>
	            		           	<!--new plan design -->
	            		           	
	            		           <%-- 	
	            		           	<div class="col-md-4 col-sm-4">
									 <div class="plan-selct">
									  <div class="mange-img">
									 <img src="${pageContext.request.contextPath}/resources/images/basic.jpg" class="img-responsive" alt="free trial"> 
									 	<h4>Advanced</h4>
									 	<div class="light-grey-bg "><input class="permonth" type="text" readonly value="${packageDetailsList.packageName}" ></div>
									 	</div>
									 	<ul>
									 		<li><input type="hidden" value="${packageDetailsList.packageId}" id="packageId"  name="packageId"></li>
									 		<li><input type="text" readonly value="${packageDetailsList.packageName}" id="packageId"  name="packageId"></li>
									 		<li><p><span>Rs.<input type="text" readonly value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" ></span> <input type="text" readonly value="${packageDetailsList.packageDuration}" id="duration" name="duration">
									 	
									 			<c:choose>
									 		 <c:when test="${packageDetailsList.durationType==0}">
									 		 Days
									 		 </c:when>
									 <c:otherwise>
									 Months
									  </c:otherwise>
									 </c:choose>
								 <input class="month-pack" type="hidden" name="durationType" value="${packageDetailsList.durationType}">
									 		</p></li>
 									 
									 	</ul>
									 	<p></p>
									 	<p></p>
									 	<input type="text" placeholder="Promo code" name="promo_code" id="promo_code">
									 	<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
						<p style="position: absolute; color: black; background-color: #9bf79b; border-radius: 3px;" id="promoMsg${packageDetailsList.packageId}"></p>
									 	
									 	<a href="#" onclick="checkPromoCode(${packageDetailsList.packageId})">Apply Promo Code</a>
									 	<input type="hidden" value="${packageDetailsList.packageCost}" id="payableAmount${packageDetailsList.packageId}" name="amount" readonly>
									 	<button class="btn-fr-all" type="submit" ><span id="payableAmt${packageDetailsList.packageId}">Rs.${packageDetailsList.packageCost}  </span>  Pay</button>
									 </div>
				                    	 
	            		           	</div> --%>
	            		          
	            		           	 
 <%-- <input type="hidden" value="${packageDetailsList.packageId}" id="packageId"  name="packageId">
  <input type="text" readonly value="${packageDetailsList.packageName}" id="packageId"  name="packageId">
  <input type="text" readonly value="${packageDetailsList.packageCost}" id="amount" name="amount">

<input type="submit" value="Submit"> --%>
</form>
 	</c:forEach>
</div>
</div>
</div>

</section>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
function checkPromoCode(packageId) {
	
	var promocode=document.getElementById("promo_code").value;
	
	 $
		.getJSON(
				'${checkPromoCode}',
				{
					promocode : promocode,
					userType : 2,
					ajax : 'true'
				},
				function(data) {
					  
					 if(data=='' || data==null)
						 {
						 
						 document.getElementById("promoMsg"+packageId).innerHTML ='Invalid Promo code';
						 }
					 else{
						 document.getElementById("promoMsg"+packageId).innerHTML =data.message;
//							$("promoMsg"+packageId).text(data.message);
							/*  */
							 
							var packageAmount=document.getElementById("amount"+packageId).value;
							var payableAmt=packageAmount-(packageAmount/100*data.discountPer);
							document.getElementById("payableAmount"+packageId).value=payableAmt;
							$("#payableAmt"+packageId).html(payableAmt);
							document.getElementById("offerId"+packageId).value=data.offerId;
							
					 }
					
					 
				})
	
}
</script>

<script type="text/javascript">
//new WOW().init();
jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>


</body>
</html>