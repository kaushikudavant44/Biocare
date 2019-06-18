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
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

 
</head>         
<body onload="getDoctorProfile();getDoctorRatingDetails()">
<jsp:include page="../include/doctorHeader.jsp"/> 


<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />

  
<div class="clearfix"></div>
<section class="doc_login">
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/radiology_left_menu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
				       <div class="col-sm-12">
				       	<div class="col-sm-2">
				        	<div class="profile_doc">
				            	<img src="/hospital/resources/images/doc.jpg" class="img-responsive" alt="doc_profile">
				            </div>
				        </div>
				        <div class="col-sm-10">
				        <div class="doc_detail">
				        <table border="none">
				  <tr>
				    <td>Name</td>
				    <td><span id="docName"></span></td>
				  </tr>
				  <tr>
				    <td>Address</td>
				    <td id="address"></td>
				  </tr>
				  <tr>
				    <td>City</td>
				    <td id="docCity"></td>
				  </tr>
				  <tr>
				    <td>Email Id</td>
				    <td id="docMail"> </td>
				  </tr>
				  <tr>
				    <td>Phone No.</td>
				    <td id="phoneNo"></td>
				  </tr>
				 <!--  <tr>
				    <td>Follow</td>
				    <td><a href="#"><span class="glyphicon glyphicon-star"></span></a> <a href="#"><span class="glyphicon glyphicon-star"></span></a> <a href="#"><span class="glyphicon glyphicon-star"></span></a></td>
				  </tr> -->
				</table>
				        </div>
				       <a href="${pageContext.request.contextPath}/showDoctorEditProfile" data-toggle="popover" title="Edit Profile" class="bg_pop"> <div class="appoint">
				         <div class="appoint1 hvr-pulse">
				        <span class="glyphicon glyphicon-edit"></span>
				        </div>
				        </div> </a>
				        </div>
				        </div>
      
       <div class="clearfix"></div>
       <hr>
       <div class="text-left">
       <h3 id="doctorName1"></h3>
       <p id="docInfo"></p>
       <hr>
       <h4>Speciality</h4>
       <ul class="list1">
       	<li class="hvr-forward" id="specialist"></li>
       <!--  <li class="hvr-forward">Surgeon</li>
        <li class="hvr-forward">Rehabilitation</li> -->
       </ul>
       <hr>
       <h4>Education</h4>
       <p class="hvr-forward" id="education"></p>
       <!-- <p class="hvr-forward">Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
       --> <hr>
       <h4>Experience</h4>
       <ul class="list1">
       	<li class="hvr-forward" id="experience"> </li>
 <!--        <li class="hvr-forward">15years of experience in Surgeon</li> -->
       </ul>
       <hr>
       <!-- <h4>Award & recognition</h4>
       <ul class="list1">
       	<li class="hvr-forward">Lorem Ipsum is simply dummy text of the printing</li>
        <li class="hvr-forward">Best award for Surgeon</li>
       </ul> -->
       </div>
 <div class="row">
  <div class="col-sm-6">  
 <div id="wrapper">
		<p class="text-left text_ttl"><strong>Ratings :</strong></p>
        <div class="clearfix"></div>
<div class="skill_name" id="skill_php">5 <span class="fa fa-star" aria-hidden="true"></span></div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_php"></div>
 <div class="skill_bar_percent" id="five"></div>
</div>

<div class="skill_name" id="skill_asp">4 <span class="fa fa-star" aria-hidden="true"></span></div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_asp"></div>
 <div class="skill_bar_percent" id="four"></div>
</div>

<div class="skill_name" id="skill_jsp">3 <span class="fa fa-star" aria-hidden="true"></span></div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_jsp"></div>
 <div class="skill_bar_percent" id="three"></div>
</div>

<div class="skill_name" id="skill_star2">2 <span class="fa fa-star" aria-hidden="true"></span></div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_star2"></div>
 <div class="skill_bar_percent" id="two"></div>
</div>

<div class="skill_name" id="skill_star1">1 <span class="fa fa-star" aria-hidden="true"></span></div>
<div class="skillbar_wrapper">
 <div class="skillbar_bar" id="skillbar_star1"></div>
 <div class="skill_bar_percent" id="one"></div>
</div>
</div>
</div>
<div class="col-sm-6">
<div class="review_sec">

<p class="text-left text_ttl"><strong>Reviews :</strong></p>
<ul class="demo2 doc_review" id="doctorRev">
<!-- There is a list of reviews in ajax function -->
<li class="news-item"></li>
<li class="news-item"></li>	 
<li class="news-item"></li>
<li class="news-item">I Recommended this doctor</li>	 
</ul>
   </div>     
 </div>       
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
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'>
</script>
<script>

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
	
function getDoctorProfile()
{
	
	
	$
	.getJSON(
			'${showDoctorProfile}',

			{
			 
				  
				ajax : 'true'

			},
			function(data) {
				document.getElementById("docName").innerHTML=data.fName+' '+data.mName+' '+data.lName;
				 document.getElementById("address").innerHTML=data.address;
				 document.getElementById("docCity").innerHTML=data.cityName;
				document.getElementById("docMail").innerHTML=data.email;
				document.getElementById("phoneNo").innerHTML=data.contactNo;
				document.getElementById("doctorName1").innerHTML='Dr. '+data.fName+' '+data.lName;
				 document.getElementById("docInfo").innerHTML=data.aboutMe; 
				 
				 document.getElementById("specialist").innerHTML=data.specType; 
				 document.getElementById("education").innerHTML=data.qualification+'<br/><b>From : </b>'+data.college+'.<br/><b> Passing year :</b> '+data.passingYear+'.'; 
				 document.getElementById("experience").innerHTML=data.yearOfExperience+" year."; 
				
				
			});
	}

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
				
				var strVar1="";
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
			
				
				strVar1 += "<li class=\"news-item\">"+data.ratingDetails[i].review+"<\/li>";

				}
				$('#doctorRev').append($(strVar1));
			});
	} 


 
/*---------Reviews----------*/
$(".demo2").bootstrapNews({
          newsPerPage: 4,
    		loop:true,
          autoplay: true,      
			pauseOnHover: true,
			navigation: false,
          direction: 'down',
          newsTickerInterval: 1000, 
         /*  onToDo: function () {
              //console.log(this);
          } */
      });
 
 
jQuery(document).ready(function() {
    var owl = jQuery('.owl-carousel');
    owl.owlCarousel({
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 1000,
      autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
</script>

<!-- <script type="text/javascript">
$(document).ready(function(){
	
$("#skillbar_php").animate({width:'85'},1500);
$("#skillbar_asp").animate({width:'55'},1500);
$("#skillbar_jsp").animate({width:'75%'},1500);
$("#skillbar_star2").animate({width:'45%'},1500);
$("#skillbar_star1").animate({width:'25%'},1500);


});


</script> -->
</body>
</html>