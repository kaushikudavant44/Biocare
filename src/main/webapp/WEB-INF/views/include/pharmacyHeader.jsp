
	<link href="${pageContext.request.contextPath}/resources/css/chatroom/notification.css" rel="stylesheet" type="text/css">
  <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/chatroom/notification_pharmacy.js" type="text/javascript"></script> 
      <input type="hidden" id="token">
<div class="navbar-wrapper">
  <div class="container-fluid">
      <input type="hidden" id="labIdTopic" value="${sessionScope.medicalDetails.medicalId}">
    <nav class="navbar navbar-inverse navbar-static-top navbar navbar-default">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header login-box">
           <button class="navbar-toggle"  data-toggle="modal" data-target="#login">${sessionScope.medicalDetails.medicalName}<span class="caret"></span> <!-- <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> --></button>
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
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPharmacyHomePage')">Profile</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showViewOrderPharmacy')">View Order <span class="pharm-count">5</span></a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showCompletedOrderPharmacy')">Completed Orders</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPharmacyOrderHistory')">History</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showCancelledOrderPharmacy')">Canceled Order</a></li>
      <li class="hvr-sweep-to-right"><a href="#" onclick="openPage('showPharmaBankDetails')">Bank Details</a></li>
    </ul>
  </div>
  </div>
  
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
            <li class="dropdown"> <a href="#" class="dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.medicalDetails.medicalName}<span class="caret"></span></a>
              <ul class="dropdown-menu square">
              <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPharmacyHomePage">Dashboard</a></li>
              <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showWalletDetails">Wallet</a></li>
              <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPharmacyPaymentHistory">Payment History</a></li>
         <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/showAddAdvertise">Add Advertise</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPharmacyChangePassword">Change password</a></li>
                <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/logout/4">Logout</a></li>
              </ul>
            </li>
             <!-- <li> <a href="#" class="name_admin">For Pharmacy</a></li> -->
             
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
      		<li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPharmacyHomePage">Dashboard</a></li>
      		<li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPharmacyPaymentHistory">Payment History</a></li>
             <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPharmacyChangePassword">Change password</a></li>
                <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/logout/4">Logout</a></li>
             </ul>
      </div>
    </div>
  </div>
</div>