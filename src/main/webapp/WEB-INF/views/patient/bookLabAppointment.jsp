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
<link href="${pageContext.request.contextPath}/resources/css/default.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/alertify.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />

<style>
.starChecked {
	color: orange;
}
li.selected {
    color: green;
}
</style>


<style>


p {
  display: block;
  font-size: 1.35em;
  line-height: 1.5em;
  margin-bottom: 22px;
}

a { color: #5a9352; text-decoration: none; }
a:hover { text-decoration: underline; }

.center { display: block; text-align: center; }


/** page structure **/
#w {
  display: block;
  width: 750px;
  margin: 0 auto;
  padding-top: 30px;
}

#content {
  display: block;
  width: 100%;
  background: #fff;
  padding: 25px 20px;
  padding-bottom: 35px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
}

#searchfield { display: block; width: 100%; text-align: center; margin-bottom: 35px; }

#searchfield form {
  display: inline-block;
  background: #eeefed;
  padding: 0;
  margin: 0;
  padding: 5px;
  border-radius: 3px;
  margin: 5px 0 0 0;
}
#searchfield form .biginput {
  width: 600px;
  height: 40px;
  padding: 0 10px 0 10px;
  background-color: #fff;
  border: 1px solid #c8c8c8;
  border-radius: 3px;
  color: #aeaeae;
  font-weight:normal;
  font-size: 1.5em;
  -webkit-transition: all 0.2s linear;
  -moz-transition: all 0.2s linear;
  transition: all 0.2s linear;
}
#searchfield form .biginput:focus {
  color: #858585;
}



.flatbtn {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #f3faef;
  text-decoration: none;
  background-color: #6bb642;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.2em;
  font-weight: bold;
  padding: 12px 22px 12px 22px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  -moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}
.flatbtn:hover {
  color: #fff;
  background-color: #73c437;
}
.flatbtn:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}



.autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto; width:250px !important; }
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; border-bottom: 1px dashed #999; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }

</style>





</head>         
<body onload="getCityList()">
<jsp:include page="../include/patientHeader.jsp"/> 


<c:url var="getLabAppointmentsTime" value="/getLabAppointmentsTime" />

<c:url var="bookLabAppointment" value="/bookLabAppointment" />
<c:url var="getLabReviewByLabId" value="/getLabReviewByLabId" />  
	<c:url var="getStateByCountryId" value="/getStateByCountryId" />
	<c:url var="getCityByStateId" value="/getCityByStateId" />
 <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  <c:url var="submitDoctorRating" value="/submitDoctorRating" />		
  <c:url var="submitLabRating" value="/submitLabRating" />	
  
<div class="clearfix"></div>
<section class="doc_login doc_filter">
<div class="dashboard_nm text-center"><h4>Book Lab Appointment </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content">
	      			</div>
	 
	                <div class="bhoechie-tab-content active">
	                <div class="filter_div">
	                <div class="col-lg-12 col-md-12 ">
	                <h3>Make An Appointment</h3>
	                </div>
	                <form action="${pageContext.request.contextPath}/getLabByCityAndTest" method="GET">
		                	<div class="col-sm-3">
		                	<input type="hidden" value="${refference}" id="refference">
		                	<input type="hidden" value="${doctorId}" id="doctorId">
		                	
			                	<select class="slct_lst"  id="labAppPatientId" name="labAppPatientId">
					      		    <c:forEach items="${patientDetailList}" var = "patientDetailList">		 
                             <c:choose>
    <c:when test="${patientDetailList.patientId==patientId}">
      <option value="${patientDetailList.patientId}" selected>${patientDetailList.fName} ${patientDetailList.lName}</option>    </c:when>    
    <c:otherwise>
      <option value="${patientDetailList.patientId}">${patientDetailList.fName} ${patientDetailList.lName}</option>   </c:otherwise>
</c:choose> 
</c:forEach>
					      		</select>
			                </div>
			                <div class="col-sm-3">
			                <input type="hidden" name="labType" value="${labType}">
			                <c:choose>
			                <c:when test="${labType==1}">
			                		<select class="multiSelect"    id="testId" name="radioTestId"  >
					      		    <c:forEach items="${labTestsList}" var = "labTestsList">
					      		      <c:set var="select" value=""/>  	
					      		    	   <c:forEach items="${testID}" var = "test">	
					      		    	  
                             <c:choose>
    <c:when test="${labTestsList.labTestId==test}">
    
       <c:set var="select" value="selected"/>  
       </c:when>
  </c:choose> 
</c:forEach>
      <option value="${labTestsList.labTestId}" ${select}>${labTestsList.labTestName}</option>    

</c:forEach>
					      		</select>
					      		
					      		</c:when>
					      		<c:otherwise>
					      	
					      		
					      		
					      		<select class="multiSelect" multiple="multiple"  id="testId" name="testId" multiple="multiple">
					      		    <c:forEach items="${labTestsList}" var = "labTestsList">
					      		      <c:set var="select" value=""/>  	
					      		    	   <c:forEach items="${testID}" var = "test">	
					      		    	  
                             <c:choose>
    <c:when test="${labTestsList.labTestId==test}">
    
       <c:set var="select" value="selected"/>  
       </c:when>
  </c:choose> 
</c:forEach>
      <option value="${labTestsList.labTestId}" ${select}>${labTestsList.labTestName}</option>    

</c:forEach>
					      		</select>
					      		
					      		</c:otherwise>
					      		
			                </c:choose>
			                </div>
			                <div class="col-sm-3">
					        	    <input id="labAppDate" class="datepicker" name="labAppDate" placeholder="date" value="${labAppDate}" readonly>
					        	    </div>
					        	    <div class="col-sm-3">	
			                	<input type="text" name="autocomplete1"   id="autocomplete1" value="${cityName}" size="16" placeholder="Enter City...">
        	<p id="outputcontent1"></p>
        		<input type="hidden" name="doctor_for_report" value="${doctorId}">
        	 <input type="hidden" id="labCity" name="labCity" value="${cityId}">
			                </div>
			               <div class="panel-group  filter_cities" id="accordion1">
					             <div class="panel panel-default">
					             <div class="col-sm-12">
					        	<a data-toggle="collapse" data-parent="#accordion1" href="#collapse6">other cities</a></div>
					        	 <div id="collapse6" class="panel-collapse collapse">
					        	 	 <div class="col-sm-4">
					        	    <select data-placeholder="Choose a Country..."
								class="chosen-select form-control" id="countryId"
								name="countryId" tabindex="2">
								<option value="" selected="selected" disabled="disabled"><c:out
										value="Select County" /></option>

								<c:forEach items="${countryList}" var="countryList"
									varStatus="count">
									<option value="${countryList.countryId}"><c:out
											value="${countryList.countryName}" /></option>
								</c:forEach>
							</select>
					        	    </div>
					        	    <div class="col-sm-4">
<select data-placeholder="Choose a State..."
								class="chosen-select form-control" id="stateId" 
								name="stateId" tabindex="2">
								<option value="" selected="selected" disabled="disabled"><c:out
										value="Select State" /></option>

							</select>					        	    </div>
					        	    <div class="col-sm-4">
<select data-placeholder="Choose a City..."
								class="chosen-select form-control" id="CityId"
								name="CityId" tabindex="2" onchange="setCityDoc()">
								<option value="" selected="selected" disabled="disabled"><c:out
										value="Select City" /></option>

							</select>
        	    					        	    </div>
					        	 </div>
					        	 </div>
					        	 </div>
			                 
			                <div class="clearfix"></div>
			                <div class="col-sm-5"></div>
			                <div class="col-sm-2"><input type="submit" value="search" class="btn-fr-all"></div>
			                <div class="col-sm-5"></div>
			                </form>
	                </div>
	                <div class="clearfix"></div>
	                <hr>
	                 <c:choose>
                              <c:when test="${empty labDetailsList}">
                              
						<div class="notFound">												
					     <img src="${pageContext.request.contextPath}/resources/images/notfound.png" class="img-responsive" alt="Not Found">																		
			         	 <p>Result Not Found</p>																		
			            </div>	
			            			
				</c:when>		
                 <c:otherwise>
	                
	                <c:forEach items="${labDetailsList}" var="labDetailsList" varStatus="count">
	               
  					<div class="appointment-div labapp-div">
  						<div class="col-sm-4">
		  					<div class="dropdown">
							  <h4 class="dropbtn"> ${labDetailsList.labName}</h4>Tests : <p>${labDetailsList.testName}</p>
							  <input type="hidden" name="testIdList" id="testIdList${labDetailsList.labId}" value="${labDetailsList.teststypes}">
							   <c:choose>
									<c:when test="${labDetailsList.labId==labId}">
									<h5>Referred By Doctor</h5>
									</c:when>
									</c:choose>
									<input type="hidden" id="referredLabId" value="${labId}">
							  <div class="dropdown-content">
							 <h3 class="content1"> ${labDetailsList.labName}</h3>  
							  <div class="cont-padding">
								   <h6>${labDetailsList.labName}</h6>
								   <h6>${labDetailsList.address}</h6>
								   <p></p> 
								   <h6>${labDetailsList.contact}</h6>
							   </div>
							  </div>
							</div>
		  					<h5>${labDetailsList.address}</h5>
  						</div>
  						<div class="col-sm-4 text-center">
  						    <h5 data-toggle="collapse" data-parent="#accordion2" href="#collapse${labDetailsList.labId}" class="revw_color" onclick="showReview(${labDetailsList.labId})">Reviews</h5>
  						     <div class="text-center rating_doc"> 
  						    <c:forEach var = "i" begin = "1" end ="${labDetailsList.rating}" >
               
          <a>   <span class="fa fa-star" aria-hidden="true" style="color:orange;float:left;"></span></a>
             
        </c:forEach>
        </div>
           <div class="text-center rating_doc"> 
        <c:forEach var = "i" begin = "${labDetailsList.rating}" end ="4" >
             
          <a>  <span class="fa fa-star" aria-hidden="true" style="color:#ccc;float:left;"></span></a>
             
        </c:forEach>
        </div>
        <div class="clearfix"></div>
  						    
  						    
  							<!-- <a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star-half" aria-hidden="true"></span></a> -->
  							<input type="hidden" id="selectedAppTime" name="selectedAppTime">
<%--   							<h6 class="time1" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="getlabAppointmentTime(${labDetailsList.labId},${labDetailsList.fromTime},${labDetailsList.toTime})" >Select Time</h6>
 --%>  						</div>
  						<div class="col-sm-4">
<%--   							<p class="text-right"><a href="#" class="btn-fr-all" onclick="bookAppointment(${labDetailsList.labId},${labDetailsList.hospitalId})">Book Now</a></p>
 --%>  			<p class="text-right"><a href="#" class="btn-fr-all" onclick="getlabAppointmentTime(${labDetailsList.labId},${labDetailsList.fromTime},${labDetailsList.toTime})">Book Now</a></p>			
 </div>
  						<div class="clearfix"></div>
  						<div class="panel-group" id="accordion1">
             <div class="panel panel-default">
        	 <div id="collapse${labDetailsList.labId}" class="panel-collapse collapse">
        	   
        	    
        	    
        	 </div>
        	 </div>
        	 </div>
  					</div>
  				<%-- 	</c:when> --%>
  					<%-- <c:otherwise>
  					
  					<c:if test="${labDetailsList.labId==labId}">
  					<div class="appointment-div labapp-div">
  						<div class="col-sm-4">
		  					<div class="dropdown">
							  <h4 class="dropbtn"> ${labDetailsList.labName}</h4>Tests : <p>${labDetailsList.testName}</p>
							  <input type="hidden" name="testIdList" id="testIdList${labDetailsList.labId}" value="${labDetailsList.teststypes}">
							  
							  <div class="dropdown-content">
							 <h3 class="content1"> ${labDetailsList.labName}</h3>  
							  <div class="cont-padding">
								   <h6>${labDetailsList.labName}</h6>
								   <h6>${labDetailsList.address}</h6>
								   <p></p> 
								   <h6>${labDetailsList.contact}</h6>
							   </div>
							  </div>
							</div>
		  					<h5>${labDetailsList.address}</h5>
  						</div>
  						<div class="col-sm-4 text-center">
  						    <h5 data-toggle="collapse" data-parent="#accordion2" href="#collapse${labDetailsList.labId}" class="revw_color" onclick="showReview(${labDetailsList.labId})">Reviews</h5>
  						     <div class="text-center rating_doc"> 
  						    <c:forEach var = "i" begin = "1" end ="${labDetailsList.rating}" >
               
          <a>   <span class="fa fa-star" aria-hidden="true" style="color:orange;float:left;"></span></a>
             
        </c:forEach>
        </div>
           <div class="text-center rating_doc"> 
        <c:forEach var = "i" begin = "${labDetailsList.rating}" end ="4" >
             
          <a>  <span class="fa fa-star" aria-hidden="true" style="color:#ccc;float:left;"></span></a>
             
        </c:forEach>
        </div>
        <div class="clearfix"></div>
  						    
  						    
  							<!-- <a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star" aria-hidden="true"></span></a>
  							<a href="#"><span class="fa fa-star-half" aria-hidden="true"></span></a> -->
  							<input type="hidden" id="selectedAppTime" name="selectedAppTime">
  							<h6 class="time1" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="getlabAppointmentTime(${labDetailsList.labId},${labDetailsList.fromTime},${labDetailsList.toTime})" >Select Time</h6>
  						</div>
  						<div class="col-sm-4">
  							<p class="text-right"><a href="#" class="btn-fr-all" onclick="bookAppointment(${labDetailsList.labId},${labDetailsList.hospitalId})">Book Now</a></p>
  			<p class="text-right"><a href="#" class="btn-fr-all" onclick="getlabAppointmentTime(${labDetailsList.labId},${labDetailsList.fromTime},${labDetailsList.toTime})">Book Now</a></p>			
 </div>
  						<div class="clearfix"></div>
  						<div class="panel-group" id="accordion1">
             <div class="panel panel-default">
        	 <div id="collapse${labDetailsList.labId}" class="panel-collapse collapse">
        	   
        	    
        	    
        	 </div>
        	 </div>
        	 </div>
  					</div>
  					</c:if>
  					</c:otherwise> --%>
  					<%-- </c:choose> --%>
  					</c:forEach>
  					</c:otherwise>
  					</c:choose>
  					
	                </div>
	                <div class="page-alerts collapse" id="alert-1" style="display:none">
    
</div>
            </div>
               
            </div>
             </div>
         </div>
         
</section>
<!--- select time--->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="appint_modal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-header">
    <input type="hidden" id="laId">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Select Appointment time</h4>
      </div>
      <div class="modal-body" onload="myFunction()" style="margin:0;">
      <div class="reletive">	
      <div id="overlay" style="display:none;"><span><img src="${pageContext.request.contextPath}/resources/images/b_logo.png" alt="loader with logo"></span>
			<div id="loading"></div>
		</div> 
		</div>
		
		<div class="animate-bottom" id="myDiv"> 
       			<ul class="appoint_tm" id="appTimesList">
       				
       			</ul>
       			<div class="clearfix"></div>
       		  <p class="text-center"><input type="submit" class="btn-fr-all appointTm" onclick="bookAppointment()">	 </p>
      </div>
      </div>
      
  </div>
</div>
<!--- End select time--->
<%--  <jsp:include page="../include/videoCall.jsp"/>  --%>

<div class="clearfix"></div>
 <jsp:include page="../include/footer.jsp"/> 
<!-- Bootstrap core JavaScript================================================== --> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
  <script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/alertify.min.js"></script> 
     	<script
		src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  
			
		<script>
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
</script>
 <script>
		 
		 var myVar;

		function myFunction() {
		    myVar = setTimeout(showPage, 1000);
		}

		function showPage() {
		    document.getElementById("loading").style.display = "none";
		    document.getElementById("myDiv").style.display = "block";
		}
		</script>

<script>
        $(function(){
            var codes = $('.highlight code');
            codes.each(function (ind, el) {
                hljs.highlightBlock(el);
            });

            $('.lobipanel').lobiPanel();
            $('#demoPanel11').lobiPanel();
            $('#lobipanel-basic')
                    .on('beforeUnpin.lobiPanel', function () {
                        console.log("beforeClose");
                    })
                    .on('onClose.lobiPanel', function () {
                        console.log("onClose");
                    })
                    .on('onTitleChange.lobiPanel', function () {
                        console.log(this, arguments);

                    })
                    .lobiPanel();
            $('#lobipanel-custom-control').lobiPanel({
                reload: false,
                close: false,
                editTitle: false
            });
            $('#lobipanel-stateful').lobiPanel({
                stateful: true
            });
            $('#lobipanel-font-awesome').lobiPanel({
                reload: {
                    icon: 'fa fa-refresh'
                },
                editTitle: {
                    icon: 'fa fa-edit',
                    icon2: 'fa fa-save'
                },
                unpin: {
                    icon: 'fa fa-arrows'
                },
                minimize: {
                    icon: 'fa fa-chevron-up',
                    icon2: 'fa fa-chevron-down'
                },
                close: {
                    icon: 'fa fa-times-circle'
                },
                expand: {
                    icon: 'fa fa-expand',
                    icon2: 'fa fa-compress'
                }
            });
            $('#lobipanel-constrain-size').lobiPanel({
                minWidth: 300,
                minHeight: 300,
                maxWidth: 600,
                maxHeight: 480
            });
            $('#lobipanel-from-url').on('loaded.lobiPanel', function (ev, lobiPanel) {
                var $body = lobiPanel.$el.find('.panel-body');
                $body.html('<div class="highlight"><pre><code>' + $body.html() + '</code></pre></div>');
                hljs.highlightBlock($body.find('code')[0]);
            }).lobiPanel({
                loadUrl: 'bootstrap/dist/css/bootstrap.min.css',
                bodyHeight: 400
            });
            $('#lobipanel-multiple').find('.panel').lobiPanel({
                sortable: true,
                beforeTitleChange: function(lobiPanel, title){
                    console.log("beforeTitleChange", arguments);
                    if (!title) {
                        return false;
                    }
                }
            });
        });
    </script>
<script>
/* $(function() {
	  $('.panel-default a').click(function() {
	    if ($(this).hasClass('activestate')) {
	      $(this).removeClass('activestate');
	    } else {
	      $('.panel-default a').removeClass('activestate');
	      $(this).addClass('activestate');
	    }
	  });
	}); */
/* $(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
}); */

/* $(document).ready(function(){
    $( ".time1" ).hover(function() {
           $('.bs-example-modal-lg').modal({
        show: true
    });
  });  
}); */
$(document).ready(function() {
    $(".appoint_tm > li").click(function(){
      /* $(".appoint_tm > li.highlighted").removeClass("highlighted"); */
      $(this).addClass("highlighted");
      $(".highlighted").addClass('disabled');
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
  
  
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script> 

<script type="text/javascript">
$(".datepicker").datepicker({
	  dateFormat: "dd-mm-yyyy",
	  minDate: 0,
	  autoclose: true
	});
	
	</script>
<script type="text/javascript">
	 
	
	 var currencies = [];
		  
		 
	 
	function getCityList() {
		 
		$.getJSON('${getOnloadCityByStateId}', {
		 
			ajax : 'true'
		}, function(data) {
			 
		 
			  $.each(
						data,
						function(key, cityList) {
							
							currencies.push({ value: cityList.cityName, data: cityList.cityId });
		  });
 
			});
		
	}
	
 
	
	$(function(){
		 /*  var currencies = [
			  
			  for(var i=0;i<cityList.length;i++)
				  {
		    { value: cityList.cityName, data: cityList.cityId }, 
				  }
		  ]; */
		  
		  // setup autocomplete function pulling from currencies[] array
		  $('#autocomplete1').autocomplete({
		    lookup: currencies,
		    onSelect: function (suggestion) {
		      /* var thehtml = '<strong>Currency Name:</strong> ' + suggestion.value + ' <br> <strong>Symbol:</strong> ' + suggestion.data; */
		      document.getElementById("labCity").value=suggestion.data;
		      $('#outputcontent1').html(thehtml);
		    }
		  });
		  

		});
	
</script>

<script>
 $(document).ready(function() { 
		$('#countryId').change(
				function() {
					 
					$.getJSON('${getStateByCountryId}', {
						countryId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose State...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].stateId + '">'
									+ data[i].stateName + '</option>';
						} 
						html += '</option>';
						$('#stateId').html(html);
						$("#stateId").trigger("chosen:updated");

					});
					
				 
		
				});
	});
 $(document).ready(function() { 
		$('#stateId').change(
				function() {
					 
					$.getJSON('${getCityByStateId}', {
						stateId : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="" disabled="disabled" selected >Choose City...</option>';
						
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].cityId + '">'
									+ data[i].cityName + '</option>';
						} 
						html += '</option>';
						$('#CityId').html(html);
						$("#CityId").trigger("chosen:updated");

					});
					
				 
		
				});
	});
 
 </script>

<script>
		 
	 function showReview(labId) {
		 $('#collapse'+labId).empty();
		
		 $
		 
														.getJSON(
																'${getLabReviewByLabId}',
																{
																	labId : labId,
																																		
																	ajax : 'true'
																},
																function(data) {
																	
																		for(var j=0;j<data.length;j++)
																			{
																			
																			var strVar="";
																			
																			strVar += "<hr>";
																			strVar += "   <p class=\"pull-left\"><strong>Date : "+data[j].date+" <\/strong><\/p>";
																			strVar += "   <div class=\"clearfix\"><\/div>";
																			strVar += "   <p class=\"text-left\">"+data[j].review+"<\/p>";
																			
																			/*  $('#collapse'+labId).html("");   */
																			 $('#collapse'+labId).append(strVar);
																			  
																			}
																		
																	
																})
		
		 
	 }
	 
	
	 
     function bookAppointment()
     {
    	 if($("#selectedAppTime").val()!="" && $("#selectedAppTime").val()!=null)
		 {
    		 var appointmentTime= document.getElementById("selectedAppTime").value;
        	 var time = document.getElementById(appointmentTime).innerHTML;
        	// alert(time);
        	// var doctorId=1;        	
        	 var labTestId=document.getElementById("testId").value;    	
        	 var appointmentDate=document.getElementById("labAppDate").value;
        	 var doctorId=document.getElementById("doctorId").value;
        	 var patientId=document.getElementById("labAppPatientId").value;
        	 var labId=document.getElementById("laId").value;
        	 
        	 var referredLabId=document.getElementById("referredLabId").value;
        	 var refference=0;
        	 if(referredLabId==labId)
        		 refference=1;
        	 var appType=1;
    		 alertify.confirm("Are you sure book appointment on Date : "+appointmentDate+" at time :"+time, function (e) {
    			    if (e) {
    			    	document.getElementById("overlay").style.display = "block";   
    //	 alert(appointmentTime+"  "+appointmentDate+"  "+labTestId);
    	 
    	  $
			.getJSON(
					'${bookLabAppointment}',
					{
						labId : labId,
						appointmentDate : appointmentDate,
						appointmentTime : appointmentTime,
						labTestId : $("#testIdList"+labId).val(),
						doctorId : doctorId,
						patientId : patientId,
						refference : refference,
						ajax : 'true'
					},
					function(data) {
						document.getElementById("overlay").style.display = "none";
						alert(data.message);
						window.open("${pageContext.request.contextPath}/showViewAppointmentToPatient?viewPatientId="+patientId+"&fromDate="+appointmentDate+"&toDate="+appointmentDate+"&viewAppType="+appType,"_self");
						
					});
    			    }
    			    
		 });
		 }
    	 else
		 {
		 alert("Please Select Time for Appoinrment");
		 }
     }
     
        
    		</script>
<script>
 function  getlabAppointmentTime(labId, fromTime, toTime)
{
	 $('#appTimesList li').remove();
	
	var appointmentDate=document.getElementById("labAppDate").value;
	document.getElementById("laId").value = labId;
	
	 if(appointmentDate!=null && appointmentDate!=""){
	  $
		.getJSON(
				'${getLabAppointmentsTime}',
				{
					labId : labId,
					appointmentDate : appointmentDate,
					fromTime : fromTime,
					toTime : toTime,
					 
					ajax : 'true'
				},
				function(data) {
					$('#appint_modal').modal('show');
				$.each(
								data.allAppointmentTimeList,
								function(key, allTimeList) {
									
								 var temp=0;
					  $.each(
								data.appointmentTimeList,
								function(key, timeList) {
								
									if(timeList.timeId==allTimeList.timeId){
										temp=1;
  var node = document.createElement("LI");
 
  var textnode = document.createTextNode(timeList.time);
  node.setAttribute("id", timeList.timeId);
  node.setAttribute("onclick", "setAppointMentTime(this, "+timeList.timeId+","+labId+")");
  node.appendChild(textnode);
  document.getElementById("appTimesList").appendChild(node);
  
  
									}
								});
					  if(temp==0)
						  {
						 
						 var node = document.createElement("LI");
				          
			           var textnode = document.createTextNode(allTimeList.time);
			           node.setAttribute("id", allTimeList.timeId);
			         node.setAttribute("style"," color:red !important");
			       node.setAttribute("class","disabled booked");
			        /*    node.setAttribute("onclick", "setAppointMentTime("+allTimeList.timeId+","+labId+")"); */
			           node.appendChild(textnode);
			           document.getElementById("appTimesList").appendChild(node);
			          
						  }
					  
					  
								});
				});
	
}
 else{
	 alert("Select Appointment Date");
 }
	  
}  


    
function setAppointMentTime(a){
  	 
	 /*  document.getElementById("selectedAppTime").value=time;
  	document.getElementById("hiddenLabId").value=labId;
  	 document.getElementById("bookAppointment").disabled=false; */
  	 
  	var time= arguments[1];
  	
   // var docId= arguments[2];
   
	 document.getElementById("selectedAppTime").value=time;
	
     var i;	   
	  var list = document.getElementById("appTimesList").getElementsByTagName('li');
	  for(i=0; i<list.length; i++)
       {
           list[i].style.background = '#fff';
           list[i].style.color = '#000';
       }
       
	  a.style.background = '#008abd';
	  a.style.color = '#fff';  	 
  	 
   }

 <!-- Feed Back -->
  
 function feedBackNotification(){
	  
	  var displayDiv=document.getElementById("alert-1");
	  displayDiv.style.display="block";					
				$
				 
				.getJSON(
						'${getDoctorsAndLabsForRating}',
						{
													
							ajax : 'true'
						},
						function(data) {
														
										var len = data.doctorsInfo.length;
										var lengt = data.labInfo.length;
										
									
										var strVar="";
										var strV="";
										
										for ( var i = 0; i < len; i++) {
											
										
										strVar += "<div class=\"alert alert-Thanks For Your Feedback  page-alert\">";
										strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
										strVar += "        <strong>"+data.doctorsInfo[i].doctorName+"-"+data.doctorsInfo[i].date+"<\/strong><strong class=\"pull-right\">"+data.doctorsInfo[i].patientName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\" class=\"feed_bk\" onClick=\"openFeedBackModel('"+data.doctorsInfo[i].patientName+"',"+data.doctorsInfo[i].patintId+","+data.doctorsInfo[i].doctorId+","+data.doctorsInfo[i].meetId+")\"> Give Feedback<\/a>";
									
										strVar += "    <\/div>";

										
										}
										for ( var j = 0; j < lengt; j++) {
											
											
											strVar += "<div class=\"alert alert-Thanks For Your Feedback page-alert\">";
											strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
											strVar += "        <strong>"+data.labInfo[j].labName+"-"+data.labInfo[j].date+"<\/strong><strong class=\"pull-right\">"+data.labInfo[j].labTestName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\"  class=\"feed_bk\" onClick=\"openLabFeedBackModel('"+data.labInfo[j].patientName+"',"+data.labInfo[j].patientId+","+data.labInfo[j].labId+","+data.labInfo[j].appointId+")\"> Give Feedback<\/a>";
											strVar += "        <a href\"#\" class=\"feed_bk\"> Not Now<\/a>";
											strVar += "    <\/div>";

											
											}
										
										$('#alert-1').html(strVar);
										
										$("#alert-1").trigger("chosen:updated"); 
									
							
							
														 
						})
						
			}	

function openFeedBackModel(patientName,patientId,doctorId,meetId)
{
	document.getElementById("ratPatientName").value=patientName;
	document.getElementById("ratPatientId").value=patientId;
	document.getElementById("ratdoctorId").value=doctorId;
	document.getElementById("ratMeetId").value=meetId;
	
	  $('#ratingModal').modal('show');




}

function openLabFeedBackModel(patientName,patientId,labId,appId)
{
	
	document.getElementById("ratLPatientName").value=patientName;
	document.getElementById("ratLPatientId").value=patientId;
	document.getElementById("ratLlabId").value=labId;
	document.getElementById("ratLappId").value=appId;
	
	  $('#labRatingModal').modal('show');




}

function saveFeedBack() {
	 
	 var ratPatientId=document.getElementById("ratPatientId").value; 
	 var ratdoctorId=document.getElementById("ratdoctorId").value; 
	 var ratPatientName=document.getElementById("ratPatientName").value; 
	 var rating=document.getElementById("combostar").value; 
	 var review=document.getElementById("review").value; 
	 var ratMeetId=document.getElementById("ratMeetId").value; 
	 
	 $
													.getJSON(
															'${submitDoctorRating}',
															{
																ratPatientId : ratPatientId,
																ratdoctorId : ratdoctorId,
																ratPatientName : ratPatientName,
																rating : rating,
																review : review,
																ratMeetId : ratMeetId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("review").value=""; 
																 
																location.reload();
																

															})
	 
	 
}
function saveLabFeedBack() {
	 
	 var ratLPatientId=document.getElementById("ratLPatientId").value; 
	 var ratLlabId=document.getElementById("ratLlabId").value; 
	 var ratLPatientName=document.getElementById("ratLPatientName").value; 
	 var rating=document.getElementById("labcombostar").value; 
	 var labReview=document.getElementById("labReview").value; 
	 var ratLappId=document.getElementById("ratLappId").value; 
	 
	  
	 $
													.getJSON(
															'${submitLabRating}',
															{
																ratLPatientId : ratLPatientId,
																ratLlabId : ratLlabId,
																ratLPatientName : ratLPatientName,
																rating : rating,
																labReview : labReview,
																ratLappId : ratLappId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("labReview").value="";
																alert(data.message);
																location.reload();
																

															})
	 
	 
}  
</script>
</body>
</html>