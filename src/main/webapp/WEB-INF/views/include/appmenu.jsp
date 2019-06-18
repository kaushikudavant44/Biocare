  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bhoechie-tab-menu">
              <div class="list-group">
              
             
              
                <a href="#" class="list-group-item text-center" onclick="getDoctorProfile();getDoctorRatingDetails()">
                  <h4 class="glyphicon glyphicon-user"></h4>Profile
                </a>
                <a href="#" class="list-group-item text-center badge1" data-badge="${appointmentCount}">
                  <h4 class="glyphicon glyphicon-list-alt"  ></h4>Appointment
                </a>
                <a href="#" class="list-group-item text-center">
                  <h4 class="glyphicon glyphicon-briefcase "></h4>Meetings
                </a>
                <a href="#" class="list-group-item text-center">
                	<h4 class="glyphicon glyphicon-comment"></h4>Sticky Notes
                </a>
                <a href="#" class="list-group-item text-center">
                   <h4 class="glyphicon glyphicon-hourglass"></h4>Routine
                </a>
                  </a>
                <a href="${pageContext.request.contextPath}/showConsultingOfDoctor" class="list-group-item text-center" onclick="openPage('showConsultingOfDoctor');" class="list-group-item text-center">
                   <h4 class="glyphicon glyphicon-hourglass" onclick="openPage('showConsultingOfDoctor')"></h4>View Consulting
                </a>
              </div>
            </div>
            <script>
            function openPage(url)
            {
            	window.open("${pageContext.request.contextPath}/"+url, '_self');
            }
            </script>