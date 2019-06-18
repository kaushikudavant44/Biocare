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
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/videoCall2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>

</head>
<body>
<c:url var="getPharmacyByPincode" value="/getPharmacyByPincode" />
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login" id="medicine">
 <div class="dashboard_nm text-center"><h4>Place Your Order</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
             
         
             <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                
                <div class="bhoechie-tab-content active">
             <form action="${pageContext.request.contextPath}/orderMedicineFromCart" method="GET" id="placeOrder">
                <input type="hidden" value="${deliveryType}" name="deliveryType" id="deliveryType">
                <input type="hidden" value="${address}" name="address">
                <input type="hidden" value="0" name="medicalId" id="medicalId">
                
                	<div class="tab-pane active" role="tabpanel" id="step3">
                	   <c:if test="${! empty( medicalDetailsList ) }">
                       <div class="table-responsive">
                	<table width="100" border="1" class="medicine-tbl">
					  <tbody>
					  <tr>
					  	<th>Sr</th>
					   
					   <th>Store</th>
					    <th>Address</th>
					  <th>Phone Number</th>
					     <th>Send</th>
					  </tr>
					  
					  <c:forEach items="${medicalDetailsList}" var="medicalDetailsList" varStatus="myIndex">
  <tr>
    <td>${myIndex.index+1}</td>
    <td>${medicalDetailsList.medicalName} </td>
    <td>${medicalDetailsList.address},${medicalDetailsList.int3}</td>
    <td>${medicalDetailsList.contact}</td>
    <td><input type="button" onclick="placeOrder(${medicalDetailsList.medicalId})"  value="Place Order" class="btn-fr-all"></td>
  </tr>
  </c:forEach>
					  
					</tbody>
			</table>

                
                </div>
                </c:if>
                       <hr>
                        <div class="row">
                        	<div class="col-md-12 col-ms-12">
                        		<div class="filter_div mar-bot20">
                    
                    				<h3>Enter Pincode</h3>
				                    	<div class="col-sm-8">
										  <input type="text" name="pincode" id="pincode" placeholder="Enter address pincode">
										  </div>
										  <div class="col-sm-4">
										  <input type="button" class="btn-fr-all" name="search" value="search" onclick="showPharmacyByPincode()">
										</div>
					      		
                    </div>
                        	</div>
                        	
                        </div>
                        <div class="table-responsive" id="myDIV">
                	

                
                </div>
                        <!-- <ul class="list-inline pull-right mar-top20">
                            
                            <li><input type="submit" class="btn-fr-all btn-info-full next-step" value="place order"></li>
                        </ul> -->
                    </div>
                 </form>
                
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>

<script>

function showPharmacyByPincode()
{	 
	
	 var pincode = document.getElementById("pincode").value;
	 var deliveryStatus = document.getElementById("deliveryType").value;
	 
		$('#myDIV').html("");
	
	 $
		.getJSON(
				'${getPharmacyByPincode}',
				{
					pincode : pincode,
					deliveryStatus : deliveryStatus,
					ajax : 'true'
				},
				function(data) {
					
					if(data!=""&&data!=null)
					{
										
						var strVarr="";
						strVarr += "<table width=\"100\" border=\"1\" class=\"medicine-tbl\" id=\"pharmacyByPincode\">";
						strVarr += "  <tbody>";
						strVarr += "<tr>";
						strVarr += "<th>Sr.No<\/th>  ";
						strVarr += "<th>Store<\/th>  ";
						strVarr += "<th>Address<\/th>  ";
						strVarr += "<th>Phone No<\/th>  ";
						strVarr += "<th>Send<\/th>  ";
						strVarr += "<\/tr>";
						strVarr += "  <\/tbody>";
						strVarr += "  <\/table>";
						$('#myDIV').append(strVarr);	
						
					$.each(
							data,
								function(key, data) {
								
					var tr = $('<tr></tr>');
					

					tr.append($('<td></td>').html(key+1));
					
					tr.append($('<td></td>').html(data.medicalName));
					tr.append($('<td></td>').html(data.address));
					tr.append($('<td></td>').html(data.contact));
				tr.append($('<td></td>').html('<input onclick="placeOrder('+data.medicalId+')" value="placeOrder" name="selectMedical" type="button" class="btn-fr-all">')); 
					
				 	 $('#pharmacyByPincode').append(tr); 
							})
					}
					else
					{
					var strVar="";
					strVar += "<div class=\"notFound\">";
					strVar += " ";
					strVar += " 	<img src=\"${pageContext.request.contextPath}\/resources\/images\/notfound.png\" class=\"img-responsive\" alt=\"Not Found\">";
					strVar += " 	";
					strVar += " 	<p>Result Not Found<\/p>";
					strVar += " ";
					strVar += " <\/div>";
					strVar += "     ";

					 $('#myDIV').append(strVar);
					}
					

				}) 
      
	 
}

function placeOrder(medicalId)
{
	document.getElementById("medicalId").value=medicalId;
	$('#placeOrder').submit();
	
}
</script>
</body>
</html>