<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


</head>         
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 

<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4><span>C</span>onsulted <span>P</span>atient <span>L</span>ist</h4></div>
<div class="container-fluid">
<div class="row">
        <div class="bhoechie-tab-container">
        <jsp:include page="../include/radiology_left_menu.jsp"/> 
        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
                
                <div class="panel-body panel-form">
              
								<div class="table-responsive">
                                <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                              
                               
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable no-footer tbl table table-bordered table table-hover">
                                    <thead>
                                        <tr role="row">
                                        <th>Sr.</th>                                        
                                        <th>Full Name</th>
                                        <th>Address</th>
                                        <th>Email Id</th>
                                        <th>Contact No</th>
                                        <th>Patient Detail</th>
                                      	</tr>
                                    </thead>
                                    
                                    <tbody>
                               <c:forEach items="${pndtPatientBasicDetailsList}" var="pndtPatientBasicDetailsList">
                                    <tr role="row" class="odd">
                                            
											<td>${pndtPatientBasicDetailsList.patientId}</td>
                                            <td>${pndtPatientBasicDetailsList.fName} ${pndtPatientBasicDetailsList.mName} ${pndtPatientBasicDetailsList.lName}</td>            
                                            <td>${pndtPatientBasicDetailsList.address}</td>
                                            <td>${pndtPatientBasicDetailsList.email}</td>
											<td>${pndtPatientBasicDetailsList.contactNo}</td>					
											<td class="text-center"><a href="${pageContext.request.contextPath}/showSinglePndtPatients?pndtId=${pndtPatientBasicDetailsList.pndtId}"><i class="fa fa-bars"></i> </a></td>
                                          
                                        </tr>
                                </c:forEach> 
                                        </tbody>
                                </table>
                               
                                </div>
                            </div>
							
						
						
                    </div>
                    
               
                
                
           </div>
           </div>
        </div>
  </div>
</div>
</section>

 
 
 <jsp:include page="../include/footer.jsp"/> 
 
 </body>