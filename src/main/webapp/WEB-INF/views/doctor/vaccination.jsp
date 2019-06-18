<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
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
<jsp:include page="../include/doctorHeader.jsp"/> 

<c:url var="getStateByCountryId" value="/getStateByCountryId" />
<c:url var="getCityByStateId" value="/getCityByStateId" />
<c:url var="insertPatientVaccinationDetails" value="/insertPatientVaccinationDetails" />
 
<c:url var="showDoctorProfile"
		value="/showDoctorProfile" />
<c:url var="getRatingAndReviewsDetailsOfDoctor"
		value="/getRatingAndReviewsDetailsOfDoctor" />

  
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Vaccination</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
                <div class="filter_div vacciinput"> 
	               <form action="getPatientByPatientId" method="GET">
      	       	     <div class="col-sm-10">
      	       	      <label>Enter Patient Id</label>
       			      	<input type="text" id="patientId" name="patientId" placeholder="Patient id" value="${patientId}" onkeypress="return IsNumeric(event);">
       			      	<p style="color:red; font-size: 14px !important; margin: 0; line-height: 20px;">${message}</p>
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
					<div class="td-page-content tabel-responsive">
					<table width="100%">
					<c:if test="${vaccinationPatientDetails.patientId > 0}">
					<thead>
					<tr>
					<th style="width: 142.783px; text-align: center !important;"><strong>Age</strong><br><strong> (completed</strong><br><strong> weeks/months/years)</strong></th>
					<th style="width: 256.683px; text-align: center;"><strong>Vaccines</strong></th>
					<th style="width: 65.5833px; text-align: center;"><strong>Doses</strong></th>
					<th style="width: 65.5833px; text-align: center;"><strong>Date</strong></th>
					<th style="width: 65.5833px; text-align: center;"><strong>Doctor</strong></th>
					</tr>
					 
			</thead>
				</c:if>
				<tbody>
				 <c:forEach items="${vaccinationDisplayList}" var="vaccinationAgeDisplayList">	
				
				 <tr>
					<td style="width: 142.783px;"  rowspan="${fn:length(vaccinationAgeDisplayList.vaccinationDetailsList)}">${vaccinationAgeDisplayList.vaxinationAgeName}</td>
			 	<c:forEach items="${vaccinationAgeDisplayList.vaccinationDetailsList}" var="vaccinationDisplayList1" varStatus="count">
					<c:if test="${count.index!=0 }">
				<tr>
				</c:if>
				 
				  <td style="width: 256.683px;"><span>${vaccinationDisplayList1.vaccinationName} </span></td>
				  <c:set var="status" value=""/>
				    <c:set var="date" value=""/>
				  <c:forEach items="${savePatientVaccinationList}" var="savePatientVaccination">
				 
				  <c:if test="${savePatientVaccination.vacciantionId==vaccinationDisplayList1.vaccinationId}">
				  <c:set var="status" value="checked disabled"/>
				   <c:set var="date" value="${savePatientVaccination.modifiedDate}"/>
				   <c:set var="doctorName" value="${savePatientVaccination.string1}"/>
				 </c:if> 
				 
				 </c:forEach> 
			
			<td style="width: 65.5833px;"><input type="checkbox" ${status} value="${vaccinationDisplayList1.vaccinationId}" id="vaccinationCheckedBox${vaccinationDisplayList1.vaccinationId}" onclick="getCheckedBoxes(${vaccinationDisplayList1.vaccinationId},'${vaccinationDisplayList1.vaccinationName}','${vaccinationPatientDetails.fName} ${vaccinationPatientDetails.mName} ${vaccinationPatientDetails.lName}')"></td>
				<td style="width: 256.683px;">${date}
				</td>
				
				<td>${doctorName}</td>
				<c:set var="doctorName" value="${savePatientVaccination.string1}"/>
				
				
				</tr>
			 
				</c:forEach>
				 
				</c:forEach> 
				
					</tbody>
					</table>
</div>       
 <%--  <div class="loader1"> <img src="${pageContext.request.contextPath}/resources/images/b_logo.png" class="img-responsive" alt="logo"></div> --%>
       			     <div class="loader2"> </div>
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
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'> 
</script>-->
<script>

function getCheckedBoxes(vaccinationId,vaccinationName,patientName){
	
	document.getElementById("vaccinationCheckedBox"+vaccinationId).value=vaccinationId;
	if(confirm("Are you sure "+vaccinationName+" vaccination is done for "+patientName+"?")){
		if(vaccinationId!=0){
		
			
			document.getElementById("vaccinationCheckedBox"+vaccinationId).disabled=true;
			insertVaccinationDetails(vaccinationId);
			location.reload();
	
		}
	
	}else
	{
		document.getElementById("vaccinationCheckedBox"+vaccinationId).checked=false;
	}
	
}

 
 /* function showPatientDetailsDiv(){
	
	document.getElementById("babyDetailsId").style.display="block";
		
} */
 

</script>



<script type="text/javascript">


function insertVaccinationDetails(vaccinationId){
	
	 var patientId=document.getElementById("patientId1").value;
	
	$.getJSON(
			'${insertPatientVaccinationDetails}',

			{
			 
				patientId : patientId,
				vaccinationId : vaccinationId,
				
				ajax : 'true'

			}); 
	
	
}	
	



</script>

</body>
</html>