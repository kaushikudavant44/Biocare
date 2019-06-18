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
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<style type="text/css">


.bd-example-modal-lg3 .modal-dialog{
    display: table;
    position: relative;
    margin: 0 auto;
    top: calc(50% - 24px);
  }

  .bd-example-modal-lg3 .modal-dialog .modal-content{
    background-color: transparent;
    border: none;
  }
</style>
</head>
<body>
	<jsp:include page="../include/doctorHeader.jsp" />


	<c:url var="getAppointTimeByDateAndClinic"
		value="/doctorAvailableTime/getAppointTimeByDateAndClinic" />
	<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />
	<c:url var="getAppointTimeForUnavailableTime"
		value="/getAppointTimeForUnavailableTime" />
		<c:url var="addFixScheduleToList"
		value="/doctorAvailableTime/addFixScheduleToList" />
		

	<div class="clearfix"></div>
	<section class="doc_login doc_filter">
	<div class="dashboard_nm text-center">
		<h4>Check Availability</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/leftmenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="referal_sec check_availability">
							<div class="detls_input doc-avlb">
								<form
									action="${pageContext.request.contextPath}/doctorAvailableTime/submitFixScheduleToList"
									method="POST" id="scheduleForm" name="scheduleForm">


									<div class="filter_div new-doc-filter">
										
											  
											<c:set var="sel" value="" />
											<div class="col-sm-4">
												<label>Select Clinic / Hospital</label> <select id="clinicId"
													name="clinicId" onchange="getTimeList(2);" required>
													<option selected value="" id="clinicfirst" disabled="disabled">Select
														Clinic/Hospital</option>
 							<optgroup label="Clinic">
													<c:forEach items="${getDoctorHospitalDetailsList}"
														var="getDoctorHospitalDetailsList">
														<c:choose>

															<c:when
																test="${getDoctorHospitalDetailsList.hospitalType==0}">
																<c:set var="sel" value="" />
																<c:choose>
																	<c:when
																		test="${hospitalId==getDoctorHospitalDetailsList.hospitalId}">
																		<c:set var="sel" value="selected" />
																	</c:when>
																</c:choose>
																<option ${sel}
																	value="${getDoctorHospitalDetailsList.hospitalId}">${getDoctorHospitalDetailsList.hospitalName}</option>
															</c:when>
														</c:choose>
													</c:forEach>
													
													</optgroup>

<optgroup label="Hospital">
<c:forEach items="${getDoctorHospitalDetailsList}"
														var="getDoctorHospitalDetailsList">
														<c:choose>
															<c:when
																test="${getDoctorHospitalDetailsList.hospitalType==1}">
																<c:set var="sel" value="" />
																<c:choose>
																	<c:when
																		test="${hospitalId==getDoctorHospitalDetailsList.hospitalId}">
																		<c:set var="sel" value="selected" />
																	</c:when>
																</c:choose>
																<option ${sel}
																	value="${getDoctorHospitalDetailsList.hospitalId}">${getDoctorHospitalDetailsList.hospitalName}</option>
															</c:when>
														</c:choose>
													</c:forEach>
</optgroup>
												</select>
												<input name="clinicName" type="hidden" id="clinicName">
											</div>
											  
									</div>
									<div class="clearfix"></div>
									<br>
									<div class="row">
										<div class="col-md-6 pull-right">
											<div class="row">
										<div class="col-sm-8 text-right">

											<label class="patient-slot">No of Patient Per Time Slot</label>
										</div>
										<div class="col-sm-4">
											<input class="text-input" id="noOfPatient" type="number" name="noOfPatient" min="1" max="6" 
												placeholder="Enter No of Patient Per Time Slot" value="1" onkeyup="getProperValue()" required>
										</div>
										<!-- <div class="col-sm-4">
											<input class="submit-btn" type="submit" onclick="validationForm()" value="Submit">
										</div> -->
									</div>
										</div>
									</div>
							<div class="clearfix"></div>
									
									
	<div class="doc_availble">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true">Morning Slots</a>
                    
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="dr-time-slot">
											<div class="col-md-12 avlb-blk">
											
												<ul id="morning">
													<c:forEach items="${timeList}" var="time" varStatus="count">
														<c:choose>
															<c:when test="${time.timeId<25}">
																<c:set var="properties" value="" />
																<c:set var="disabledStatus" value="" />
																<c:choose>
																	<c:when test="${time.int1!=0}">
																		<c:choose>
																			<c:when test="${time.int1==hospitalId}">
																				<c:set var="properties" value="checked" />

																			</c:when>
																			<c:otherwise>
																				<c:set var="properties" value="checked" />
																				<c:set var="disabledStatus" value="disabled" />
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<c:set var="properties" value="" />
																	</c:otherwise>
																</c:choose>
																<li class="white-tooltip" data-toggle="tooltip" title="${timeList[count.index].string1}" ><span class="button-checkbox">
																		<button type="button" ${disabledStatus} class="btn flag_class"
																			data-color="info">${timeList[count.index].time}
																			To ${timeList[count.index+1].time}  </button> <input
																		value="${timeList[count.index].timeId}_${timeList[count.index].time}" name="timeId"
																		${disabledStatus} type="checkbox" ${properties}
																		class="hidden flag_class" />
																</span></li>
															 
															</c:when>
														</c:choose>
													</c:forEach>
												</ul>

											</div>
                </div>
            </div>
        </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" aria-expanded="false" href="#collapseTwo">Afternoon Slots</a>
               	 
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                <div class="dr-time-slot">
                    <div class="col-md-12 avlb-blk">
											
												<ul>


													<c:forEach items="${timeList}" var="time" varStatus="count">
														<c:choose>
															<c:when test="${time.timeId>24 && time.timeId<35}">
																<c:set var="properties" value="" />
																<c:set var="disabledStatus" value="" />
																<c:choose>
																	<c:when test="${time.int1!=0}">
																		<c:choose>
																			<c:when test="${time.int1==hospitalId}">
																				<c:set var="properties" value="checked" />

																			</c:when>
																			<c:otherwise>
																				<c:set var="properties" value="checked" />
																				<c:set var="disabledStatus" value="disabled" />
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<c:set var="properties" value="" />
																	</c:otherwise>
																</c:choose>
																<li class="white-tooltip" data-toggle="tooltip" title="${timeList[count.index].string1}"><span class="button-checkbox">
																		<button type="button" ${disabledStatus} class="btn flag_class"
																			data-color="info">${timeList[count.index].time}
																			To ${timeList[count.index+1].time}</button> <input
																		value="${timeList[count.index].timeId}_${timeList[count.index].time}" name="timeId"
																		${disabledStatus} type="checkbox" ${properties}
																		class="hidden flag_class" />
																</span></li>
																 	
															</c:when>
														</c:choose>
													</c:forEach>


												</ul>

											</div>
											</div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" aria-expanded="false"  href="#collapseThree">Evening Slots</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                <div class="dr-time-slot">
                    <div class="col-md-12 avlb-blk">
											
												<ul>
													<c:forEach items="${timeList}" var="time" varStatus="count">
														<c:choose>
															<c:when test="${time.timeId>34 && time.timeId<41}">
																<c:set var="properties" value="" />
																<c:set var="disabledStatus" value="" />
																<c:choose>
																	<c:when test="${time.int1!=0}">
																		<c:choose>
																			<c:when test="${time.int1==hospitalId}">
																				<c:set var="properties" value="checked" />

																			</c:when>
																			<c:otherwise>
																				<c:set var="properties" value="checked" />
																				<c:set var="disabledStatus" value="disabled" />
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<c:set var="properties" value="" />
																	</c:otherwise>
																</c:choose>
																<li class="white-tooltip" data-toggle="tooltip" title="${timeList[count.index].string1}"><span class="button-checkbox">
																		<button type="button" ${disabledStatus} class="btn flag_class"
																			data-color="info">${timeList[count.index].time}
																			To ${timeList[count.index+1].time}</button> <input
																		value="${timeList[count.index].timeId}_${timeList[count.index].time}" name="timeId"
																		${disabledStatus} type="checkbox" ${properties}
																		class="hidden flag_class" />
																</span></li>
																 	
															</c:when>
														</c:choose>
													</c:forEach>
												</ul>
											
											</div>
											
											</div>
											
                </div>
                
            </div>
            </div>
            <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" aria-expanded="false"  href="#collapseFour">Night Slots</a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body">
                <div class="dr-time-slot">
                   <div class="col-md-12 avlb-blk">
											
												<ul>
													<c:forEach items="${timeList}" var="time" varStatus="count">
														<c:choose>
															<c:when test="${time.timeId>40 && time.timeId<49}">
																<c:set var="properties" value="" />
																<c:set var="disabledStatus" value="" />
																<c:choose>
																	<c:when test="${time.int1!=0}">
																		<c:choose>
																			<c:when test="${time.int1==hospitalId}">
																				<c:set var="properties" value="checked" />

																			</c:when>
																			<c:otherwise>
																				<c:set var="properties" value="checked" />
																				<c:set var="disabledStatus" value="disabled" />
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<c:set var="properties" value="" />
																	</c:otherwise>
																</c:choose>
																<c:set var="toTime"
																	value="${timeList[count.index+1].time}" />
																<c:choose>

																	<c:when test="${time.timeId==48}">
																		<c:set var="toTime" value="${timeList[0].time}" />
																	</c:when>
																</c:choose>
																<li class="white-tooltip" data-toggle="tooltip" title="${timeList[count.index].string1}"><span class="button-checkbox">
																		<button type="button" ${disabledStatus} class="btn flag_class"
																			data-color="info">${timeList[count.index].time}
																			To ${toTime}</button> <input
																		value="${timeList[count.index].timeId}_${timeList[count.index].time}" name="timeId"
																		${disabledStatus} type="checkbox" ${properties}
																		class="hidden flag_class" />
																		  
																		
																</span></li>
															 
															</c:when>
														</c:choose>
													</c:forEach>
												</ul>

											</div>
											</div>
											
                </div>
            </div>
            </div>
           
<!--             <input class="submit-btn" type="submit" value="Add To Schedule">
 -->              
           <!--   <input class="submit-btn" type="submit" onclick="validationForm()" value="Submit"> -->
        </div>
      
				
										
    </div>
    	<div class="col-sm-4">
    	</div>
	<div class="col-sm-2">
											 <input class="submit-btn"  id ="submitTime"type="button"  value="Add">
  
   
										</div>
										<div class="col-sm-2">
										 <input class="submit-btn"  type="submit" onclick="return(checkValidation());" value="Submit">
										</div>
 
</form>
</div>
								


							</div>



						
					</div>
				</div>

			</div>
		</div>
	</div>
	</section>
	 
<div class="modal fade bd-example-modal-lg3 myLoader" data-backdrop="static" data-keyboard="false" tabindex="-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 48px">
            <span class="fa fa-spinner fa-spin fa-3x"></span>
        </div>
    </div>
</div>
	 

	<div class="clearfix"></div>
	<jsp:include page="../include/footer.jsp" />
	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
	<script>
$(document).ready(function() {
    $("input[name$='status']").click(function() {
        var test = $(this).val();

        $("div.desc").hide();
        $("#Cars"+test).show();
    });
});

$(document).ready(function() {
    $("input[class$='status']").click(function() {
        var test = $(this).val();
        

        $("div.desc").hide();
        $("#Cars3"+test).show();
    });
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
  
  $('.datepicker').datepicker({ format: "dd-mm-yyyy", startDate:new Date(), autoclose: true}).datepicker();
</script>


	<script>
$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
        	
        	if(document.getElementById("clinicId").value=="" || document.getElementById("clinicId").value==null)
        		{
        	alert("Select first clinic OR Hospital");
        		 }
        	else{
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        	}
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });
});
</script>


	<script type="text/javascript">
function getTimeList(no)
{
	
	/* var date=document.getElementById("date").value;
	var hospitalId=0
	if(no==2)
	  hospitalId=document.getElementById("clinicId").value;
	else if(no==3)
	 hospitalId=document.getElementById("hospitalId").value;
	
	
	document.getElementById("hospital").value=hospitalId;
	window.open("${pageContext.request.contextPath}/doctorAvailableTime/showAvailableTimePage?hospitalId="+hospitalId+"&date="+date, "_self");
 */
	}

/* function validationForm()
{
	if( document.getElementById("hospital").value=="" || document.getElementById("hospital").value==null)
	alert("Select Clinic or Hospital !!");
	} */
	
	
function getProperValue(){
	
	
	var minValue=document.getElementById("noOfPatient").value;
	
	
	var maxValue=document.getElementById("noOfPatient").value;
	
	
	if(minValue < 1 || maxValue > 6){
		
		alert("Enter patient value less than 6 or greater than 0");
		document.getElementById("noOfPatient").value="";
	}
	
}
</script>
<script type="text/javascript">
/* function submitFixSchedule(e)
{
	var frm = $('#scheduleForm');

    

        e.preventDefault();

        $.ajax('${addFixScheduleToList}', {
  		  type: "POST",
           
  		  contentType : 'application/json; charset=utf-8',
	      dataType : 'json', 
            data: $('form[name=scheduleForm]').serialize(),
        },function (data) {
                console.log('Submission was successful.');
                console.log(data.message);
            });
   
	
	}
	 */
	//button
	
	$('#clinicId').on('change', function() {
		var clinicName=$("#clinicId option:selected").text();
		$('#clinicName').val(clinicName);
});
	 
	 var flag=false;
	$(function(){
		
		$('#submitTime').click(function (e){
			
			    	
			var clinicName=$("#clinicId option:selected").text();
			$('#clinicName').val(clinicName);
			
			 e.preventDefault();
			//	alert("submitted  data : "+$('form[name=scheduleForm]').serialize());
			
			 var timeId = document.getElementsByName("timeId");
			   flag=false;
			  var i;
			  for (i = 0; i < timeId.length; i++) {
			    if (timeId[i].checked && !timeId[i].disabled) {
			    	flag=true;
			    	break;
			    }
			  }
			    if(flag){
			    	$('.myLoader').modal('show');
		        $.ajax('addFixScheduleToList', {
		  		  type: "POST",
		           
		  		
		            data: $('form[name=scheduleForm]').serialize(),
		            
		            
		            success: function (data,status,xhr) {   // success callback function
						$('.myLoader').modal('hide');
				   },
				   error: function (jqXhr, textStatus, errorMessage) { // error callback 
					   $('.myLoader').modal('hide');
				   alert("Failed To Update");
				   }
		            });
		        
		      var clinic= $('#clinicId').val();
		        	//	$('#clinicId option[value='+clinic+']').attr('disabled','disabled');
		        		$("#clinicId option[value="+clinic+"]").remove();
		        		 
		        		$('#clinicId option[id=clinicfirst]').attr('selected','selected');
		        		
		        		$('.active').each(function() {
		        		    if(!$(this).is(':checked')) {
		        		        $(this).prop('disabled', true);
		        		        
		        		    }
		        		});
		        		var _checked;
		        		 $('input[type=checkbox]').each(function() {
		        		        if($(this).is(':checked'))
		        		        $(this).prop('disabled','disabled');
		        		    });
			}
			    else{
			    	alert("Please Select Time slot");
			    	}
			    
		        		
		});
		var clinicName=$("#clinicId option:selected").text();
		$('#clinicName').val(clinicName);
	});
	
	</script>
<script type="text/javascript">
function checkValidation() {
 
	  if(flag){
		
				if(confirm('Submit fix Schedule ?')){
					
					 document.getElementById("scheduleForm").submit();
					 return true;
				}
	}
	   
 
	var timeId = document.getElementsByName("timeId");
 
	  var isValidated=false;
	  for (var i = 0; i < timeId.length; i++) {
	    if (timeId[i].checked) {
	    	isValidated=true;
	    	 
	    }
	    
	  } 
 if(!isValidated)
	 {
	 alert("Please select Time slot first");
	 }
		 return isValidated;
//	 alert(isValidated);
	 
  
	 
}
</script>
</body>
</html>