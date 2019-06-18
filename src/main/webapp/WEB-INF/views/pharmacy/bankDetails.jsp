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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">


</head>         
<body>
<jsp:include page="../include/pharmacyHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Pharmacy Dashboard</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/pharmacyLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
       <h4 class="detlnm"> 
         <a href="${pageContext.request.contextPath}/showAddEditPharmacyBankDetails" data-toggle="tooltip" title="" data-original-title="edit">Edit <span class="icon-user" style="color: #009fea; font-size: 20px"></span></a> </h4>
         <div class="cliHoDetl">
       <p><strong>Bank Name :</strong> ${pharmacyBankAccountInfo.bankName}</p> 
        
        <p><strong>Account Holder Name :</strong> ${pharmacyBankAccountInfo.accHolderName}</p> 
      
       <p><strong>IFSC :</strong> ${pharmacyBankAccountInfo.ifscCode}</p>
     
       <p> <strong>GSTIN :</strong> ${pharmacyBankAccountInfo.gstNo}</p>
       <p><strong>Branch Name :</strong> ${pharmacyBankAccountInfo.bankBranch}</p> 
       <p><strong>Account No. :</strong> ${pharmacyBankAccountInfo.accountNo}</p> 
        <p> <strong>PAN :</strong> ${pharmacyBankAccountInfo.panNo}</p>
        </div>
      
      
       
         
    </div>       
     </div>     
             </div>
         </div>
        </div>
</section>

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
			<a type="button" class="btn-fr-all" href="${pageContext.request.contextPath}/showPharmacySuscriptionPage">Renew Account</a>
      </div>
      <div class="modal-footer">
      	
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
    </div>
 
  </div>
</div>

<!-- Modal -->
<div class="modal fade uploadPic" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
   
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
<img id="myImg" src="#" class="img-responsive" alt="your image" />
 <!-- <input type='file' /> -->
  <form action="updatePharmacyProfilesPic" method="POST" enctype="multipart/form-data">
 <p class="text-center"><label class="custom-file-upload">
    <input type="file" name="profilePhoto" accept=".jpg, .png, .jpeg"/>
    <i class="glyphicon glyphicon-open-file"></i>Select Photo
</label></p>
      </div>
      <div class="modal-footer">
        <p class="text-center"><button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Done</button></p>
      </div> 
    </div>
  </div>
</div>
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 

		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'>
</script>
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

</script>
<script>
//14-04-2018
$(".demo2").bootstrapNews({
            newsPerPage: 2,
            autoplay: true,
			pauseOnHover: true,
			navigation: false,
            direction: 'down',
            newsTickerInterval: 1500,
            onToDo: function () {
                //console.log(this);
            }
        });
        
$(document).ready(function(){
	
	$("#skillbar_php").animate({width:'85%'},1500);
	$("#skillbar_asp").animate({width:'55%'},1500);
	$("#skillbar_jsp").animate({width:'75%'},1500);
	$("#skillbar_star2").animate({width:'45%'},1500);
	$("#skillbar_star1").animate({width:'25%'},1500);


	});

function getDoctorRatingDetails()
{
	 
	
	$
	.getJSON(
			'${getRatingAndReviewsDetailsOfDoctor}',

			{
			 
				ajax : 'true'

			},
			function(data) {
				
				var len=data.ratingDetails.length;
				var strVar="";
				$(document).ready(function(){
					
					$("#skillbar_php").animate({width:data.fivaeStar+"%"},1500);
					$("#skillbar_asp").animate({width:data.fourStar+"%"},1500);
					$("#skillbar_jsp").animate({width:data.threeStar+"%"},1500);
					$("#skillbar_star2").animate({width:data.twoStar+"%"},1500);
					$("#skillbar_star1").animate({width:data.oneStar+"%"},1500);
					document.getElementById("five").innerHTML=data.fivaeStar+"%";
					document.getElementById("four").innerHTML=data.fourStar+"%";
					document.getElementById("three").innerHTML=data.threeStar+"%";
					document.getElementById("two").innerHTML=data.twoStar+"%";
					document.getElementById("one").innerHTML=data.oneStar+"%";
					});
				
				for (var i = 0; i < len; i++) {
				strVar = '<div class="item">'+
				'        <div class="doc_review">'+
				'            <p>'+data.ratingDetails[i].review+ ' </p>'+
				'        </div>'+
				'        </div>'; 
					
				}
				$('#doctorRev').append($(strVar));
			});
	} 




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

var expireDay = endtime.slice(-2);

var d = new Date();

var remainDay=expireDay-d.getDate();


document.getElementById("remainDays").innerHTML=remainDay; 
 

var subscriptionEndAlert = "<c:out value="${subscriptionAlertStart}"/>";
$(window).load(function(){        
	
	
	if(subscriptionEndAlert=='0'){ 
	  
		$('#onloadModal').modal('show');
		
	 }
	    });

</script>

</body>
</html>