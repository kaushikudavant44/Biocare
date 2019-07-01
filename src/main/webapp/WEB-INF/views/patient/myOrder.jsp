
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
</head>

<body> 
<jsp:include page="../include/patientHeader.jsp"/> 
<c:url var="getPrescriptionByMeetingId" value="/getPrescriptionByMeetingId" />
<c:url var="showMyAllOder" value="/showMyAllOder" />
<c:url var="cancelOrder" value="/cancelOrder" />
<c:url var="getPrescriptionDetailsForOrder" value="/getPrescriptionDetailsForOrder" />
<c:url var="getPrescriptionDetailsForInvoice" value="/getPrescriptionDetailsForInvoice" />

<div class="clearfix"></div>
<section class="doc_login inssurance_buy" id="medicine">
 <div class="dashboard_nm text-center"><h4>My Order </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
                <div class="filter_div">
                <form action="${pageContext.request.contextPath}/showMyOder">
                	<div class="row">
                		<div class="col-md-3 col-sm-3">
                		<div class="myoder">
                	<strong> Select Member</strong> 
                		<div class="order-sort">
                			 <select class="slct_lst" id="patientId" name="patientId">
      		 <c:forEach items="${patientDetailList}" var="patientDetailList">
												<c:choose>

													<c:when
														test="${patientId==patientDetailList.patientId}">
														<option selected value="${patientDetailList.patientId}">${patientDetailList.fName}</option>
														
													</c:when>
                                                      <c:otherwise>
                 				                 <option  value ="${patientDetailList.patientId}">${patientDetailList.fName }</option>
                                            </c:otherwise>
												</c:choose>
											</c:forEach>
      		 
      		</select> 
      		
      		
      		
                		</div>                		
                	</div>
                		</div>
                		<div class="col-md-3 col-sm-3">
                		<div class="myoder">
                	<strong>order</strong> Placed in
                			<select name="month">
                			
                			<c:choose>
         
         <c:when test = "${month==1}">
          
                				<option value="1" selected>last 30 days</option>
                				<option value="6">Past 6 months</option>
                				<option value="0">All Oders</option>
         </c:when>
         
         
         <c:when test = "${month==6}">
           <option value="1" >last 30 days</option>
                				<option value="6" selected>Past 6 months</option>
                				<option value="0">All Oders</option>
         </c:when>
         <c:when test = "${month==0}">
           <option value="1" >last 30 days</option>
                				<option value="6">Past 6 months</option>
                				<option value="0" selected>All Oders</option>
         </c:when>
         
        <c:otherwise>
        <option value="1" selected>last 30 days</option>
                				<option value="6">Past 6 months</option>
                				<option value="0">All Orders</option>        </c:otherwise> 
								 
								 
								   </c:choose>
                			
                			
                				
                			</select>
                		</div>
                		</div> 
                		<div class="col-md-3 col-sm-3">
                		<br class="hidden-sm- hidden-xs">
                		<input class="btn-fr-all" type="submit" value="submit"></div>
                		
                	</div> 
                	
                	</form>               	
                </div>
                <div class="clearfix"></div>
                
                <div class="bs-example">
    <ul class="nav nav-tabs mar-top20">
    <li  class="active"><a data-toggle="tab" href="#sectionB">Pending Order</a></li>
     <li><a data-toggle="tab" href="#sectionC">Completed Order</a></li>
     <li><a data-toggle="tab" href="#sectionA">Delivered Order</a></li>
        
    </ul>
    
    <c:choose>
                 <c:when test="${empty PatientOrderDetailsList}">
                              
						<div class="notFound">												
					     <img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">																		
			         	 <p>Result Not Found</p>																		
			            </div>	
			            			
				</c:when>		
    <c:otherwise>
    <div class="tab-content mar-bot15">
  
    <div id="sectionB" class="tab-pane fade in active">
            <div>
                <c:forEach items="${PatientOrderDetailsList}" var="PatientOrderDetailsList"	varStatus="count">
                <c:if test="${PatientOrderDetailsList.status==0}">
                <div class="a-box ">
                			<div class="box-head">
                				<div class="row">
                				
                					<div class="col-md-4 col-sm-4 col-xs-4">
                						<div class="palce-text">
                						<p class="text-left">Order No : ${PatientOrderDetailsList.requestToMedicalId}</p>
										 <form action="${pageContext.request.contextPath}/getOrederDetailsByRequetId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
										 <p class="text-left"><input class="order-details-btn" type="submit" value="Order Details"></p>
                					    </form>		
                						
                									
										</div>
										
                					</div>
                

                					<%-- <div class="col-md-3 col-sm-4 col-xs-3 hidden-sm hidden-xs">
                						<div class="palce-text">
                						<p>Pending</p>
    
                						<p>${PatientOrderDetailsList.totalAmt}</p>								
										</div>
										
                					</div> --%>
                					<div class="col-md-4 col-sm-4 col-xs-3">
                						<div class="palce-text">
                						<p>Ship To </p>
                						<div class="dropdown">
													
														<h5 class="dropbtn">${PatientOrderDetailsList.patientName} <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
														 <div class="dropdown-content">
															<h3 class="content1">Shiping Address</h3>
															<div class="add-blk">
																<h4>${PatientOrderDetailsList.patientName}</h4>
																<p>${PatientOrderDetailsList.address}</p>
																	<p class="hidden-lg hidden-md hidden-sm hidden-xs">${PatientOrderDetailsList.pincode}</p>
																	<p>India</p>
																	<p>Phone: ${PatientOrderDetailsList.patientContact}</p>
																	
															</div>
														</div>
													</div>								
										</div>
										
                					</div>
                					
                					<div class="col-md-4 col-sm-4 col-xs-5">
                					
                						<div class="palce-text">
                						<div class="order-cancel-btn">
			<a class="btn-fr-all top-xs" href="#" data-toggle="modal" data-target="#largeModal" onclick="getPrescriptionDetails(${PatientOrderDetailsList.requestToMedicalId})"><span class="hidden-xs">View</span> Prescription </a>                				</div>		
                					    
                														
										</div>
										
                					</div>
                					
                					
                				</div>
                			</div>
                			<div class="a-box-inner">
                			<div class="row">
                			<div class="col-lg-1 col-md-2 col-sm-2 col-xs-3 ">
                			<div class="presc-icon text-left"><span class="icon-prescription"></span></div>
                			</div>
                			<div class="col-lg-7 col-md-6 col-sm-6 col-xs-4">
                				<h4><strong> Pending</strong></h4>
                				<p>${PatientOrderDetailsList.lastModifiedDate}</p>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				<div class="order-cancel-btn">
                					<a class="btn-fr-all top-xs" href="#" onclick="cancelOrder(${PatientOrderDetailsList.requestToMedicalId})">Cancel Order</a>
                				</div>
                				</div>
                				</div>
                			</div>
                		</div>
                		</c:if>
                		
  </c:forEach>  
  <c:forEach items="${PatientOrderDetailsList1}" var="PatientOrderDetailsList"	varStatus="count">
                <c:if test="${PatientOrderDetailsList.status==0}">
                <div class="a-box ">
                			<div class="box-head">
                				<div class="row">
                				
                					<div class="col-md-4 col-sm-4 col-xs-4">
                						<div class="palce-text">
                						<p class="text-left">Order No : ${PatientOrderDetailsList.requestToMedicalId}</p>
										 <form action="${pageContext.request.contextPath}/getUploadedOrderDetailsByRequestId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
										 <p class="text-left"><input class="order-details-btn" type="submit" value="Order Details"></p>
                					    </form>		
                						
                									
										</div>
										
                					</div>
                

                					<%-- <div class="col-md-3 col-sm-4 col-xs-3 hidden-sm hidden-xs">
                						<div class="palce-text">
                						<p>Pending</p>
    
                						<p>${PatientOrderDetailsList.totalAmt}</p>								
										</div>
										
                					</div> --%>
                					<div class="col-md-4 col-sm-4 col-xs-3">
                						<div class="palce-text">
                						<p>Ship To </p>
                						<div class="dropdown">
													
														<h5 class="dropbtn">${PatientOrderDetailsList.patientName} <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
														 <div class="dropdown-content">
															<h3 class="content1">Shiping Address</h3>
															<div class="add-blk">
																<h4>${PatientOrderDetailsList.patientName}</h4>
																<p>${PatientOrderDetailsList.address}</p>
																	<p class="hidden-lg hidden-md hidden-sm hidden-xs">${PatientOrderDetailsList.pincode}</p>
																	<p>India</p>
																	<p>Phone: ${PatientOrderDetailsList.patientContact}</p>
																	
															</div>
														</div>
													</div>								
										</div>
										
                					</div>
                					
                					<div class="col-md-4 col-sm-4 col-xs-5">
                					
                						<div class="palce-text">
                						<div class="order-cancel-btn">
                						
                					<%-- 	  <a href="#" data-toggle="modal" data-target="#largeModal1" onclick="getPrescriptionImage(${PatientOrderDetailsList.patientId},${getMedicalOrderDetails.requestToMedicalId},'${getMedicalOrderDetails.prescriptionName}')">
	                			<span class="scheduleInfo hidden-xs" > <img src="https://d2y2l77dht9e8d.cloudfront.net/web-assets/dist/70fce7e90959619c2e18aeab492c8a78.svg" class="rx_image"  width="24" height="24px"  alt="Rx_image">View</span>Prescription</a>
                						 --%>
			<a class="btn-fr-all top-xs" href="#" data-toggle="modal" data-target="#largeModal1" onclick="getPrescriptionImage(${PatientOrderDetailsList.patientId},${PatientOrderDetailsList.requestToMedicalId},'${PatientOrderDetailsList.string1}')"><span class="hidden-xs">View</span> Prescription </a>                 				</div>		
          			    
                														
										</div>
										
                					</div>
                					
                					
                				</div>
                			</div>
                			<div class="a-box-inner">
                			<div class="row">
                			<div class="col-lg-1 col-md-2 col-sm-2 col-xs-3 ">
                			<div class="presc-icon text-left"><span class="icon-prescription"></span></div>
                			</div>
                			<div class="col-lg-7 col-md-6 col-sm-6 col-xs-4">
                				<h4><strong> Pending</strong></h4>
                				<%-- <p>${PatientOrderDetailsList.lastModifiedDate}</p> --%>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				<div class="order-cancel-btn">
                					<a class="btn-fr-all top-xs" href="#" onclick="cancelOrder(${PatientOrderDetailsList.requestToMedicalId})">Cancel Order</a>
                				</div>
                				</div>
                				</div>
                			</div>
                		</div>
                		</c:if>
                		
  </c:forEach>  
              		
 </div>               

        </div>
    
    
    
    
        <div id="sectionA" class="tab-pane fade">
            <div>
                <c:forEach items="${PatientOrderDetailsList}" var="PatientOrderDetailsList"	varStatus="count">
                <c:if test="${PatientOrderDetailsList.status==2}">
                <div class="a-box ">
                			<div class="box-head">
                				<div class="row">
                					<div class="col-md-3 col-sm-4 col-xs-4">
                						<div class="palce-text">
                						<p>Delivered</p>
                						<p>${PatientOrderDetailsList.orderDate}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3 hidden-sm hidden-xs">
                						<div class="palce-text">
                						<p>Total</p>
    
                						<p>${PatientOrderDetailsList.totalAmt}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3">
                						<div class="palce-text">
                						<p>Ship To </p>
                						<div class="dropdown">
													
														<h5 class="dropbtn">${PatientOrderDetailsList.patientName} <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
														 <div class="dropdown-content">
															<h3 class="content1">Shiping Address</h3>
															<div class="add-blk">
																<h4>${PatientOrderDetailsList.patientName}</h4>
																<p>${PatientOrderDetailsList.address}</p>
																	<p class="hidden-lg hidden-md hidden-sm hidden-xs">${PatientOrderDetailsList.pincode}</p>
																	<p>India</p>
																	<p>Phone: ${PatientOrderDetailsList.patientContact}</p>
																	
															</div>
														</div>
													</div>								
										</div>
										
                					</div>
                					
                					<div class="col-md-3 col-sm-4 col-xs-5">
                						<div class="palce-text">
                						<p class="text-right">Order No : ${PatientOrderDetailsList.requestToMedicalId}</p>
                						<form action="${pageContext.request.contextPath}/getOrederDetailsByRequetId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
										 <p class="text-right"><input class="order-details-btn" type="submit" value="Order Details"></p>
                					    </form>						
										</div>
										
                					</div>
                					
                					
                				</div>
                			</div>
                			<div class="a-box-inner">
                			<div class="row">
                			<div class="col-lg-1 col-md-2 col-sm-2 col-xs-3">
                			<div class="presc-icon text-left"><span class="icon-prescription"></span></div>
                			</div>
                			<div class="col-lg-7 col-md-6 col-sm-6 col-xs-4">
                				<h4><strong> Delivered</strong></h4>
                				<p>${PatientOrderDetailsList.lastModifiedDate}</p>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				
                				<div class="order-cancel-btn">
                					<a class="btn-fr-all top-xs" href="#" onclick="getPrescriptionDetailsForInvoice(${PatientOrderDetailsList.requestToMedicalId},${PatientOrderDetailsList.totalAmt});" data-toggle="modal" data-target="#bill"><span class="hidden-xs">View</span> Bill </a>
                				</div>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				<div class="order-cancel-btn">
                					<a class="btn-fr-all top-xs" href="#" data-toggle="modal" data-target="#largeModal" onclick="getPrescriptionDetails(${PatientOrderDetailsList.requestToMedicalId})"><span class="hidden-xs">View</span> Prescription </a>
                				</div>
                				</div>
                				</div>
                			</div>
                		</div>
                		</c:if>
                		
  </c:forEach>  
  <c:forEach items="${PatientOrderDetailsList1}" var="PatientOrderDetailsList"	varStatus="count">
                <c:if test="${PatientOrderDetailsList.status==2}">
                <div class="a-box ">
                			<div class="box-head">
                				<div class="row">
                					<div class="col-md-3 col-sm-4 col-xs-4">
                						<div class="palce-text">
                						<p>Delivered</p>
                						<p>${PatientOrderDetailsList.orderDate}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3 hidden-sm hidden-xs">
                						<div class="palce-text">
                						<p>Total</p>
    
                						<p>${PatientOrderDetailsList.totalAmt}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3">
                						<div class="palce-text">
                						<p>Ship To </p>
                						<div class="dropdown">
													
														<h5 class="dropbtn">${PatientOrderDetailsList.patientName} <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
														 <div class="dropdown-content">
															<h3 class="content1">Shiping Address</h3>
															<div class="add-blk">
																<h4>${PatientOrderDetailsList.patientName}</h4>
																<p>${PatientOrderDetailsList.address}</p>
																	<p class="hidden-lg hidden-md hidden-sm hidden-xs">${PatientOrderDetailsList.pincode}</p>
																	<p>India</p>
																	<p>Phone: ${PatientOrderDetailsList.patientContact}</p>
																	
															</div>
														</div>
													</div>								
										</div>
										
                					</div>
                					
                					<div class="col-md-3 col-sm-4 col-xs-5">
                						<div class="palce-text">
                						<p class="text-right">Order No : ${PatientOrderDetailsList.requestToMedicalId}</p>
                						<form action="${pageContext.request.contextPath}/getUploadedOrderDetailsByRequestId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
										 <p class="text-right"><input class="order-details-btn" type="submit" value="Order Details"></p>
                					    </form>						
										</div>
										
                					</div>
                					
                					
                				</div>
                			</div>
                			<div class="a-box-inner">
                			<div class="row">
                			<div class="col-lg-1 col-md-2 col-sm-2 col-xs-3">
                			<div class="presc-icon text-left"><span class="icon-prescription"></span></div>
                			</div>
                			<div class="col-lg-7 col-md-6 col-sm-6 col-xs-4">
                				<h4><strong> Delivered</strong></h4>
                				<p>${PatientOrderDetailsList.lastModifiedDate}</p>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				
                				<div class="order-cancel-btn">
                					<a class="btn-fr-all top-xs" href="<%-- ${pageContext.request.contextPath}/showUploadedPrescriptionMedicineBillToPharmacy/${PatientOrderDetailsList.requestToMedicalId} --%> #" data-toggle="modal" data-target="#bill2"><span class="hidden-xs">View</span> Bill </a>
                				</div>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				<div class="order-cancel-btn">
                					<a class="btn-fr-all top-xs" href="#" data-toggle="modal" data-target="#largeModal1" onclick="getPrescriptionImage(${PatientOrderDetailsList.patientId},${PatientOrderDetailsList.requestToMedicalId},'${PatientOrderDetailsList.string1}')"><span class="hidden-xs">View</span> Prescription </a>                 				</div>
                				</div>
                				</div>
                				</div>
                			</div>
                		
                		</c:if>
                		
  </c:forEach>  
</div>
     </div>         		
            
 
  <div id="sectionC" class="tab-pane fade">
            <div>
                <c:forEach items="${PatientOrderDetailsList}" var="PatientOrderDetailsList"	varStatus="count">
                <c:if test="${PatientOrderDetailsList.status==1}">
                <div class="a-box ">
                			<div class="box-head">
                				<div class="row">
                					<div class="col-md-3 col-sm-4 col-xs-4">
                						<div class="palce-text">
                						<p>Completed</p>
                						<p>${PatientOrderDetailsList.orderDate}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3 hidden-sm hidden-xs">
                						<div class="palce-text">
                						<p>Total</p>
    
                						<p>${PatientOrderDetailsList.totalAmt}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3">
                						<div class="palce-text">
                						<p>Ship To </p>
                						<div class="dropdown">
													
														<h5 class="dropbtn">${PatientOrderDetailsList.patientName} <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
														 <div class="dropdown-content">
															<h3 class="content1">Shiping Address</h3>
															<div class="add-blk">
																<h4>${PatientOrderDetailsList.patientName}</h4>
																<p>${PatientOrderDetailsList.address}</p>
																	<p class="hidden-lg hidden-md hidden-sm hidden-xs">${PatientOrderDetailsList.pincode}</p>
																	<p>India</p>
																	<p>Phone: ${PatientOrderDetailsList.patientContact}</p>
																	
															</div>
														</div>
													</div>								
										</div>
										
                					</div>
                					
                					<div class="col-md-3 col-sm-4 col-xs-5">
                						<div class="palce-text">
                						<p class="text-right">Order No : ${PatientOrderDetailsList.requestToMedicalId}</p>
                						<%-- <form action="${pageContext.request.contextPath}/getOrederDetailsByRequetId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
										 <p class="text-right"><input class="order-details-btn" type="submit" value="Order Details"></p> 
                					    </form>		 --%>				
										</div>
										
                					</div>
                					
                					
                				</div>
                			</div>
                			<div class="a-box-inner">
                			<div class="row">
                			<div class="col-lg-1 col-md-2 col-sm-2 col-xs-3">
                			<div class="presc-icon text-left"><span class="icon-prescription"></span></div>
                			</div>
                			<div class="col-lg-7 col-md-6 col-sm-6 col-xs-4">
                				<h4><strong> Completed</strong></h4>
                				<p>${PatientOrderDetailsList.lastModifiedDate}</p>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				<div class="order-cancel-btn">
                				
                				<form action="${pageContext.request.contextPath}/getOrederDetailsByRequetId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
                						<c:if test="${PatientOrderDetailsList.paymentStatus!=1}">
										 <p class="text-right"><input class="btn-fr-all top-xs" type="submit" value="Checkout"></p> 
										 </c:if>
                					    </form>			
                				
<%--                 					<a data-toggle="modal" class="btn-fr-all top-xs" href="#myModal" onclick="showPrescription(${PatientOrderDetailsList.meetId},'${PatientOrderDetailsList.doctorName}')">Checkout </a> 
 --%>                					<%-- <a class="btn-fr-all top-xs" href="#" data-toggle="modal" data-target="#largeModal" onclick="showPrescription(${PatientOrderDetailsList.meetId},'${PatientOrderDetailsList.doctorName}')"><span class="hidden-xs">View</span> Prescription </a> --%>
                				</div>
                				</div>
                				</div>
                			</div>
                		</div>
                		</c:if>
                		
  </c:forEach>  
  <c:forEach items="${PatientOrderDetailsList1}" var="PatientOrderDetailsList"	varStatus="count">
                <c:if test="${PatientOrderDetailsList.status==1}">
                <div class="a-box ">
                			<div class="box-head">
                				<div class="row">
                					<div class="col-md-3 col-sm-4 col-xs-4">
                						<div class="palce-text">
                						<p>Completed</p>
                						<p>${PatientOrderDetailsList.orderDate}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3 hidden-sm hidden-xs">
                						<div class="palce-text">
                						<p>Total</p>
    
                						<p>${PatientOrderDetailsList.totalAmt}</p>								
										</div>
										
                					</div>
                					<div class="col-md-3 col-sm-4 col-xs-3">
                						<div class="palce-text">
                						<p>Ship To </p>
                						<div class="dropdown">
													
														<h5 class="dropbtn">${PatientOrderDetailsList.patientName} <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
														 <div class="dropdown-content">
															<h3 class="content1">Shiping Address</h3>
															<div class="add-blk">
																<h4>${PatientOrderDetailsList.patientName}</h4>
																<p>${PatientOrderDetailsList.address}</p>
																	<p class="hidden-lg hidden-md hidden-sm hidden-xs">${PatientOrderDetailsList.pincode}</p>
																	<p>India</p>
																	<p>Phone: ${PatientOrderDetailsList.patientContact}</p>
																	
															</div>
														</div>
													</div>								
										</div>
										
                					</div>
                					
                					<div class="col-md-3 col-sm-4 col-xs-5">
                						<div class="palce-text">
                						<p class="text-right">Order No : ${PatientOrderDetailsList.requestToMedicalId}</p>
                						<%-- <form action="${pageContext.request.contextPath}/getOrederDetailsByRequetId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
										 <p class="text-right"><input class="order-details-btn" type="submit" value="Order Details"></p> 
                					    </form>		 --%>				
										</div>
										
                					</div>
                					
                					
                				</div>
                			</div>
                			<div class="a-box-inner">
                			<div class="row">
                			<div class="col-lg-1 col-md-2 col-sm-2 col-xs-3">
                			<div class="presc-icon text-left"><span class="icon-prescription"></span></div>
                			</div>
                			<div class="col-lg-7 col-md-6 col-sm-6 col-xs-4">
                				<h4><strong> Completed</strong></h4>
                				<p>${PatientOrderDetailsList.lastModifiedDate}</p>
                				</div>
                				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
                				<div class="order-cancel-btn">
                				
                				<form action="${pageContext.request.contextPath}/getUploadedOrderDetailsByRequestId" method="GET">
                						<input type="hidden" value="${PatientOrderDetailsList.requestToMedicalId}" name="requestId">
                						<c:if test="${PatientOrderDetailsList.paymentStatus!=1}">
										 <p class="text-right"><input class="btn-fr-all top-xs" type="submit" value="Checkout"></p> 
										 </c:if>
                					    </form>			
                				
<%--                 					<a data-toggle="modal" class="btn-fr-all top-xs" href="#myModal" onclick="showPrescription(${PatientOrderDetailsList.meetId},'${PatientOrderDetailsList.doctorName}')">Checkout </a> 
 --%>                					<%-- <a class="btn-fr-all top-xs" href="#" data-toggle="modal" data-target="#largeModal" onclick="showPrescription(${PatientOrderDetailsList.meetId},'${PatientOrderDetailsList.doctorName}')"><span class="hidden-xs">View</span> Prescription </a> --%>
                				</div>
                				</div>
                				</div>
                			</div>
                		</div>
                		</c:if>
                		
  </c:forEach>  

              		
 </div>               
 
        </div>
         </div>   
       </c:otherwise>
   </c:choose> 
    </div>
   
    
    
    
</div>
                
                		
                		
</div>
</div>
</div>
</div>
</div>
</section>

 <!--Doctor Payment  -->
         <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Pharmacy Payment</h4>
       
      </div>
      <div class="modal-body text-center pay-lab-modal">
	           <h4>you have receive request regarding Pharmacy payment</h4>
	          
	           <p><strong>Pharmacy Name : </strong> Yog Medical</p>
	           <p><strong>Order No :</strong> 349</p>
	           <p><strong>Date :</strong> 2018-11-12 12:34:0</p>
	           <h3><strong>Amount :</strong> <span> 500 </span></h3>

      </div>
      <div class="modal-footer">
                    <input type="button" value="Pay" class="btn-fr-all">
                   
                </div>
      </div>
    </div>
    </div>
      <!--Doctor Payment  -->

<!--priscription  -->
<div id="largeModal" class="modal fade bs-example-modal-lg reportsDesign" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
					
					<div class="modal-body card_sec" id="displayTable">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
							<a onclick="printTable()"><span class="icon-printer down-icon-modal"></span></a>
							<hr>
							<h4 class="modal-title"><span id="hospitalName"></span> <br> <span  id="drName"></span></h4>
							<hr>
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
					<div class="pat_name text-center">
	                			<div class="row">
	                				<div class="col-sm-10 modal-pric-details">
	                				<!-- <h5><strong>Hospital Name :</strong> <span> Surya Multispaclity Hospital </span></h5>
	                				<h5><strong>Contact No :</strong> <span> 1234567890 </span></h5> -->
	                				</div>
	                				<!-- <div class="col-sm-2 modal-down-icon">
	                					<a href="#"><span class="fa  fa-download"></span></a>
	                					<a href="#"><i class="icon-printer" aria-hidden="true"></i></a>
	                				</div>  -->
	                				
	                			</div>
	                		</div>
	                		<br>
 						 	 <div class="table-responsive">
        	<table width="100%" border="0" class="tbl table table-bordered table table-hover" id="prescTable">
        	<thead>
   <tr align="center">
    <th>Sr.No</th>
    <th>Medicine</th>
    <th>Quantity</th>
    <th>Instructions</th>
    <th>Timing</th>
  </tr>
</thead>
<tbody>
</tbody>
</table> 

        </div>
        <hr>
					<div class="signB">
						Signature: <img id="doctorSign" class="img-responsive img-center">
					</div>

					</div>
					 
					
				</div>
			</div>
		</div>
		
<div id="bill" class="modal fade bs-example-modal-lg reportsDesign"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<div class="modal-body card_sec" id="displayTable">
					<a onclick="printTable()"><span
						class="icon-printer down-icon-modal"></span></a>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<hr>
					<h4 class="modal-title" id="medicalName"></h4>
					<h5 class="text-right">
						<strong>Address : </strong> <span id="mediclaAddress"> </span>
					</h5>

					<h5 class="text-right">
						<strong>Contact No. :</strong> <span id="medicalContact"> </span>
					</h5>
					<h5 class="text-right">
						<strong>Email Id. :</strong> <span id="medicalEmail"> </span>
					</h5>

					<div class="circle1">
						<i class="fa fa-list-ul" aria-hidden="true"></i>
					</div>
					<hr>
					<div class="invoice overflow-auto">
						<div>
							<header>
							<div class="row">
								<div class="col">

									<a target="_blank"> <img
										src="${pageContext.request.contextPath}/resources/images/logo.png"
										data-holder-rendered="true" />
									</a>
								</div>
								<hr>

							</div>
							</header>
							<main>
							<div class="row contacts text-left">
								<div class="col-sm-6 invoice-to">
									<div class="text-gray-light">
										<strong>INVOICE TO:</strong>
									</div>
									<h4 class="to" id="patientName"></h4>

								</div>
								<div class="col-sm-6 invoice-details text-right">
									<div class="invoice-id">
										<strong>INVOICE: <span id="invoiceNo"></span></strong>
									</div>
									<h5 class="date">
										<span>Date of Invoice: <span id="invoiceDate"></span></span>
									</h5>
								</div>
							</div>
							<table border="0" cellspacing="0" cellpadding="0"
								id="invoiceTable">
								<thead>
									<tr>
										<th>SR.NO.</th>
										<th class="text-center">ITEM NAME</th>
										<th class="text-right">QTY</th>
										 
										<th class="right">TOTAL</th>
									</tr>
								</thead>

								<tbody>


								</tbody>
								<tfoot>
									<tr>
										<td colspan="1"></td>
										<td colspan="2">SUBTOTAL</td>
										<td><span id="invSubTotal"></span></td>
									</tr>

									<tr>
										<td colspan="1"></td>
										<td colspan="2">GRAND TOTAL</td>
										<td><span id="invGrandTotal"></span></td>
									</tr>
								</tfoot>
							</table>
							<br>
							<div class="thanks text-center">Thank you!</div>
							<br>
							<!-- <div class="notices">
		                    <div>NOTICE:</div>
		                    <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
		                </div> --> </main>
							<footer class="invoicefoot"> Invoice was created on a
							computer and is valid without the signature and sealff. </footer>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="bill2" class="modal fade bs-example-modal-lg reportsDesign"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="margin-top: 20%;">
				<div class="modal-body card_sec" id="displayTable">
				<a onclick="printTable()"><span class="icon-printer down-icon-modal"></span></a>
						<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
								<hr>
							<h4 class="modal-title"> Bio pharma</h4>
							<h5 class="text-right"><strong>Address : </strong> <span>Nasalapur,Nashik,Maharashtra
 </span></h5>
	                				<!-- <h5><strong>Hospital Name :</strong> <span> Surya Multispaclity Hospital </span></h5> -->
	                			<h5 class="text-right"><strong>Contact No. :</strong> <span>7276757346</span></h5>
	                			<h5 class="text-right"><strong>Email Id. :</strong> <span>gpagar33@gmail.com</span></h5>
							
							<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<hr>
					<div class="invoice overflow-auto">
		        <div >
		            <header>
		                <div class="row">
		                    <div class="col">
		                        <a target="_blank" >
		                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" data-holder-rendered="true" />
		                            </a>
		                    </div>
		                    <div class="col company-details">
		                        <h2 class="name">
		                            <a target="_blank">
		                            ${getMedicalOrderDetails.medicalName}
		                            </a>
		                        </h2>
		                        <div>${getMedicalOrderDetails.address}</div>
		                        <div>${getMedicalOrderDetails.contact}</div>
		                        <div>${getMedicalOrderDetails.email}</div>
		                    </div>
		                </div>
		            </header>
		            <main>
		                <div class="row contacts">
		                    <div class="col-sm-6 invoice-to">
		                        <div class="text-gray-light"><strong>INVOICE TO:</strong></div>
		                         <h4 class="to">${getMedicalOrderDetails.patientName}</h4>
		                       <!--  <div class="email"><a >ganesh@example.com</a></div> -->
		                    </div>
		                    <div class="col-sm-6 invoice-details text-right">
		                        <div class="invoice-id"><strong>INVOICE ${getMedicalOrderDetails.requestToMedicalId}</strong></div>
		                        <div class="date"><span>Date of Invoice: ${getMedicalOrderDetails.paymentDate}</span></div>
		                    </div>
		                </div>
		             
		                <div class="carousel1" id="displayTable">
					<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
						  <div class="carousel-inner" role="listbox">
						    
						 
						   	 <div id="prescriptionImage">
     				<a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-1.jpg" data-lightbox="example-1"><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-1.jpg" alt="image-1" /></a>
    			     <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-2.jpg" data-lightbox="example-2" data-title="Optional caption."><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-2.jpg" alt="image-1"/></a> 
    			   <c:forEach items="${prescriptions}" var="prescriptions">
    			   
    			     <a class="example-image-link" href="${prescriptions}" data-lightbox="example-1"><p class="text-center"><img class="example-image invoiceimg" src="${prescriptions}" alt="image-1" /></p></a>
    			   </c:forEach>
   						  
   						  </div>
						  </div>
  						  
  					</div>
					<div class="pat_name text-center">
	                			<%-- <img src="http://104.238.116.176:8080/images/patient/${patientDetailList.patientId}/prescription/${patientDetailList.prescriptionName}" class="img-responsive prescrptimg" alt="prescription"> --%>
	                		</div>
	                		<hr>
	                		<p class="text-center"><label>Total Amount</label>
						<input type="text" name="totAmount"  id="totAmount"  value="${getMedicalOrderDetails.totalAmt}" class="prescAmt"></p>
					</div>
					
		                
		                <div class="clearfix"></div>
		                <br>
		                <div class="thanks text-center">Thank you!</div>
							<br>			
		                <!-- <div class="notices">
		                    <div>NOTICE:</div>
		                    <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
		                </div> -->
		            </main>
		            <footer class="invoicefoot">
		                Invoice was created on a computer and is valid without the signature and seal.
		            </footer>
		        </div>
		        <div></div>
		    </div>
				</div>
			</div>
		</div>
	</div>	
<div id="largeModal1" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
				<form action="${pageContext.request.contextPath}/confirmUploadedPrescriptionMedicalOrder" method="POST" onsubmit="return confirm('Are you sure submit order?')">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title"> Prescription </h4>
					</div>
					<div class="modal-body carousel1" id="displayTable">
					<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
						  <div class="carousel-inner" role="listbox">
						     <%--<div class="item active"><iframe src="https://www.youtube-nocookie.com/embed/Bi8ikmo1pMI?rel=0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
						     </div>--%>
						   <!--  <div class="item active" id="prescriptionImage"><img class="first-slide" id="prescriptionImage" src="https://bionische.com/biocare/resources/images/logo.png" alt="prescription"></div> --> 
						   	 <div id="prescriptionImage">
     				 <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-1.jpg" data-lightbox="example-1"><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-1.jpg" alt="image-1" /></a>
    			     <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-2.jpg" data-lightbox="example-2" data-title="Optional caption."><img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-2.jpg" alt="image-1"/></a> 
   							 </div>
						  </div>
  					<!-- 	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> --> 
  					</div>
					<div class="pat_name text-center">
	                			<%-- <img src="http://104.238.116.176:8080/images/patient/${patientDetailList.patientId}/prescription/${patientDetailList.prescriptionName}" class="img-responsive prescrptimg" alt="prescription"> --%>
	                		</div>
	                		<hr>
	                		<!-- <p class="text-center"><label>Total Amount</label>
						<input type="text" name="totAmount"  id="totAmount" placeholder="Enter total Amount...." class="prescAmt" readonly></p> -->
					</div>
					<input type="hidden" id="requestId" name="requestId">
					
					 <div class="Modal-footer">
					 	<!-- <p class="text-center medicine-order"><input type="submit" class="btn-fr-all" value="send"></p> -->
					 </div>
					</form> 
				</div>
			</div>
		</div>		
<!--priscrption  -->

<!-- cancel Reason -->
<!-- <div id="reasonmedal" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title"> Reason for Cancellation </h4>
						<small>Order No : 404-9365095-1337931</small>
					</div>
					<div class="modal-body">
 						 	<ul class="reasonblk">
 						 		<li>Just trying the app <input type="checkbox" class="form-check-input"></li>

								<li>Bought medicine from outside <input type="checkbox" class="form-check-input"></li>
								
								<li>Placed a new order <input type="checkbox" class="form-check-input"></li>
								
								<li>Delay in order <input type="checkbox" class="form-check-input"></li>
								
								<li>Other <input type="checkbox" class="form-check-input"></li>
								
								<li><a href="#" class="submit-btn">Submit</a></li>
 						 	</ul> 

					</div>
					 
					
				</div>
			</div>
		</div> -->
<!-- Cancel Reason -->

<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 


<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script> 
  <script>
  function showPrescription(meetId,doctorName)
  {	 
  	 
	  document.getElementById("docName").innerHTML=doctorName;
  	  $('#prescTable td').remove();
   
  	
  	 $
  		.getJSON(
  				'${getPrescriptionByMeetingId}',
  				{
  					meetId : meetId,
  					
  					ajax : 'true'
  				},
  				function(data) {
  					
  					$.each(
  							data,
  								function(key, display) {

  					var tr = $('<tr></tr>');
  					

  					tr.append($('<td></td>').html(key+1));
  					tr.append($('<td></td>').html(display.medicineName));
  					tr.append($('<td></td>').html(display.medicineQuantity));
  					tr.append($('<td></td>').html(display.medicineInstruction));
  					tr.append($('<td></td>').html(display.medicineTiming));
  					
  				 	 $('#prescTable').append(tr);
  							})

  					

  				}) 
        
  	 
  }
  
  
  
  function cancelOrder(requestId)
  {	 
	
  	 $
  		.getJSON(
  				'${cancelOrder}',
  				{
  					requestId : requestId,
  					
  					ajax : 'true'
  				},
  				function(data) {
  					
  					if(data.message=="success")
  						{
  						alert("Order Canceled Successfully");
  						location.reload();
  						}
  					else
  						{
  						alert("Failed To Cancel Order");
  						}

  				}) 
        
  	 
  }
  
 
  
  function showAllOrders()
  {	 
  	 
	  var patientId=document.getElementById("patientId").value; 
	  $('#allOrder').html("");
  	
  	 $
  		.getJSON(
  				'${showMyAllOder}',
  				{
  					patientId : patientId,
  					
  					ajax : 'true'
  				},
  				function(data) {
  					
  					$.each(
  							data,
  								function(key, data) {
  					
  					var strVar="";
  					strVar += "   <div class=\"a-box \">";
  					strVar += "                			<div class=\"box-head\">";
  					strVar += "                				<div class=\"row\">";
  					strVar += "                					<div class=\"col-md-3 col-sm-3\">";
  					strVar += "                						<div class=\"palce-text\">";
  					strVar += "                						<p>Order placed<\/p>";
  					strVar += "                						<p>"+data.orderDate+"<\/p>";
  					strVar += "										<\/div>";
  					strVar += "										";
  					strVar += "                					<\/div>";
  					strVar += "                					<div class=\"col-md-3 col-sm-3\">";
  					strVar += "                						<div class=\"palce-text\">";
  					strVar += "                						<p>Total<\/p>";
  					strVar += "    ";
  					strVar += "                						<p>${data.totalAmt}<\/p>	";
  					strVar += "										<\/div>";
  					strVar += "										";
  					strVar += "                					<\/div>";
  					strVar += "                					<div class=\"col-md-3 col-sm-3\">";
  					strVar += "                						<div class=\"palce-text\">";
  					strVar += "                						<p>Ship To<\/p>";
  					strVar += "                						<div class=\"dropdown\">";
  					strVar += "													";
  					strVar += "														<h5 class=\"dropbtn\">'"+data.patientName+"'<\/h5>";
  					strVar += "														 <div class=\"dropdown-content\">";
  					strVar += "															<h3 class=\"content1\">Shiping Address<\/h3>";
  					strVar += "															<div class=\"add-blk\">";
  					strVar += "																<h4>"+data.patientName+"<\/h4>";
  					strVar += "																<p>"+data.address+"<\/p>";
  					strVar += "																	<p>"+data.pincode+"<\/p>";
  					strVar += "																	<p>India<\/p>";
  					strVar += "																	<p>Phone: "+data.patientContact+"<\/p>";
  					strVar += "																	";
  					strVar += "															<\/div>";
  					strVar += "														<\/div>";
  					strVar += "													<\/div>								";
  					strVar += "										<\/div>";
  					strVar += "										";
  					strVar += "                					<\/div>";
  					strVar += "                				<\/div>";
  					strVar += "                			<\/div>";
  					strVar += "                			<div class=\"a-box-inner\">";
  					strVar += "                			<div class=\"row\">";
  					strVar += "                			<div class=\"col-md-2 col-sm-2\">";
  					strVar += "                			<a href=\"#\" data-toggle=\"modal\" data-target=\"#largeModal\" onclick=\"showPrescription('"+data.meetId+"','"+data.meetId+"')\"><div class=\"imageContainer text-center\"><img src=\"\/biocare\/resources\/images\/medicine.png\" class=\"img-responsive img-center\" alt=\"medicine\"><\/div><\/a>";
  					strVar += "                			<\/div>";
  					strVar += "                			<div class=\"col-md-10 col-sm-10\">";
  					strVar += "                				<h4><strong> Delivered 5-June-2018<\/strong><\/h4>";
  					strVar += "                				<p>"+data.lastModifiedDate+"<\/p>";
  					strVar += "                				<\/div>";
  					strVar += "                				<\/div>";
  					strVar += "                			<\/div>";
  					strVar += "                		<\/div>";

  					
  				 	 $('#allOrder').append(strVar);
  							})

  					

  				}) 
        
  	 
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

	          function orderDetails(requestId)
	          {
					window.open("${pageContext.request.contextPath}/getOrederDetailsByRequetId?requestId="+requestId,"_blank");
	        	  
	          }
	            	
	          function getPrescriptionImage(patientId,medicalReqId,prescriptionName)
	          {
	          	var prescription = prescriptionName.split(",");
	          	
	        	 $("#imageTag").remove();
	          	
	          	//var imageSrc="https://bionische.com/biocare/resources/images/logo.png";
	          	 for(var i=0;i<prescription.length;i++){
	          	
	          		
	          		 var imageSrc="http://104.238.116.176:8080/images/patient/"+patientId+"/prescription/"+prescription[i];
	          	
	           	 $("#prescriptionImage").append('<a class="example-image-link" id="imageTag" href="'+imageSrc+'" data-lightbox="example-1"><img class="example-image" src="'+imageSrc+'" alt="image-1" /></a>');  
	          	 }
	          	 
	          }
	            	
</script>

<script type="text/javascript">
function getPrescriptionDetails(requestId)
{
	   
	 
	   
	 
	 $('#prescTable tbody tr').remove();
	 $
		.getJSON(
				'${getPrescriptionDetailsForOrder}',
				{
					requestId : requestId,
					
					ajax : 'true'
				},
				function(data) {
					 
					 $("#drName").text(data.doctorName);
					 $("#hospitalName").text(data.hospitalName);
				 
					 document.getElementById("doctorSign").src=data.signature;
					$.each(
							data.getPrescriptionDetailsForOrderList,
								function(key, prescriptionList) {
							 
								var tr = $('<tr></tr>');
								
					 		tr.append($('<td></td>').html(key+1));  
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.quantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
								 
								 
								 
							 
					
								$('#prescTable tbody').append(tr);
							})	
							
							
				});
	 
	 
}



function getPrescriptionDetailsForInvoice(requestId,totAmt)
{
	   
	 
	 
	 $('#invoiceTable tbody tr').remove();
	 $
		.getJSON(
				'${getPrescriptionDetailsForInvoice}',
				{
					requestId : requestId,
					
					ajax : 'true'
				},
				function(data) {
					 
					 $("#medicalName").text(data.medicalName);
					 $("#mediclaAddress").text(data.address);
					 $("#medicalContact").text(data.contact);
					 $("#medicalEmail").text(data.email);
					 $("#patientName").text(data.patientName);
					 $("#invoiceNo").text(requestId);
					 $("#invoiceDate").text(data.invoiceDate);
					 $("#invSubTotal").text(totAmt);
					 $("#invGrandTotal").text(totAmt);
					 
		              
		                
		                        
					 
					$.each(
							data.getPrescriptionDetailsForOrderList,
								function(key, prescriptionList) {
								 
								var tr = $('<tr></tr>');
								
						  		tr.append($('<td></td>').html(key+1));  
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.quantity));
							 
								/* onkeyup=" return checkNum(event,this);" */
								tr.append($('<td></td>').html(prescriptionList.price+'/-'));
							 
					
								$('#invoiceTable tbody').append(tr);
							})	
							
							
				});
	  
	 
}

</script>
</body>
</html>