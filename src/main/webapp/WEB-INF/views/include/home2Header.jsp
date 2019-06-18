<div class="navbar-wrapper">
  <div class="container-fluid">
    <nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span>Menu <!-- <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>  --></button>
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
      <li class="nm_menu">Bionische <span>Menu</span></li>
      <li class="hvr-sweep-to-right"><a href="#">Reports</a></li>
      <li class="hvr-sweep-to-right"><a href="#">Book Appointment</a></li>
       <li class="hvr-sweep-to-right"><a href="${pageContext.request.contextPath}/showLabtest">Lab Test</a></li>
      <li class="hvr-sweep-to-right"><a href="${pageContext.request.contextPath}/showOrderMedicine">Our Medicines</a></li>
      <li class="hvr-sweep-to-right"><a href="${pageContext.request.contextPath}/showConsultinghome">Online Consulting</a></li>
      <li class="hvr-sweep-to-right"><a href="#">Contact us</a></li>
    </ul>
  </div>
  </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">    
            <li class="dropdown"> <a href="#" class="dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">  Login  <span class="caret"></span></a>
              <ul class="dropdown-menu square">
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showDoctorLoginPage">Doctor Login</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPatientLoginPage">Patient Login</a></li>
                <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showLabLoginPage">Lab Login</a></li>
              <li><a class="hvr-sweep-to-right"   href="${pageContext.request.contextPath}/showPharmacyLoginPage">Pharmacy Login</a></li>
              </ul>
            </li>
            <!--  <li><a href="#signup" data-toggle="modal">Sign Up</a></li> -->
            <!--  <li><a href="#">Help</a></li> -->
          </ul>
           
        </div>
    </nav>
  </div>
</div>