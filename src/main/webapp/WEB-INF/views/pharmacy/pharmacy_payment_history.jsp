<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
</head>
<body>

<jsp:include page="../include/pharmacyHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login inssurance_buy">
<div class="dashboard_nm text-center"><h4>Pharmacy Payment History</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/pharmacyLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">

	 <c:url var="getPharmacyPaymentDetailsByMedicalId"
		value="/getPharmacyPaymentDetailsByMedicalId" />
			 <c:url var="getPharmacySubscriptionPaymentDetailsByMedicalId"
		value="/getPharmacySubscriptionPaymentDetailsByMedicalId" />

			<div class="bs-example appontlist">
    <ul class="nav nav-tabs newappon">
					<li class="active"><a data-toggle="tab" href="#sectionA"><p>Plan Subscription Payment</p></a></li>
					<li><a data-toggle="tab" href="#sectionB"><p>Pharmacy Report Payment </p></a></li>
					
			</ul>
			
			<div class="tab-content">
				<div id="sectionA" class="tab-pane fade in active">
				
    					<div class="filter_div doc_fil">
    						<div class="col-md-12 col-sm-12">
							<h3>Plan subscription payment</h3>
							<div class="row">
							<div class="col-md-4 col-sm-4">
								<input type="text" id="subscribeFromDate" name="subscribeFromDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="From Date" title="Type in a name">
							</div>
							<div class="col-md-4 col-sm-4">
							<input type="text" id="subscribeToDate" name="subscribeToDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="To Date" title="Type in a name">
							</div>
							<div class="col-md-4 col-sm-4">
							<p class="text-center"><a href="#" class="sub_anch"><input class="btn-fr-all" type="button" value="Search" onclick="getPharmacySubscription()"></a></p>
							</div>
							</div>
							</div>
    					</div>
    					<div class="clearfix"></div>
    					<hr>
    					<div class="row">
					 <div class="col-md-12 col-sm-12">
					 	<div class="table-responsive">
                                          <table width="100" border="1" id="myTable23">
                                              <tr>
                                                <th scope="col">Sr.no</th>
          										<th scope="col">Txn Date</th>
          										<th scope="col">Txn Id</th>
          										<th scope="col">Order Id</th>
          											<th scope="col">Amount</th>
          												<th scope="col">Payment Status</th>
                                              </tr>
                                         <tbody>
                                         
                                         
                                         </tbody>
                                    </table>
										 </div>
					 </div>
					 </div>
    		
				</div>
				<div id="sectionB" class="tab-pane fade">
					
    			<div class="filter_div doc_fil">
    						<div class="col-md-12 col-sm-12">
							<h3> Pharmacy Report Payment</h3>
					
					<div class="row">
							<div class="col-md-4 col-sm-4">
							<input type="text" id="medicalPayFormDate" name="medicalPayFormDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="From Date" title="Type in a name">
							</div>
							<div class="col-md-4 col-sm-4">
							<input 	type="text" id="medicalPayToDate" name="medicalPayToDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="To Date" title="Type in a name">
							</div>
							<div class="col-md-4 col-sm-4">
							<p class="text-center"> <a href="#" class="sub_anch"><input class="btn-fr-all" type="button" value="Search" onclick="getPharmacyPaymentDetails()"></a>	</p>
							</div>
				</div>
				</div>
				</div>	
				<div class="clearfix"></div>
				<hr>
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="table-responsive">
							<table width="100" border="1" id="myTable24">
								<tr>
									<th scope="col">Sr.no</th>
									<th scope="col">Txn Date</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Txn Id</th>
									<th scope="col">Order Id</th>
									<th scope="col">Amount</th>
									<th scope="col">Payment Status</th>
								</tr>
								<tbody>


								</tbody>
							</table>
						</div>
					</div>
				</div>		
    		
				</div>
			</div>
			</div>


	<!-- <div class="modal-body">
	Plan subscription payment
                           
 
                             <input type="text" id="subscribeFromDate" name="subscribeFromDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="from date" title="Type in a name">
                                   <input type="text" id="subscribeToDate" name="subscribeToDate" class="datepicker myInput" onkeyup="myFunction()" placeholder="to date" title="Type in a name">
                                   <p class="text-center"><a href="#" class="sub_anch"><input type="button" value="Search" onclick="getPharmacySubscription()"></a></p> <hr>	
                                  
                                   	<ul>
                                            <li>Medicine Name :<span>xdffdg</span></li>
                                            <li>Quantity :<span>10</span></li>
                                            <li>Instructions :<span>keep in cool storage</span></li>
                                            <li>Timings: <span>9:00PM</span></li>
                           				 </ul>
                                  
                                  		 <div class="table-responsive">
                                          <table width="100" border="1" id="myTable23">
                                              <tr>
                                                <th scope="col">Sr.no</th>
          										<th scope="col">Txn Date</th>
          										<th scope="col">Txn Id</th>
          										<th scope="col">Order Id</th>
          											<th scope="col">Amount</th>
          												<th scope="col">Payment Status</th>
                                              </tr>
                                         <tbody>
                                         
                                         
                                         </tbody>
                                    </table>
										 </div>
                                         
                                         </div>
									 <hr> -->
									 
                                  <!-- <div class="modal-body">
                                  Pharmacy Report Payment
						<input type="text" id="medicalPayFormDate" name="medicalPayFormDate"
							class="datepicker myInput" onkeyup="myFunction()"
							placeholder="from date" title="Type in a name"> <input
							type="text" id="medicalPayToDate" name="medicalPayToDate"
							class="datepicker myInput" onkeyup="myFunction()"
							placeholder="to date" title="Type in a name">
						<p class="text-center">
							<a href="#" class="sub_anch"><input type="button"
								value="Search"
								onclick="getPharmacyPaymentDetails()"></a>
						</p>
						<hr>
						<ul>
                                            <li>Medicine Name :<span>xdffdg</span></li>
                                            <li>Quantity :<span>10</span></li>
                                            <li>Instructions :<span>keep in cool storage</span></li>
                                            <li>Timings: <span>9:00PM</span></li>
                           				 </ul>

						<div class="table-responsive">
							<table width="100" border="1" id="myTable24">
								<tr>
									<th scope="col">Sr.no</th>
									<th scope="col">Txn Date</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Txn Id</th>
									<th scope="col">Order Id</th>
									<th scope="col">Amount</th>
									<th scope="col">Payment Status</th>
								</tr>
								<tbody>


								</tbody>
							</table>
						</div>



					</div> -->

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 

		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<script type="text/javascript">
function showLoader()
{
	var fromDate=document.getElementById("fromDate").value;
	var toDate=document.getElementById("toDate").value;
	var patientId=document.getElementById("patientId").value;
	var x = new Date(fromDate);
	var y = new Date(toDate);
	
	}

</script>
<script type="text/javascript">

	              /* $(".datepicker").datepicker({
	            	  dateFormat: "yy-mm-dd",
	            	  minDate: 0,
	            	  autoclose: true
	            	}); */
	            	$(".datepicker").datepicker({
		            	 format: "dd-mm-yyyy",
		            	  autoclose: true
		            	});

	          
</script>

	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>
	<script type="text/javascript">


	function getPharmacyPaymentDetails()
	{
		

		var fromDate=document.getElementById("medicalPayFormDate").value;
		var toDate=document.getElementById("medicalPayToDate").value;
		  $('#myTable24 td').remove();
						$.getJSON('${getPharmacyPaymentDetailsByMedicalId}', {
							 
							toDate : toDate,
							fromDate : fromDate,
							ajax : 'true'
						}, function(data) {
							
							
							
						//	alert(data);
							
							  $.each(
									  data,
										function(key, list) {

							var tr = $('<tr></tr>');
							

							tr.append($('<td></td>').html(key+1));
							
							tr.append($('<td></td>').html(list.paymentDate));
							tr.append($('<td></td>').html(list.patientName));
							tr.append($('<td></td>').html(list.txnId));
							tr.append($('<td></td>').html(list.orderId));
							 
							  tr.append($('<td></td>').html(list.totalAmt));
							if(list.paymentStatus==1)
							tr.append($('<td></td>').html('Success'));
							else if(list.paymentStatus==6)
								tr.append($('<td></td>').html('Pending'));
							else
							tr.append($('<td></td>').html('Failed'));
						  
							 
							
							
							 
							
						 	 $('#myTable24').append(tr);
									})

							
						});
						
						
		}



	function getPharmacySubscription()
	{
		
		
		var fromDate=document.getElementById("subscribeFromDate").value;
		var toDate=document.getElementById("subscribeToDate").value;
		  $('#myTable23 td').remove();
						$.getJSON('${getPharmacySubscriptionPaymentDetailsByMedicalId}', {
							 
							toDate : toDate,
							fromDate : fromDate,
							ajax : 'true'
						}, function(data) {
							
							
							
						//	alert(data);
							
							  $.each(
									  data,
										function(key, list) {

							var tr = $('<tr></tr>');
							

							tr.append($('<td></td>').html(key+1));
							
							tr.append($('<td></td>').html(list.paymentDate));
							tr.append($('<td></td>').html(list.txnId));
							tr.append($('<td></td>').html(list.orderId));
						 
							tr.append($('<td></td>').html(list.amount));
				 
					  if(list.txnStatus==1)
							tr.append($('<td></td>').html('Success'));
							else if(list.txnStatus==6)
								tr.append($('<td></td>').html('Pending'));
							else
							tr.append($('<td></td>').html('Failed'));
						  
							
							
							 
							
						 	 $('#myTable23').append(tr);
									})

							
						});
						
		
		}
		
	

	</script>
</body>
</html>