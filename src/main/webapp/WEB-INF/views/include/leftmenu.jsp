  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bhoechie-tab-menu">
              <div class="list-group">
           
             
             	 <a href="#" class="list-group-item text-center ${dashboardActive}"  onclick="openPage('showDoctorDashBoard')">
                  <h4 class="icon-specialist-user"></h4>Dashboard
                </a> 
                <a href="#" class="list-group-item text-center ${homeActive}"  onclick="openPage('showDoctorHomePage')" onclick="getDoctorProfile();getDoctorRatingDetails()">
                  <h4 class="icon-specialist-user"></h4>Profile
                </a>
                <a href="#" onclick="openPage('showViewDoctorAppointment')" class="list-group-item text-center ${appointActive}">
                  <h4 class="icon-calendar-page"  ></h4>Appointment
                </a>
                <a href="#" onclick="openPage('showUploadVideo')" class="list-group-item text-center ${uploadActive}">
                  <h4 class="glyphicon glyphicon-facetime-video"  ></h4>Send Video to Patient
                </a>
                
                <a href="#" class="list-group-item text-center ${consultActive}"  onclick="openPage('showViewConsultHistory');" class="list-group-item text-center">
                   <h4 class="icon-male-consultant" ></h4>View Consulting
                </a>
                <a href="#" class="list-group-item text-center ${timeAvailableActive}" onclick="openPage('doctorAvailableTime/showAvailableTimePage');" class="list-group-item text-center">
                   <h4 class="icon-calendar-with-a-clock-time-tools" ></h4>Available Time
                </a>
                <a href="#" class="list-group-item text-center ${vaccinationActive}" onclick="openPage('showVaccination');" class="list-group-item text-center">
                   <h4 class="icon-vaccine" ></h4>Vaccination
                </a>
                <c:if test="${sessionScope.gynecologist=='gynecologist'}">
                   <a href="#" class="list-group-item text-center ${vaccinationActive}" onclick="openPage('showInsertBabyReports');" class="list-group-item text-center">
                   <h4 class="icon-vaccine" ></h4>Upload Baby Report
                </a>
                </c:if>
                 
                
                <a href="#" class="list-group-item text-center ${patientSharedReports}" onclick="openPage('showPatientSharedReports');" class="list-group-item text-center">
                   <h4 class="icon-calendar-with-a-clock-time-tools" ></h4>Patient Shared Reports
                </a>
                <a href="#" class="list-group-item text-center ${bankDetails}" onclick="openPage('showDocBankDetails');" class="list-group-item text-center">
                   <h4 class="icon-calendar-with-a-clock-time-tools" ></h4>Bank Details
                </a>
                
                 <c:if test="${sessionScope.radiologist=='Radiologist'}">
                    <a href="#" class="list-group-item text-center" onclick="openPage('showTestDetails');" class="list-group-item text-center">
                   <h4 class="glyphicon glyphicon-hourglass" ></h4>Test Management
                </a>
                  <a href="#" class="list-group-item text-center ${mynetwork}" onclick="openPage('getDoctorCircleList');" class="list-group-item text-center">
                   <h4 class="icon-calendar-with-a-clock-time-tools" ></h4>My Network
                </a>
                </c:if>
                  <a href="#" class="list-group-item text-center ${mynetwork}" onclick="openPage('getDoctorCircleList');" class="list-group-item text-center">
                   <h4 class="icon-calendar-with-a-clock-time-tools" ></h4>My Network
                </a>
              </div>
            </div>
           
          
           
            <script>
            
           
            
            function openPage(url)
            {
            	window.open("${pageContext.request.contextPath}/"+url, '_self');
            	/* document.getElementById("doprofile").classList.add("active"); */
            	
            }
            </script>