<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="First Page">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Merchant Check Out Page</title>
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
<jsp:include page="../include/doctorHeader.jsp"/>

<section class="doc_login inssurance_buy">
	<div class="dashboard_nm text-center"><h4>Merchant Check Out Page</h4></div>
	<div class="container-fluid">
<div class="col-lg-10 col-md-10 col-md-offset-1">
<div class="bhoechie-tab-content ">
        	<div class="bs-example checkoutpage" >
	    <c:if test="${show==0}">
	<form method="post" action="${pageContext.request.contextPath}/redirect">

		<table border="1">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>1</td>
					<td><label>ORDER_ID ::<span class="reqd"></span></label></td>
					<td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						name="ORDER_ID" autocomplete="off"
						value="${orderId}">
					</td>
				</tr>
				<tr style="display: none">
					<td>2</td>
					<td><label>CUSTID ::<span class="reqd"></span></label></td>
					<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>
				</tr>
				<tr style="display: none"> 
					<td>3</td>
					<td><label>INDUSTRY_TYPE_ID ::<span class="reqd"></span></label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
				</tr >
				<tr style="display: none">
					<td>4</td>
					<td><label>Channel ::<span class="reqd"></span></label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td><label>txnAmount<span class="reqd"></span></label></td>
					<td><input title="TXN_AMOUNT" tabindex="10" readonly="readonly"
						type="text" name="TXN_AMOUNT"
						value="${amount}">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input class="btn-fr-all" value="CheckOut" type="submit" onclick=""></td>
				</tr>
			</tbody>
		</table>
		* - Mandatory Fields
	</form>
	</c:if>
	</div>
	<c:if test="${show==1}">
		<form method="post" action="${pageContext.request.contextPath}/submitConsultingPaymentByWallet">
	<input title="Wallet Amount" tabindex="10" type="hidden" name="walletId" value="${walletDetails.walletId}">
		<table border="1">
			<tbody>
			<tr>
					<th>S.No</th>
					<th>Wallet Amount</th>
					<th>Renewal Amount</th>
				</tr>
			
	<tr>		
	<td>1</td>
	<!-- <td><label>Wallet Amount<span class="reqd"></span></label></td> -->
	
	<td><input title="Wallet Amount" tabindex="10" type="text" name="walletAmount" value="${walletDetails.walletAmount}" readonly></td>
	<td><input title="Consulting Amount" tabindex="10" type="text" name="consultingAmount" value="${amount}" readonly></td>
	</tr>
		
	</tbody>
	</table>
	<br>
	<input class="btn-fr-all" value="CheckOut" type="submit" >
	</form>
	
	</c:if>
	
	</div>
	</div>
	</div>
	</section>
	<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 

	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
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