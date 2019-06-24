<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<div class="navbar-wrapper">
  <div class="container-fluid">
    <nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
         </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right mrgn-top" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">
          <li class="dnld-app1"><a href="${pageContext.request.contextPath}/#about">About Us</a></li>
          <li class="dnld-app1"><a href="${pageContext.request.contextPath}/#appoint">Appointment</a></li>  
          <li class="dnld-app1"><a href="${pageContext.request.contextPath}/#health">Healthcare </a></li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">  Our Product  <span class="caret"></span></a>
              <ul class="dropdown-menu square">
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/#iboard"><span class="fa fa-info"></span> &nbsp; Overview</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showWaitingRoom"><span class="fa fa-television"></span>&nbsp; Waiting Room TV</a></li>
                <%-- <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showWaitingPoster"><span class="fa fa-clipboard"></span>&nbsp; Waiting Room Poster</a></li> --%>
             <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showWallboard"><span class="fa fa-clipboard"></span>&nbsp; Dr. Room iBoard</a></li>
              <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showExamTablet"><span class="fa fa-tablet"></span>&nbsp; Dr. Room Tablet</a></li>
               <%-- <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showInfusionTablet"><span class="fa fa-tablet"></span>&nbsp; Infusion Room Tablet</a></li> --%>
              </ul>
            </li>
          <li class="dnld-app1"><a href="${pageContext.request.contextPath}/#blog">Blog </a></li>  
          <li class="dnld-app1"><a href="${pageContext.request.contextPath}/#article">Articles </a></li>
          <li class="dropdown"> <a href="#" class="loginA dropdown-toggle  js-activated" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">  Login  <span class="caret"></span></a>
              <ul class="dropdown-menu square">
               <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showDoctorLoginPage"><span class="icon-doctor"></span> Doctor Login</a></li>
                <li><a class="hvr-sweep-to-right" href="${pageContext.request.contextPath}/showPatientLoginPage"><span class="icon-doctor-1"></span> Patient Login</a></li>
                <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showLabLoginPage"><span class="icon-lab-microscope"></span> Lab Login</a></li>
             <li><a class="hvr-sweep-to-right"  href="${pageContext.request.contextPath}/showPharmacyLoginPage"><span class="icon-cross"></span> Pharmacy Login</a></li>
              </ul>
            </li>
            <li class="dnld-app"><a href="#" data-toggle="modal"><span class="icon-smartphone"></span>Download App</a></li>
            <!--  <li><a href="#signup" data-toggle="modal">Sign Up</a></li> -->
             <!-- <li><a href="#">Help</a></li> -->
          </ul>
        </div>
     
    </nav>
    <div class="modal fade feedbck doclistBook" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="loginpopup5">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">Not Logged in</h4>
        <span class="glyphicon glyphicon-triangle-bottom"></span>
      </div>
      <div class="modal-body text-center">
	           <!-- <h3>You must Login First</h3>
	           <div class="clearfix"></div>
	            <h5>If you are not registered click on sign up</h5>
	            <div class="clearfix"></div>
	           <a href="#" class="btn-fr-all" data-toggle="modal">Login</a>
					<a href="#" class="btn-fr-all" data-toggle="modal">Sign Up</a>  -->   
					<input type="hidden" id="valueOfParameter">
					<div class="login1_blk">
	 		<div class="login-form">
	 			<p id="errormessage1" style="color:red;position:absolute; margin: 0 auto; left:0; right:0" maxlength="20"></p>
        <input type="text" id="LogInUname2" name="userName" placeholder="Username" class="capitl_none" required="required" onclick="clearMsg()">
       <div class="loader2" style="position: fixed;margin-left: 140px" id="loader"> </div>
        <input type="password" id="LogInPasswors2" name="password" class="capitl_none" placeholder="password" onkeypress="if(event.keyCode==13) {doctorLogin();}" required="">
	 	
	 	<input type="submit" name="submit" class="btn-fr-all" placeholder="login" onclick="patientLinkLogin()" value="Login">
	<a href="${pageContext.request.contextPath}/showPatientRegistrationPage">Sign Up</a><br>
	<a href="" onclick="usrnameMsgForForgetPwd()">Forgot Password?</a>
	 		</div>
	 </div>
      </div>
      </div>
    </div>
 </div>
  </div>
</div>


<script>


function openLoginModal(type){
 
 document.getElementById("valueOfParameter").value=type;
 $("#loginpopup5").modal('show');
	
}

 function patientLinkLogin() {
		// document.getElementById("loader").style.display='block'; 		 
		var type;
		type=document.getElementById("valueOfParameter").value;
		
		var userName=document.getElementById("LogInUname2").value; 
		 var password=document.getElementById("LogInPasswors2").value;
		
		 $
		 
														.getJSON(
																'patientLoginProcess',
																{
																	userName : userName,
																	password : password,
																	
																	ajax : 'true'
																},
																function(data) {
																	// document.getElementById("loader").style.display='none'
																	//alert(data.message);
																	if(data.message=="wrong") 
																		{//alert("wrong");
																		//	document.getElementById("loader").style.display='none';
																	 document.getElementById("errormessage1").innerHTML="Invalid credential."; 
																		}  
																	else
																		{
																		
																		if(type==1){
																			window.open("${pageContext.request.contextPath}/showPatienReportPage","_self");
																		}else if(type==2){
																			
																			window.open("${pageContext.request.contextPath}/showBookAppointment","_self");
																			
																		}else if(type==3){
																			
																			window.open("${pageContext.request.contextPath}/showBookAppointment","_self");
																			
																		}else if(type==4){
																			
																			window.open("${pageContext.request.contextPath}/showOrderMedicinePage","_self");
																			
																		}
                                                                            else if(type==5){
																			
                                                                            	window.open("${pageContext.request.contextPath}/showBookAppointment","_self");
																			
																		}
																		
																		
																		

																		}
																})
		
		 
	 }
	 
	 </script>