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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="First Page">
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
<jsp:include page="../../include/patientHeader.jsp"/>
	<section class="doc_login ">
	<div class="dashboard_nm text-center"><h4>Merchant Check Out Page</h4></div>
	<!-- <pre>
	</pre> -->
	<div class="container-fluid">
	 <c:url var="submitLabReportPayment" value="/submitLabReportPayment" /> 
<div class="col-lg-10 col-md-10 col-md-offset-1"> 
<div class="bhoechie-tab-content">
 
        	<div class="bs-example checkoutpage">
	<c:if test="${show==0}">
	<form method="post" action="${pageContext.request.contextPath}/labReportPaymentGateway">

		<table border="1">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>1</td>
					<td><label>ORDER_ID::<span class="reqd"></span></label></td>
					<td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20" name="ORDER_ID" autocomplete="off" value="${orderId}" readonly>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td><label>CUSTID ::<span class="reqd"></span></label></td>
					<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001" readonly></td>
				</tr>
				<tr>
					<td>3</td>
					<td><label>INDUSTRY_TYPE_ID ::<span class="reqd"></span></label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail" readonly></td>
				</tr>
				<tr>
					<td>4</td>
					<td><label>Channel ::<span class="reqd"></span></label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB" readonly>
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td><label>txnAmount<span class="reqd"></span></label></td>
					<td><input title="TXN_AMOUNT" tabindex="10" type="text" name="TXN_AMOUNT" value="${amount}" readonly>
					</td>
				</tr>
				<tr>
					<td colspan="3"><input class="btn-fr-all" value="CheckOut" type="submit" onclick=""></td>
				</tr>
			</tbody>
		</table>
		<p class="text-left">* - Mandatory Fields</p>
	</form>
	</c:if>
	</div>
	
	
	<c:if test="${show==1}">
	
		<input type="hidden" id="txnStatus" value="1" readonly>
		<input type="hidden" id="txnId" value="0" readonly>
		<input type="hidden" id="orderId" value="0" readonly>
		<input type="hidden" id="txnAmt" value="0" readonly>
	<input title="Wallet Amount" tabindex="10" type="hidden" id="walletId" value="${walletDetails.walletId}">
		
	<h3 class="text-uppercase margn0">Pay with Wallet</h3>
		<div class="waltblc">
			<img src="/biocare/resources/images/wallet.png" class="img-responsive" alt="wallet"><strong>Wallet Balance</strong> <input title="Wallet Amount" tabindex="10" type="text" name="" value="${walletDetails.walletAmount}" readonly>
		</div>
		<div class="prescptdiv">
			<div class="row">
				<div class="col-sm-6">
					<strong>Consulting Amount</strong>
				</div>
				<div class="col-sm-6 text-right">
					<input title="Consulting Amount" tabindex="10" type="text" id="prescriptionAmount" name="" value="${amount}" readonly>
				</div>
			</div>
		</div>
		<p class="text-center paybtn"><input class="btn-fr-all" value="Pay" type="button" onclick="paidByWallet()" ></p>
	
	</c:if>
	</div>
	</div>
	</div>
</section>
<div class="clearfix"></div>
	<jsp:include page="../../include/footer.jsp" />
	
	<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>	

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 

<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>

<script type="text/javascript">
//new WOW().init();
jQuery('ul.nav li.dropdown').hover(function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideDown(500);
}, function() {
jQuery(this).find('.dropdown-menu').stop(true, true).delay(200).slideUp(500);
});


function paidByWallet(){
	
	$.getJSON(
			'${submitLabReportPayment}',
			{
				txnStatus: 1,
				txnId : 0,
				orderId : 0,
				txnAmt : 0,
				ajax : 'true'
			},
			function(data) {
				
				alert("sc");	
				if(data!=null){
					window.open("${pageContext.request.contextPath}/showPatientPaymentHistory","_self");
				}
	
			});
	
}
</script>
</body>
</html>