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
<style type="text/css">

.autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto;}
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; border-bottom: 1px dashed #999; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }

</style>
</head>         
<body onload="getHospitalDetails()">
<jsp:include page="../include/doctorHeader.jsp"/> 

<c:url var="getStateByCountryId"
		value="/getStateByCountryId" />
		<c:url var="getCityByStateId"
		value="/getCityByStateId" />
		
 
<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
<c:url var="sendTextOtp" value="/sendTextOtp" />
  <c:url var="verifyRegOTP" value="/verifyRegOTP" />
  <c:url var="verifyContactNumber" value="/verifyContactNumber" />
  <c:url var="getAllHospitalByType" value="/getAllHospitalByType" />
  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Add Clinic Info</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
					<form method="GET" action='submitNewClinicReg' >
        	<div class="row editpg">
        		<!-- <div class="col-sm-4 search-input">
        		   <input type="text" id="searchHospitals" name="search" placeholder="Search Hospital"> 
        		   <p id="outputcontent"></p>
        		</div> -->
        		<!-- <div class="col-sm-4"></div>
        		<div class="col-sm-4"></div>
        		<div class="clearfix"></div>
        		<hr> -->
        		<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Clinic Name</label>
            		 <input type="text" required class="input-text" name="name" id="name" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || (event.charCode > 31 && event.charCode < 33)" data-rule-required="true" />
            		 </div>
					</div>
					
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1">Contact No</label>
            		 <input type="text" required class="input-text" name="contact" id="contactNo" onkeypress='return IsNumeric(event);' min="10" maxlength="13" />
            		 <i class="glyphicon glyphicon-ok verified" style="color:green;display:none" id="verifiedMark" ></i>
            		 </div>
					</div>
					<div class="col-sm-4">
                	<div class="form-group">
                     <label for="exampleInputEmail1" >Email</label>
            		 <input type="email" required class="input-text capitl_none" name="email" id="email"/>
            		 </div>
					</div>
					
					<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">Country</label>
				             <select required class="input-text chosen-select" id="countryId" name="countryId" onchange="getStateBYCountry()">
				             <option  value ="">---Select Country---</option>
											 <c:forEach items="${countryList}" var = "countryList">
											 
											 
											   <c:choose>
         
         <c:when test = "${countryList.countryId==hospitalDetails.countryId}">
          <option selected  value ="${countryList.countryId}">${countryList.countryName }</option>
         </c:when>
                 <c:otherwise>
                 				                             <option  value ="${countryList.countryId}">${countryList.countryName }</option>
                 
                 </c:otherwise>
                 </c:choose>
				                           <%--   <option  value ="${countryList.countryId}">${countryList.countryName }</option> --%>
				                             </c:forEach>
				                             
				                    </select>
				</div>
				</div>
				
				<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">State</label>
				                      <select required class="input-text chosen-select" id="stateId" name="stateId" onchange="getCityBYState()">
				                 <option value="">--select--</option>
                             
									   <c:forEach items="${stateList}" var = "stateList">
									   <c:choose>
                                            <c:when test = "${stateList.stateId==hospitalDetails.stateId}">
                                                <option selected  value ="${stateList.stateId}">${stateList.stateName }</option>
                                            </c:when>
                                            <c:otherwise>
                 				                 <option  value ="${stateList.stateId}">${stateList.stateName }</option>
                                            </c:otherwise>
                                       </c:choose>
				                     </c:forEach>
				                     
				                    
				                      </select>
				            	 
				</div>
				</div>
					
					<div class="col-sm-4">
				<div class="form-group">
				                     <label for="exampleInputEmail1">City</label>
				             
				            	 <select required class="input-text chosen-select" id="cityId" name="cityId" >
				            	<option value="">--select--</option> 
							 <c:forEach items="${cityList}" var = "cityList">
									   <c:choose>
                                            <c:when test = "${cityList.cityId==hospitalDetails.cityId}">
                                                <option selected  value ="${cityList.cityId}">${cityList.cityName }</option>
                                            </c:when>
                                            <c:otherwise>
                 				                 <option  value ="${cityList.cityId}">${cityList.cityName}
                 				                 </option>
                                            </c:otherwise>
                                       </c:choose>
				                     </c:forEach>
				                      </select>
				</div>
				</div>
				    <div class="col-sm-4">            	
				<div class="form-group">
				                     <label for="exampleInputEmail1">Address</label>
				            	<input required type="text" value="${hospitalDetails.address}" class="input-text" name="address" id="address">
				</div>
				</div>
				
				
				
				<div class="clearfix"></div>
                <hr> 
				<div class="col-sm-12 text-center">
                <div class="form-group">
                		<input id="verifyButton" type="button" value="Verify" class="btn-fr-all" onclick="verifyMobileNumber()">
                    	<!-- <input type="submit" name="Submit" id="submitBtn" class="btn-fr-all" data-toggle="modal" data-target="#otp" > -->
                    	<input type="submit" id="submitButton" value="Submit" name="submit" class="btn-fr-all" style="display: none;">
                    	
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

<div class="modal fade otp-pg" id="otp" tabindex="1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Verify Mobile Number</h4>
      </div>
      <div class="modal-body">
        <section class="lab_testsec otppg">
	 	<div class="text-center">
	 	<div class="otp-pg"><p>In order to create new account you need to verify mobile number. Please enter OTP received on mobile number : <span id="mobileVerify"></span></p>
	 	
	 	<label>Enter OTP</label>
	 	<div id="divOuter">
	<div id="divInner">
		<input type="text" id="pincode-input2"  >
		<div class="timer"><span id="timer"></span></div>
		 <input type="button" class="resndotp" id="resendButton" onclick="verifyMobileNumber()" value="Resend OTP"  disabled> 
		<div class="resndotp">
		<!-- <a  id="resendButton" href="#" onclick="verifyMobileNumber()" disabled>Resend OTP</a> -->
		<p class="timeoutmsg" id="timeoutmsg" style="display:none">Time Out Click on Resend OTP</p>
	</div>
<div>
	 	<a href="#" onclick="verifyEnteredOTP()" class="btn-fr-all" >Verify</a>
	 	</div>
	 	</div>
	 </div>
	</div>	
	</div>
	
	
</section>
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
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>
<script>

function timeout(){
let timerOn = true;

function timer(remaining) {
  var m = Math.floor(remaining / 60);
  var s = remaining % 60;
  
  m = m < 10 ? '0' + m : m;
  s = s < 10 ? '0' + s : s;
  document.getElementById('timer').innerHTML = m + ':' + s;
  remaining -= 1;
  
  if(remaining >= 0 && timerOn) {
    setTimeout(function() {
        timer(remaining);
    }, 1000);
    return;
  }

  if(!timerOn) {
    // Do validate stuff here
    return;
  }
  
  // Do timeout stuff here
  //alert('Timeout for otp');
  document.getElementById("timeoutmsg").style.display="block";
  document.getElementById("resendButton").disabled=false;
}

timer(120);
}
$('#pincode-input2').pincodeInput({hidedigits:false,inputs:6,complete:function(value, e, errorElement){
	$("#pincode-callback").html("Complete callback from 6-digit test: Current value: " + value);
	
	
}});
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
<script>
function verifyMobileNumber(){
	 
	 
 	var contactNo=document.getElementById("contactNo").value;
 	$('#mobileVerify').text(contactNo);
//	var otp=document.getElementById("enterOTP").value;
	//alert(contactNo);
	if(contactNo!="")
	{
		$("#otp").modal();
	$.getJSON('${sendTextOtp}',
			{
		contactNo : contactNo,
			
		ajax : 'true',
		},
		function(data) {
				 
			alert(data.message);
				
			});
	}else{
		alert("Enter Mobile number");
	}
 
}

function verifyEnteredOTP(){
	
	var enteredOTP=document.getElementById("pincode-input2").value;

		$.getJSON('${verifyRegOTP}',
				{
			enteredOTP : enteredOTP,
				
			ajax : 'true',
			},
			function(data) {
				
				//document.getElementById("reset1").submit();	
				
				if(data.message!=null){
					$('#otp').modal('hide');
					
					document.getElementById("verifiedMark").style.display="block";
					document.getElementById("verifyButton").style.display="none";
					$("#contactNo").prop("readonly",true);
					document.getElementById("submitButton").style.display="inline";
					alert(data.message);
					
					}else{
						alert("Invalid OTP");
					}
				
				});
	
}




</script>	
<script src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>
<script>
var currencies=[];

function getHospitalDetails(){
	var type=1;
	$.getJSON('${getAllHospitalByType}', {
		 
		type : type,
		
		ajax : 'true'
	}, function(data) {
		 
		
		  $.each(
					data,
					function(key, getHospitalDetailsList) {
													
						currencies.push({ value: getHospitalDetailsList.hospitalName, data: getHospitalDetailsList.hospitalId });
						
	  });

	});	
	
}


$(function(){
	
	
	  $('#searchHospitals').autocomplete({
		  
	    lookup: currencies,
	    
	    onSelect: function (suggestion) {   
		
	     //alert(suggestion.value);
	     var thehtml = '<strong>Currency Name:</strong> ' + suggestion.value + ' <br> <strong>Symbol:</strong> ' + suggestion.data; 
	    	
	    // document.getElementById("doctorCity").value=suggestion.data;
	      
	      $('#outputcontent').html(thehtml);
	    } 
	     
	  });
	 
	  
	}); 
</script>
</body>
</html>