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
	<div class="dashboard_nm text-center"><h4>Bank Details</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
        
       
        	<jsp:include page="../include/leftmenu.jsp"/>
             
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
				
					<h4 class="detlnm"> 
         <a href="${pageContext.request.contextPath}/showAddEditDoctorBankDetails" data-toggle="tooltip" title="" data-original-title="edit"> Edit <span class="icon-user" style="color: #009fea; font-size: 20px"></span></a> </h4>
        
       
        
       <div class="cliHoDetl">
       <p><strong>Bank Name :</strong> ${doctorBankAccountInfo.bankName}</p> 
        
        <p><strong>Account Holder Name :</strong> ${doctorBankAccountInfo.accHolderName}</p> 
      
       <p><strong>IFSC :</strong> ${doctorBankAccountInfo.ifscCode}</p>
     
       <p> <strong>GSTIN :</strong> ${doctorBankAccountInfo.gstNo}</p>
       <p><strong>Branch Name :</strong> ${doctorBankAccountInfo.bankBranch}</p> 
       <p><strong>Account No. :</strong> ${doctorBankAccountInfo.accountNo}</p> 
        <p> <strong>PAN :</strong> ${doctorBankAccountInfo.panNo}</p>
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
					<p id="errormessage" style="color:red;position:absolute;" maxlength="20">${msg}</p>
						
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
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

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

var expireDay = endtime.slice(-2);

var d = new Date();

var remainDay=expireDay-d.getDate();


document.getElementById("remainDays").innerHTML=remainDay; 
 
 
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