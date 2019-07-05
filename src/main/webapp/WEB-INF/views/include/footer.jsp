<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="submitContactUs" value="/submitContactUs" />
<div class="footer-big">

	<footer>
		<div class="container animate" data-animate="fadeIn"
			data-duration="1.0s" data-delay="0.1s">
			<div class="row">
				<div class="col-sm-3">
					<h3>Doctors</h3>
					<ul class="list">
						<c:choose>
							<c:when test="${sessionScope.doctorDetails.doctorId>0}">
								<li><a
									href="${pageContext.request.contextPath}/showDoctorHomePage"
									class="hvr-forward">Profile</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showViewDoctorAppointment"
									class="hvr-forward">Appointment</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showViewConsultHistory"
									class="hvr-forward">View Consulting</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/showDoctorLoginPage"
									class="hvr-forward">Profile</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showDoctorLoginPage"
									class="hvr-forward">Appointment</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showDoctorLoginPage"
									class="hvr-forward">View Consulting</a></li>

							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-sm-3">
					<h3>Patients</h3>
					<ul class="list">
						<c:choose>
							<c:when test="${sessionScope.patientDetails.patientId>0}">
								<li><a
									href="${pageContext.request.contextPath}/showPatientHomePage"
									class="hvr-forward">Profile</a></li>
								<li><a href="#" onclick="getDoctorList()"
									class="hvr-forward">Find a Doctor</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPatientConsultToPage"
									class="hvr-forward">Consult a doctor</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showOrderMedicinePage"
									class="hvr-forward">Order medicines</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showBookAppointment"
									class="hvr-forward">Make An Appointment</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/showPatientLoginPage"
									class="hvr-forward">Profile</a></li>
								<li><a href="#" onclick="getDoctorList()"
									class="hvr-forward">Find a Doctor</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPatientLoginPage"
									class="hvr-forward">Consult a doctor</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPatientLoginPage"
									class="hvr-forward">Order medicines</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPatientLoginPage"
									class="hvr-forward">Make An Appointment</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-sm-3">
					<h3>Lab</h3>
					<ul class="list">
						<c:choose>
							<c:when test="${sessionScope.labDetails.labId>0}">
								<li><a
									href="${pageContext.request.contextPath}/showLabHomePage"
									class="hvr-forward">profile</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showViewLabAppointment"
									class="hvr-forward">Appointment</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showLabHistory"
									class="hvr-forward">History</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/showLabLoginPage"
									class="hvr-forward">profile</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showLabLoginPage"
									class="hvr-forward">Appointment</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showLabLoginPage"
									class="hvr-forward">History</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-sm-3">
					<h3>Pharmacy</h3>
					<ul class="list">
						<c:choose>
							<c:when test="${sessionScope.medicalDetails.medicalId>0}">
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyHomePage"
									class="hvr-forward">Profile</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyViewOrder"
									class="hvr-forward">Order list</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyCompletedOrder"
									class="hvr-forward">completed order</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyOrderHistory"
									class="hvr-forward">History</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyLoginPage"
									class="hvr-forward">Profile</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyLoginPage"
									class="hvr-forward">Order list</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyLoginPage"
									class="hvr-forward">completed order</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showPharmacyLoginPage"
									class="hvr-forward">History</a></li>

							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</div>
		</div>
	</footer>
	<div class="footer_sec">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 text-left">
					<p>
						Follow us : <a
							href="https://www.facebook.com/bionischetechnology/?modal=admin_todo_tour"
							target="_blank" class="hvr-float"><span class="icon-facebook"></span></a><a
							href="https://twitter.com/BionischeT" target="_blank"
							class="hvr-float"><span class="icon-twitter"></span></a><a
							href="https://www.linkedin.com/company/bionische-technology-pvt-ltd/"
							target="_blank" class="hvr-float"><span class="icon-linkedin"></span></a><a
							href="https://www.instagram.com/bionische_technology/"
							target="_blank" class="hvr-float"><span
							class="icon-instagram"></span></a>
					</p>
					<p>
						Email id :<a href="mailto:info@bionische.com" target="blank"
							class="hvr-forward"> info@bionische.com</a>
					</p>
				</div>
				<div class="col-sm-4 text-center">
					
					<img
						src="${pageContext.request.contextPath}/resources/images/logofoot.png"
						class="img-responsive" alt="health care">
						<a href="#termcon" data-toggle="modal"><i>Terms & Condition</i></a>
					<a href="#termcon1" data-toggle="modal"><i>Privacy_Policy</i></a>

				</div>
				<!-- <div class="col-sm-4 text-right">
		 		<p>Designed by :<a href="http://bionische.com" target="blank"  class="hvr-forward"> Bionische</a></p>
		 		<p class="cont-us"><a href="#"  class="hvr-forward"><span>Contact us</span></a></p>
		 	</div> -->
				<div class="col-sm-4 text-right">
					<p class="cont-us">
						<span>Quick Links</span>
					</p>
					<p>
						<a href="http://bionische.com/about-comapny.html" target="blank"
							class="hvr-forward"> About Us</a>&nbsp; / <a href="#"
							data-toggle="modal" data-target="#contactUsModal"
							class="hvr-forward"> Contact Us</a>
					</p>

				</div>
			</div>
		</div>
	</div>


	<!--  <div id="snackbar" border="0">
  <img  ismap=""  src="https://secure.img-cdn.mediaplex.com/0/10599/247540/728x90.jpg?mpqs=&amp;mpssl=1&amp;mpvc=">
  </div> -->

	<!-- <div id="snackbar" style='display:none'>
    <div id="popup">
            <img  ismap=""  src="https://secure.img-cdn.mediaplex.com/0/10599/247540/728x90.jpg?mpqs=&amp;mpssl=1&amp;mpvc=">
			<div class="closed-button">
			<button type="submit" class="closed-button" value="Submit" data-dismiss="modal" aria-label="Close" onClick="PopUp('hide')"><span aria-hidden="true">×</span></button>
			<input type="submit" name="submit" value="Submit" onClick="PopUp('hide')">
			</div>
		 </div>
</div> -->



</div>



<div class="footer-850">
	<footer>
		<div class="container-fluid animate" data-animate="fadeIn"
			data-duration="1.0s" data-delay="0.1s">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" class="collapsed">For Doctor</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="list">
								<c:choose>
									<c:when test="${sessionScope.doctorDetails.doctorId>0}">
										<li><a
											href="${pageContext.request.contextPath}/showDoctorHomePage"
											class="hvr-forward">Profile</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showViewDoctorAppointment"
											class="hvr-forward">Appointment</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showViewConsultHistory"
											class="hvr-forward">View Consulting</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/showDoctorLoginPage"
											class="hvr-forward">Profile</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showDoctorLoginPage"
											class="hvr-forward">Appointment</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showDoctorLoginPage"
											class="hvr-forward">View Consulting</a></li>

									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo" class="collapsed">For patients</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="list">
								<c:choose>
									<c:when test="${sessionScope.patientDetails.patientId>0}">
										<li><a
											href="${pageContext.request.contextPath}/showPatientHomePage"
											class="hvr-forward">Profile</a></li>
										<li><a href="#" onclick="getDoctorList()"
											class="hvr-forward">Find a Doctor</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPatientConsultToPage"
											class="hvr-forward">Consult a doctor</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showOrderMedicinePage"
											class="hvr-forward">Order medicines</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showBookAppointment"
											class="hvr-forward">Make An Appointment</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/showPatientLoginPage"
											class="hvr-forward">Profile</a></li>
										<li><a href="#" onclick="getDoctorList()"
											class="hvr-forward">Find a Doctor</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPatientLoginPage"
											class="hvr-forward">Consult a doctor</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPatientLoginPage"
											class="hvr-forward">Order medicines</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPatientLoginPage"
											class="hvr-forward">Make An Appointment</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseThree" class="collapsed">For Lab</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="list">
								<c:choose>
									<c:when test="${sessionScope.labDetails.labId>0}">
										<li><a
											href="${pageContext.request.contextPath}/showLabHomePage"
											class="hvr-forward">profile</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showViewLabAppointment"
											class="hvr-forward">Appointment</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showLabHistory"
											class="hvr-forward">History</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/showLabLoginPage"
											class="hvr-forward">profile</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showLabLoginPage"
											class="hvr-forward">Appointment</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showLabLoginPage"
											class="hvr-forward">History</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseFour" aria-expanded="true"
								aria-controls="collapse4" class="collapsed">For Pharmacy</a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="list">
								<c:choose>
									<c:when test="${sessionScope.medicalDetails.medicalId>0}">
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyHomePage"
											class="hvr-forward">Profile</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyViewOrder"
											class="hvr-forward">Order list</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyCompletedOrder"
											class="hvr-forward">completed order</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyOrderHistory"
											class="hvr-forward">History</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyLoginPage"
											class="hvr-forward">Profile</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyLoginPage"
											class="hvr-forward">Order list</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyLoginPage"
											class="hvr-forward">completed order</a></li>
										<li><a
											href="${pageContext.request.contextPath}/showPharmacyLoginPage"
											class="hvr-forward">History</a></li>

									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="footer_sec">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 text-left">
					<p>
						Follow us &nbsp;: <a
							href="https://www.facebook.com/bionischetechnology/?modal=admin_todo_tour"
							target="_blank" class="hvr-float"><span class="icon-facebook"></span></a><a
							href="https://twitter.com/BionischeT" target="_blank"
							class="hvr-float"><span class="icon-twitter"></span></a><a
							href="https://www.linkedin.com/company/bionische-technology-pvt-ltd/"
							target="_blank" class="hvr-float"><span class="icon-linkedin"></span></a><a
							href="https://www.instagram.com/bionische_technology/"
							target="_blank" class="hvr-float"><span
							class="icon-instagram"></span></a>
					</p>
					<p>
						Email id &nbsp;:<a href="mailto:info@bionische.com" target="blank"
							class="hvr-forward"> info@bionische.com</a>
					</p>
				</div>
				<div class="col-sm-4 text-center">
					<img
						src="${pageContext.request.contextPath}/resources/images/logofoot.png"
						class="img-responsive" alt="health care">

				</div>
				<!-- <div class="col-sm-4 text-right">
		 		<p>Designed by  &nbsp;:<a href="http://bionische.com" target="blank"  class="hvr-forward"> Bionische</a></p>
		 		<p class="cont-us"><a href="#"  class="hvr-forward"><span>Contact us</span></a></p>
		 	</div> -->
				<div class="col-sm-4 text-right">
					<p class="cont-us">
						<span>Quick Links</span>
					</p>
					<p>
						<a href="${pageContext.request.contextPath}/showAboutUs"
							target="blank" class="hvr-forward"> About Us</a>&nbsp; / <a
							href="#" data-toggle="modal" data-target="#contactUsModal"
							class="hvr-forward"> Contact Us</a>
					</p>

				</div>
			</div>
		</div>
	</div>
</div>

<div class="chatting chatbox-min" id="chating" style="display: none">
	<div class="chatbox-holder">

		<div class="chatbox group-chat">
			<div class="chatbox-top">
				<div class="chatbox-avatar">
					<a target="_blank" href="#"><img
						src="${pageContext.request.contextPath}/resources/images/b_logo.png"
						class="img-responsive" alt="b logo" /></a>
				</div>

				<div class="chat-group-name">
					<span class="status away"></span> <span id="chatingName"></span>
				</div>
				<!-- <div class="chat-group-count">10</div> -->
				<div class="chatbox-icons">

					<div class="settings-popup">
						<ul>
							<li><a href="#">Group members</a></li>
							<li><a href="#">Add members</a></li>
							<li><a href="#">Delete members</a></li>
							<li><a href="#">Leave group</a></li>
						</ul>
					</div>
					<a href="javascript:void(0);"><i class="fa fa-minus"></i></a> <a
						href="#"
						onclick="document.getElementById('chating').style.display = 'none';"><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="chat-messages">
				<div id="chatingBox"></div>

			</div>

			<div class="chat-input-holder">

				<input type="text" class="chat-input" placeholder="Enter Message"
					onkeyup="sendemsg(event);" id="messageBox">
				<!-- <textarea class="chat-input" placeholder="Enter Message" onkeyup="sendemsg(event);" id="messageBox"></textarea> -->
				<button class="msg_send_btn" type="button">
					<i class="fa fa-paper-plane-o" aria-hidden="true"
						onclick="sendMessage()"></i>
				</button>
				<!-- <input type="submit" value="Send" class="message-send" /> -->
			</div>


		</div>

	</div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="contactUsModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Have you any Query ?</h4>
			</div>
			<div class="modal-body contact-inpt">
				<input type="text" name="fullname" id="fullname"
					placeholder="Full Name" autocomplete="no-fill"> <input
					type="text" name="email" id="email" placeholder="Email Id"
					autocomplete="no-fill"> <input type="text" name="phone"
					id="phone" placeholder="Phone Number" autocomplete="no-fill">
				<textarea type="text" name="message" id="message"
					placeholder="Message"></textarea>
				<p class="text-center">
					<input type="submit" name="submit" onclick="submitContactUs()"
						class="btn-fr-all" value="Send Message">
				</p>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!--  <div class="overlay" id="001">
<a href="javascript:void(0)" id="close_001">CLOSE</a>
<p>Lorem ipsum</p>
</div> -->

<!-- <div class="chatting chatbox-min" id="chating"  style="display: none">
 <div class="top_menu">
  <div class="chatbox-icons">
        <a href="javascript:void(0);"><i class="fa fa-minus"></i></a>
        <a href="javascript:void(0);"><i class="fa fa-close"></i></a>       
      </div> 
            <div class="title">Chat</div></div> 
   <div  id="chatingBox" >
  </div>
 <div class="bottom_wrapper"> <input type="text" class="form-control" placeholder="Enter Message" onkeyup="sendemsg(event);" id="messageBox"></div>
  </div> -->
<!--   <div id="snackbar" border="0">
  <img  ismap=""  src="https://secure.img-cdn.mediaplex.com/0/10599/247540/728x90.jpg?mpqs=&amp;mpssl=1&amp;mpvc=" width="50%">
  </div> -->

<!-- advert pop -->
<!-- <script>
  function PopUp(hideOrshow) {
	    if (hideOrshow == 'hide') document.getElementById('snackbar').style.display = "none";
	    else document.getElementById('snackbar').removeAttribute('style');
	}
	window.onload = function () {
	    setTimeout(function () {
	        PopUp('show');
	    }, 1000);
	}
  </script> -->
<!-- advert pop -->


<script>
  
  
  
  
  
  $(function(){
	  $('.fa-minus').click(function(){    $(this).closest('.chatbox').toggleClass('chatbox-min');
	  });
	  $('.fa-close').click(function(){
	    $(this).closest('.chatbox').hide();
	  });
	  $(".content_img").click(function(){
		    $('.chatbox').show();
		});
	});
  </script>
<script type="text/javascript">

window.onload = function() {
if (location.protocol != 'https:'  && !location.port)
{
 location.href = 'https:' + window.location.href.substring(window.location.protocol.length);
}
};


	function submitContactUs() {
		var fullname=$('#fullname').val();
		var email=$('#email').val();
		var phone=$('#phone').val();
		var message=$('#message').val();
		
		$
		 
		.getJSON(
				'${submitContactUs}',
				{
					fullname : fullname,
					email : email,
					phone : phone,
					message : message,
					ajax : 'true'
				},
				function(data) {
					
					alert(data);
				});
	}
	</script>


