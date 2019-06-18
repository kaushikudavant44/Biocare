<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome To Health Care</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
</head>
<body>

<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center"><h4>Our Packages</h4></div>
	
<div class="container-fluid">
<div class="col-lg-10 col-md-10 col-md-offset-1">
        	<div class="bs-example renewAcc">

<form action="${pageContext.request.contextPath}/pharmacySuscriptionPaymentCheckout" method="post">

 
<!-- <input type="text" value="1" name="amount">
<input type="hidden" value="1" name="durationType">
<input type="hidden" value="1" name="duration">
<input type="hidden" value="1" name="packageId">
<input type="submit" value="Proceed"> -->

</form>



<c:forEach items="${packageDetailsList}" var="packageDetailsList">	
	            		           	<form action="${pageContext.request.contextPath}/pharmacySuscriptionPaymentCheckout" method="post">
	            		           	<div class="col-lg-4 col-md-6 col-sm-6">
	            		           	<input type="hidden" value="${packageDetailsList.packageId}" id="packageId"  name="packageId">
	            		           	 <input class="month-pack" type="hidden" name="durationType" value="${packageDetailsList.durationType}">
	            		           	<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
									 <div class="plan-blk">
									  <div class="plan-head-blk">
									
									 	<h3>Advanced</h3>
									 	<div class="plan-duration"><input class="permonth" type="text" readonly value="${packageDetailsList.packageName}" ></div>
									 	</div>
									 	<div class="plan-details">
									 	<ul>
									 	<li>
									 		<div class="row">
									 			<div class="col-md-7 col-sm-7">
									 			<div class="form-group">
									 			<input type="text" class="input-promo"  placeholder="Enter Promo Code" name="promo_code" id="promo_code${packageDetailsList.packageId}">
									 			<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
									 			<p id="promoMsg${packageDetailsList.packageId}"></p>
									 			</div>
									 			</div>
									 			<div class="col-md-5 col-sm-5">
									 			<a href="#" class="promo-btn" onclick="checkPromoCode(${packageDetailsList.packageId})">Apply</a>
									 			<input type="hidden" value="${packageDetailsList.packageCost}" id="payableAmount${packageDetailsList.packageId}" name="amount" readonly>
									 			</div>
									 		</div>
									 	
									 	</li>
									 	<li>
									 	<input type="hidden" value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" >
									 	<input type="hidden" value="${packageDetailsList.packageDuration}" id="duration" name="duration">
									 		<p><span>${packageDetailsList.packageCost} / ${packageDetailsList.packageDuration}</span>
									 		<c:choose>
									 		 <c:when test="${packageDetailsList.durationType==0}">
									 		 Days
									 		 </c:when>
									 <c:otherwise>
									 Months
									  </c:otherwise>
									 </c:choose>
									 		</p>
									 	</li>
									 	<li><button class="pay-btn martop15" type="submit" ><span id="payableAmt${packageDetailsList.packageId}">Rs.${packageDetailsList.packageCost}  </span>  Pay</button></li>
									 	</ul>
									 		<%-- <li><input type="hidden" value="${packageDetailsList.packageId}" id="packageId"  name="packageId"></li> --%>
									 		<%-- <li><input type="text" readonly value="${packageDetailsList.packageName}" id="packageId"  name="packageId"></li> --%>
									 		<%-- <li><p><span>Rs.<input type="text" readonly value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" ></span> <input type="text" readonly value="${packageDetailsList.packageDuration}" id="duration" name="duration">
									 	
									 			<c:choose>
									 		 <c:when test="${packageDetailsList.durationType==0}">
									 		 Days
									 		 </c:when>
									 <c:otherwise>
									 Months
									  </c:otherwise>
									 </c:choose>
								 <input class="month-pack" type="hidden" name="durationType" value="${packageDetailsList.durationType}">
									 		</p></li> --%>
 									 
									 	<!-- </ul> -->
									 		</div>
									 	<!-- <p></p>
									 	<p></p> -->
									 	<%-- <input type="text" placeholder="Promo code" name="promo_code" id="promo_code${packageDetailsList.packageId}">
									 	<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
						<p style="position: absolute; color: black; background-color: #9bf79b; border-radius: 3px;" id="promoMsg${packageDetailsList.packageId}"></p> --%>
									 	
									 	<%-- <a href="#" onclick="checkPromoCode(${packageDetailsList.packageId})">Apply Promo Code</a>
									 	<input type="hidden" value="${packageDetailsList.packageCost}" id="payableAmount${packageDetailsList.packageId}" name="amount" readonly> --%>
									 	<%-- <button class="btn-fr-all" type="submit" ><span id="payableAmt${packageDetailsList.packageId}">Rs.${packageDetailsList.packageCost}  </span>  Pay</button> --%>
									 </div>
				                    	 
	            		           	</div>
	            		           	</form>
	            		           	</c:forEach>
	            		           	
	            		           	
	            		           	</div>
</div>

</section>
<%-- <jsp:include page="../../include/footer.jsp"/>  --%>
<script type="text/javascript">
//new WOW().init();
jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});

</script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
function checkPromoCode(packageId) {
	
	var promocode=document.getElementById("promo_code"+packageId).value;
	
	 $
		.getJSON(
				'${checkPromoCode}',
				{
					promocode : promocode,
					userType : 4,
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

</body>
</html>