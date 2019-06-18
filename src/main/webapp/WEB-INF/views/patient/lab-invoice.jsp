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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/radiology.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>

<script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
            //document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
       
</script>
</head>

<body>
 
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login" id="medicine">
<div class="dashboard_nm text-center"><h4>Payment Request  </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active card">
                <div class="row">
	                	<div class="col-md-12 col-sm-12">
	                	
	                		<div class="table-responsive">
	                		<table width="100%" border="0">	
									<thead>
									<tr>
										<th>Sr</th>
										<th>Date</th>
										<th>Lab Name</th>
										<th>Report</th>
										<th>Status</th>
									</tr>
									<c:forEach items="${pateintReportPaymentDetailsList}" var="pateintReportPaymentDetailsList" varStatus="count">
									<tr>
								
										<td>${count.index+1}</td>
										<td>${pateintReportPaymentDetailsList.reportDate}</td>
										<td>${pateintReportPaymentDetailsList.labName}</td>
										<td><a href="#myModal" data-toggle="modal" onclick="paymentReport(${pateintReportPaymentDetailsList.reportId},${pateintReportPaymentDetailsList.txnTableId},'${pateintReportPaymentDetailsList.labName}','${pateintReportPaymentDetailsList.labTestName}','${pateintReportPaymentDetailsList.createdDate}', ${pateintReportPaymentDetailsList.totalAmount})">${pateintReportPaymentDetailsList.reportFileName}</a></td>
										<td>Unpaid</td>
									
									</tr>
								</c:forEach>	
									</thead>
							</table>
	                		</div>
	                	 	
	             
	                	</div>
	                </div>
                
 				</div>
 </div>
 </div>
 </div>
 </div>
 </section>

<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Lab Payment</h4>
       
      </div>
      <form action="${pageContext.request.contextPath}/labReportPaymentCheckout" method="post">
      <div class="modal-body text-center pay-lab-modal">
	           <h4>you have received request regarding lab payment</h4>
	          
	           <p id="labName"> </p>
	           <p id="testName"></p>
	           <p id="date"> </p>
	           <h3 id="totalAmount"></h3>
	           
	           <input type="hidden" id="txnTableId" name="txnTableId">
	            <input type="hidden" id="reportId" name="reportId">
	              <input type="hidden" id="amount" name="amount">
	            

      </div>
      <div class="modal-footer">
                    <input type="submit" value="Pay" class="btn-fr-all">
                    <!-- <input type="button" value="Decline" class="btn-fr-all"> -->
                </div>
                </form>
      </div>
    </div>
    </div>
 
 
 
  <jsp:include page="../include/footer.jsp"/> 
  
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script>
function paymentReport(reportId,txnTableId,labName,testName,date,totalAmount){
	document.getElementById("reportId").value=reportId;
	document.getElementById("txnTableId").value=txnTableId;
	document.getElementById("amount").value=totalAmount;
	
	 
	
	document.getElementById("labName").innerHTML="<strong>Lab Name :</strong>"+labName;
	document.getElementById("testName").innerHTML="<strong>Test Name :</strong>"+testName;
	document.getElementById("date").innerHTML="<strong>Date :</strong>"+date;
	document.getElementById("totalAmount").innerHTML="<strong>Amount :</strong> <span>"+totalAmount+" </span>";
}
</script>
</body>
</html>