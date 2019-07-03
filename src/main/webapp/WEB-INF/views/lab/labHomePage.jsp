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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">


</head>         
<body>
<jsp:include page="../include/labHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Lab Dashboard</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/labLeftMenu.jsp"/> 
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
				    <div class="hospitalSec innersection lab_detl">
       <div class="">
       	<%-- <div class="col-sm-3">
        	<div class="profile_doc">
            	<a href="#" data-toggle="modal" data-target="#upload"><img src="http://166.62.32.164:8080/images/pharmacy/lab/${labDetails.photo}" class="img-responsive" alt="doc_profile"></a>
            </div>
        </div> --%>
        <div class="">
        <div class="doc_detail">
        <table border="none">
  <tr> 
    <td>Lab Name</td>
     <td style="opacity:0.4">|</td>
    <td>${labDetails.labName}</td>
  </tr>
  <tr>
    <td>Address</td>
     <td style="opacity:0.4">|</td>
    <td>${labDetails.address}-${labDetails.int3}.</td>
  </tr>
  <tr>
    <td>Email id</td>
     <td style="opacity:0.4">|</td>
    <td>${labDetails.email}</td>
  </tr>
  <tr>
    <td>Contact</td>
     <td style="opacity:0.4">|</td>
    <td>+91-${labDetails.contact}</td>
  </tr>
   
  <!--<tr>
    <td>Ratings</td>
    <td><a href="#"><span class="glyphicon glyphicon-star"></span></a> <a href="#"><span class="glyphicon glyphicon-star"></span></a> <a href="#"><span class="glyphicon glyphicon-star"></span></a> <a href="#"><span class="glyphicon glyphicon-star"></span></a> <a href="#"><span class="glyphicon glyphicon-star"></span></a> </td>
  </tr>-->
</table>
<%-- <a class="profWallet" href="${pageContext.request.contextPath}/showWalletDetails"><img src="/biocare/resources/images/wallet.png" class="img-responsive" alt="wallet"> <span>(0${walletDetails.walletAmount} Rs./-)</span></a>
       --%>
<a class="fas fa-wallet pull-right" href="${pageContext.request.contextPath}/showReferralCode/${labDetails.labId}/2"><img src="${pageContext.request.contextPath}/resources/images/refer1.png" class="img-responsive" alt="refer now"></a>      
        </div> 
        <a href="${pageContext.request.contextPath}/showEditLabProfile" data-toggle="popover" title="Edit Profile" class="bg_pop"> <div class="appoint">
				         <div class="appoint1 hvr-pulse">
				        <span class="icon-user"></span>
				        </div>
				        </div> </a>
        </div>
        
       </div>
       <div class="clearfix"></div>
       <hr>
       
       
       
      <%--  <h4 class="detlnm"> Bank Details
      
		 
         <a href="${pageContext.request.contextPath}/showAddEditLabBankDetails" data-toggle="tooltip" title="" data-original-title="edit"  style="float: right;"><span class="icon-user" style="float: right; color: #009fea; font-size: 20px"></span></a> </h4>
        
       
        
       <div class="col-sm-4 cliHoDetl">
       <p><strong>Bank Name :</strong> ${labBankAccountInfo.bankName}</p> 
        
        <p><strong>Account Holder Name :</strong> ${labBankAccountInfo.accHolderName}</p> 
      
       <p><strong>IFSC :</strong> ${labBankAccountInfo.ifscCode}</p>
     
       <p> <strong>GSTIN :</strong> ${labBankAccountInfo.gstNo}</p>
        </div>
      
       <div class="col-sm-4 cliHoDetl">
       <p><strong>Branch Name :</strong> ${labBankAccountInfo.bankBranch}</p> 
       <p><strong>Account No. :</strong> ${labBankAccountInfo.accountNo}</p> 
        <p> <strong>PAN :</strong> ${labBankAccountInfo.panNo}</p>
       </div> --%>
       
       
       
        
       
      <div class="ratings-part"> 
  <div class="row"> 
  <div class="col-sm-3">
  <p class="text-left text_ttl"><strong>Ratings :</strong></p>
   
  						    <c:forEach var = "i" begin = "1" end ="${rating}" >
               
          <a>   <span class="fa fa-star" aria-hidden="true"></span></a>
             
        </c:forEach>
       
        <c:forEach var = "i" begin ="${rating}" end ="4" >
             
          <a>  <span class="fa fa-star" aria-hidden="true" style="color:#ccc;"></span></a>
             
        </c:forEach>
   
   <h4>${rating}</h4>
   <p class="flaticon-man count-rate"> ${totalPatient}</p>
   </div>
   <div class="col-sm-9">
<div id="wrapper">
        <div class="clearfix"></div>
<div class="skill_name" id="skill_php">5</div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_php"></div>
 <div class="skill_bar_percent" id="five">${getDoctorRatingReviewCount.fivaeStar} %</div> 
</div>

<div class="skill_name" id="skill_asp">4</div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_asp"></div>
 <div class="skill_bar_percent" id="four">${getDoctorRatingReviewCount.fourStar}%</div> 
</div>

<div class="skill_name" id="skill_jsp">3</div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_jsp"></div>
 <div class="skill_bar_percent" id="three">${getDoctorRatingReviewCount.threeStar}%</div> 
</div>

<div class="skill_name" id="skill_star2">2</div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_star2"></div>
 <div class="skill_bar_percent" id="two">${getDoctorRatingReviewCount.twoStar}%</div> 
</div>

<div class="skill_name" id="skill_star1">1</div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_star1"></div>
 <div class="skill_bar_percent" id="one">${getDoctorRatingReviewCount.oneStar}%</div>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
   <div class="review_sec" >
<p class="text-left text_ttl"><strong>Reviews :</strong></p>
<%-- <ul class="demo2 doc_review" id="doctorRev">
<!-- There is a list of reviews in ajax function -->
<li class="news-item">I Recommend this doctor</li>
<li class="news-item">I Recommend this doctor</li>	 
<a href="${pageContext.request.contextPath}/showAllReviews"> View All</a>
</ul> --%>

<c:forEach items="${ratingReviews}" var = "ratingReviews" begin = "0" end ="2" >
<div class="doc-profReviews">
						<span>${ratingReviews.date}</span> 
						<div class="clearfix"></div>
						
					<p>	<c:forEach var = "i" begin = "1" end ="${ratingReviews.rating}" >
               
          <a>   <span class="fa fa-star" aria-hidden="true"></span></a>
             
        </c:forEach>
       
        <c:forEach var = "i" begin ="${ratingReviews.rating}" end ="4" >
             
          <a>  <span class="fa fa-star" aria-hidden="true" style="color:#ccc;"></span></a>
             
        </c:forEach></p>
						
   						<div class="clearfix"></div>
						<p>${ratingReviews.review}</p>
					</div>
</c:forEach>
					<c:if test="${getReviewCount>2}">
					<a href="${pageContext.request.contextPath}/showAllLabReviews"> View All</a>
					</c:if>
   </div> 
   </div> 
    
</div>

                </div>
            </div>
        </div>
    </div>
  </div>
</section>
<!-- Modal -->
<div class="modal fade uploadPic" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
   
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
<img id="myImg" src="#" class="img-responsive" alt="your image" />
 <!-- <input type='file' /> -->
  <form action="updateLabProfilePic" method="POST" enctype="multipart/form-data">
 
 <p class="text-center"><label class="custom-file-upload">
    <input type="file" name="profilePhoto" accept=".jpg, .png, .jpeg"/>
    <i class="glyphicon glyphicon-open-file"></i>Select Photo
</label></p>
      </div>
      <div class="modal-footer">
        <p class="text-center"><button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Done</button></p>
        </form>
      </div> 
    </div>
  </div>
</div>
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 


<div id="onloadModal" class="modal fade onloadModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body text-center">
      <h5>Your Account is Expired Within</h5>
        <div id="clockdiv" class="clockdiv">
			  <div>
			    <span class="days" id="remainDays"></span>
			    <div class="smalltext" >Days</div>
			  </div>
			<!--   <div>
			    <span class="hours"></span>
			    <div class="smalltext">Hours</div>
			  </div>
			  <div>
			    <span class="minutes"></span>
			    <div class="smalltext">Minutes</div>
			  </div>
			  <div>
			    <span class="seconds"></span>
			    <div class="smalltext">Seconds</div>
			  </div> -->
			</div>
			<div class="clearfix"></div>
			<a type="button" class="btn-fr-all" href="${pageContext.request.contextPath}/showLabSuscriptionPage">Renew Account</a>
      </div>
      <div class="modal-footer">
      	
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
    </div>
 
  </div>
</div>
		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

 <script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

$(document).ready(function(){
	
	var five=document.getElementById("five").innerHTML;
	var four=document.getElementById("four").innerHTML;
	var three=document.getElementById("three").innerHTML;
	var two=document.getElementById("two").innerHTML;
	var one=document.getElementById("one").innerHTML;

	$("#skillbar_php").animate({width:five},1500);
	$("#skillbar_asp").animate({width:four},1500);
	$("#skillbar_jsp").animate({width:three},1500);
	$("#skillbar_star2").animate({width:two},1500);
	$("#skillbar_star1").animate({width:one},1500);


	});
$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
        }
    });
});

function imageIsLoaded(e) {
    $('#myImg').attr('src', e.target.result);
};	


</script>
<script>

var endtime="<c:out value="${getExpiryDate}"/>"; 

var expireDay = endtime.substring(0, 2);

var d = new Date();

var remainDay=expireDay-d.getDate();

if(remainDay==0){
	
	document.getElementById("remainDays").innerHTML="Your account is going to expire today."; 	
	
}else{
document.getElementById("remainDays").innerHTML=remainDay; 
}


var subscriptionEndAlert = "<c:out value="${subscriptionAlertStart}"/>";
$(window).load(function(){        
	
	
	if(subscriptionEndAlert=='0'){ 
	  
		$('#onloadModal').modal('show');
		
	 }
	    });

</script>
</body>
</html>