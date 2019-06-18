    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="submitLabRating" value="/submitLabRating" />
<c:url var="submitDoctorRating" value="/submitDoctorRating" />
<c:url var="getPatientCartCount" value="/getPatientCartCount" />

<c:url var="changePatientNotificationStatus" value="/changePatientNotificationStatus" />

<c:url var="getPatientNotification" value="/getPatientNotification" />
<c:url var="sendMessageToDoctor" value="/sendMessageToDoctor" />
<c:url var="updateVideoCallStatus" value="/updateVideoCallStatus" />

	
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/chatroom/notification.css" rel="stylesheet" type="text/css">
<%-- <script src="${pageContext.request.contextPath}/resources/js/chatroom/mqttws31.min.js" type="text/javascript"></script> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
   <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/chatroom/notification_patient.js" type="text/javascript"></script> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="${pageContext.request.contextPath}/resources/css/videoCallPat.css" rel="stylesheet" type="text/css">
 <input type="hidden" id="fcmToken">
  <input type="hidden" id="toDeviceType">
  <input type="hidden" id="token">
<audio id='audio' controls style="display: none" loop>
    <source src="${pageContext.request.contextPath}/resources/sound/taki_taki.mp3" type="audio/wav" />
    
    </audio> 
    
<div class="navbar-wrapper">
  <div class="container-fluid">
  <input type="hidden" id="patientIdTopic" value="${sessionScope.patientDetails.patientId}">
    <input type="hidden" id="familyIdTopic" value="${sessionScope.patientDetails.familyId}">
    <nav class="navbar navbar-inverse navbar-static-top navbar navbar-default">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="${pageContext.request.contextPath}/homePage"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header login-box">
       <ul  class="nav navbar-nav navbar-right mobileNotify">
                       <li><ul class="nav navbar-nav navbar-right mar-top0">
					        <li class="dropdown">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon-notification"></span><i class="button__badge"style="display: none" id="mobilenotificationAvail"><span id="mobilenotificationCount"></span></i> </a>
					          <ul class="dropdown-menu notify-drop">
					            <div class="notify-drop-title">
					            	<div class="row">
					            		<div class="col-md-6 col-sm-6 col-xs-6 notif-heading">Notification (<b><span id="mobilenotificationCount1"></span></b>)</div>
					            		<div class="col-md-6 col-sm-6 col-xs-6 text-right"><a href="" class="rIcon allRead" data-tooltip="tooltip" data-placement="bottom" title="t�m� okundu."></a></div>
					            	</div>
					            </div>
					            <!-- end notify title -->
					            <!-- notify content -->
					            <div class="drop-content" id="mobilenotification">
					            	
					            </div>
					            <div class="notify-drop-footer text-center">
					            	<a href="${pageContext.request.contextPath}/showAllPatientNotification"><i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility"></i> See All Notification</a>
					            </div>
					          </ul>
					        </li>
      				</ul></li>
      				<li class="card-icon">
				                   <a href="${pageContext.request.contextPath}/showmyCart">
				                   <span class="icon-shopping-cart"></span>
				                   <i class="button__badge" id="mobilecartCount"></i> </a>
		                     </li>
      </ul> 
           <button class="navbar-toggle"  data-toggle="modal" data-target="#login">${sessionScope.patientDetails.fName} ${sessionScope.patientDetails.lName}<span class="caret"></span> <!-- <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> --> </button>
         </div>
        
         <div class="menu_side">
     <input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
  <label for="openSidebarMenu" class="sidebarIconToggle">
    <div class="spinner diagonal part-1"></div>
    <div class="spinner horizontal"></div>
    <div class="spinner diagonal part-2"></div> 
  </label>
  <div id="sidebarMenu">
    <ul class="sidebarMenuInner">
      <li class="nm_menu">Biocare <span>Menu</span></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPatientHomePage')">Profile</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showBookAppointment')">Book Appointment</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPatientConsultToPage')">Consulted Doctor</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPreviousSharedVideo')">Shared Videos</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPatienReportPage')">Reports</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showOrderMedicinePage')">Order Medicine</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showMyOder')">View Order</a></li>
       <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPatientVaccinationPage');" >Vaccination</a></li>
       <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPatientBankDetl');" >Bank Details</a></li>
        <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showHealthInsuranceEnquiry');" >Insurance</a></li> 
        <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showStemCellBank')">Stemcell</a></li> 
        
    </ul>
  </div>
  </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
            <li class="dropdown"> <a href="#" class="dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.patientDetails.fName} ${sessionScope.patientDetails.lName}<span class="caret"></span></a>
              <ul class="dropdown-menu square">
               <%--  <li><a class="hvr-sweep-to-right" data-toggle="modal" data-target="#largeModal" href="#" onclick="setUserType(1)">${sessionScope.patientDetails.patientId}</a></li> --%>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPatientHomePage">Dashboard</a></li>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPreviousSharedVideo">Shared Videos</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showWalletDetails">Wallet</a></li>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPatientPaymentHistory">Payment History</a></li>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showChangePassword">Change password</a></li>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/logout/2">Logout</a></li>
              
          </ul>
          </li>
          <li>
               <ul class="nav navbar-nav navbar-right mar-top0 mobscreenNone">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon-notification"></span><i class="button__badge"style="display: none" id="notificationAvail"><span id="notificationCount"></span></i> </a>
          <ul class="dropdown-menu notify-drop">
            <div class="notify-drop-title">
            	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-6 notif-heading">Notification (<b><span id="notificationCount1"></span></b>)</div>
            		<div class="col-md-6 col-sm-6 col-xs-6 text-right"><a href="" class="rIcon allRead" data-tooltip="tooltip" data-placement="bottom" title="t�m� okundu."></a></div>
            	</div>
            </div>
            <!-- end notify title -->
            <!-- notify content -->
            <div class="drop-content" id="notification">
            	
            </div>
            <div class="notify-drop-footer text-center">
            	<a href="${pageContext.request.contextPath}/showAllPatientNotification"><i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility"></i> See All Notification</a>
            </div>
          </ul>
        </li>
      </ul>
               </li>
               <li class="card-icon mobscreenNone">
                   <a href="${pageContext.request.contextPath}/showmyCart">
                   <span class="icon-shopping-cart"></span>
                   <i class="button__badge" id="cartCount"></i> </a>
                       </li>
          </ul>
        </div>
     
     
    </nav>
  </div>
</div>




<div class="modal fade login-sm" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       
      <ul class="nav navbar-nav animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
      		<li><a class="hvr-sweep-to-right" d href="${pageContext.request.contextPath}/showPatientHomePage">Dashboard</a></li>
             <li><a class="hvr-sweep-to-right" d href="${pageContext.request.contextPath}/showPatientPaymentHistory">Payment History</a></li>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showChangePassword">Change password</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/logout/2">Logout</a></li>
               <!--  <li><a class="btn btn-secondary dropdown-toggle" href="#" id="notifications-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i id="notificationsIcon" class="fa fa-bell-o" aria-hidden="true"></i>
        <span id="notificationsBadge" class="badge badge-danger"><i class="fa fa-spinner fa-pulse fa-fw" aria-hidden="true"></i></span>
      </a></li> -->
                 <!-- <li class="notification-prof"><a href="#" onclick="feedBackNotification()" class="text-center"><span  class="fa fa-bell-o"></span><i class="button__badge">2</i></a></li> -->
             </ul>
      </div>
    </div>
  </div>
</div>

<!-- Feed Back Doctor Modal -->

<div class="modal fade feedbck" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="ratingModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Feedback For Doctor</h4>
        <span class="glyphicon glyphicon-triangle-bottom"></span>
      </div>
      <div class="modal-body">
      	<div class="feedbktodc rating-form">
      	<label>Rating:</label>
			                <div class="docnmFeed">
			               
			                 
						                	<!-- RATING - Form -->
												
												  <fieldset class="form-group">
												    
												    
												    <input type="hidden" id="ratPatientId">
        <input type="hidden" id="ratdoctorId">
        <input type="hidden" id="ratingnotificationId">
												    <div class="form-item">
												      
												      <input id="rating-5" name="rating" type="radio" value="5" />
												      <label for="rating-5" data-value="5">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">5</span>
												      </label>
												      <input id="rating-4" name="rating" type="radio" value="4" />
												      <label for="rating-4" data-value="4">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">4</span>
												      </label>
												      <input id="rating-3" name="rating" type="radio" value="3" />
												      <label for="rating-3" data-value="3">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">3</span>
												      </label>
												      <input id="rating-2" name="rating" type="radio" value="2" />
												      <label for="rating-2" data-value="2">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">2</span>
												      </label>
												      <input id="rating-1" name="rating" type="radio" value="1" />
												      <label for="rating-1" data-value="1">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">1</span>
												      </label>
												      
												     <!--  <div class="form-action">
												        <input class="btn-reset" type="reset" value="Reset" />   
												      </div> -->
												
												      <!-- <div class="form-output">
												        ? / 5
												      </div> -->
												      
												    </div>
												    
												  </fieldset>
												
												
								</div>
			         </div>
			         <div class="discriptReview">
			         	<textarea rows="4" cols="50" placeholder="Enter your Feedback" id="review"></textarea>
			         	<div class="clearfix"></div>
			         	 
			         	<p class="text-center"><a href="#" class="btn-fr-all" onclick="saveFeedBack1()">Send</a></p>
			         </div>
			        
			         
	                
	                
	                
      </div>
      </div>
    </div>
 </div>



<!-- Feed Back Lab Modal -->
<div class="modal fade feedbck" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="labRatingModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Feedback For Lab</h4>
        <span class="glyphicon glyphicon-triangle-bottom"></span>
      </div>
      <div class="modal-body">
      	<div class="feedbktodc rating-form">
      	<label>Rating:</label>
			                <div class="docnmFeed">
			               
			                 
						                	<!-- RATING - Form -->
												
												  <fieldset class="form-group">
												   
       
       
												    <legend class="form-legend">Rating:</legend>
												    <input type="hidden" id="ratLPatientId">
        <input type="hidden" id="ratLlabId">
        <input type="hidden" id="labnotificationId">
												    <div class="form-item">
												      
												      <input id="rating-6" name="lrating" type="radio" value="5" />
												      <label for="rating-6" data-value="5">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">5</span>
												      </label>
												      <input id="rating-7" name="lrating" type="radio" value="4" />
												      <label for="rating-7" data-value="4">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">4</span>
												      </label>
												      <input id="rating-8" name="lrating" type="radio" value="3" />
												      <label for="rating-8" data-value="3">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">3</span>
												      </label>
												      <input id="rating-9" name="lrating" type="radio" value="2" />
												      <label for="rating-9" data-value="2">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">2</span>
												      </label>
												      <input id="rating-11" name="lrating" type="radio" value="1" />
												      <label for="rating-11" data-value="1">
												        <span class="rating-star">
												          <i class="fa fa-star-o"></i>
												          <i class="fa fa-star"></i>
												        </span>
												        <span class="ir">1</span>
												      </label>
												      
												     <!--  <div class="form-action">
												        <input class="btn-reset" type="reset" value="Reset" />   
												      </div> -->
												
												      <!-- <div class="form-output">
												        ? / 5
												      </div> -->
												      
												    </div>
												    
												  </fieldset>
												
												
								</div>
			         </div>
			         <div class="discriptReview">
			         	<textarea rows="4" cols="50" placeholder="Enter your Feedback" id="labReview"></textarea>
			         	<div class="clearfix"></div>
			         	 
			         	<p class="text-center"><a href="#" class="btn-fr-all" onclick="saveLabFeedBack()">Send</a></p>
			         </div>
			        
			         
	                
	                
	                
      </div>
      </div>
    </div>
 </div>

 
 
 
 <!-- VideoCall -->
 
   <!-- The Modal -->
  
  <div class="modal" id="videoCallReceive">
    <div class="modal-dialog" style="width: 300px">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Video Call</h4>
         <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
          <div   style="text-align: center;   position: relative;">
      
      <img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" id="doctorPhoto" alt="Avatar"   style="width: 70%;height: 150px; border-radius: 50%;">
   <strong><p id="callMsg"></p></strong>
   <input type="hidden" id="videoCallUrl">
    </div>
    
    
        
        </div>
      
        <!-- Modal footer -->
        <div class="modal-footer">
        <input type="hidden" id="videoCallId">
          <button type="button" class="btn btn-success" data-dismiss="modal" onclick="receivedCall();updateStatus()">Connect <i class="fa fa-arrow-circle-o-right"></i></button>
          <!--  <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="sentRejectCall()">Reject</button> -->
        </div>
        
      </div>
    </div>
  </div>
 
   
 
 
 
  

	<script type="text/javascript">
            

            function copyToClipboard(element) {
              var $temp = $("<input>");
              $("body").append($temp);
              $temp.val($(element).text()).select();
              document.execCommand("copy");
              $temp.remove();
              alert("Link copied!");
            }
 
        </script>
 
 
 
 
 
 
 
 
 
 
 



<script type="text/javascript">

  $(window).load(function(){        
	  getNotification();
	  getCartCount();
  });
 function getNotification()
 {
	
$
.getJSON(
		'${getPatientNotification}',
		{
			 
			ajax : 'true',
		},
		function(data) {
			
			 $("#notification").empty();
			 $("#mobilenotification").empty();
			var count=0;
			var strVar="";
			
			   $.each(
						data,
						function(key, notificationList) {
						 
							if(notificationList.status==0)
							{
								 
							$("#notificationAvail").show();
							$("#mobilenotificationAvail").show();
							count=count+1;
							strVar += "<li class=\"unread-notif\">";
							strVar += "            		";
							strVar += "            		<div style='cursor:pointer;' onclick='seenNotification("+notificationList.notificationId+")' class=\"col-md-12 col-sm-12 col-xs-12 pd-l0\" >"; /* <a href=\"#\" class=\"rIcon\"><i class=\"fa fa-times\" aria-hidden=\"true\"><\/i><\/a> */
							strVar += "            		<p class=\"dr-icon\"><i class=\"fa fa-user-md\" aria-hidden=\"true\"><\/i> &nbsp; "+notificationList.string1+"<\/p>";
							strVar += "            		<p>"+notificationList.notification+".<\/p>";
							strVar += "            		<p class=\"date\">"+notificationList.dateTime+"<\/p>";
							strVar += "            		<\/div>";
							
							
							}
							else{
			strVar += "<li class=\"read-notif\">";
			strVar += "            		";
			strVar += "  <div class=\"col-md-12 col-sm-12 col-xs-12 pd-l0\" >"; /* <a href=\"#\" class=\"rIcon\"><i class=\"fa fa-times\" aria-hidden=\"true\"><\/i><\/a> */
			strVar += "            		<p class=\"dr-icon\"><i class=\"fa fa-user-md\" aria-hidden=\"true\"><\/i> &nbsp; "+notificationList.string1+"<\/p>";
			strVar += "            		<p>"+notificationList.notification+".<\/p>";
			strVar += "            		<p class=\"date\">"+notificationList.dateTime+"<\/p>";
			strVar += "            		<\/div>";
			
							}
			if(notificationList.string2=="drating")
				{
				strVar += "<a href=\"#\" class=\"rIcon feedbtn\" onclick=\"openDoctorratingModal('"+notificationList.notificationId+"','"+notificationList.int1+"','"+notificationList.patientId+"')\">Feed Back<\/a>"	
				strVar += "            	<\/li>";
				}
			else if(notificationList.string2=="lrating")
				{
				strVar += "<a href=\"#\" class=\"rIcon feedbtn\" onclick=\"openLabFeedBackModel('"+notificationList.notificationId+"','"+notificationList.int1+"','"+notificationList.patientId+"')\">Feed Back<\/a>"	

				}
			
			else if(notificationList.string2=="cpayment")
			{
			strVar += "<a href=\"${pageContext.request.contextPath}/consultingPaymentRequest/"+notificationList.int1+"\" class=\"rIcon feedbtn\" \">Make Payment<\/a>"	

			}
			else if(notificationList.string2=="videoshare")
			{
			strVar += "<a href=\"${pageContext.request.contextPath}/viewVideoSharedByDoctor/"+notificationList.int1+"\" class=\"rIcon feedbtn\" \">View Video<\/a>"	

			}
			
							
						});
			 
			   $("#notificationCount").html(count);
			   $("#notificationCount1").html(count);
			   $("#mobilenotificationCount").html(count);
			   $("#mobilenotificationCount1").html(count);
			
$('#notification').append($(strVar));
$('#mobilenotification').append($(strVar));
		});

  }
  function seenNotification(id)
  {
	
	   $
	  .getJSON(
	  		'${changePatientNotificationStatus}',
	  		{
	  			notificationId : id,
	  			ajax : 'true',
	  		},
			function(data) {
	  			getNotification();
	  		}) 
  }
  
  function getCartCount()
  {
	
	   $
	  .getJSON(
	  		'${getPatientCartCount}',
	  		{
	  			ajax : 'true',
	  		},
			function(data) {
	  			
	  			$("#cartCount").html(data);
	  			$("#mobilecartCount").html(data);
	  		}) 
  }
  
  function openDoctorratingModal(notificationId,doctorId,patientId)
  {
	  document.getElementById("ratPatientId").value=patientId;
	  document.getElementById("ratdoctorId").value=doctorId;
	  document.getElementById("ratingnotificationId").value=notificationId;
	  $('#ratingModal').modal('show');
	  
  }
  
  function openLabFeedBackModel(labnotificationId,labId,patientId)
  {
  	
  	document.getElementById("ratLPatientId").value=patientId;
  	document.getElementById("ratLlabId").value=labId;
  	document.getElementById("labnotificationId").value=labnotificationId;
  	
  	  $('#labRatingModal').modal('show');

  }

  function saveFeedBack1() {
		 
	
		 var ratPatientId=document.getElementById("ratPatientId").value; 
		 var ratdoctorId=document.getElementById("ratdoctorId").value; 
		 var rating=$("input:radio[name=rating]:checked").val();
		
		 var review=document.getElementById("review").value;
		 var notificationId = document.getElementById("ratingnotificationId").value;
		 
		 $
														.getJSON(
																'${submitDoctorRating}',
																{
																	ratPatientId : ratPatientId,
																	ratdoctorId : ratdoctorId,																
																	rating : rating,
																	review : review,
																	notificationId : notificationId,
																	
																	ajax : 'true'
																},
																function(data) {
																	
																	if(data.message="success")
																		
																	{
																		alert("Successfully Submited");
																		location.reload();
																	}
																	

																})
		 
		 
	}
  
  function saveLabFeedBack() {
	 
		 var ratLPatientId=document.getElementById("ratLPatientId").value; 
		 var ratLlabId=document.getElementById("ratLlabId").value; 
		 var rating=$("input:radio[name=lrating]:checked").val();
		 var labReview=document.getElementById("labReview").value; 
		 var labnotificationId=document.getElementById("labnotificationId").value; 
		
 
		 $
														.getJSON(
																'${submitLabRating}',
																{
																	ratLPatientId : ratLPatientId,
																	ratLlabId : ratLlabId,																
																	rating : rating,
																	labReview : labReview,
																	labnotificationId : labnotificationId,
																	ajax : 'true'
																},
																function(data) {
																	
																	document.getElementById("labReview").value="";
                                                                    if(data.message="success")
																		
																	{
																		alert("Successfully Submited");
																		location.reload();
																		
																	}
																	

																}) 
		 
		 
	}  
</script>  

<script>
    $(function(){
        $(".endCall").click(function(){
            $(this).hide();
            return false;
        });
    });
</script>
 <script type="text/javascript">
 function sendMessage()
 {
 	
 	var messageStr = document.getElementById("messageBox").value;
 	document.getElementById("messageBox").value="";
 	var fromToken=document.getElementById("token").value;
 	var toToken=document.getElementById("fcmToken").value;
 	var toDeviceType=document.getElementById("toDeviceType").value;
 	 
 	
 	
	var strVar = "";
	strVar += "<div class=\"container1 darker\">";
	//strVar += "  <img src=\"\/w3images\/avatar_g2.jpg\" alt=\"Avatar\" class=\"right\" style=\"width:100%;\">";
	strVar += "  <p>" + messageStr + "<\/p>";
	strVar += "  <span class=\"time-left\">" + getCurrentTime() + "<\/span>";
	strVar += "<\/div>";

	$('#chatingBox').append($(strVar));
	document.getElementById("messageBox").focus();
	
 	
 	 $
 		.getJSON(
 				'${sendMessageToDoctor}',
 				{
 					message : messageStr,
 					toToken : toToken,												
 					toDeviceType : toDeviceType,
 					fromDeviceType : 3,
 					fromToken : fromToken,
 					 
 					ajax : 'true'
 				},
 				function(data) {
 				 
 				});
 }


 
</script>
 <script type="text/javascript">
 function updateStatus() {
	
	 var id=document.getElementById("videoCallId").value;
	 $
		.getJSON(
				'${updateVideoCallStatus}',
				{
					 
					id : id,
					status : 1,
					 
					ajax : 'true'
				});
}
 </script>