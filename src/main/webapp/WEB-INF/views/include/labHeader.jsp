    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="getLabNotification" value="/getLabNotification" />
<c:url var="changeLabNotificationStatus" value="/changeLabNotificationStatus" />


<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

	<link href="${pageContext.request.contextPath}/resources/css/chatroom/notification.css" rel="stylesheet" type="text/css">
 
  <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/chatroom/notification_lab.js" type="text/javascript"></script> 
      <input type="hidden" id="token">
<div class="navbar-wrapper">
  <div class="container-fluid">
    <input type="hidden" id="labIdTopic" value="${sessionScope.labDetails.labId}">
    <nav class="navbar navbar-inverse navbar-static-top navbar navbar-default">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header login-box">
        <ul class="nav navbar-nav navbar-right mobileNotify docNotify">
         	<li><ul class="nav navbar-nav navbar-right mar-top0">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="icon-notification"></span><i class="button__badge" style="display: none" id="mobilenotificationAvail"><span id="mobilenotificationCount"></span></i> </a>
          <ul class="dropdown-menu notify-drop">
            <div class="notify-drop-title">
            	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-6 notif-heading">Notification (<b><span id="mobilenotificationCount1"></span></b>)</div>
            		<div class="col-md-6 col-sm-6 col-xs-6 text-right"><a href="" class="rIcon allRead" data-tooltip="tooltip" data-placement="bottom" title="tümü okundu."></a></div>
            	</div>
            </div>
            <!-- end notify title -->
            <!-- notify content -->
            <div class="drop-content" id="mobilenotification">
            	
            </div>
            <div class="notify-drop-footer text-center">
            	<a href="${pageContext.request.contextPath}/showDoctorNotification" style="display:none" id="seeAllNotification"><i class="flaticon-eye-with-a-diagonal-line-interface-symbol-for-invisibility"></i> See All Notification</a>
            </div>
          </ul>
        </li>
      </ul></li>
      </ul>
          <button class="navbar-toggle"  data-toggle="modal" data-target="#login">${sessionScope.labDetails.labName}<span class="caret"></span> <!-- <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> --></button>
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
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showLabHomePage')">Profile</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showViewLabAppointment')">Appointment</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showLabHistory')">History</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showLabTestEdit')">Edit Tests</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showBankDetails')">Bank Details</a></li>
      
    </ul>
  </div>
  </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
            <li class="dropdown"> <a href="#" class="dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.labDetails.labName}<span class="caret"></span></a>
              <ul class="dropdown-menu square">
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showLabHomePage">Dashboard</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showWalletDetails">Wallet</a></li>
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showLabPaymentHistory">Payment History</a></li>
              <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/showAddAdvertise">Add Advertise</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showLabChangePassword">Change password</a></li>
                <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/logout/3">Logout</a></li>
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
            		<div class="col-md-6 col-sm-6 col-xs-6 text-right"><a href="" class="rIcon allRead" data-tooltip="tooltip" data-placement="bottom" title="tümü okundu."></a></div>
            	</div>
            </div>
            <!-- end notify title -->
            <!-- notify content -->
            <div class="drop-content" id="notification">
            	
            </div>
            <div class="notify-drop-footer text-center">
            	<a href="${pageContext.request.contextPath}/showAllLabNotification"><i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility"></i> See All Notification</a>
            </div>
          </ul>
        </li>
      </ul>
               </li>
          </ul>
        </div>
     
    </nav>
  </div>
</div>

<!-- mobile -->
<div class="modal fade login-sm" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <ul class="nav navbar-nav  animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
            	<li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showLabHomePage">Dashboard</a></li>
            	<li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showLabPaymentHistory">Payment History</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showLabChangePassword">Change password</a></li>
                <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/logout/3">Logout</a></li>
              
             
          </ul>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

  $(window).load(function(){        
	  getNotification();
  });
 function getNotification()
 {
$
.getJSON(
		'${getLabNotification}',
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
							strVar += "<li class=\"read-notif\">";
							strVar += "            		";
							strVar += "            		<div style='cursor:pointer;' onclick='seenNotification("+notificationList.notificationId+")' class=\"col-md-12 col-sm-12 col-xs-12 pd-l0\" >"; /* <a href=\"#\" class=\"rIcon\"><i class=\"fa fa-times\" aria-hidden=\"true\"><\/i><\/a> */
							strVar += "            		<p class=\"dr-icon\"><i class=\"fa fa-user-md\" aria-hidden=\"true\"><\/i> &nbsp; "+notificationList.string1+"<\/p>";
							strVar += "            		<p>"+notificationList.notification+".<\/p>";
							strVar += "            		<p class=\"date\">"+notificationList.dateTime+"<\/p>";
							strVar += "            		<\/div>";
							strVar += "            	<\/li>";
							
							}
							else{
			strVar += "<li class=\"unread-notif\">";
			strVar += "            		";
			strVar += "            		<div class=\"col-md-12 col-sm-12 col-xs-12 pd-l0\" >"; /* <a href=\"#\" class=\"rIcon\"><i class=\"fa fa-times\" aria-hidden=\"true\"><\/i><\/a> */
			strVar += "            		<p class=\"dr-icon\"><i class=\"fa fa-user-md\" aria-hidden=\"true\"><\/i> &nbsp; "+notificationList.string1+"<\/p>";
			strVar += "            		<p>"+notificationList.notification+".<\/p>";
			strVar += "            		<p class=\"date\">"+notificationList.dateTime+"<\/p>";
			strVar += "            		<\/div>";
			strVar += "            	<\/li>";
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
	  		'${changeLabNotificationStatus}',
	  		{
	  			notificationId : id,
	  			ajax : 'true',
	  		},
			function(data) {
	  			getNotification();
	  		}) 
  }
</script>  