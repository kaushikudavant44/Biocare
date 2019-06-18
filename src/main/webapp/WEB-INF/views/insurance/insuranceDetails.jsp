<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="${pageContext.request.contextPath}/resources/text/css" href="css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body>
<jsp:include page="../include/patientHeader.jsp" />  

<div class="header">
<!-- Carousel================================================== -->
<%-- <div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/buy_innsurance.jpg" alt="health care">
    </div>
  </div>
 </div> --%>
<!-- /.carousel --> 
</div>
<div class="clearfix"></div>
<section class="inssurance_buy">
	<div class="container">
    <div class="row">
    	 <div class="top_blk">
            <table class="app_id">
  <tr>
    <th scope="row">Claim</th>
    <td>0000000000000</td>
  </tr>
  <tr>
    <th scope="row">Status</th>
    <td>Your health care insurance is complete. Please make the payment due.</td>
  </tr>
</table>

        </div>
        <div class="clearfix"></div>
        <hr>
        <div class="form_check app_detail">
        	
                <ul class="list-group col-xs-12 col-sm-12 col-md-12">
                    <li class="list-group-item list-head">Policy Details	</li>
                    <li class="list-group-item payment-summary-name"><label class="ps-icon6">Type of Insurance</label><p class="right_prt"><span class="text-uppercase">Health Insurance</span></p></li>
                    <li class="list-group-item"><label class="ps-icon6">Premium (Annual)</label><p class="right_prt"><span>${getInsuranceDetailsPolicyAfterBuy.premium}</span></p></li>
                    <li class="list-group-item"><label class="ps-icon7">Family member</label><p class="right_prt"></p>
                    
  <table>
    
  <tr>
    <td>Sr. no.</td>
    <td>Name</td>
    <td>Relation</td>
    <td>Policy No.</td>
  </tr>
 <c:forEach items="${getInsuranceDetailsPolicyAfterBuy.adultMemberList}" var="adultMemberList">

  <tr>
    <td>1</td>
    <td>${adultMemberList.adultFirstName}</td>
    <td>${adultMemberList.proposerRelation}</td>
     <td>${adultMemberList.policyNo}</td>  
  </tr>
  </c:forEach>
 <c:forEach items="${getInsuranceDetailsPolicyAfterBuy.childMemberList}" var="childMemberList">
  <tr>
    <td>1</td>
    <td>${childMemberList.childFname}</td>
    <td>${childMemberList.relationWithProposer}</td>
    <td>${childMemberList.policyNo}</td>  
  </tr>
  </c:forEach> 
  
</table>
					
                    </li>
                     <li class="list-group-item list-head">Proposer Details	</li>
                    <li class="list-group-item"><label class="ps-icon8">Application Id</label><p class="right_prt"><span>${getInsuranceDetailsPolicyAfterBuy.registrationId}</span></p></li>
                    <li class="list-group-item"><label class="ps-icon8">Due date</label><p class="right_prt"><span>${getInsuranceDetailsPolicyAfterBuy.dueDate}</span></p></li>
                </ul>
                
    		</div>
    	</div>
    </div>
</section>

             <div class="clearfix"></div>
<jsp:include page="../include/footer.jsp" />  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
</body>
</html>
