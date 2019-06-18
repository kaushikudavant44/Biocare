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
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="../include/patientHeader.jsp" />


	<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />


	<div class="clearfix"></div>
<section class="doc_login walletdash">
	<div class="dashboard_nm text-center"><h4><span>B</span>ionische <span>W</span>allet </h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3">
					<div class="wallet-blnc">
						<img src="${pageContext.request.contextPath}/resources/images/wallet.png" class="img-responsive" alt="wallet">
						<h4>Your wallet Balance</h4>
						<h3><span>Promo Balance :  Rs.</span> ${userWalletDetails.promoBalance}</h3>
						<h3><span>Wallet Balance : Rs.</span> ${userWalletDetails.balance}</h3>
						<h3><hr/></h3>
						<h3><span>Total Wallet Balance : Rs.</span> ${totalBalance}</h3>
					</div>
					<div class="wallet-sec">
						<input type="text" placeholder="Enter refferal code">
						
						<input type="submit" class="btn-fr-all text-center" value="Add money to wallet">
					</div>
			</div>	
			<div class="col-sm-9">
			<h4 class="pss-center">Passbook</h4>
				<div class="table-responsive cls_det">				
       	 <table id="myTable">
  <tr>
    <th scope="col">Merchant Name</th>
    <th scope="col">Withdrawal</th>
    <th scope="col">Deposit</th>
    <th scope="col">Status</th>
    <th scope="col">Comment</th>
  </tr>
  	 <c:forEach items="${getWalletTransactionDetailsList}" var = "getWalletTransactionDetails">
  
  <tr>
    <td>
     <c:choose>
   <c:when test="${getWalletTransactionDetails.txnType==2}">
    <h4>Paid for Order</h4>
      <p><strong>To :</strong> <span> ${getWalletTransactionDetails.fromToName}</span></p>
    </c:when>
     <c:when test="${getWalletTransactionDetails.txnType==1}">
     <h4>Added to Wallet</h4>
     <p><strong>From :</strong> <span> ${getWalletTransactionDetails.fromToName}</span></p>
      
    </c:when>
    </c:choose>
    
   
    	
    	<p><strong>Transaction ID :</strong> <span>${getWalletTransactionDetails.transactionId}</span></p>
    	<p><strong>Date & Time :</strong> <span>${getWalletTransactionDetails.dateTime}</span></p>
    </td> 
    <c:choose>
    <c:when test="${getWalletTransactionDetails.txnType==2}">
     <td>${getWalletTransactionDetails.amount}</td>
      <td>-</td>
    </c:when>
     <c:when test="${getWalletTransactionDetails.txnType==1}">
      <td>-</td>
     <td>${getWalletTransactionDetails.amount}</td>
    </c:when>
    </c:choose>
   
    <c:choose>
    <c:when test="${getWalletTransactionDetails.status==1}">
     <td>Success</td>
    </c:when>
    <c:otherwise>
         <td>Failed</td>
    </c:otherwise>
    </c:choose>
    
   
    <td>${getWalletTransactionDetails.comment}</td>
  </tr>
  </c:forEach>
  <!-- <tr>
    <td><h4>Cashback Received</h4>
    	<p><strong>For Databack Order :</strong> <span> #UsdsEqfdBORwJhUpiVri</span></p>
    	<p><strong>Transaction ID :</strong> <span>19716429676</span></p>
    	<p><strong>Date & Time :</strong> <span>2018-07-17  00:20:03 PM</span></p>
    </td> 
    <td>Rs. 300</td>
    <td>-</td>
    <td>Success</td>
    <td>-</td>
  </tr>
 <tr>
    <td><h4>Cashback Received</h4>
    	<p><strong>For Databack Order :</strong> <span> #UsdsEqfdBORwJhUpiVri</span></p>
    	<p><strong>Transaction ID :</strong> <span>19716429676</span></p>
    	<p><strong>Date & Time :</strong> <span>2018-07-17  00:20:03 PM</span></p>
    </td> 
    <td>Rs. 300</td>
    <td>-</td>
    <td>Success</td>
    <td>-</td>
  </tr>
  <tr>
    <td><h4>Cashback Received</h4>
    	<p><strong>For Databack Order :</strong> <span> #UsdsEqfdBORwJhUpiVri</span></p>
    	<p><strong>Transaction ID :</strong> <span>19716429676</span></p>
    	<p><strong>Date & Time :</strong> <span>2018-07-17  00:20:03 PM</span></p>
    </td> 
    <td>Rs. 300</td>
    <td>-</td>
    <td>Success</td>
    <td>-</td>
  </tr> -->
</table>


	   </div>
			</div>	
		</div>
			</div>
</section>
<a class="profWallet" href="${pageContext.request.contextPath}/showAllWalletDetails">Show All</a>

	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
	<script>
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

 function getPrescriptionDetails(meetId) { 
	 
	 $('#prescTable'+meetId+' td').remove();
	 
	 $.getJSON('${getPrescriptionByMeetingId}',

				{
		 meetId : meetId,

					ajax : 'true',

				}, function(data) {
					
					
					
					$
					.each(
							data,
							function(key, prescriptionList) {

								var tr = $('<tr></tr>');
								
								tr.append($('<td></td>').html(key+1));
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.medicineQuantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
								
								$('#prescTable'+meetId+' tbody').append(tr);
							})
				});
}
</script>
	<script>

/* $(document).ready(function(){
    $( ".time1" ).hover(function() {
           $('.bs-example-modal-lg').modal({
        show: true
    });
  });  
}); */
$(document).ready(function() {
    $(".appoint_tm > li").click(function(){
      /* $(".appoint_tm > li.highlighted").removeClass("highlighted"); */
      $(this).addClass("highlighted");
      $(".highlighted").addClass('disabled');
    });
});


</script>

	<script type="text/javascript">
jQuery(document).ready(function() {
    var owl = jQuery('.owl-carousel');
    owl.owlCarousel({
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 1000,
      autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
  
$('.datepicker').datepicker({ format: "dd-mm-yyyy",  autoclose: true})
$('#popoverOption').popover({ trigger: "hover" });

$(document).ready(function() {    
    $("#medicine_nm").val("xyz nlkjhj"); 
    $("#qnty").val("5"); 
    $("#instruction").val("before food");
    $("#timing").val("night");
});

</script>

</body>
</html>