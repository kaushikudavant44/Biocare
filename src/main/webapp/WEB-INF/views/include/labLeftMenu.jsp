  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bhoechie-tab-menu">
              <div class="list-group">
                <a href="#" onclick="openPage('showLabHomePage')" class="list-group-item text-center ${profileActive}">
                  <h4 class="icon-specialist-user"></h4>Profile
                </a>
                <a href="#"  onclick="openPage('showViewLabAppointment')" class="list-group-item text-center ${appointActive}" data-badge="${appointmentCount}">
                  <h4 class="icon-calendar-page"></h4>Appointment
                </a>
                <a href="#" onclick="openPage('showLabHistory')" class="list-group-item text-center ${historyActive}">
                  <h4 class="icon-clipboard"></h4>History
                </a>
                <a href="#" onclick="openPage('showLabTestEdit')" class="list-group-item text-center ${testActive}">
                  <h4 class="icon-user"></h4>Edit Tests
                </a>
                 <a href="#" onclick="openPage('showLabBankDetails')" class="list-group-item text-center ${labBankAcc}">
                  <h4 class="icon-newspaper"></h4>Bank Details
                </a>
                 <c:if test="${sessionScope.labDetails.isRadiologist==1}">
                 <a href="#" onclick="openPage('showCheckUserType')" class="list-group-item text-center ${testActive}">
                  <h4 class="icon-newspaper"></h4>PNDT Patients Details
                </a>
              
                 <a href="#" onclick="openPage('showPndtPatientList')" class="list-group-item text-center ${testActive}">
                  <h4 class="icon-newspaper"></h4>PNDT Patient List
                </a>
          
                 <a href="#" onclick="openPage('showPndtUserNamePassword')" class="list-group-item text-center ${testActive}">
                  <h4 class="icon-newspaper"></h4>PNDT Password
                </a>
              	</c:if>
                 
              </div>
            </div>
              <script>
            function openPage(url)
            {
            	window.open("${pageContext.request.contextPath}/"+url, '_self');
            }
            </script>