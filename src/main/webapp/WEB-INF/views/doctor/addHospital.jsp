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
  <c:url var="getHospitalByType" value="/getHospitalByType" />
  <c:url var="editHospitalDetails"
		value="/editHospitalDetails" />
<div class="clearfix"></div>
<section class="doc_login">
	<div class="dashboard_nm text-center"><h4>Add Hospital Info</h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
           
        	<jsp:include page="../include/leftmenu.jsp"/>
           
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">
                <div class="bhoechie-tab-content active">
					<form method="GET" action='submitDoctorHospital' >
        	<div class="editpg">
        		<div class="col-sm-4 search-input">
        		   <!-- <input type="text" id="myInput"  name="search" placeholder="Search Hospital" autocomplete="off">  -->
        		     	<input type="text" id="autocomplete" size="16" placeholder="Search Hospital">
        		   <p id="outputcontent"></p>
        		</div>
        		 <div class="col-sm-4"></div>
        		<div class="col-sm-4"></div>
        		<div class="clearfix"></div>
        		<hr>
        		<input type="hidden" name="demo" id="demo" size="16" placeholder="Search Hospital">
        	
                <div class="table-responsive">
                	<table width="100%" border="0" class="tbl table table-bordered table table-hover" id="hospitalTableBody">
															<thead>
																<tr align="center">
																	<th>Sr.No</th>
																	<th>Hospital Name</th>
																	<th>Contact No.</th>
																	<th>Email Id</th>
																	<th>Address</th>
																</tr>
															</thead>

															<tbody>
																
															</tbody>
														</table>
                </div>
				<div class="col-sm-12 text-center">
                <div class="form-group">
                    	<input type="submit" id="submitButton" value="Submit" name="submit" class="btn-fr-all">
                    	
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
<%-- <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script> --%>
<script type="text/javascript">
function openPage(pageUrl)
{
	 window.open("${pageContext.request.contextPath}/"+pageUrl,'_top');
	
}

</script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>
<script>
var currencies=[];

function getHospitalDetails(){
	var type=1;
	$.getJSON('${getHospitalByType}', {
		 
		type : type,
		
		ajax : 'true'
	}, function(data) {
		 
		
		  $.each(
					data,
					function(key, getHospitalDetailsList) {
												
						currencies.push({ value: getHospitalDetailsList.hospitalName+", "+getHospitalDetailsList.address, data: getHospitalDetailsList.hospitalId});
					
	  });

	});	
	
}


 $(function(){
	
	
	  $('#autocomplete').autocomplete({
		  
	    lookup: currencies,
	    
	    onSelect: function (suggestion) {   
	
	    var s= document.getElementById("demo").value=suggestion.data;
	   
	     getSingleHospitalDetails(s);
	      
	      $('#outputcontent').html(thehtml);
	    } 
	     
	  });
	 
	  
	});  
 
 
 function getSingleHospitalDetails(hospitalId){
	 
	 
	 $('#hospitalTableBody tr').remove();
	 
	 $.getJSON('${editHospitalDetails}', {
		 
		 hospitalId : hospitalId,
			
			ajax : 'true'
		}, function(data) {
			
			var tr = $('<tr></tr>');
			
			tr.append($('<td></td>').html(1));
			tr.append($('<td></td>').html(data.hospitalName));
			tr.append($('<td></td>').html(data.contactNo));
			tr.append($('<td></td>').html(data.email));
			tr.append($('<td></td>').html(data.address));
			
			$('#hospitalTableBody tbody').append(tr);
	 
		});
 }
 
</script>



</body>
</html>