<%@page import="com.bionische.biocare.common.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<%@ page
	import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
	Enumeration<String> paramNames = request.getParameterNames();
	Map<String, String[]> mapData = request.getParameterMap();
	TreeMap<String, String> parameters = new TreeMap<String, String>();
	String paytmChecksum = "";
	while (paramNames.hasMoreElements()) {
		String paramName = (String) paramNames.nextElement();
		if (paramName.equals("CHECKSUMHASH")) {
			paytmChecksum = mapData.get(paramName)[0];
		} else {
			parameters.put(paramName, mapData.get(paramName)[0]);
		}
	}
	boolean isValideChecksum = false;
	String outputHTML = "";
	String txnId="";
	String txnAmt="";
	int respCode=0;
	String orderId="";
 
	String txnDate="";
 
	String submitFunction="";
 
	try {
		isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper()
				.verifycheckSum(PaytmConstants.MERCHANT_KEY, parameters, paytmChecksum);
		if (isValideChecksum && parameters.containsKey("RESPCODE")) {
			if (parameters.get("RESPCODE").equals("01")) {
				respCode=1;
				txnAmt=parameters.get("TXNAMOUNT");
				txnId=""+parameters.get("TXNID");
				 
				txnDate=parameters.get("TXNDATE");
			 
				orderId=parameters.get("ORDERID");
				submitFunction="submitData('"+parameters.get("TXNID")+"')";
			
				outputHTML = parameters.toString();
 System.out.println(outputHTML);
				
			}
			else if (parameters.get("RESPCODE").equals("06")) {
				outputHTML = parameters.toString();
				respCode=6;
				txnAmt=parameters.get("TXNAMOUNT");
				txnId=parameters.get("TXNID");
				 
				txnDate=parameters.get("TXNDATE");
				 
				orderId=parameters.get("ORDERID");
				submitFunction="submitData('"+parameters.get("TXNID")+"')";
			}
			
			else {
				outputHTML = "<b>Payment Failed.</b>";
				respCode=Integer.parseInt(parameters.get("RESPCODE"));
				txnAmt=parameters.get("TXNAMOUNT");
				txnId=parameters.get("TXNID");
				orderId=parameters.get("ORDERID");
				submitFunction="failed()";
			}
		} else {
			outputHTML = "<b>Checksum mismatched.</b>";
		}
	} catch (Exception e) {
		outputHTML = e.toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body class="login_prt" onload=<%=submitFunction%>>

<c:url var="savePatientDetailsAndPayment"
		value="/savePatientDetailsAndPayment" />
		<c:url var="updatePatientWalletAndTransactions"
		value="/updatePatientWalletAndTransactions" />
		
		<!-- Payment Failed -->
		<div class="fail-blk" id="failedDiv" style="display: none">
	<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>	
		<div class="log_user faild" >
    <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/fail.jpg" class="img-responsive" alt="wait"></div>
    <h3 class="text-center">Failed</h3>
   	<p>Sorry Your Registration Is Failed</p>
   	
   		<br>
   		<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center">
							<a class="proceed_b" href="${pageContext.request.contextPath}/showPatientLoginPage">Exit</a>
						</div>
					</div>
					<%-- <div class="col-xs-6 col-sm-6 col-md-6 pad-0">
						<div class="receipt-left">
						<a class="proceed_b" href="${pageContext.request.contextPath}/patientSuscriptionPaymentCheckout">Try Again</a>
						</div>
					</div> --%>
				</div>
            </div>
   	<div class="clearfix"></div>
    </div>
    </div>
  <!-- Payment Failed -->
  
  <!--Successfully  -->

<div class="success-blk " id="successDiv" style="display: none">
 <div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div> 
     <div class="log_user Pay_successfully " >
     <!-- <a href="#"><span class="icon-printer receipt-print"></span></a> -->
 <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/done.jpg" class="img-responsive" alt="thumb"></div>
 <%-- <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="logo"> --%>
 <h3 class="text-center">Thank You</h3>
	<p>Your Registration Is Successful</p>
	<div class="row">
		
        <div class="receipt-main col-xs-10 col-sm-10 col-md-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">
            
			<div class="row">
			
				<div class="receipt-header receipt-header-mid">
					
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="receipt-left text-center" >
							<h1>Receipt <a href="#" class="hidden-print" onclick="myFunction()"><span class="icon-printer receipt-print"></span></a></h1>
							
						</div>
					</div>
				</div>
            </div>
			
			
            <div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                         
                        <tr>
                            <td class="col-md-9">Bank TXN ID </td>
                            <td class="col-md-3"><%=txnId%> <span id="txnid"> </span> </td>
                        </tr>
                        
                        
                         <tr>
                            <td class="col-md-9">Order ID</td>
                            <td class="col-md-3"><%=orderId%> </td>
                        </tr>
                        
                         <tr>
                            <td class="col-md-9">TXN Amount</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> <%=txnAmt%></td>
                        </tr>
                        <tr>
                            <td class="col-md-9">TXN Date</td>
                            <td class="col-md-3"><%=txnDate%></td>
                        </tr>
                         
                        <tr>
                           
                            <td class="text-right"><h2><strong>Total: </strong></h2></td>
                            <td class="text-left text-danger"><h2><strong> <i class="fa fa-inr"></i> <%=txnAmt%> </strong></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
			
			<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<%-- <div class="col-xs-6 col-sm-6 col-md-6 pad-0">
						<div class="receipt-right">
							<a class="exit_b" href="${pageContext.request.contextPath}/showPatientLoginPage">Exit</a>
						</div>
					</div> --%>
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center ">
						<a class="proceed_b" href="${pageContext.request.contextPath}/${backUrl}">Proceed</a>
						</div>
					</div>
				</div>
            </div>
			
        </div>    
	</div>
	
 </div>
 </div>
		<!-- Successfully -->
		
		<!-- Payment pending -->
		<div class="pending-blk " id="pendingDiv" style="display: none">
			<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>
    <div class="log_user Pay_successfully " >
    <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/pending.jpg" class="img-responsive" alt="wait"></div>
    <h3 class="text-center">Pending</h3>
   	<p>Your Payment Process Is Pending Due To Bank Server Failure.<br>Please Stay Tunned, We Will Get Back To You Soon.</p>
   	<div class="row">
   	<div class="receipt-main col-xs-10 col-sm-10 col-md-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">
            
			<div class="row">
			
				<div class="receipt-header receipt-header-mid">
					
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="receipt-left text-center" >
							<h1>Receipt <a href="#" class="hidden-print" onclick="myFunction()"><span class="icon-printer receipt-print"></span></a></h1>
							
						</div>
					</div>
				</div>
            </div>
			
			
            <div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td class="col-md-9">Bank TXN ID </td>
                            <td class="col-md-3"><%=txnId%> <span id="txnid"> </span> </td>
                        </tr>
                          
                         <tr>
                            <td class="col-md-9">Order ID</td>
                            <td class="col-md-3"><%=orderId%> </td>
                        </tr>
                        
                         <tr>
                            <td class="col-md-9">TXN Amount</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> <%=txnAmt%></td>
                        </tr>
                        <tr>
                            <td class="col-md-9">TXN Date</td>
                            <td class="col-md-3"><%=txnDate%></td>
                        </tr>
                         
                        <tr>
                           
                            <td class="text-right"><h2><strong>Total: </strong></h2></td>
                            <td class="text-left text-danger"><h2><strong> <i class="fa fa-inr"></i> <%=txnAmt%> </strong></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
			<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<%-- <div class="col-xs-6 col-sm-6 col-md-6 pad-0">
						<div class="receipt-right">
							<a class="exit_b" href="${pageContext.request.contextPath}/showPatientLoginPage">Exit</a>
						</div>
					</div> --%>
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center ">
						<a class="proceed_b" href="${pageContext.request.contextPath}/${backUrl}">Proceed</a>
						</div>
					</div>
				</div>
            </div>
				
			
        </div>
   </div>
   	
    </div>
		</div>
		<!-- Payment pending -->
		
	<%-- <%=outputHTML%> --%>
		<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<a id="urlBtn" style="display: none" href="${pageContext.request.contextPath}/${backUrl}">Go To Next</a>
		<input type="hidden" id="packageId" name="packageId" value="${packageId}">
		<input type="hidden" id="packageAmt" name="packageAmt" value="${packageAmt}">
		<input type="hidden" id="offerId" name="offerId" value="${offerId}">
	<script type="text/javascript">
	function submitData(txnId){
	 
				var txnAmt=<%=txnAmt%>;
				 
				var respCode=<%=respCode%>;
				 var orderId=<%=orderId%>;
				 var packageId= document.getElementById("packageId").value;
				 var offerId=document.getElementById("offerId").value;
				 var packageAmt=document.getElementById("packageAmt").value;
				 
				 if(respCode==1)
					 {
					  
					 // document.getElementById("urlBtn").style.display="block";
					//show success page
						document.getElementById("successDiv").style.display='block';
					 }
				 
				
				 else if(respCode==6)
					{
					//Show pending page
					document.getElementById("pendingDiv").style.display='block';
					}
				 $
					.getJSON(
							'${savePatientDetailsAndPayment}',
							{
								orderId : orderId,
								txnAmt : txnAmt,
								txnId : txnId,
								txnStatus : respCode,
								packageId : packageId,
								packageAmt : packageAmt,
								offerId : offerId,
								ajax : 'true'
							},
							function(data) {
								
								alert(data);
								
								if(data!=0){
									
									 $
										.getJSON(
												'${updatePatientWalletAndTransactions}',
												{
													userId : data,
													
													userType : 1,
													ajax : 'true'
												});
									//window.open("${pageContext.request.contextPath}/updateWalletAndTransactions/"+data+"/"+1,"_self"); 
									}
								
							});
	}
	function myFunction() {
	    window.print();
	}
	function failed()
	{
		//show Failed page
		document.getElementById("failedDiv").style.display='block';
		
	}
	</script>
</body>
</html>