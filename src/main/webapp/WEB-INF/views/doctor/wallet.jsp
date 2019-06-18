<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

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

	<c:choose>
<c:when test="${sessionScope.patientDetails.patientId>0}">
<jsp:include page="../include/patientHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.doctorDetails.doctorId>0}">
<jsp:include page="../include/doctorHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.labDetails.labId>0}">
<jsp:include page="../include/labHeader.jsp"/>
</c:when>
<c:when test="${sessionScope.medicalDetails.medicalId>0}">
<jsp:include page="../include/pharmacyHeader.jsp"/>
</c:when>

<c:otherwise>
<jsp:include page="../include/homeHeader.jsp"/> 
</c:otherwise>
</c:choose>


	<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />
		<c:url var="checkBankDetailsOfPatient"
		value="/checkBankDetailsOfPatient" />
		
		<c:url var="checkBankDetailsOfPharmacy"
		value="/checkBankDetailsOfPharmacy" />
		<c:url var="checkBankDetailsOfLab"
		value="/checkBankDetailsOfLab" />
		<c:url var="checkBankDetailsOfDoctor"
		value="/checkBankDetailsOfDoctor" />
		<c:url var="addRequestForMoneyTransfer"
		value="/addRequestForMoneyTransfer" />


	<div class="clearfix"></div>
<section class="doc_login walletdash">
		<div class="dashboard_nm text-center"><h4>Bionische Wallet </h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3">
			
		
					<div class="wallet-blnc">
						<img src="${pageContext.request.contextPath}/resources/images/wallet.png" class="img-responsive" alt="wallet">
						<h4>Your wallet Balance</h4>
					<%-- 	<h3><span>Promo Balance :  Rs.</span> ${userWalletDetails.promoBalance}</h3> --%>
					<%-- 	<h3><span>Wallet Balance : Rs.</span> ${walletDetails.walletAmount}</h3> --%>
						<h3><hr/></h3>
						<h3><span>Total Wallet Balance : Rs.</span> ${walletDetails.walletAmount}</h3>
					</div>
					
					<div class="wallet-sec">
						<input type="hidden" id="userId" placeholder="Enter Amount" value="${walletDetails.userId}">
						<input type="hidden" id="wallId" placeholder="Enter Amount" value="${walletDetails.walletId}" >
						<input type="hidden" id="userType" placeholder="Enter Amount" value="${walletDetails.userType}" >
						<input type="hidden" id="wallAmount" placeholder="Enter Amount" value="${walletDetails.walletAmount}" >
						<input type="text" id="enterAmount" min="0" placeholder="Enter Amount" onkeyup="checkAmountValid()" >
						
						
						<input type="submit" class="btn-fr-all text-center" value="Add money to To Bank" onclick="checkBankDetails()">
					</div>
					 
			</div>	
			<div class="col-sm-9">
			<h4 class="pss-center">Passbook</h4>
				<div class="table-responsive cls_det">				
       	 <table id="myTable">
  <tr>
    <th scope="col">Sr. No</th>
    <th scope="col">User Name</th>
    <th scope="col">Amount</th>
    <th scope="col">Date</th>
    <th scope="col">Comment</th>
  </tr>
 
  <c:forEach items="${getWalletTransactionDetailsList}" var="getWalletTransactionDetailsList" varStatus="count">
 
	
  <tr>
   <td>${count.index+1}</td>
   <c:if test="${getWalletTransactionDetailsList.toUserName!=null}">
   <td>${getWalletTransactionDetailsList.toUserName}</td>
   </c:if>
   <c:if test="${getWalletTransactionDetailsList.toUserName==null}">
   <td>BIONISCHE</td>
   </c:if>
   <c:if test="${getWalletTransactionDetailsList.transactionType==0}">
   <td>+ ${getWalletTransactionDetailsList.amount}</td>
   </c:if>
    <c:if test="${getWalletTransactionDetailsList.transactionType==1}">
   <td>- ${getWalletTransactionDetailsList.amount}</td>
   </c:if>
    <c:if test="${getWalletTransactionDetailsList.transactionType==2}">
   <td>- ${getWalletTransactionDetailsList.amount}</td>
   </c:if>
    <c:if test="${getWalletTransactionDetailsList.transactionType==4}">
   <td>- ${getWalletTransactionDetailsList.amount}</td>
   </c:if>
   

      
   
      <td>
 ${getWalletTransactionDetailsList.lastModifiedDate}
    
      </td>

	 
 
   <c:if test="${getWalletTransactionDetailsList.transactionType==0}">
   <td>Referal Amount</td>
   </c:if>
    <c:if test="${getWalletTransactionDetailsList.transactionType==1}">
   <td>Consulting</td>
   </c:if>
   <c:if test="${getWalletTransactionDetailsList.transactionType==2}">
   <td>Order Medicine</td>
   </c:if>
   <c:if test="${getWalletTransactionDetailsList.transactionType==4}">
   <td>Transfer To Bank</td>
   </c:if>
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
	   <div class="clearfix"></div>
	   <hr>
<a class="btn-fr-all text-center" href="${pageContext.request.contextPath}/showAllWalletDetails">Show All</a>
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

function checkAmountValid(){
	
	
	var amount=document.getElementById("enterAmount").value;
	
	
	var wallAmount=document.getElementById("wallAmount").value;
	
	if(parseFloat(amount)>parseFloat(wallAmount)){
		document.getElementById("enterAmount").value="";
		alert("Enter Valid Amount");
	}
	
}

function checkBankDetails(){
	var userId=document.getElementById("userId").value;
	var wallId=document.getElementById("wallId").value;
	var amount=document.getElementById("enterAmount").value;
	var userType=document.getElementById("userType").value;
	
	
	if(amount!=0){
	if(userType==1){
	 $.getJSON('${checkBankDetailsOfPatient}',

				{
					

					ajax : 'true',

				}, function(data) {
					
					if(data==null){
						
						alert("Please add bank details");
						
					}else{
						
						 $.getJSON('${addRequestForMoneyTransfer}',

									{
							 
							 			userId : userId,			
							 
										 wallId : wallId,
										 
										 amount : amount,
										 
										 userType :userType, 
										
										ajax : 'true',

									}, function(data) {
										
										
										if(data!=null){
											
											alert("Your Request Successfully Uploaded. We are working on your request it will take 24-48 hours.");
											location.reload();
											
										}
										
									});
					}
					
					
				});
	
	}else if(userType==0){
		
		//Doctor
		$.getJSON('${checkBankDetailsOfDoctor}',

				{
					

					ajax : 'true',

				}, function(data) {
					
					if(data==null){
						
						alert("Please add bank details");
						
					}else{
						
						 $.getJSON('${addRequestForMoneyTransfer}',

									{
							 
							 			userId : userId,			
							 
										 wallId : wallId,
										 
										 amount : amount,
										 
										 userType :userType, 
										
										ajax : 'true',

									}, function(data) {
										
										if(data!=null){
											
											alert("Your Request Successfully Uploaded. We are working on your request it will take 24-48 hours.");
											location.reload();
											
										}
										
										
									});
					}
					
					
				});
		
		
		
		
	}else if(userType==2){
		
		//LAB
		
		$.getJSON('${checkBankDetailsOfLab}',

				{
					

					ajax : 'true',

				}, function(data) {
					
					if(data==null){
						
						alert("Please add bank details");
						
					}else{
						
						 $.getJSON('${addRequestForMoneyTransfer}',

									{
							 
							 			userId : userId,			
							 
										 wallId : wallId,
										 
										 amount : amount,
										 
										 userType :userType, 
										
										ajax : 'true',

									}, function(data) {
										
										if(data!=null){
											
											alert("Your Request Successfully Uploaded. We are working on your request it will take 24-48 hours.");
											location.reload();
											
										}
										
									});
					}
					
					
				});
		
		
	}else if(userType=3){
		
		//Pharmacy
		
		$.getJSON('${checkBankDetailsOfPharmacy}',

				{
					

					ajax : 'true',

				}, function(data) {
					
					if(data==null){
						
						alert("Please add bank details");
						
					}else{
						
						 $.getJSON('${addRequestForMoneyTransfer}',

									{
							 
							 			userId : userId,			
							 
										 wallId : wallId,
										 
										 amount : amount,
										 
										 userType :userType, 
										
										ajax : 'true',

									}, function(data) {
										
										
										if(data!=null){
											
											alert("Your Request Successfully Uploaded. We are working on your request it will take 24-48 hours.");
											location.reload();
											
										}
										
										
									});
					}
					
					
				});
		
		
	}
	
	
	
	
	}else{
		
		alert("Enter Valid Amount");
		
	}
	
	
}

</script>

</body>
</html>