<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bhoechie-tab-menu">
              <div class="list-group">
                <a href="${pageContext.request.contextPath}/showPatientHomePage" onclick="openPage('showPatientHomePage')" class="list-group-item text-center ${homeActive}">
                  <h4 class="icon-specialist-user"></h4>Profile
                </a>
                <a href="${pageContext.request.contextPath}/showBookAppointment" onclick="openPage('showBookAppointment')" class="list-group-item text-center ${appointActive}">
                  <h4 class="icon-calendar-page"></h4>Appointment
                </a>
                <a href="${pageContext.request.contextPath}/showPatientConsultToPage" onclick="openPage('showPatientConsultToPage')" class="list-group-item text-center ${consultActive}">
                  <h4 class="icon-male-consultant"></h4>Consulted Doctor
                </a>
                
                <a href="#" class="list-group-item text-center ${reportActive}" onclick="openPage('showPatienReportPage')">
                   <h4 class="icon-newspaper"></h4>Report
                </a>
                <a href="#" class="list-group-item text-center ${orderActive}" onclick="openPage('showOrderMedicinePage')">
                	<h4 class="icon-pills"></h4>Order Medicine
                </a>
                <a href="#" class="list-group-item text-center ${orderViewActive}" onclick="openPage('showMyOder')">
                	<h4 class="icon-task-complete"></h4>View Order
                </a>
                <a href="#" class="list-group-item text-center ${vaccination}" onclick="openPage('showPatientVaccinationPage');" class="list-group-item text-center">
                   <h4 class="icon-vaccine" ></h4>Vaccination
                </a>
                 <a href="#" class="list-group-item text-center ${bankdetail}" onclick="openPage('showPatientBankDetl');" class="list-group-item text-center">
                   <h4 class="icon-newspaper" ></h4>Bank Details
                </a>
                <a href="#" class="list-group-item text-center" onclick="openPage('showHealthInsuranceEnquiry')">
                	<h4 class="icon-shield"></h4>Insurance
                </a>  
                
                <a href="#" class="list-group-item text-center" onclick="openPage('showStemCellBank')">
                	<h4 class="icon-shield"></h4>Stemcell
                </a> 
                
                <!--  <a href="#" class="list-group-item text-center" onclick="">
                	<h4 class="glyphicon glyphicon-list-alt"></h4>Add History
                </a>
                <a href="#" class="list-group-item text-center" onclick="">
                	<h4 class="glyphicon glyphicon-list-alt"></h4>View History
                </a> -->
                <%-- <a href="${pageContext.request.contextPath}/showConsultingOfDoctor" class="list-group-item text-center" onclick="openPage('showConsultingOfDoctor');" class="list-group-item text-center">
                   <h4 class="glyphicon glyphicon-hourglass"></h4>View Consulting
                </a> --%>
              </div>
              
</div>
 <script>
            function openPage(url)
            {
            	window.open("${pageContext.request.contextPath}/"+url, '_self');
            }
            </script>