<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
</head>
<body>
<jsp:include page="../include/doctorHeader.jsp"/>

<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Doctor Consulting Bill History</h4></div>
<c:url var="getDoctorConsultingReceiptHistory" value="/getDoctorConsultingReceiptHistory" />
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
 <jsp:include page="../include/leftmenu.jsp"/>
 <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
                
                <div class="filter_div doc_fil">
                <h3>Doctor Consulting Bill History</h3>
						
						<div class="row">
							 <div class="col-md-4 col-sm-4"><input type="text" id="fromDate" class="datepicker myInput" placeholder="From Date"  name="fromDate" value="2018-11-30"></div>
							 <div class="col-md-4 col-sm-4"><input type="text" id="toDate" class="datepicker myInput" placeholder="To Date" name="toDate" value="2019-01-30"></div>
							 <div class="col-md-4 col-sm-4"> <input type="button" class="btn-fr-all" onclick="getConsultReceiptHistory()" Value="Search"/> </div>
						</div>
				</div>
				<div class="clearfix"></div>
					<hr>
                
<!-- <input type="text" id="fromDate" name="fromDate" value="2018-11-30">
  <input type="text" id="toDate" name="toDate" value="2019-01-30">
 <input type="button" onclick="getConsultReceiptHistory()" Value="Search"/>  -->
<table style="width:100%" id="consultingReceiptHistory">
<thead>
  <tr>
   <th>#</th>
    <th>Receipt No</th>
    <th>Date</th> 
    <th>Txn Id</th>
    <th>Amount</th>
    <th>View Receipt</th>
   
  </tr>
  </thead>
  <tbody>
   
 </tbody>
</table>
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

<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%> 

<script type="text/javascript">
function getConsultReceiptHistory()
{
	
	
	var fromDate=document.getElementById("fromDate").value;
	var toDate=document.getElementById("toDate").value;
	 
	  $('#consultingReceiptHistory td').remove();
					$.getJSON('${getDoctorConsultingReceiptHistory}', {
						 
						toDate : toDate,
						fromDate : fromDate,
						ajax : 'true'
					}, function(data) {
						
						
				 var totalAmt=0;
				 
						  $.each(
								  data,
									function(key, list) {

						var tr = $('<tr></tr>');
						

						tr.append($('<td></td>').html(key+1));
						tr.append($('<td></td>').html(list.receiptNo));
						tr.append($('<td></td>').html(list.createdDate));
						
						tr.append($('<td></td>').html(list.txnId));
						tr.append($('<td></td>').html(list.paidAmt));
						tr.append($('<td></td>').html('<a href="${pageContext.request.contextPath}/pdfViewConsultinfReceipt/'+list.receiptNo+'">View Receipt</a>'));
						 $('#consultingReceiptHistory').append(tr);
								})
								
								 
					});
					
	}


</script>

</body>
</html>