<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 bhoechie-tab-menu">
              <div class="list-group">
                <a href="#" onclick="openPage('showPharmacyHomePage')" class="list-group-item text-center ${homeActive}">
                  <h4 class="icon-specialist-user"></h4>Profile
                </a>
                <a href="#" onclick="openPage('showViewOrderPharmacy')" class="list-group-item badge1 text-center ${viewOrderActive}">
                  <h4 class="icon-buying-on-smartphone"></h4>View Order
                  <span class="pharm-count">${count}</span>
                  
                </a>
                <a href="#" onclick="openPage('showCompletedOrderPharmacy')" class="list-group-item text-center ${completedActive}">
                  <h4 class="icon-task-complete"></h4>Completed Orders
                </a>
                <a href="#" class="list-group-item text-center ${historyActive}" onclick="openPage('showPharmacyOrderHistory')">
                	<h4 class="icon-clipboard"></h4>History
                </a>
                <a href="#" class="list-group-item text-center ${cancelActive}" onclick="openPage('showCancelledOrderPharmacy')">
                	<h4 class="icon-clipboard"></h4>Canceled Order
                </a>
                <a href="#" class="list-group-item text-center ${bankActive}" onclick="openPage('showPharmaBankDetails')">
                	<h4 class="icon-newspaper"></h4>Bank Details
                </a>
                
              </div>
              
</div>
 <script>
            function openPage(url)
            {
            	window.open("${pageContext.request.contextPath}/"+url, '_self');
            }
            </script>