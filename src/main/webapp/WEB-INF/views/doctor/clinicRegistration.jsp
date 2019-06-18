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

</head>         
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 

<c:url var="getStateByCountryId"
		value="/getStateByCountryId" />
		<c:url var="getCityByStateId"
		value="/getCityByStateId" />
		
 
<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
		<c:url var="editHospitalDetails"
		value="/editHospitalDetails" />
		

  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Edit Clinic Info</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
					<form method="GET" action='submitEditClinicReg' >
        	<div class="row editpg">
        	
        		<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Clinic Name</label>
            		   <input type="hidden" required class="input-text" name="name" id="hospitalName"  data-rule-required="true" /> 
            		 <select class="input-text" onchange="getHospitalDetails()" id="hospitalId" name="hospitalId">
            		 	<option readonly>select</option>
            		 	<c:forEach items="${hospitalDetails}" var="hospitalDetails">	
            		 	<c:if test="${hospitalDetails.type==0}">
            		 	<option value="${hospitalDetails.hospitalId}">${hospitalDetails.hospitalName}</option>
            		 	</c:if>
            		 	</c:forEach>
            		 </select>
            		 </div>
					</div>
					
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Contact No</label>
            		 <input type="text" required class="input-text" name="contact" id="contact" onkeypress='return IsNumeric(event);' min="10" maxlength="13" value=""  />
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1" >Email</label>
            		 <input type="email" required class="input-text capitl_none" name="email" id="email" value="" />
            		 </div>
					</div>
					
					<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Country</label>
				          <select class="input-text" id="countryId" name="countryId" onchange="getStateBYCountry()">
				          <option value="" readonly>select</option>
            		 	 <c:forEach items="${countryList}" var="countryList">	
            		 	<option value="${countryList.countryId}">${countryList.countryName}</option>
            		 	</c:forEach> 
            		 	
            		 </select>
				</div>
				</div>
				
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">State</label>
				                     <select class="input-text" id="stateId" name="stateId" onchange="getCityBYState()">
            		 	
            		 	
            		 </select>
				            	 
				</div>
				</div>
					
					<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">City</label>
				             
				            	 <select class="input-text" id="cityId" name="cityId">
            		
            		 	
            		 </select>
				</div>
				</div>
				    <div class="col-sm-4">            	
				<div class="form-group">
				                     <label for="exampleInputEmail1">Address</label>
				            	<input required type="text" value="" class="input-text" name="address" id="address">
				</div>
				</div>
				
				
				
				<div class="clearfix"></div>
                <hr> 
				<div class="col-sm-12 text-center">
                <div class="form-group">
                    	<input type="submit" name="Submit" class="btn-fr-all">
                    	<!-- <input type="reset" value="Reset" class="btn-fr-all"> -->
                </div>
                </div>
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
				document.getElementById("docName").innerHTML='Dr. '+data.fName+' '+data.mName+' '+data.lName;
				 document.getElementById("address").innerHTML=data.address;
				 document.getElementById("docCity").innerHTML=data.cityName;
				document.getElementById("docMail").innerHTML=data.email;
				document.getElementById("phoneNo").innerHTML=data.contactNo;
				/* document.getElementById("doctorName1").innerHTML='Dr. '+data.fName+' '+data.lName; */
				 document.getElementById("docInfo").innerHTML=data.aboutMe; 
				 
				 document.getElementById("specialist").innerHTML=data.specType; 
				 document.getElementById("education").innerHTML=data.qualification+'<br/><b>From : </b>'+data.college+'.<br/><b> Passing year :</b> '+data.passingYear+'.'; 
				 document.getElementById("experience").innerHTML=data.yearOfExperience+" year."; 
				
				
			});
	}

function getHospitalDetails(){
	
	var hospitalId=document.getElementById("hospitalId").value;
	
	$
	.getJSON(
			'${editHospitalDetails}',

			{
				hospitalId : hospitalId,
				  
				ajax : 'true'

			},
			function(data) {
				
				document.getElementById("hospitalId").value=data.hospitalId;
				document.getElementById("hospitalName").value=data.hospitalName;
				document.getElementById("address").value=data.address;
				
				document.getElementById("contact").value=data.contactNo;
				document.getElementById("email").value=data.email;
				
				
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
  /*---------Reviews----------*/
  $(".demo2").bootstrapNews({
            newsPerPage: 4,
            autoplay: true,
			pauseOnHover: true,
			navigation: false,
            direction: 'down',
            newsTickerInterval: 1500,
            onToDo: function () {
                //console.log(this);
            }
        });
</script>

<script>
function getStateBYCountry() {
	 
	 var countryId=document.getElementById("countryId").value; 
	
	 $('#stateId option').remove();
	 
	 $
													.getJSON(
															'${getStateByCountryId}',
															{
																countryId : countryId,
																
																ajax : 'true'
															},
															function(data) {
																
																
																var len = data.length;
																var strVar="";
																strVar +="<option value=''>--select--<\/option>";
																for (var i = 0; i < len; i++) {
																
																	strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
															 
																} 
																 $('#stateId').append($(strVar))

															})
	 
	 
}



function getCityBYState(){
									 
	 var stateId=document.getElementById("stateId").value; 
	
	 $('#cityId option').remove();
	 $
													.getJSON(
															'${getCityByStateId}',
															{
																stateId : stateId,
																
																ajax : 'true'
															},
															function(data) {
																
																
																var len = data.length;
																var strVar="";
																strVar +="<option value=''>--select--<\/option>";
																for (var i = 0; i < len; i++) {
															
																	strVar += "<option value="+data[i].cityId+">"+data[i].cityName+"<\/option>";
															 
																} 
																 $('#cityId').append($(strVar))

															})
	 
	 
}
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