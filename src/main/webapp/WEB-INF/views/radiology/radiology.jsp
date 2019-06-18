<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="getAllStateByCountryId" value="/getAllStateByCountryId" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<title>Welcome to  Health care </title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js" type="text/javascript"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">

</head> 
<body class="radiology_sec">
  <div class="navbar-wrapper box radiology_main">
  <div class="container-fluid">
    <nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand animate" data-animate="slideInLeft" data-duration="1.0s" data-delay="0.2s" href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logo_health.png" class="img-responsive" alt="health care"></a> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
         </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.2s">      
            <li class="active"><a href="index.html">Home</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/resources/	images/doc_admin.png" class="img-responsive img-circle" alt="doctor"><strong>Patient Name</strong></a></li>
            <li><a href="#">logout &nbsp; <span class="glyphicon glyphicon-log-out"></span></a></li>
             </ul>
        </div>
     
    </nav>
  </div>
</div>

<section class="doc_login">
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/leftmenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content radiology_sec active">
				  <div class="radiology">
            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-envelope-o"></i>Search</a></li>
                    <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-cube"></i>Patient Details</a></li>
                    <li role="presentation"><a href="#Section3" aria-controls="settings" role="tab" data-toggle="tab" onclick="executeMultipleMethod()"><i class="fa fa-comment" ></i> PNDT Details</a></li>
                     <li role="presentation"><a href="#Section4" aria-controls="settings" role="tab" data-toggle="tab"><i class="fa fa-comment"></i> Image Processing & Cosumption Details </a></li>
                    
                </ul>
                <script>
                function executeMultipleMethod(){
                	getAllStateByCountryId();
                	getDoctorDetails();
                	
                }
                </script>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                    <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-4">
                    <input type="text" class="form-control mar-bot" placeholder="Search">
                    
                    </div>
                    </div>
                       <table width="100" border="1">
  <tr>
    <td width="15%"><label class="line-height"><input type="checkbox" class="ckbox" value="">Is Aborted</label></td>
    <td width="50%">
    	<div class="form-group">
                                        
                                          <div class="col-xs-12">
                                          	<div class="col-xs-4 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Mr.</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
                                    <div class="col-xs-4 text-center"><label class="line-height"><input type="checkbox" class="ckbox" value="">
                                    Age Type </label></div>
                                    <div class="col-xs-4 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Years</option>
                                                    <option>1980</option>
                                                    <option>1985</option>
                                                    <option>1981</option>
                                                </select>
                                            </div>
                                            
                                          </div>
                                        </div>
    </td>
    <td>
    	<div class="row">
        	<div class="col-md-6 col-sm-6 col-xs-6">
            	<div class="xform-group">
    <label for="nameField" class="col-xs-3"> From </label>
     <div class="col-xs-8"><input type="text" class="form-control form_datetime" id="nameField" placeholder="On Date"></div>
    </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-6">
            <div class="xform-group">
    <label for="nameField" class="col-xs-3 text-center"> To</label>
     <div class="col-xs-8"><input type="text" class="form-control form_datetime" id="nameField" placeholder="On Date"></div>
    </div>
            </div>
        </div>
    </td>
    
  </tr>
  <tr>
    <td>
    	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Ref Dr.</label>
    </td>
  
    <td>
    	<div class="col-xs-12 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
    </td>
     <td>
    	<div class="row">
        	<div class="col-md-6 col-sm-6 col-xs-6">
            	<div class="xform-group">
    <label for="nameField" class="col-xs-3"> From </label>
     <div class="col-xs-8"><input type="text" class="form-control form_datetime" id="nameField" placeholder="On Date"></div>
    </div>
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-6">
            <div class="xform-group">
    <label for="nameField" class="col-xs-3 text-center"> To</label>
     <div class="col-xs-8"><input type="text" class="form-control form_datetime" id="nameField" placeholder="On Date"></div>
    </div>
            </div>
        </div>
    </td>
    
  </tr>
  <tr>
    <td> <label class="line-height"><input type="checkbox" class="ckbox" value=""> Modality </label> </td>
    <td>
    	<div class="col-xs-12 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
    </td>
    <td> <div class="col-xs-3">
    <label class="line-height"><input type="checkbox" class="ckbox" value=""> Test </label> </div> 
    	<div class="col-xs-8 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
    </td>
    
  </tr>
  <tr>
    <td> <label class="line-height"><input type="checkbox" class="ckbox" value=""> Entry Done By</label> </td>
    <td>
    	<div class="col-xs-12 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
    </td>
    <td> <div class="col-xs-3">
    <label class="line-height"><input type="checkbox" class="ckbox" value=""> Ref By. </label> </div> 
    	<div class="col-xs-8 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
    </td>
    
  </tr>
  <tr>
    <td>
    	<label class="line-height"><input type="checkbox" class="ckbox" value="">Pay Type</label>
    </td>
    <td>
    	<div class="col-xs-12 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
    </td>
    <td>
    	<div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> PNDT </label>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Aborted </label>
        </div>
    </td>
  </tr>
  <tr>
    <td><label class="line-height"><input type="checkbox" class="ckbox" value=""> Balance </label></td>
    <td>
    	<div class="form-group">
                                        
                                          <div class="col-xs-12">
                                          	<div class="col-xs-4 select_tb">
                                            	<input type="text" class="form-control" placeholder="">
                                            </div>
                                    <div class="col-xs-4 text-center"><label class="line-height"><input type="checkbox" class="ckbox" value="">
                                    Concession </label></div>
                                    <div class="col-xs-4 select_tb">
                                            	<input type="text" class="form-control" placeholder="">
                                            </div>
                                            
                                          </div>
                                        </div>
    </td>
    <td>
    	<div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Dispatched </label>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value="">From F Pasted </label>
        </div>
    </td>
  </tr>
  <tr>
    <td><label class="line-height"><input type="checkbox" class="ckbox" value=""> Gender </label></td>
    <td>
    <div class="form-group">
                                        
                                          <div class="col-xs-12">
                                          	<div class="col-xs-4 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Female</option>
                                                    <option>male</option>
                                                    
                                                </select>
                                            </div>
                                    <div class="col-xs-4 text-center"><label class="line-height"><input type="checkbox" class="ckbox" value="">
                                    Religion </label></div>
                                    <div class="col-xs-4 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                </select>
                                            </div>
                                            
                                          </div>
                                        </div>
    </td>
    	
    </td>
    <td>
    	<div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Report </label>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Remark </label>
        </div>
    </td>
  </tr>
  <tr>
    <td><label class="line-height"><input type="checkbox" class="ckbox" value=""> Exam Done By</label></td>
    <td>
    	<div class="col-xs-12 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                </select>
                                            </div>
    </td>
    <td>
    	<div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Is Report Done </label>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Multiple Modality </label>
        </div>
         <div class="col-md-6 col-sm-6 col-xs-6">
        	<label class="line-height"><input type="checkbox" class="ckbox" value=""> Multiple Test </label>
        </div>
    </td>
  </tr>
  
  <tr>
  		<td colspan="3">
        	<div class="table-responsive">
            	<table width="100" border="1" class="radio-tbl">
  <tr>
    <td>Date</td>
    <td>Patien Name</td>
    <td>Age</td>
    <td>Contact Details</td>
    <td>Entry Done By</td>
    <td>Ref By</td>
    <td>Test's</td>
    <td>Amount</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

            </div>
        </td>
  </tr>
  
</table>

                       
                        	
                    </div>
 
                    <div role="tabpanel" class="tab-pane fade" id="Section2">
                        <div class="bs-example">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-plus"></span> What is HTML?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="xrow"> 
                            <form class="form-horizontal">
                            	<div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">FVD</label>
                                          <div class="col-xs-10">
                                          	
                                            	<input type="text" class="form-control form_datetime" id="nameField" placeholder="Select date and time" />
                                           </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2"> Date</label>
                                          <div class="col-xs-10">
                                          	
                                            	<input type="text" class="form-control form_datetime" id="nameField" placeholder="Select date and time" />
                                         </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2"> Refer By</label>
                                          <div class="col-xs-10">
                                          	<div class="col-xs-6 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select doctor</option>
                                                    <option>External doctor</option>
                                                    <option>Internal doctor</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6"><input type="text" class="form-control" id="time" placeholder="Doctor name" /></div>
                                            
                                          </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Name</label>
                                          <div class="col-xs-10">
                                          	<div class="col-xs-3 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Mr.</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-9"><input type="text" class="form-control" id="time" placeholder="Patient name" /></div>
                                            
                                          </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Gender</label>
                                          <div class="col-xs-10">
                                          	<div class="col-xs-6 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Male</option>
                                                    <option>Female</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6"><input type="text" class="form-control" id="time" placeholder="Enter Age" /></div>
                                            
                                          </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Contact</label>
                                          <div class="col-xs-10">
                                          	<div class="col-xs-6 select_tb">
                                            	<input type="text" class="form-control" id="contact" placeholder="Contact" />
                                            </div>
                                    <div class="col-xs-3"><label class="line-height"><input type="checkbox" class="ckbox" value="">Is Aborted</label></div>
                                    <div class="col-xs-3"><input type="text" class="form-control" placeholder="Show Resone" value=""></div>
                                            
                                          </div>
                                        </div>
                                </div>
                            </form>
                            </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-plus"></span> What is Bootstrap?</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                   <div class="xrow"> 
                   
                   <div class="table-responsive">
                	<table width="100" border="0" class="radio-tbl table-bordered table-hover">
  <tr>
    <th> Patient Name </th>
    <th> Refer Name </th>
    <th> Test(s)</th>
    <th>Amt</th>
  </tr>
  <tr>
    <td> Patient Name </td>
    <td> Refer Name </td>
    <td> Test(s)</td>
    <td>Amt</td>
  </tr>
  
  <tr>
    <td> Patient Name </td>
    <td> Refer Name </td>
    <td> Test(s)</td>
    <td>Amt</td>
  </tr>
  <tr>
    <td> Patient Name </td>
    <td> Refer Name </td>
    <td> Test(s)</td>
    <td>Amt</td>
  </tr>
</table>

                </div>
                   
                            <form class="form-horizontal">
                            	<div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Entry Done</label>
                                          <div class="col-xs-10">
                                          	
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>wasim shaikh</option>
                                                    <option>akash Adke</option>
                                                </select>
                                           </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2"> Remark</label>
                                          <div class="col-xs-10">
                                          	
                                            	<input type="text" class="form-control" id="nameField" placeholder="" />
                                         </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Exam Done</label>
                                          <div class="col-xs-10">
                                          	
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>wasim shaikh</option>
                                                    <option>akash Adke</option>
                                                </select>
                                           </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Income</label>
                                          <div class="col-xs-10">
                                          <input type="text" class="form-control" id="nameField" placeholder="" />
                                          </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Payment</label>
                                          <div class="col-xs-10">
                                          	<div class="col-xs-6 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Select</option>
                                                    <option>Cash</option>
                                                    <option>Online</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6">
                                            <select class="sel_doc">
                                                	<option>Religion</option>
                                                    <option>Cash</option>
                                                    <option>Online</option>
                                                </select></div>
                                            
                                          </div>
                                        </div>
                                </div>
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2"> Date </label>
                                          <div class="col-xs-10">
                                          	
                                            	<input type="text" class="form-control form_datetime" id="nameField" placeholder="Dispatch Date" />
                                            
                                          </div>
                                        </div>
                                </div>
                                
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Email ID</label>
                                          <div class="col-xs-8">
                                            	<input type="text" class="form-control mar-bot" id="contact" placeholder="Email-ID" />
                                          </div>
                                          <div class="col-xs-2">
                                <label class="line-height"><input type="checkbox" class="ckbox" value=""></label>
                                <button type="button" value="Send" class="btn btn-info"> Send </button>
                                </div>
                                        </div>
                                </div>
                                
                                <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2"> </label>
                                          <div class="col-xs-10">
                                    <div class="col-xs-4 pad-0"><label class="line-height"><input type="checkbox" class="ckbox" value="">Is  Report Done </label></div>
                                    <div class="col-xs-8 pad-0 select_tb">
                                            	<input type="text" class="form-control" id="contact" placeholder="Search" />
                                            </div>
                                    
                                            
                                          </div>
                                        </div>
                                </div>
                            </form>
             </div>
           </div>
         </div>
       </div>
    </div>
  </div>
</div>
 
                    <div role="tabpanel" class="tab-pane fade" id="Section3">
                        <div class="row">
                            <form class="form-horizontal">
                            <table width="100" border="0">
  <tr>
    <td colspan="4">
     <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">State </label> 
                                          <div class="col-xs-10">
                                          <div class="col-xs-6 select_tb "><select class="sel_doc" id="stateId" >
                                                	
                                                  
                                                </select></div>
                                          	<div class="col-xs-6 select_tb ">
                                            	<select class="sel_doc">
                                                	<option>Husband</option>
                                                    <option>Father</option>
                                                    <option>Other</option>
                                                </select>
                                            </div>
                                            
                                            
                                          </div>
                                        </div>
                                </div>
   <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="nameField" class="col-xs-2">Name </label> 
                                          <div class="col-xs-10">
                                        <!--   <div class="col-xs-3 select_tb">
                                            	<select class="sel_doc">
                                                	<option>Mr.</option>
                                                    <option>Mrs.</option>
                                                    <option>Miss</option>
                                                    <option>Master</option>
                                                </select>
                                            </div> -->
                                          	<div class="col-xs-9 select_tb ">
                                            	<input type="text" class="form-control" id="time" placeholder="Name" />
                                            </div>
                                            
                                            
                                          </div>
                                        </div>
                                </div></td>
    
  </tr>
  <tr>
    <td colspan="2">
    <div class="row pndt">
    <div class="xform-group">
         <label for="nameField" class="col-xs-4"> Number of Children</label>
    	<div class="col-xs-6"><input type="submit" class="form-control" id="time" placeholder="" /></div>
    	<div class="col-xs-2"><input type="button" class="btn btn-info" value="Add Children Details"/></div>
    	
        </div>
        </div>
    </td>
    <td>
    <div class="row pndt">
    <div class="xform-group">
    	<div class="col-xs-6 pad-right-0">
        <input type="text" class="form-control form_datetime" id="nameField" placeholder="Last Menstrual Period" /></div>
        <div class="col-xs-6 pad-left-0"><input type="text" class="form-control" id="time" placeholder="Doctor name" /></div>
        </div>
        </div>
        </td>
    
  </tr>
  <tr>
    <td colspan="2">
    	<label for="nameField" class="col-xs-5">Genetic / medical Disease History </label> 
                                          <div class="col-xs-4">
                                          <div class="col-xs-12 select_tb ">
                                          <textarea class="form-control" id="diseaseHistory" placeholder="Genetic / medical Disease History" readonly></textarea>
                                          </div></div>
                                                
                                         <div class="col-xs-3">
                                          <div class="col-xs-12 select_tb "><select class="sel_doc" id="diseaseHistorySelect" onchange="enableTextArea()" >
                                          			
                                                	<option value="0">No</option>
                                                	<option value="1">Yes</option>	
                                                    
                                                    
                                                </select></div></div>
    </td>
    <!--<td colspan="5">&nbsp;</td>-->
   
    
  </tr>
  <tr>
    <td colspan="2">
    <div class="mar-bot0">
    <label for="nameField" class="col-xs-5">Indication of Pre-Natal Diagnosis </label>
    <div class="col-xs-7 select_tb ">
   <!--  <select class="sel_doc">
         <option>Yes</option>
         <option>No</option>
                                                    
     </select> -->
    <input type="text" class="form-control form_datetime" id="nameField" placeholder="" /></div>
     </div>
   
      <div class="clearfix"></div>
       <div class="mar-bot0">
     <label for="nameField" class="col-xs-5">(a) Previous Child / Children with </label>
    <div class="col-xs-7 select_tb ">
    <select class="sel_doc">
         <option>Applicable</option>
         <option>Not-Applicable</option>
                                                    
     </select></div>
     </div>
      <div class="clearfix"></div>
      <div class="mar-bot0">
     <label for="nameField" class="col-xs-5">(b) Mother / Father / Subling Has Genetic Disease </label>
    <div class="col-xs-7 select_tb ">
    <select class="sel_doc">
         
         <option>Known</option>
         <option>Not Known</option>
                                                    
     </select></div>
     </div>
    <div class="mar-bot0">
     <label for="nameField" class="col-xs-5">(c) Other (Specify)</label>
		<div class="col-xs-7 select_tb ">
    <select class="sel_doc">
         <option>24 Weeks and Above</option>
         <option>No</option>
                                                    
     </select></div>
</div>
     </td>
    
  </tr>
  <tr>
    <td colspan="2">
    	<div class="mar-bot0">
    <label for="nameField" class="col-xs-5">Procedures Carried Out By</label>
    <div class="col-xs-7 select_tb ">
    <select class="sel_doc">
         <option>${doctorDetails.fName} ${doctorDetails.lName}</option>
         
     </select>
     </div>
     </div>
     
     <div class="mar-bot0">
    <label for="nameField" class="col-xs-5">Non Invasive Ultrasound </label>
    <div class="col-xs-7 select_tb ">
    <select class="sel_doc">
         <option>Invasive</option>
         <option>Non Invasive</option>
     </select>
     </div>
     </div>
    </td>
    
   
  </tr>
  <tr>
    <td colspan="2">
    	
    <div class="xform-group">
         <label for="nameField" class="col-xs-5"> Laboratory Test Recommended </label>
    	<div class="col-xs-7 select_tb ">
    <select class="sel_doc">
       
         <option>Aplicable</option>
         <option>Non Aplicable</option>
       
     </select>
     </div>
        </div>
        
    </td>
    <td>
    
    <div class="xform-group">
         <label for="nameField" class="col-xs-5"> Procedure Complication </label>
    	<div class="col-xs-7"><input type="text" class="form-control" id="time" placeholder="None" /></div>
        </div>
        
    </td>
    
  </tr>
  <tr>
    <td colspan="2">
    <div class="row pndt">
    <div class="xform-group">
         <label for="nameField" class="col-xs-5"> Result of </label>
    	<div class="col-xs-7"><input type="text" class="form-control" id="time" placeholder=""></div>
        </div>
        </div>
    </td>
    <td>
    <div class="row pndt">
    <div class="xform-group">
    	<div class="col-xs-4 pad-right-0">
        <input type="text" class="form-control" id="nameField" placeholder="Ultrasonography"></div>
        <div class="col-xs-4 pad-left-0"><input type="text" class="form-control" id="time" placeholder="Diamniotic Dichrotic Twin Intrauterine Gestations Noted"></div>
        <div class="col-xs-4 pad-left-0"><button type="button" class="btn btn-info" value="Open Report">Open Report</button></div>
        </div>
        </div>
        </td>
    
  </tr>
  <tr>
    <td colspan="2">
    	
    <div class="xform-group">
         <label for="nameField" class="col-xs-5"> Procedure Date (s) </label>
    	<div class="col-xs-7"><input type="text" class="form-control form_datetime" id="nameField" placeholder="Last Menstrual Period"></div>
        </div>
       
    </td>
    <td>
    	<div class="xform-group">
         <label for="nameField" class="col-xs-5"> Consent Obtrained Date </label>
    	<div class="col-xs-7"><input type="text" class="form-control form_datetime" id="nameField" placeholder="Last Menstrual Period"></div>
        </div>

    </td>
    
  </tr>
  <tr>
    <td colspan="2">
    <div class="xform-group">
    <label for="nameField" class="col-xs-5"> Pre-natal Diagnostic Proc. Result Converyed to </label>
     <div class="col-xs-7"><input type="text" class="form-control" id="time" placeholder=""></div>
    </div>
    </td>
    <td>
    	<div class="xform-group">
        <a href="#" class="col-xs-1">Change</a>
    <label for="nameField" class="col-xs-3"> On Date </label>
     <div class="col-xs-8"><input type="text" class="form-control form_datetime" id="nameField" placeholder="On Date"></div>
    </div>
    </td>
    
  </tr>
  
  <tr>
    <td colspan="2">
    <div class="row pndt">
    <div class="xform-group">
         <label for="nameField" class="col-xs-5"> Was MTP Conducted </label>
    	<div class="col-xs-7"><input type="text" class="form-control" id="time" placeholder="Not Applicable"></div>
        </div>
        </div>
    </td>
    <td>
    <div class="row pndt">
    <div class="xform-group">
    	<div class="col-xs-6 pad-right-0">
        <input type="text" class="form-control form_datetime" id="nameField" placeholder="Sliug"></div>
        <div class="col-xs-6 pad-left-0"><input type="text" class="form-control form_datetime" id="time" placeholder="Date on Which MTP Carried Out"></div>
        </div>
        </div>
        </td>
    
  </tr>
</table>
                            </form>
                            </div>
                    </div>
                    
                    <div role="tabpanel" class="tab-pane fade in active" id="Section4">
                       <!-- <h2>Patient Details</h2>-->
                       
                        	
                    </div>
                </div>
            </div>
   
</div>     
                </div>
            </div>
        </div>
    </div>
  </div>
</section>
<!--<div class="header">

<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="images/detl_page.jpg" alt="Radiology">
    </div>
  </div>
 </div>

</div>-->
<div class="clearfix"></div>

<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
$(function() {
  $('.form_datetime').datetimepicker({
	  		format: 'DD-MM-YYYY HH:mm'
             
	    });
  		
});

    /*$(".form_datetime").datetimepicker({
        format: "dd MM yyyy - hh:ii",
        linkField: "mirror_field",
        linkFormat: "yyyy-mm-dd hh:ii"
    });*/
</script> 


<script>
		function getAllStateByCountryId(){
			
			var countryId=1;
	
			$.getJSON(
					'${getAllStateByCountryId}',
					{
						countryId : countryId,
						
						ajax : 'true'
					},function(data) {
						$.each(
								data,
								function(key, stateList) {
									

									var html = '<option value="" disabled="disabled" selected >Choose Sate...</option>';
									
									var len = data.length;
									for ( var i = 0; i < len; i++) {
										html += '<option value="' + data[i].stateId + '">'
												+ data[i].stateName + '</option>';
									} 
									html += '</option>';
									$('#stateId').html(html);
									$("#stateId").trigger("chosen:updated");
								})
						
						
						
						
					});
	
		}

</script>




 <script>
    
   function enableTextArea(){
	  
    var enableTextArea=document.getElementById("diseaseHistorySelect").value;
 
    if(enableTextArea=="1"){
 
    	 $("#diseaseHistory").attr("readonly", false);
    	
    }else{
    	 $("#diseaseHistory").attr("readonly", true);
    }
   }
    </script>	
</body>
</html>


                                          			