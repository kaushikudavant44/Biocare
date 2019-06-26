<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<link href="${pageContext.request.contextPath}/resources/css/alertify.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">


</head>         
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 


<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />

  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Doctor Profile</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
        
       
        	<jsp:include page="../include/leftmenu.jsp"/>
             
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
				       <div class="col-sm-12">
				       	<div class="col-sm-2 text-center"> 
				        	<div class="profile_doc"> <!-- id="docImage" -->
				        	<a href="#" data-toggle="modal" data-target="#myModal" class="profilePic"><img class="img-responsive" alt="doc_profile" src="${getDoctorProfile.profilePhoto}"></a>
				            <img src="${pageContext.request.contextPath}/resources/images/verifd.png" class="img-responsive verifd" alt="verified">
				             <img src="${getDoctorProfile.signature}" style="width: 147px;height: 87px;" class="img-responsive" alt="sign"> 
				            </div>
				            <%-- <img src="166.62.32.164:8080/biocare/${getDoctorProfile.fName}" class="img-responsive verifd" alt="verified"> --%>
				            <div class="clearfix"></div>
				            <i class="verifd-nm">Verified Doctor</i>
				            <div class="clearfix"></div>
				            <i class="verifd-nm1">Click on photo for upload new Profile Pic</i>
				        </div>
				        <div class="col-sm-10">
				        <div class="doc_detail">
				        <table border="none">
				  <tr>
				    <td>Name</td>
				     <td style="opacity:0.4">|</td>
				    <td><span id="docName">${getDoctorProfile.fName} ${getDoctorProfile.mName} ${getDoctorProfile.lName}</span></td>
				  </tr>
				  <tr>
				  <tr>
				    <td>Speciality</td>
				     <td style="opacity:0.4">|</td>
				    <td id="specialist"><strong>${getDoctorProfile.specType}</strong></td>
				  </tr>
				  
				  <tr>
				    <td>Address</td>
				    <td style="opacity:0.4">|</td>
				    <td id="address">${getDoctorProfile.address}</td>
				  </tr>
				  <tr>
				    <td>City</td>
				     <td style="opacity:0.4">|</td>
				    <td id="docCity">${getDoctorProfile.cityName}</td>
				  </tr>
				  <tr>
				    <td>Email Id</td>
				    <td style="opacity:0.4">|</td>
				    <td id="docMail">${getDoctorProfile.email}</td>
				  </tr>
				  <tr>
				    <td>Contact</td>
				     <td style="opacity:0.4">|</td>
				    <td id="phoneNo"><a href="${getDoctorProfile.contactNo}">${getDoctorProfile.contactNo}</a></td>
				  </tr>
				</table>
				<%-- <a class="fas fa-wallet profWallet" href="${pageContext.request.contextPath}/showWalletDetails"><img src="/biocare/resources/images/wallet.png" class="img-responsive" alt="wallet"><span>(0${walletDetails.walletAmount} Rs./-)</span></a> --%>
				<a  href="#passwordModel" data-toggle="modal" class="profWallet"><span>Change Profile Password</span></a>
				
				<a class="fas fa-wallet pull-right" href="${pageContext.request.contextPath}/showReferralCode/${getDoctorProfile.doctorId}/0"><img src="${pageContext.request.contextPath}/resources/images/refer1.png" class="img-responsive" alt="refer now"></a>   
				        </div>
				       <a href="${pageContext.request.contextPath}/showUpdateDoctorProfile" data-toggle="popover" title="Edit Profile" class="bg_pop"> <div class="appoint">
				         <div class="appoint1 hvr-pulse">
				        <span class="icon-user"></span>
				        </div>
				        </div> </a>
				        </div>
				        </div>
      
       <div class="clearfix"></div>
       <hr>
       <div class="text-left">
       <h3 id="doctorName1"><strong class="doc-prof-heading"> Profile Info </strong></h3>
        
       <p id="docInfo"></p>
       <hr>
      <%--  <h4>Speciality</h4>
       <ul class="list1">
       	<li class="hvr-forward" id="specialist">${getDoctorProfile.specType}</li>
       <!--  <li class="hvr-forward">Surgeon</li>
        <li class="hvr-forward">Rehabilitation</li> -->
       </ul>
       <hr> --%>
       <h4 class="prof-sub-heading">Experience</h4>
       <ul class="list1">
       	<li class="hvr-forward" id="experience">${getDoctorProfile.yearOfExperience} Years of Experience</li>
 <!--        <li class="hvr-forward">15years of experience in Surgeon</li> -->
       </ul>
       <hr>
       <h4 class="prof-sub-heading">Education</h4>
       <p class="hvr-forward" id="education">${getDoctorProfile.qualification}</p>
       <!-- <p class="hvr-forward">Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
       --> <hr>
       <h4 class="prof-sub-heading">About me</h4>
       <p class="hvr-forward" id="aboutMe">${getDoctorProfile.aboutMe}</p>
       
         
       
      
       <div class="clearfix"></div>
       
       <hr>
       <h4 class="detlnm"> Clinic Details
      <a href="${pageContext.request.contextPath}/showClinicPage" data-toggle="tooltip" title="" data-original-title="edit"><span class="icon-user" style=" color: #009fea; font-size: 19px; margin-left: 10px"></span></a> 
		<c:if test="${noHospitalFound==2}">
       <a href="${pageContext.request.contextPath}/showClinicDelete" data-toggle="tooltip" title="" data-original-title="Delete"><span class="icon-rubbish-bin" style="color: #009fea; font-size: 18px; margin-left:10px"></span></a>
		</c:if>
       <a href="${pageContext.request.contextPath}/showInsertClinicPage" data-toggle="tooltip" title="" data-original-title="Add clinic"><span class="icon-plus-black-symbol" style="color: #009fea; font-size: 18px; margin-left:10px"></span></a>
         </h4>
       <c:forEach items="${hospitalDetails}" var="hospitalDetails">
       
       <c:if test="${hospitalDetails.type==0}">
       <div class="col-sm-4 cliHoDetl">
       <p><strong>Clinic Name :</strong> ${hospitalDetails.hospitalName}</p> 
      <p><strong>Contact No. :</strong> ${hospitalDetails.contactNo}</p> 
       <p><strong>Email Id :</strong> ${hospitalDetails.email}</p>
      <p> <strong>Address :</strong> ${hospitalDetails.address}</p>
        </div>
        </c:if>
     
     
       </c:forEach>
      
       <div class="clearfix"></div>
       
       
      
       
       
          <hr>
        <h4 class="detlnm"> Hospital Details
        <c:if test="${noHospitalFound==2}">
         <a href="${pageContext.request.contextPath}/showHospitalDelete" data-toggle="tooltip" title="" data-original-title="Delete"><span class="icon-rubbish-bin" style="color: #009fea; font-size: 18px; margin-left:10px"></span></a>
        </c:if>
        <a href="${pageContext.request.contextPath}/showAddHospital" data-toggle="tooltip" title="" data-original-title="Add Hospital"><span class="icon-plus-black-symbol" style="color: #009fea; font-size: 20px; margin-left:10px"></span></a>
      
       <%-- <a href="${pageContext.request.contextPath}/showEditHospital" data-toggle="tooltip" title="" data-original-title="edit"  style="float: right;"><span class="flaticon-user" style="float: right; color: #009fea; font-size: 20px"></span></a> --%></h4>
       <c:forEach items="${hospitalDetails}" var="hospitalDetails">
     	<c:if test="${hospitalDetails.type==1}">
     	<div class="col-sm-4 cliHoDetl">
       <p><strong>Hospital Name :</strong> ${hospitalDetails.hospitalName} <br>
      <strong>Contact No. :</strong> ${hospitalDetails.contactNo} <br>
       <strong>Email Id :</strong> ${hospitalDetails.email}<br>
       <strong>Address :</strong> ${hospitalDetails.address}</p>
       </div>
      
       </c:if>
       
       </c:forEach>
       <div class="clearfix"></div>
       
       <hr>
       <!-- <h4>Award & recognition</h4>
       <ul class="list1">
       	<li class="hvr-forward">Lorem Ipsum is simply dummy text of the printing</li>
        <li class="hvr-forward">Best award for Surgeon</li>
       </ul> -->
       </div>
 
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
   <p class="icon-specialist-user count-rate"> ${totalPatient}</p>
   </div>
   <div class="col-sm-9">
<div id="wrapper">
        <div class="clearfix"></div>
<div class="skill_name" id="skill_php">5</div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_php"></div>
 <div class="skill_bar_percent" id="five">${getDoctorRatingReviewCount.fivaeStar}%</div> 
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


<c:forEach items="${ratingReviews}" var = "ratingReviews" begin = "0" end ="2" >
<div class="doc-profReviews">
						<span>${ratingReviews.createDate}</span> 
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
					<a href="${pageContext.request.contextPath}/showAllDoctorReviews"> View All</a>
					</c:if>
   </div> 
   </div>
   
              
    
   
             </div>
         </div>
  </div>
 </div>
 </div>
</section>


<div id="passwordModel" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog" >
			<div class="modal-dialog modal-md modal-sm" style="width:25%;margin-top:10%">
				<div class="modal-content">
				  <form action="${pageContext.request.contextPath}/changeDoctorProfilePassword" method="post">  
					<div class="modal-header">
						<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->
						<h4 class="modal-title"  align="center">  Profile Login</h4>
					</div>
					<div class="modal-body">
					<p id="errormessage"  style="color:red; position:absolute; text-align:center; margin-bottom: 10px" maxlength="20">${msg}</p>
						
						Profile Password  <input type="password" id="LogInPasswors" name="password" placeholder="password" class="form-control" required>
					 
					</div>
					<div class="modal-footer" >
					<div align="center"> 
						 
						
						<input type="button" class="btn btn-warning"value="Cancel" onclick="cancelChangePassword()"/>
						<input type="submit" class="btn btn-success"value="Submit" />
							</div> 
							 
					</div>
					 
				 </form>  
				</div>
			</div> 
		</div>
		
		
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
			<a type="button" class="btn-fr-all" href="${pageContext.request.contextPath}/showDoctorSuscriptionPage">Renew Account</a>
      </div>
      <div class="modal-footer">
      	
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
    </div>
 
  </div>
</div>


<!-- Modal -->
<div class="modal fade uploadPic" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
   
      <div class="modal-body text-center">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
<img id="myImg" src="#" class="img-responsive" alt="your image" />
<div class="clearfix"></div>
<i class="verifd-nm1">Dimension: 200 X 200</i>
<div class="clearfix"></div>
<i class="verifd-nm1">Size of Image: Minimum 10 KB - Maximum 300 KB</i>
<div class="clearfix"></div>
<i class="verifd-nm1">Image Format: JPEG, JPG</i>
 <!-- <input type='file' /> -->
 <form action="${pageContext.request.contextPath}/updateDoctorProfilesPhoto" enctype="multipart/form-data" method="POST">
 <p class="text-center"><label class="custom-file-upload">
    <input type="file" name="profilePhoto"/>
    <i class="glyphicon glyphicon-open-file"></i>Select Photo
</label></p>
      </div>
      <div class="modal-footer">
        <p class="text-center"><button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary" accept=".jpg, .png, .jpeg" >Done</button></p>
       </form>
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
<script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<!-- new alert -->
<script src="${pageContext.request.contextPath}/resources/js/alertify.min.js"></script> 
	
<!-- new alert  -->


<script>




 

  

 /* $('#onloadModal').modal('show');  */

$("#hide").click(function(){
    $(".doc-Reviewshide").css('display', 'block');
 });

 /*     */
/* sticky notes*/
(function($)
{
    /**
     * Auto-growing textareas; technique ripped from Facebook
     *
     * https://github.com/jaz303/jquery-grab-bag/tree/master/javascripts/jquery.autogrow-textarea.js
     */
    $.fn.autogrow = function(options)
    {
        return this.filter('textarea').each(function()
        {
            var self         = this;
            var $self        = $(self);
            var minHeight    = $self.height();
            var noFlickerPad = $self.hasClass('autogrow-short') ? 0 : parseInt($self.css('lineHeight')) || 0;

            var shadow = $('<div></div>').css({
                position:    'absolute',
                top:         -10000,
                left:        -10000,
                width:       $self.width(),
                fontSize:    $self.css('fontSize'),
                fontFamily:  $self.css('fontFamily'),
                fontWeight:  $self.css('fontWeight'),
                lineHeight:  $self.css('lineHeight'),
                resize:      'none',
                'word-wrap': 'break-word'
            }).appendTo(document.body);

            var update = function(event)
            {
                var times = function(string, number)
                {
                    for (var i=0, r=''; i<number; i++) r += string;
                    return r;
                };

                var val = self.value.replace(/</g, '&lt;')
                                    .replace(/>/g, '&gt;')
                                    .replace(/&/g, '&amp;')
                                    .replace(/\n$/, '<br/>&nbsp;')
                                    .replace(/\n/g, '<br/>')
                                    .replace(/ {2,}/g, function(space){ return times('&nbsp;', space.length - 1) + ' ' });

                // Did enter get pressed?  Resize in this keydown event so that the flicker doesn't occur.
                if (event && event.data && event.data.event === 'keydown' && event.keyCode === 13) {
                    val += '<br />';
                }

                shadow.css('width', $self.width());
                shadow.html(val + (noFlickerPad === 0 ? '...' : '')); // Append '...' to resize pre-emptively.
                $self.height(Math.max(shadow.height() + noFlickerPad, minHeight));
            }

            $self.change(update).keyup(update).keydown({event:'keydown'},update);
            $(window).resize(update);

            update();
        });
    };
})(jQuery);


var noteTemp =  '<div class="note">'
				+	'<a href="javascript:;" class="button remove">X</a>'
				+ 	'<div class="note_cnt">'
				+		'<textarea class="title" placeholder="Enter note title"></textarea>'
				+ 		'<textarea class="cnt" placeholder="Enter note description here"></textarea>'
				+	'</div> '
				+'</div>';

var noteZindex = 1;
function deleteNote(){
    $(this).parent('.note').hide("puff",{ percent: 133}, 250);
};

function newNote() {
  $(noteTemp).hide().appendTo("#board").show("fade", 300).draggable().on('dragstart',
    function(){
       $(this).zIndex(++noteZindex);
    });
 
	$('.remove').click(deleteNote);
	$('textarea').autogrow();
	
  $('.note')
	return false; 
};



$(document).ready(function() {
    
    $("#board").height($(document).height());
    
    $("#add_new").click(newNote);
    
    $('.remove').click(deleteNote);
    newNote();
	  
    return false;
});
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

<script type="text/javascript">
		
		

		
		$(document).ready(function() {

		    $('.datepicker').datepicker({
		        format: 'dd-mm-yyyy'
		    });
		});
		
		
	 </script>

<script type="text/javascript">




function openPage(pageUrl)
{
	 window.open("${pageContext.request.contextPath}/"+pageUrl,'_top');
	
	}
	
/* function getDoctorProfile()
{
	
	
	$
	.getJSON(
			'${showDoctorProfile}',

			{
			 
				  
				ajax : 'true'

			},
			function(data) {
				alert(data.fName);
				document.getElementById("docName").innerHTML='Dr. '+data.fName+' '+data.mName+' '+data.lName;
				 document.getElementById("address").innerHTML=data.address+"-"+data.int2;
				 document.getElementById("docCity").innerHTML=data.cityName;
				document.getElementById("docMail").innerHTML=data.email;
				document.getElementById("phoneNo").innerHTML=data.contactNo;
				/* document.getElementById("doctorName1").innerHTML='Dr. '+data.fName+' '+data.lName; */
				 /* document.getElementById("docInfo").innerHTML=data.aboutMe; 
				 document.getElementById("docImage").src="http://166.62.32.164:8080/images/doctor/"+data.profilePhoto;
				 document.getElementById("specialist").innerHTML=data.specType; 
				 document.getElementById("education").innerHTML=data.qualification+'<br/><b>From : </b>'+data.college+'.<br/><b> Passing year :</b> '+data.passingYear+'.'; 
				 document.getElementById("experience").innerHTML=data.yearOfExperience+" year."; 
				
				
			});
	} */
	$("#hide").click(function(){
	    $(".doc-profReviewshide").hide();
	});

	$("#show").click(function(){
	    $(".doc-profReviewshide").show();
	});


function validateDocPassword()
{
	
	var password= document.getElementById("validatePwd").value;
	

	 if(password!="" && password!=null)
		 {
			
	  $
		.getJSON(
				'${passwordDocValidation}',
				{
					password : password,
					
					ajax : 'true'
				},
				function(data) {
					
					if(data.message=="failed")
					{
					alert("wrong old password");
						location.reload();
					}
					else
						{
						changeDocPassword();
						}

					
				});
		 }
	 else
		 {
		 alert("Please Enter Old Password");
		 }
}

function changeDocPassword()
{
	
	var newPassword= document.getElementById("newPassword").value;
	
	 if(newPassword!="" && newPassword!=null)
		 {
		 alert("newPassword:"+newPassword);
	  $
		.getJSON(
				'${changeDoctorPassword}',
				{
					newPassword : newPassword,
					
					ajax : 'true'
				},
				function(data) {
					
					window.open("${pageContext.request.contextPath}/showDoctorLoginPage","_self");

					
				});
		 }
	 else
		 {
		 alert("Please Enter New Password");
		 }
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


 
 
/* function getTimeRemaining(endtime) {
	
	
	
	
	var t = Date.parse(endtime) - Date.parse(new Date());
	  var seconds = Math.floor((t / 1000) % 60);
	  var minutes = Math.floor((t / 1000 / 60) % 60);
	  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
	  var days = Math.floor(t / (1000 * 60 * 60 * 24));
	  return {
	    'total': t,
	    'days': days,
	    'hours': hours,
	    'minutes': minutes,
	    'seconds': seconds
	  };
	}

	function initializeClock(id, endtime) {
	  var clock = document.getElementById(id);
	  var daysSpan = clock.querySelector('.days');
	  var hoursSpan = clock.querySelector('.hours');
	  var minutesSpan = clock.querySelector('.minutes');
	  var secondsSpan = clock.querySelector('.seconds');
	var day;
	  function updateClock() {
	    var t = getTimeRemaining(endtime);
	
	    daysSpan.innerHTML = t.days;
	    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
	    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
	    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

	    if (t.total <= 0) {
	      clearInterval(timeinterval);
	    }
	  }

	  updateClock();
	  var timeinterval = setInterval(updateClock, 1000);
	}

	/* var deadline = new Date(Date.parse(new Date()) + 5 * 24 * 60 * 60 * 1000); 
	initializeClock('clockdiv', deadline); */
	
	
</script>
<script>

var subscriptionEndAlert = "<c:out value="${subscriptionAlertStart}"/>";
$(window).load(function(){        
	
	
	if(subscriptionEndAlert=='0'){ 
	  
		$('#onloadModal').modal('show');
		
	 }
	    });

function cancelChangePassword(){
	$('#passwordModel').modal('hide');
}



</script>
</body>
</html>