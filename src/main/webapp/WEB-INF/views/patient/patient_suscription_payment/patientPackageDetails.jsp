<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care</title>
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
<%-- <jsp:include page="../../include/patientHeader.jsp"/> --%>


<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center"><h4>Our Packages</h4></div>
	
<div class="container-fluid">
<div class="col-lg-10 col-md-10 col-md-offset-1">
        	<div class="bs-example renewAcc">
        	
<c:url var="checkPromoCode"
		value="/checkPromoCode" />
		
<c:forEach items="${packageDetailsList}" var="packageDetailsList">
	
<form action="${pageContext.request.contextPath}/patientSuscriptionPaymentCheckout" method="post">

<input type="hidden" value="${backUrl}" name="backUrl">
<input type="hidden" value="${patientContact}" name="contactNo">
<input type="hidden" value="${patientEmail}" name="email">


	<div class="col-lg-4 col-md-6 col-sm-6">
	   <div class="plan-blk">
	   <div class="plan-head-blk">
	    <%-- <img src="${pageContext.request.contextPath}/resources/images/basic.jpg" class="img-responsive" alt="free trial">  --%>
	        <h3>ADVANCED</h3>
	        	            		           					
	     </div>
	   <div class="plan-details pad40">
	   		<ul>
	   			<li>
	   				<div class="row">
	            		<div class="col-md-7 col-sm-7">
	            			<input class="input-promo" type="text" placeholder="Enter Promo code" name="promo_code" id="promo_code${packageDetailsList.packageId}">
									 	<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
						<p id="promoMsg${packageDetailsList.packageId}">
	            		</div>
	            		
	            		<div class="col-md-5 col-sm-5">
	            		<a class="promo-btn" href="#" onclick="checkPromoCode(${packageDetailsList.packageId})">Apply <!-- Promo Code --></a>
									 	<input type="hidden" value="${packageDetailsList.packageCost}" id="payableAmount${packageDetailsList.packageId}" name="amount" readonly>
	            		</div>
	            	</div>
	   			</li>
	   			<li>
	   			<input type="hidden"  value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" >
	   			<p><span>Rs.${packageDetailsList.packageCost}</span> 
	            		           				</p></li>
	        <li>
	        	<input type="hidden" value="${packageDetailsList.packageId}" name="packageId">
  <button class="pay-btn martop15" type="submit" ><span id="payableAmt${packageDetailsList.packageId}">Rs.${packageDetailsList.packageCost}  </span>  Pay</button>
	        </li>
	   		</ul>
	   </div>
<%-- <p><span>Rs.<input type="text" readonly value="${packageDetailsList.packageCost}" id="amount${packageDetailsList.packageId}" name="packageAmt" ></span>  --%>
									 	</p>
<%-- 									 		
<input class="input-promo" type="text" placeholder="Promo code" name="promo_code" id="promo_code${packageDetailsList.packageId}">
									 	<input type="hidden"  name="offerId" id="offerId${packageDetailsList.packageId}" value="0">
						<p id="promoMsg${packageDetailsList.packageId}"></p>
									 	
									 	<a class="promo-btn" href="#" onclick="checkPromoCode(${packageDetailsList.packageId})">Apply <!-- Promo Code --></a>
									 	<input type="hidden" value="${packageDetailsList.packageCost}" id="payableAmount${packageDetailsList.packageId}" name="amount" readonly> --%>
									 	
									

<%-- <input type="hidden" value="1" name="packageId">
  <button class="pay-btn martop15" type="submit" ><span id="payableAmt${packageDetailsList.packageId}">Rs.${packageDetailsList.packageCost}  </span>  Pay</button> --%>
 <%-- <div class="idz-pricing-bg-icon"><img src="${pageContext.request.contextPath}/resources/images/patient-plan-bg.png" alt="health care"></div>  --%>
	</div>
	</div>
</form>
</c:forEach>
</div>
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
	alert(promocode);
	 $
		.getJSON(
				'${checkPromoCode}',
				{
					promocode : promocode,
					userType : 1,
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