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

</head> 
<body>
<jsp:include page="../include/patientHeader.jsp" />  

<div class="header">
<!-- Carousel================================================== -->
		<!--<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
 
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="images/banner1.png" alt="health care">
    </div>
    <div class="item"> <img class="first-slide" src="images/banner1.png" alt="health care"></div>
    <div class="item"> <img class="first-slide" src="images/banner1.png" alt="health care"></div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>-->
<!-- /.carousel --> 
</div>
<div class="clearfix"></div>
<section class="premiumSec">
	<div class="container">
    	<div class="premium_blk1">
   		 <div class="top_blk">
        	<img src="${pageContext.request.contextPath}/resources/images/premium_logo.jpg" class="img-responsive" alt="premium logo">
            <h5>Health insurance</h5>
            <hr> 
            <table class="health-insurance-values">
            <tbody>
            <tr>
                <th>No. of Adult</th>
                <th>No. of Children</th>
                <th>Age of Eldest Member</th>
                <th>Sum Insured</th>
                <th>Premium</th>
            </tr>
            
            
            
         
           <tr>
                <td data-th="No. of Adult">${proposerDetails.noOfAdult }</td>
                <td data-th="No. of Children">${proposerDetails.noOfChildren }</td>
                <td data-th="Age of Eldest Member"> ${proposerDetails.eldestMemberAge }</td>
                <td data-th="Sum Insured" class="formatAmount">
                    <span class="euro">
                       <span> ₹ ${proposerDetails.cover } </span>
                        </span>
                </td>
                <td data-th="Premium" class="formatDouble"><span class="euro">₹ ${proposerDetails.premium }</span></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="clearfix"></div>
        <hr>
        <div class="form_check">
        	<div class="row">
        	
   
                <ul class="list-group col-xs-12 col-sm-12 col-md-12">
                    <li class="list-group-item list-head">Proposer Details	</li>
                    <li class="list-group-item payment-summary-name"><label class="ps-icon6"><i class="glyphicon glyphicon-user"></i> &nbsp;Name</label><p class="right_prt"><span class="text-uppercase">${proposerDetails.proposerFirstName} ${proposerDetails.proposerMiddleName} ${proposerDetails.proposerLastName}  </span> <!-- <a href="#"><i class="glyphicon glyphicon-pencil"></i></a> --></p></li>
                    <li class="list-group-item"><label class="ps-icon6"><i class="glyphicon glyphicon-phone"></i>&nbsp;Mobile no</label><p class="right_prt"><span>${proposerDetails.proposerContactNo }  </span><!-- <a href="#"><i class="glyphicon glyphicon-pencil"></i></a> --></p></li>
                    <li class="list-group-item"><label class="ps-icon7"><i class="glyphicon glyphicon-envelope"></i> &nbsp;Email</label><p class="right_prt"><span>${proposerDetails.proposerEmailId }  </span><!-- <a href="#"><i class="glyphicon glyphicon-pencil"></i></a> --></p></li>
                    <li class="list-group-item"><label class="ps-icon8"><i class="glyphicon glyphicon-home"></i>&nbsp;Address</label><p class="right_prt"><span class="text-uppercase">${proposerDetails.proposerPermanentAddress} ${proposerDetails.proposerPermanentPinCode}</span><!-- <a href="#"><i class="glyphicon glyphicon-pencil"></i></a> --></p></li>
                </ul>
                <ul class="list-group col-xs-12 col-sm-12 col-md-12">
                    <li class="list-group-item list-head">Insured Details</li>
                    <li class="list-group-item"><table class="health-insurance-values">
                    <tbody>
                    <tr>
                        <th>Insured Full Name</th>
                        <th>Date of Birth</th>
                        <th>Relation to the proposer</th>
                    </tr>
                    	<c:forEach items="${adultMemberList}" var="adultMember" >
                   <tr>
                        <td data-th="Insured Full Name">${adultMember.adultFirstName} ${adultMember.adultMiddleName} ${adultMember.adultLastName}</td>
                        <td data-th="Date of Birth">${adultMember.adultDob}</td>
                        <td data-th="Relation to the proposer"> ${adultMember.proposerRelation}</td>
                        </tr>
                        </c:forEach>
                        <c:forEach items="${childMemberDetailsList}" var="childMemberDetailsList" varStatus="count">
                   <tr>
                        <td data-th="Insured Full Name">${childMemberDetailsList.childFname} ${childMemberDetailsList.childMname} ${childMemberDetailsList.childLname}</td>
                        <td data-th="Date of Birth">${childMemberDetailsList.dob}</td>
                        <td data-th="Relation to the proposer"> ${childMemberDetailsList.relationWithProposer}</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table></li>
                </ul>
    		</div>
    	</div>
        <div class="terms_blk">
        <div class="row">
        <div class="col-sm-6">
        	<p class="text-left"><span class="glyphicon glyphicon-chevron-left"></span> <a href="#" onclick="window.history.back();" class="terms">go back/ Edit</a></p>
            </div>
            <div class="col-sm-6">
             <p class="text-right"><a data-toggle="modal" data-target="#exampleModal" class="terms" href="#">
  I accept terms & condition
</a></p>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><strong>Terms and Conditions</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is <br/>
      simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
       <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
       <hr>
       <p class="text-center"><input type="checkbox" id="termsAndCondition"   > I accept terms & condition</p>
      </div>
    </div>
  </div>
</div>
            </div>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/showCheckOutpage" method="post">
             <p class="text-center"> 
     <!--    <a href="#"><button class="editBtn" value="Edit" onclick="window.history.back();" >Edit</button></a> -->
         <button class="confirmDisabledBtn" type="submit" id="confirmBtn" value="Submit" disabled="disabled">Confirm</button> 
         </p>
         </form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script>
  $('#datetimepicker1').datetimepicker({ format: 'DD/MM/YYYY' });
  $('.adult_b').datetimepicker({ format: 'DD/MM/YYYY' });
  function validateForm() {
    var x = document.forms["myForm"]["fname"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
}
	
  
</script>


<script type="text/javascript">

$('#termsAndCondition').mousedown(function() {
    if (!$(this).is(':checked')) {
    	
    	document.getElementById('confirmBtn').disabled=false;
    	$("#confirmBtn").removeClass("confirmDisabledBtn").addClass("confirmBtn");
    	
       // this.checked = confirm("Are you sure?");
       // $(this).trigger("change");
    }
    else{
    	document.getElementById('confirmBtn').disabled=true;
    	$("#confirmBtn").removeClass("confirmBtn").addClass("confirmDisabledBtn");
    	
    }
});

</script>
</body>
</html>
