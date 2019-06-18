<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0052)https://getbootstrap.com/docs/3.3/examples/carousel/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
    <title>STEM CELL</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <script src="./Carousel Template for Bootstrap_files/ie-emulation-modes-warning.js.download"></script>
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
  </head>
<!-- NAVBAR  
================================================== -->
  <body>
   <jsp:include page="../include/stemcellHeader.jsp" /> 
<section class="stemcells_buy">
<h5>Stemcells &nbsp; Details</h5>
<form action="${pageContext.request.contextPath}/showViewPatientDetailsStemCell" method="POSt">
	<div class="container">
    	<div class="row">
    	<c:forEach items="${getPatientEnrollDetailsList}" var = "getPatientEnrollDetailsList"> 
        	<div class="col-sm-4">
            	<div class="stemcell_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/det_icon.jpg" class="img-responsive"> 
                    <h4>Life cell</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Company name :</strong> Life-Cell</li>
                        <li><strong>${getPatientEnrollDetailsList.planName} :</strong> ${getPatientEnrollDetailsList.planCost}</li>
                    </ul>
                    <p><a href="#" class="insurance_btn" data-toggle="modal" data-target="#bs-example-modal-lg${getPatientEnrollDetailsList.patientenrollId}">View Details</a></p>
                </div>
            </div>
           
<div class="modal fade" id="bs-example-modal-lg${getPatientEnrollDetailsList.patientenrollId}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content enroll_sec">
     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      
      <div class="detail_enroll">
     
            <div class="col-sm-12">
        <div class="col-sm-4"> <label for="sel1">
StemCell-Registered Date :</label></div>
         <div class="col-sm-8 text-center"> <p>${getPatientEnrollDetailsList.date}</p></div>
         </div>
            <div class="col-sm-12">
        <div class="col-sm-4"> <label for="sel1">
StemCell-Registered Time :</label></div>
         <div class="col-sm-8 text-center"> <p>${getPatientEnrollDetailsList.time}</p></div>
         </div>
            <div class="col-sm-12">
        <div class="col-sm-4"> <label for="sel1">
Patients Expetced-Delivery Date :</label></div>
         <div class="col-sm-8 text-center"> <p>${getPatientEnrollDetailsList.expectedDeliveryDate}</p></div>
         </div>
            <div class="col-sm-12">
        <div class="col-sm-4"> <label for="sel1">
StemCell-Plan Type :</label></div>
         <div class="col-sm-8 text-center"> <p>${getPatientEnrollDetailsList.planType}</p></div>
         </div>
           <div class="col-sm-12">
        <div class="col-sm-4"> <label for="sel1">
StemCell-Plan Cost :</label></div>
         <div class="col-sm-8 text-center"> <p>${getPatientEnrollDetailsList.planCost}</p></div>
         </div>
         </div>
        
    </div>
  </div>
  </div>
  </c:forEach>  
   
           <%--  <div class="col-sm-4">
            	<div class="stemcell_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/det_icon.jpg" class="img-responsive"> 
                    <h4>health care</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Company name :</strong> Stemcells</li>
                        <li><strong>plan1 :</strong> 16000/-</li>
                    </ul>
                    <p><a href="insurance_detail.html" class="insurance_btn">View Details</a></p>
                </div>
            </div>
            <div class="col-sm-4">
            	<div class="stemcell_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/det_icon.jpg" class="img-responsive"> 
                    <h4>health care</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Company name :</strong> Stemcells</li>
                        <li><strong>plan1 :</strong> 16000/-</li>
                    </ul>
                    <p><a href="insurance_detail.html" class="insurance_btn">View Details</a></p>
                </div>
            </div>
            <div class="clearfix"></div>
            <hr>
            <div class="col-sm-4">
            	<div class="stemcell_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/det_icon.jpg" class="img-responsive"> 
                    <h4>health care</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Company name :</strong> Stemcells</li>
                        <li><strong>plan1 :</strong> 16000/-</li>
                    </ul>
                    <p><a href="insurance_detail.html" class="insurance_btn">View Details</a></p>
                </div>
            </div>
            <div class="col-sm-4">
            	<div class="stemcell_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/det_icon.jpg" class="img-responsive"> 
                    <h4>health care</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Company name :</strong> Stemcells</li>
                        <li><strong>plan1 :</strong> 16000/-</li>
                    </ul>
                    <p><a href="insurance_detail.html" class="insurance_btn">View Details</a></p>
                </div>
            </div>
            <div class="col-sm-4">
            	<div class="stemcell_blk">
                	<img src="${pageContext.request.contextPath}/resources/images/det_icon.jpg" class="img-responsive"> 
                    <h4>health care</h4>
                    <div class="border_btm"></div>
                    <ul class="buy_details">
                    	<li><strong>Company name :</strong> Stemcells</li>
                        <li><strong>plan1 :</strong> 16000/-</li>
                    </ul>
                 
                    <p><a href="insurance_detail.html" class="insurance_btn">View Details</a></p>
                </div>
            </div> --%>
        </div>
    </div>
    </form>
</section>
<!-- FOOTER -->
<jsp:include page="../include/stemcellFooter.jsp" /> 
<!-- Bootstrap core JavaScript
 ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/holder.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>