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
				txnId=parameters.get("TXNID");
				
				 
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

<c:url var="submitPatientMedicinePayment"
		value="/submitPatientMedicinePayment" />
		
		<!-- Payment Failed -->
		<div class="fail-blk" id="failedDiv" style="display: none">
	<div class="login_screen"><img src="${pageContext.request.contextPath}/resources/images/login_bg.png" class="img-responsive" alt="login"></div>	
		<div class="log_user faild" >
    <div class="success-bg"><img src="${pageContext.request.contextPath}/resources/images/fail.jpg" class="img-responsive" alt="wait"></div>
    <h3 class="text-center">Failed</h3>
   	<p>Sorry Your Payment Is Unsuccessful</p>
   	
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
						<a class="proceed_b" href="${pageContext.request.contextPath}/doctorSuscriptionCheckoutPage">Try Again</a>
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
	<p>Your Pharmacy Payment Completed Successfully </p>

	<div class="row">
		
        <div class="receipt-main col-xs-10 col-sm-10 col-md-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">
        	<div class="row">
        		<div class="receipt-header receipt-header-mid">
					
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="receipt-left">
							<h1>Receipt</h1>
						</div>
					</div>
				</div>
        	</div>
            <div class="row">
    			<div class="receipt-header">
					
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="receipt-right">
							<h5>Gurdeep Singh <small>  |   Order No : 156</small></h5>
							<p><b>Mobile :</b> +91 12345-6789</p>
							<p><b>Email :</b> info@gmail.com</p>
							<p><b>Address :</b> Australia</p>
						</div>
					</div>
					
				
				
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="receipt-left">
							<h5>TechMed Pharmac.</h5>
							<p> +91 12345-6789 </p>
							<p> info@gmail.com </p>
							<p> Viraj Corner Nashik </p>
						</div>
					</div>
				</div>
            </div>
			<!-- <div class="row">
				<div class="receipt-header receipt-header-mid">
					<div class="col-xs-8 col-sm-8 col-md-8 text-left">
						<div class="receipt-right">
							<h5>Gurdeep Singh <small>  |   Lucky Number : 156</small></h5>
							<p><b>Mobile :</b> +91 12345-6789</p>
							<p><b>Email :</b> info@gmail.com</p>
							<p><b>Address :</b> Australia</p>
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4">
						<div class="receipt-left">
							<h1>Receipt</h1>
						</div>
					</div>
				</div>
            </div> -->
			
            <div><br>
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
                            <td class="col-md-9">Wallet Amount</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> ${walletAmount}</td>
                        </tr>
                        
                        <tr>
                            <td class="col-md-9">TXN Date</td>
                            <td class="col-md-3"><%=txnDate%></td>
                        </tr>
                         
                        <tr>
                           
                            <td class="text-right"><h2><strong>Total: </strong></h2></td>
                            <td class="text-left text-danger"><h2><strong> <i class="fa fa-inr"></i><input type="text" id="totAmount" > </strong></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
			
			<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<%-- <div class="col-xs-6 col-sm-6 col-md-6 pad-0">
						<div class="receipt-right">
							<a class="exit_b" href="${pageContext.request.contextPath}/showDoctorLoginPage">Exit</a>
						</div>
					</div> --%>
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center">
						<a class="proceed_b" href="${pageContext.request.contextPath}/showPatientPaymentHistory">Proceed</a>
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
						<div class="receipt-left">
							<h1>Receipt</h1>
						</div>
					</div>
				</div>
        	</div>
            <div class="row">
    			<div class="receipt-header">
					
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="receipt-right">
							<h5>Gurdeep Singh <small>  |   Order No : 156</small></h5>
							<p><b>Mobile :</b> +91 12345-6789</p>
							<p><b>Email :</b> info@gmail.com</p>
							<p><b>Address :</b> Australia</p>
						</div>
					</div>
					
				
				
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="receipt-left">
							<h5>TechMed Pharmac.</h5>
							<p> +91 12345-6789 </p>
							<p> info@gmail.com </p>
							<p> Viraj Corner Nashik </p>
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
                            <td class="col-md-9">Wallet Amount</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> ${walletAmount}</td>
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
                            <td class="text-left text-danger"><h2><strong> <i class="fa fa-inr"></i> <input type="text" id="totAm" ></strong></h2></td>
                        </tr>
                    </tbody>
                </table>
                 <input type="hidden" id="wallAmount" value=" ${walletAmount}"> 
            </div>
			<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<%-- <div class="col-xs-6 col-sm-6 col-md-6 pad-0">
						<div class="receipt-right">
							<a class="exit_b" href="${pageContext.request.contextPath}/showDoctorLoginPage">Exit</a>
						</div>
					</div> --%>
					<div class="col-xs-12 col-sm-12 col-md-12 pad-0">
						<div class="text-center">
						<a class="proceed_b" href="${pageContext.request.contextPath}/showPatientPaymentHistory">Proceed</a>
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
		
	<script type="text/javascript">
	var txnAmnt=<%=txnAmt%>;
	
	var wallAm=document.getElementById("wallAmount").value;
	
	var totalAmount=parseFloat(txnAmnt) + parseFloat(wallAm);
	

	document.getElementById("totAmount").value = parseFloat(totalAmount);
	document.getElementById("totAm").value = totalAmount;
	
	function submitData(txnId){
		 
				var txnAmt=<%=txnAmt%>;
				 
				var respCode=<%=respCode%>;
				 var orderId=<%=orderId%>;
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
							'${submitPatientMedicinePayment}',
							{
								orderId : orderId,
								txnAmt : txnAmt,
								txnId : txnId,
								txnStatus : respCode,
								ajax : 'true'
							},
							function(data) {
								alert("Success");
							})
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