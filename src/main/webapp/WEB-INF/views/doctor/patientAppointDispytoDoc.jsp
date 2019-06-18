<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">

<script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
            //document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
       
    </script>
</head>         
<body>


	<c:url var="getAppointmentsTime" value="/getAppointmentsTime" />
  	  	<c:url var="deleteDoctorAppointment" value="/deleteDoctorAppointment" />
  	<c:url var="editPatientAppointmentByDoctor" value="/editPatientAppointmentByDoctor" />
  	<c:url var="sendConsultingPaymentRequest" value="/sendConsultingPaymentRequest" />
  	
  	
  	
<jsp:include page="../include/doctorHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login inssurance_buy">
<div class="dashboard_nm text-center"><h4>Patient Appointment</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
            <fmt:parseDate value="${currentDate}" var="currDate" 
                              pattern="dd-MM-yyyy" />
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content">
	      			</div>
	 
	                <div class="bhoechie-tab-content active">
	               <div class="filter_div doc_fil">
	               <div class="col-md-12 col-sm-12"> 
	               <h3>Select Dates <%--to previous appointment--%></h3>
	               </div>
	               <form action="showViewDoctorAppointment" method="get" id="getAppointmentFormId">
	                 
      	       	      <div class="col-sm-3">
      	       	      <label>From Date</label>
       			      	<input type="text" name="fromDate" id="fromDate" placeholder="From Date" class="datepicker form-control" value="${fromDate}" readonly>
       			      </div>
       			          
       			      <div class="col-sm-3">
       			      <label>To Date</label>
       			      	 <input type="text" name="toDate" id="toDate" placeholder="To Date" class="datepicker form-control"  value="${toDate}" readonly>
       			      </div>
       			      
       			      <div class="col-sm-1 text-center">
       			      <label class="mar-top30">OR</label>
       			      </div>
       			      
       			      <div class="col-sm-3">
       			      <label>Patient Id</label>
       			      	 <input type="text" name="patientId" id="patientId" placeholder="Patient Id" class="form-control"  value="${patientId}" onkeypress="return IsNumeric(event);">
       			      </div>
       			       <div class="col-sm-2">
       			       <input type="button" value="Search" class="btn-fr-all dspl-appt" onclick="showLoader()"> 
       			       
	                 </div>
	                 </form>
       			      </div>  
       			      <div class="clearfix"></div>
       			    	<hr>
       			    	 <%--  <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
       			     <div class="loader2"> </div>
       			     <div class="bs-example appontlist">
							<ul class="nav nav-tabs newappon">
								
								<c:set value="0" var="inPersonCou"></c:set>
								<li class="active"><a data-toggle="tab" href="#sectionA"><p>In Person Appointment <span class="w3-badge w3-blue" id="inPersonCount"></span></p></a></li>
								
								<c:set value="0" var="virtualCountVar"></c:set>
								<li> <a data-toggle="tab" href="#sectionB"><p>Virtual Appointment <span class="w3-badge w3-red" id="virtualAppCount"></span></p></a></li>
							</ul>
							
    							
							<form>
							<div class="tab-content">
							
							<div id="sectionA" class="tab-pane fade in active">
							
			<c:forEach items="${getTempAppointmentList}" var="getTempAppointmentList" varStatus="count" >
				<c:if test="${getTempAppointmentList.int_1==0}">
				<fmt:parseDate value="${getTempAppointmentList.date}" var="apppointDate" 
                              pattern="dd-MM-yyyy" />
  					
  					
  					<div class="appointment-div docpatientApp">
  						<div class="col-sm-4">
							  <h4 class="dropbtn marbot0"><i class="icon-doctor-1 font20"></i><%-- <img src="${pageContext.request.contextPath}/resources/images/patCount1.png" class="img-responsive" alt="patient Counter"> --%>  ${getTempAppointmentList.patientName}</h4>
							  <h5  class="martop0">Hospital Name: <strong class="fontcolor"><a href="#">${getTempAppointmentList.hospitalName}</a></strong></h5>
  						</div>
  						
  						
  						<div class="col-sm-4 text-center">
  						    <h5>Date : ${getTempAppointmentList.date}</h5>
  						    <h5>Time : ${getTempAppointmentList.time}</h5>
  						</div>
  						<div class="col-sm-4">
  						
  						
  							<p class="text-right">
  							<c:choose>
  							<c:when test="${getTempAppointmentList.status==1 && currDate <= apppointDate}">
        
  							<a href="${pageContext.request.contextPath}/showDoctorConsulting/${getTempAppointmentList.patientId}/${getTempAppointmentList.appointId}/${getTempAppointmentList.hospitalId}/0" class="btn-fr-all">Consult</a> 
  							
  							</c:when>
  							<%-- <c:when test="${getTempAppointmentList.int_1==1 && getTempAppointmentList.status==1 && getTempAppointmentList.delStatus==0}">
        
  							<a href="${pageContext.request.contextPath}/showDoctorConsulting/${getTempAppointmentList.patientId}/${getTempAppointmentList.appointId}" class="btn-fr-all">Consult</a> 
  							
  							</c:when> --%>
  							</c:choose>
  							
  							  <c:choose>
  							 <c:when test="${getTempAppointmentList.status==0 && currDate <= apppointDate || getTempAppointmentList.status==1 && currDate <= apppointDate || getTempAppointmentList.status==3 && currDate <= apppointDate}">
        				
  							<a href="#" onclick="setAppointId(${getTempAppointmentList.appointId}, ${getTempAppointmentList.doctorId},'${getTempAppointmentList.date}',${getTempAppointmentList.timeId},'${getTempAppointmentList.time}'), getAppointTime(${getTempAppointmentList.timeId});" class="btn-fr-all"  data-toggle="modal" data-target=".bs-example-modal-lg2">Edit/Confirm</a>
  							</c:when>
  							</c:choose>
  							</p>
  						</div>
  						<div class="clearfix"></div>
  						<hr>
  						<div class="col-sm-4"></div>
  						<div class="col-sm-4">
  						 
                                <c:choose>
                              <c:when test="${getTempAppointmentList.status==0}">
                              
  							<h5 class="text-center">Status : <span class="orange_color">Pending</span></h5>
  							
  							</c:when>
  							 <c:when test="${getTempAppointmentList.status==1}">
                              
  							<h5 class="text-center">Status : <span class="green_color">Confirm</span></h5>
  							
  							</c:when>
  							
  							 <c:when test="${getTempAppointmentList.status==2}">
                              
  							<h5 class="text-center">Status : <span class="red_color">Cancel</span></h5>
  							
  							</c:when>
  							 <c:when test="${getTempAppointmentList.status==3}">
                              
  							<h5 class="text-center">Status : <span class="red_color">Reject</span></h5>
  							
  							</c:when>
  							 <c:when test="${getTempAppointmentList.status==4}">
                              
  							<h5 class="text-center">Status : <span class="green_color">Complete</span></h5>
  							
  							</c:when>
  							
  							</c:choose>
  							
  							 <c:choose>
  							 <c:when test="${getTempAppointmentList.int_1==0}">
                              
  							<!-- <h5 class="text-center">Type : <span class="grey_color">Offline</span></h5> -->
  							
  							</c:when>
  							
  							 <c:when test="${getTempAppointmentList.int_1==1}">
                              
  							<!-- <h5 class="text-center">Type : <span class="blue_color">Online</span></h5> -->
  							
  							</c:when>
  							
  							
  							</c:choose>
  							
  						</div>
  						<div class="col-sm-4"></div>
  					</div>
  					<c:set value="${inPersonCou + 1}" var="inPersonCou"></c:set>
  					
  						
  					</c:if>
  					
  					<c:if test="${count.last}">
          <input type="hidden" id="inPerson" value="${inPersonCou}"/>
       </c:if>
  					</c:forEach>
								</div>
								 
			<div id="sectionB" class="tab-pane fade">
			
			<c:forEach items="${getTempAppointmentList}" var="getTempAppointmentList" varStatus="countabc" >
			
					<c:if test="${getTempAppointmentList.int_1==1}">
									<fmt:parseDate value="${getTempAppointmentList.date}" var="apppointDate" 
                              pattern="dd-MM-yyyy" />
  					<div class="appointment-div docpatientApp">
  						<div class="col-sm-4">
							  <h4 class="dropbtn font20"><i class="icon-doctor-1 font20"></i><%-- <img src="${pageContext.request.contextPath}/resources/images/patCount1.png" class="img-responsive" alt="patient Counter"> --%> ${getTempAppointmentList.patientName}</h4>
							  <h5>Hospital Name: <strong><a href="#">${getTempAppointmentList.hospitalName}</a></strong></h5>
  						</div>
  						<div class="col-sm-4 text-center">
  						    <h5>Date : ${getTempAppointmentList.date}</h5>
  						    <h5>Time : ${getTempAppointmentList.time}</h5>
  						    
  							
  						</div>
  						<div class="col-sm-4">
  						
  						
  							<p class="text-right">
  							
  							
  							 
  							<c:choose>
  							<c:when test="${getTempAppointmentList.status==1 && currDate <= apppointDate}">
        					
        					<c:choose>
        					<c:when test="${getTempAppointmentList.paymentStatus==1}">
  						<a href="${pageContext.request.contextPath}/showDoctorConsulting/${getTempAppointmentList.patientId}/${getTempAppointmentList.appointId}/${getTempAppointmentList.hospitalId}/1" class="btn-fr-all">Consult</a>  
  							</c:when>
  							<c:otherwise>
  							<a href="#" onclick="sendConsultingPaymentRequest(${getTempAppointmentList.patientId},${getTempAppointmentList.appointId});" class="btn-fr-all">Send Payment Request</a>  
  							</c:otherwise>
  							</c:choose>
  							</c:when>
  							<%-- <c:when test="${getTempAppointmentList.int_1==1 && getTempAppointmentList.status==1 && getTempAppointmentList.delStatus==0}">
        
  							<a href="${pageContext.request.contextPath}/showDoctorConsulting/${getTempAppointmentList.patientId}/${getTempAppointmentList.appointId}" class="btn-fr-all">Consult</a> 
  							
  							</c:when> --%>
  							</c:choose>
  							
  							  <c:choose>
  							 <c:when test="${getTempAppointmentList.status==0 && currDate <= apppointDate || getTempAppointmentList.status==1 && currDate <= apppointDate || getTempAppointmentList.status==3 && currDate <= apppointDate}">
								
							<a href="#" onclick="setAppointId(${getTempAppointmentList.appointId}, ${getTempAppointmentList.doctorId},'${getTempAppointmentList.date}',${getTempAppointmentList.timeId},'${getTempAppointmentList.time}'), getAppointTime(${getTempAppointmentList.timeId});" class="btn-fr-all"  data-toggle="modal" data-target=".bs-example-modal-lg2">Edit/Confirm</a>
  								
  							</c:when>
  							</c:choose>
  							</p>
  						</div>
  						<div class="clearfix"></div>
  						<hr>
  						<div class="col-sm-4"></div>
  						<div class="col-sm-4">
  						 
                                <c:choose>
                              <c:when test="${getTempAppointmentList.status==0}">
                              
  							<h5 class="text-center">Status : <span class="orange_color">Pending</span></h5>
  							
  							</c:when>
  							 <c:when test="${getTempAppointmentList.status==1}">
                              
  							<h5 class="text-center">Status : <span class="green_color">Confirm</span></h5>
  							
  							</c:when>
  							
  							 <c:when test="${getTempAppointmentList.status==2}">
                              
  							<h5 class="text-center">Status : <span class="red_color">Cancel</span></h5>
  							
  							</c:when>
  							 <c:when test="${getTempAppointmentList.status==3}">
                              
  							<h5 class="text-center">Status : <span class="red_color">Reject</span></h5>
  							
  							</c:when>
  							 <c:when test="${getTempAppointmentList.status==4}">
                              
  							<h5 class="text-center">Status : <span class="green_color">Complete</span></h5>
  							
  							</c:when>
  							
  							</c:choose>
  							
  							 <c:choose>
  							 <c:when test="${getTempAppointmentList.int_1==0}">
                              
  							<!-- <h5 class="text-center">Type : <span class="grey_color">Offline</span></h5> -->
  							
  							</c:when>
  							
  							 <c:when test="${getTempAppointmentList.int_1==1}">
                              
  							<!-- <h5 class="text-center">Type : <span class="blue_color">Online</span></h5> -->
  							
  							</c:when>
  							
  							
  							</c:choose>
  							
  						</div>
  						<div class="col-sm-4"></div>
  				
  						
  					</div>
  						<c:set value="${virtualCountVar + 1}" var="virtualCountVar"></c:set>
  					
  					
      		
      		
  						
  						
  					</c:if>
  					<c:if test="${countabc.last}">
          		<input type="hidden" id="virtualId" value="${virtualCountVar}"/>
       		</c:if>
  					</c:forEach>
							
						        </div>
						
							</div>
						</form>
						</div>
	                
  					
  					 
  					 
	                </div>
            </div>
               
            </div>
             </div>
         </div>
</section>
<input type="hidden" name="appointId" id="appointId">
<input type="hidden" name="doctorId" id="doctorId">
<!--- select time--->
<div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Appointment</h4>
       <%--  </c:when>
        </c:choose> --%>
      </div>
      <div class="modal-body">
      	       <div class="row">
      	       	      <div class="col-sm-6">
       			      	<input type="text" onchange="getAppointTime(0)" class="datepicker" placeholder="select new date" id="newDate" name="newDate" disabled>
       			      </div>
       			      <div class="col-sm-6">
       			      	<select class="slct_lst" name="time" id="time">
			      		   
			      			  
			      		</select>
       			      </div>
       			</div>
       			<div class="clearfix"></div>
       			<hr>
       			<p class="text-center big-screen">
       			<a href="#" onclick="cancelAppointment()" class="btn-fr-all btn_red">Cancel Appointment</a>
       			
       			 <a href="#" onclick="editAppointment()" class="btn-fr-all">Confirm Appointment</a>
       			 </p>
       			 <p class="text-center small-screen">
       			<a href="#" onclick="cancelAppointment()" class="btn-fr-all btn_red">Cancel</a>
       			
       			 <a href="#" onclick="editAppointment()" class="btn-fr-all">Confirm</a>
       			 </p>
      </div>
  </div>
</div>
<!--- End select time--->

<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>

<script type="text/javascript">
function showLoader()
{
	var fromDate=document.getElementById("fromDate").value;
	var toDate=document.getElementById("toDate").value;
	var patientId=document.getElementById("patientId").value;
	var x = new Date(fromDate);
	var y = new Date(toDate);
	if(patientId==null || patientId==''){
	if(x>y){
		alert("Please Enter Valid Dates");
	}else{
		
		document.getElementById("getAppointmentFormId").submit();	
		document.getElementById("loader").style.display='block';	
	
	}
	}else{
		
		document.getElementById("getAppointmentFormId").submit();	
		document.getElementById("loader").style.display='block';	
	
	}
}
</script>
<script type="text/javascript">



var inPersonCount=document.getElementById("inPerson").value;
document.getElementById("inPersonCount").innerHTML=inPersonCount;

</script>
<script type="text/javascript">
var virtualAppointmentId=document.getElementById("virtualId").value;
document.getElementById("virtualAppCount").innerHTML=virtualAppointmentId;
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
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script> -->

<script type="text/javascript">

	              /* $(".datepicker").datepicker({
	            	  dateFormat: "yy-mm-dd",
	            	  minDate: 0,
	            	  autoclose: true
	            	}); */
	            	$(".datepicker").datepicker({
		            	 format: "dd-mm-yyyy",
		            	  autoclose: true
		            	});

	          
</script>

<script type="text/javascript">

function setAppointId(appointId, doctorId,date,timeId,time)
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




function getAppointTime(timeId)
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
					
					
					if(data.appointmentTimeList!=null)
						{
										
				$.each(
								data.appointmentTimeList,
								function(key, allTimeList) {
									
								 var html = '<option value="" disabled="disabled" selected >Choose Time...</option>';		
								 var temp=0;
					  $.each(
								data.appointmentTimeList,
								function(key, timeList) {
									
									if(timeList.timeId==allTimeList.timeId){
										
										 var node = document.createElement("option");
							    		 
							    		  var textnode = document.createTextNode(timeList.time);
							    		  node.setAttribute("value", timeList.timeId);
							    		 
							    		  node.appendChild(textnode);
							    		  document.getElementById("time").appendChild(node);
  
									}
								});
					 
								});
				
						}
					
			
			});
	
 	 
}		

function editAppointment()
{
	var newDate=document.getElementById("newDate").value;
	var timeId=document.getElementById("time").value;
	var appointId= document.getElementById("appointId").value;
	
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
</script>

<script type="text/javascript">
function sendConsultingPaymentRequest(patientId, appointmentId)
{
	
	$
	.getJSON(
			'${sendConsultingPaymentRequest}',
			{
				patientId : patientId,
				appointmentId : appointmentId,
				 
				ajax : 'true'
			},
			function(data) {
				alert(data.message);
			});
	
}
</script>
</body>
</html>