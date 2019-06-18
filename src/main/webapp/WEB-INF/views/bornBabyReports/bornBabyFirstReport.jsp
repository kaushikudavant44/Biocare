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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head> 
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 



  <c:url var="generateBabyReports"
		value="/generateBabyReports" />
		<c:url var="saveBirthReport"
		value="/saveBirthReport" />
<div class="clearfix"></div>
<section class="doc_login information_sec">
	<div class="container-fluid">
	<div class="row">
		
		<jsp:include page="../include/leftmenu.jsp"/>
		
		
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
		<div class="bhoechie-tab-content active">
		<div class="filter_div vacciinput"> 
	               <form action="getPatientDetailsByPatientId" method="GET">
      	       	     <div class="col-sm-10">
      	       	      <label>Enter Patient Id</label>
       			      	<input type="text" id="patientId" name="patientId" placeholder="Patient id" value="${patientId}" onkeypress="return IsNumeric(event);" required>
       			      	<p style="color:red; font-size: 14px !important; margin: 0; line-height: 20px;">${msg}</p>
      	       	     </div>
      	       	     
       			      	<div class="col-sm-2">
       			       <input type="submit" value="Search" class="btn-fr-all dspl-appt baby-vacci" > 
       			       
	                 </div>
       			       </form>
       			      </div> 
       			      <div class="clearfix"></div>
       			      <hr>
       			   
       			      <c:if test="${vaccinationPatientDetails.patientId > 0}">
       			      
       			   <input type="hidden" id="patientId1" name="patientId" value="${vaccinationPatientDetails.patientId}">   
       			      <div class="baby-details">
       			      	<h4><span class="flaticon-specialist-user"></span>Baby Details</h4>
       			      	<div class="col-sm-6">
	       			      	<h6>Baby Name</h6>
	       			      	<p>${vaccinationPatientDetails.fName} ${vaccinationPatientDetails.mName} ${vaccinationPatientDetails.lName}</p>
	       			      	<h6>Gender</h6>
	       			      	<p>${vaccinationPatientDetails.gender}</p>
	       			      	
       			      	</div>
       			      	<div class="col-sm-6">
	       			      	<!-- <h6>Mother Name</h6>
	       			      	<p>Xyz gdgfghth</p> -->
	       			      	
	       			      	<h6>Blood Grp</h6>
	       			      	<p>${vaccinationPatientDetails.bloodGroup}</p>
	       			      	<h6>Address</h6>
	       			      	<p>${vaccinationPatientDetails.address}</p>
       			      	</div>
       			      	<div class="col-sm-12">
	       			      	
	       			      	 
       			      	</div>
       			       	<!-- <div class="text-center"><input type="submit" value="Confirm" class="btn-fr-all"> </div> -->
       			      </div>
       			      </c:if>
		
		
<h3>Baby Details</h3>
		
<form action="${pageContext.request.contextPath}/generateBabyReports" method="post">
	<div class="baby_details">
<div class="row">

    <div class="col-sm-4">
    <label><strong>Mother Name  :</strong> <input autocomplete="off" type="text" id="motherName" name='motherName' required></label>
    </div>
    <div class="col-sm-4">
    <label><strong>Date of birth :</strong> <input class="datepicker" autocomplete="off" type="text" id="dob" name="dob" required></label>
    </div>
    <div class="col-sm-4">
    <label><strong>Time of Birth : </strong><input type="time" id='dobTime' data-format="hh:mm:ss" name='dobTime' required></label>
    </div>
    <div class="col-sm-4">
    <label><strong>Birth Weight :</strong> <input type="number" id='birthWeight' name='birthWeight' required></label>  
    </div>
    <div class="col-sm-4">
    <label><strong>Length :</strong> <input type="number" id='length' name='length' required >  </label>
    </div>
    <div class="col-sm-4">
    <label><strong>Head Circumference :</strong> <input type="text" id='headCircumference' name='headCircumference' required> </label> 
    </div>
    <div class="col-sm-4">
    <label><strong>Blood Group :</strong> 
     		<select  id="bloodGroup" name="bloodGroup" required>
     				 <option>Select Blood Group</option>
            		 <option>O +ve</option> 
            		 <option>O -ve</option> 
            		 <option>A -ve</option>
            		 <option>A +ve</option>
            		 <option>B -ve</option>
            		 <option>B +ve</option>
            		 <option>AB -ve</option>
            		 <option>AB +ve</option>
            </select>
       </label>
    </div>
     <div class="col-sm-4">
    <label><strong>Hospital Name :</strong>
     <select  id="hospitalId" name="hospitalId">
            		 	
            		 	<option readonly>select</option>
            		 	<c:forEach items="${getHospitalDetailsList}" var="getHospitalDetailsList" >
            		 	
            		 	
            		 	<option value="${getHospitalDetailsList.hospitalId}">${getHospitalDetailsList.hospitalName}</option>
            		 	</c:forEach>
     </select>
    
     <!-- <input type="text" id='hospitalName' name='hospitalName' required>  </label> -->
    </div>
    <div class="clearfix"></div>
    <div class="col-sm-6 check_baby1">
    <label><strong>Gender : </strong><ul><li><input type="radio" id="sex" name="sex" value="Male" required> Male </li><li><input type="radio" name="sex" value="Female" required> Female</li></ul></label>
    </div>
    <div class="col-sm-6 check_baby">
    <label><strong>Delivery Type :</strong> <br>Normal : <input type="radio" name="deliveryType" value="Normal" required> 
        Vacuume :   <input type="radio" name="deliveryType" required value="Vacuume"   > 
        Forceps :<input type="radio" name="deliveryType" required value="Forceps
      "   > 
         Caesarean :<input type="radio" name="deliveryType" required value="Caesarean"     >
        </label>
    </div>
  
</div>
<div class="clearfix"></div>
<input type="hidden" id='familyId' name="familyId" value='${vaccinationPatientDetails.familyId}'>
<input type="hidden" id='patientId' name="patientId" value='${vaccinationPatientDetails.patientId}'>
<hr>
<p class="text-center"><input type="button" class="btn-fr-all history_sbmt" value="Submit" onclick="generateBabyReports()"></p>
  </div>
  </form>
</div>
		</div>
	
	
	</div>
	
	
</div>
</section>

<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 

<div id="largeModal" class="modal fade bs-example-modal-sm"
			tabindex="-1" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="margin-top:-1% !important"
							aria-hidden="true">&times; </button>
						<h5 class="modal-title">Edit Appointment</h5>
					</div>
					<div class="modal-body">
						 	<div class="baby_details">
	
<!-- <div class="row">

    <div class="col-sm-4">
    <label><strong>Mother Name  :</strong> <input type="text" id="motherName" name='motherName'></label>
    </div>
    <div class="col-sm-4">
    <label><strong>date of birth :</strong> <input class="datepicker" data-format="dd-mm-yy" type="text" id="dob" name="dob"></label>
    </div>
    <div class="col-sm-4">
    <label><strong>time of Birth : </strong><input type="time" id='dobTime' data-format="hh:mm:ss" name='dobTime'></label>
    </div>
    <div class="col-sm-4">
    <label><strong>Birth Weight :</strong> <input type="number" id='birthWeight' name='birthWeight'></label>  
    </div>
    <div class="col-sm-4">
    <label><strong>Length :</strong> <input type="number" id='length' name='length'>  </label>
    </div>
    <div class="col-sm-4">
    <label><strong>Head Circumference :</strong> <input type="text" id='headCircumference' name='headCircumference'> </label> 
    </div>
    <div class="col-sm-4">
    <label><strong>Blood Group :</strong> <input type="text" id='bloodGroup' name='bloodGroup'>  </label>
    </div>
    <div class="clearfix"></div>
    <hr>
    <div class="col-sm-6 check_baby1">
    <label><strong>sex : </strong><ul><li><input type="checkbox" name="sex" value="Male"> Male </li><li><input type="checkbox" name="sex" value="Female"> Female</li></ul></label>
    </div>
    <div class="col-sm-6 check_baby">
    <label><strong>Delivery Type :</strong> <br>Normal : <input type="checkbox" name="deliveryType" value="Normal"> 
        Vacuume :   <input type="checkbox" name="deliveryType" value="Vacuume" checked> 
        Forceps :<input type="checkbox" name="deliveryType" value="Forceps
      " checked> 
         Caesarean :<input type="checkbox" name="deliveryType" value="Caesarean" checked>
        </label>
    </div>
</div> -->
<div class="clearfix"></div>
<hr>
<a href="#" class="history_sbmt">Confirm</a>
</div>

					</div>
					<!-- <div class="modal-footer">
						<button type="button" class="btn btn-danger" style="float: left;"   onclick="cancelAppointment()">Cancel Appointment</button>
						<button type="button" class="btn btn-primary"  
							id="bookAppointment" onclick="editAppointment()"
							 >Confirm Appointment</button>
							 <br/>
					</div> -->
				</div>
			</div>
		</div>
		
	<div id="largeModal11" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-body" id="report">
					<div class="baby_details card_sec">


						<div class="clearfix"></div>

						<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<ul class="card_list">
							<li>
								<h3 id="hospitalN"></h3> <span></span>
							</li>

							<li><h3>
									<span id="docFName"></span>
								</h3> <span>(<span id="docSpec"></span>)
							</span></li>
							<li><strong>Mother Name :</strong> <span id="motherN" name="motherName"></span>
							</li>
							<li><strong>Date of birth :</strong> <span id="dobirth" name="dob"></span></li>
							<li><strong>Time of Birth :</strong> <span id="dobT" name="dobTime"></span>
							</li>
							<li><strong>Birth Weight :</strong> <span id="birthW" name="birthWeight"></span>
							</li>
							<li><strong>Height :</strong> <span id="len" name="height"></span></li>

							<li><strong>Head Circumference :</strong> <span
								id="headC" name="headCircumference"></span></li>
							<li><strong>Blood Group :</strong> <span id="bloodG" name="bloodGroup"></span>
							</li>


							<li><label><strong>Delivery Type : </strong> <span
									id="deliveryT" name="deliveryType"></span> </label></li>

							<li><label><strong>Gender : </strong><span id="gender" name="sex"></span>
							</label></li>
						</ul>
						<input type="hidden" id='doctorId' name="doctorId">
						<div class="card_img">
							<img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								alt="logo">
						</div>
						<!-- <input type="button" class="history_sbmt" id="mkImage" value="Send To Patient"> -->
					</div>

				</div>

			</div>
		</div>
	</div>	
	<div id="dis"></div>
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<script   src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"   integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE="   crossorigin="anonymous"></script>
    --> 
<script>



 $('#mkImage').click(function(){ //calling this function when Save button pressed
    html2canvas($('#report'), {//give the div id whose image you want in my case this is #cont
    onrendered: function (canvas) {
    var img = canvas.toDataURL("image/png",1.0);//here set the image extension and now image data is in var img that will send by our ajax call to our api or server site page
	alert("ss"+img);
    var patientId=document.getElementById("patientId").value;
    var doctorId=document.getElementById("doctorId").value;
    alert(patientId+"   "+doctorId);
    var formData = {
    		img:img,
			  doctorId:doctorId,
			 patientId:patientId,
       };

    $.ajax('saveBirthReport', {
		  type: "POST",
		
			
			  
			  contentType : 'application/json; charset=utf-8',
		      dataType : 'json', 
			   data: JSON.stringify(formData), 
				

		}, function(data) {
	 
			    $("#dis").html(data.fileName);
			   alert("Birth Report Send Successfully to Patient.")
		
		});
 /*    
    $.ajax({
          type: 'POST',
       //   url: "http://localhost/my/index.php",//path to send this image data to the server site api or file where we will get this data and convert it into a file by base64
          data:{
            "img":img
          },
          success:function(data){
          $("#dis").html(data);
          }
    });  */
    }
    });
});

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
function generateBabyReports() {

	
	var dobTime=document.getElementById("dobTime").value;
	var birthWeight=document.getElementById("birthWeight").value;
	var bloodGroup=document.getElementById("bloodGroup").value;
	//var deliveryType=document.getElementById("deliveryType").value;
	var dob=document.getElementById("dob").value;
	var headCircumference=document.getElementById("headCircumference").value;
	var hospitalId=document.getElementById("hospitalId").value;
	var hospitalName=document.getElementById("hospitalId").text;
	var length=document.getElementById("length").value;
	var motherName=document.getElementById("motherName").value;
	var patientId=document.getElementById("patientId").value;
	var sex=document.getElementById("sex").value;
	
	
	$.getJSON('${generateBabyReports}',

	{
		dobTime :dobTime,
		birthWeight:birthWeight,
		bloodGroup:bloodGroup,
		deliveryType:$("input[name='deliveryType']:checked").val(),
		dob:dob,
		hospitalName:$("#hospitalId option:selected").text(),
		headCircumference:headCircumference,
		hospitalId:hospitalId,
		length:length,
		motherName:motherName,
		patientId:patientId,
		sex:$("input[name='sex']:checked").val(),
		ajax : 'true'

	}, function(data) {
		//birthReport=data;

		//	alert(data);
		//openBornReport(data);
	
		document.getElementById("dobT").innerHTML=data.birthTime;
		document.getElementById("motherN").innerHTML=data.motherName;
		document.getElementById("birthW").innerHTML=data.birthWeight;
		document.getElementById("bloodG").innerHTML=data.bloodGroup;
		document.getElementById("deliveryT").innerHTML=data.deliveryType;
		document.getElementById("dobirth").innerHTML=data.dob;
		document.getElementById("headC").innerHTML=data.headCircumference;
		document.getElementById("len").innerHTML=data.length;
		document.getElementById("gender").innerHTML=data.sex;
		document.getElementById("hospitalN").innerHTML=data.hospitalName;
		document.getElementById("docSpec").innerHTML="Dr. "+data.doctorName;
		document.getElementById("doctorId").value=data.doctorId;
		
		$('#largeModal11').modal('show');
		
		

	});

	/* if(birthReport==null)
	 alert("Report not available"); */

}
		
		/* $(document).ready(function() {

		    $('.datepicker').datepicker({
		        format: 'dd-mm-yyyy'
		    });
		}); */
		$(".datepicker").datepicker({format: 'dd-mm-yyyy'});
		$(function() { 
		    $('#dobTime').datetimepicker({
		      pickDate: false
		    });
		  }); 
		
		
	/* function setAppointId(appointId, doctorId,date,timeId,time)
	{
	
		document.getElementById("appointId").value=appointId;
		document.getElementById("doctorId").value=doctorId;
		document.getElementById("newDate").value=date;
		//document.getElementById("newTime").value =time;
		var html = '<option value="'+timeId+'" disabled="disabled" selected="selected" >'+time+'</option>';
		html += '</option>';
		$('#time').html(html);
		$("#time").trigger("chosen:updated");
		
	}
	
	function getAppointTime()
	{
		var appointId= document.getElementById("appointId").value;
		
		var newDate=document.getElementById("newDate").value;
		var doctorId=document.getElementById("doctorId").value;
		
	     $
			.getJSON(
					'${getAppointmentsTime}',
					{
						doctorId : doctorId,
						appointmentDate : newDate,
						 
						ajax : 'true'
					},
					function(data) {
					
    
						  $.each(
									data,
									function(key, timeList) {
										
										
										var html = '<option value="" disabled="disabled" selected >Choose Time...</option>';
										
										var len = data.length;
										for ( var i = 0; i < len; i++) {
											html += '<option value="' + data[i].timeId + '">'
													+ data[i].time + '</option>';
										} 
										html += '</option>';
										$('#time').html(html);
										$("#time").trigger("chosen:updated");
									})
					});
	
									
										
		 
	}
	
	function editAppointment()
	{
		var newDate=document.getElementById("newDate").value;
		var timeId=document.getElementById("time").value;
		//alert(timeId);
		//alert(newDate);
		var appointId= document.getElementById("appointId").value;
		//alert(appointId);
		
	//	alert("Edit");
	if(timeId=="" || timeId==null)
		{
		alert("Please Select Time!!");
		}
	else{
	 $
			.getJSON(
					'${editPatientAppointmentByDoctor}',
					{
						timeId : timeId,
						appointId : appointId,
						appointmentDate : newDate,
						 
						ajax : 'true'
					},
					function(data) {
						
						location.reload();
						
					});
					 
										
									 
	}					 
		 
	 
		
	} 
	
	
	
	function cancelAppointment()
	{
		var appointId= document.getElementById("appointId").value;
		if(confirm("Are you sure Cancel Appointment !!"))
			{
			 $
				.getJSON(
						'${deleteDoctorAppointment}',
						{
							appId : appointId,
							 
							 
							ajax : 'true'
						},
						function(data) {
							
							location.reload();
							
						});
						 
					 
			}
		
	}
  */
	
</script>
<script type="text/javascript">

</script>
<script type="text/javascript">



/* function openPage(pageUrl)
{
	 window.open("${pageContext.request.contextPath}/"+pageUrl,'_top');
	
	}
	
 



function openCunsult()
{
	 
	 window.open("https://plus.google.com/hangouts/_?gid=APP_ID",'_blank');
	
	}

 */

</script>
</body>
</html>