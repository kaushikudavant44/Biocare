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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/videoCallPat.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>

</head>         
<body>
<c:url var="getConsultingDetailsByDoctorHaveingPresc" value="/getConsultingDetailsByDoctorHaveingPresc" />
<c:url var="getPrescriptionByMeetingId" value="/getPrescriptionByMeetingId" />
<c:url var="getDoctorsByPatientId" value="/getDoctorsByPatientId" />
<c:url var="getPharmacyByPatientId" value="/getPharmacyByPatientId" />
<c:url var="getPharmacyByPincode" value="/getPharmacyByPincode" />
<c:url var="submitMedicineToPharmacy" value="/submitMedicineToPharmacy" /> 
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login" id="medicine">
 <div class="dashboard_nm text-center"><h4>Order Medicine Online</h4></div>
<div class="container-fluid"> 
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
   
    <div class="row">
        <div class="wizard">fgg
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Upload Prescription">
                            <span class="round-tab">
                                <i class="flaticon-download"></i>
                            </span>
                        </a>
                       <h4 class="small-title"> Upload Prescription</h4>
                    </li>
                     <input type="hidden" id="meetId" name="meetId">
  <input type="hidden" id=setPatientName name="setPatientName">
  <input type="hidden" id="setDoctorName" name="setDoctorName">
  <input type="hidden" id="setDoctorId" name="setDoctorId">
   <input type="hidden" id="setMeetId" name="setMeetId">
  <input type="hidden" id="setHospitalName" name="setHospitalName">
                   
                    <li role="presentation" class="disabled">
                    
                         <a href="#step2"> 
                            <span class="round-tab">
                                <i class="flaticon-placeholder"></i>
                            </span>
                   </a>
                        <h4 class="small-title">  Address </h4>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#"> 
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-home"></i>
                            </span>
                       </a>
                        <h4 class="small-title"> Select Medical </h4>
                    </li>

                    <!--<li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                    </li>-->
                </ul>
            </div>

            
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="step1">
                        <div class="step1">
                      
                        <div class="col-sm-3">
                        <label>Select Member</label>
			                	<select class="text-input" id="patientId" name="patientId" onChange="getDoctors()">
					      		    <option>select member</option>
      			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
					      		</select>
			                </div>
			                <div class="col-sm-2">
			                <label>From Date</label>
			                	<input type="text" name="startdate" id="startdate" readonly placeholder="From Date" class="datepicker">
			                </div>
			                 <div class="col-sm-2">
			                 <label>To Date</label>
			                	<input type="text" name="enddate" id="enddate" readonly placeholder="To Date" class="datepicker">
			                </div>
			                <div class="col-sm-1 text-center">
					        	<a><strong>OR</strong></a>
					        </div>
			                 <div class="col-sm-3">
			                 <label>Doctor Name</label>
			                	<select class="text-input" id="doctorId" name="doctorId" >
					      		    <option value="0">select doctor name</option>
					      		</select>
			                </div>
			                <div class="col-sm-1">
			                	<a href="#" class="btn-fr-all dspl-appt new-btn" onClick="searchDoctor()">Search</a>
			                </div>
			               
			                
                            <div class="medicine-blk">
                
                	<!--<button onclick="myFunction()">UPLOAD PRESCRIPTION  </button>-->
                </div>
                <div class="clearfix"></div>
                <hr>
                  <div class="loader2"> </div>
                <div class="table-responsive" id="myDIV">
                	<table width="100" border="1" class="medicine-tbl" id="prescriptionList">
  <tr>
  <th>Sr.No</th>
   <th>Name</th>
    <th>Date</th>
    <th>Doctor</th>
    <th>Hospital</th>
    <th>Prescription</th>
    <th>Send</th>
  </tr>
 <tbody>
 
 
 
 </tbody>
</table>

                
                </div>
                        </div>
                        <!-- <ul class="list-inline pull-right mar-top">
                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                        </ul> -->
                        <div class="clearfix"></div>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step2">
                    <h3 class="text-center">My Medical</h3>
                    <hr>
                    <div class="clearfix"></div>
                        <div class="step2">
                       <div class="table-responsive" id="myDIV">
                	<table width="100" border="1" class="medicine-tbl" id="orderdMedical">
  <tr>
    <th>Sr.No</th>
    <th>Store</th>
    <th>Address</th>
    <th>Contact</th>
    <th>Send</th>
  </tr>
  
</table>
               
                </div>
                    <br>   
                      
                       <h3 class="text-center">Search Other Medical</h3>
                       <hr>
                          <div class="clearfix"></div>
                        <div class="col-sm-3"></div>
                        
                         <div class="col-sm-6">
                         <div class="col-sm-8">
                        
                        
  <input type="text" name="pincode" id="pincode" placeholder="Enter address pincode">
  </div>
  <div class="col-sm-4">
  <input type="submit" class="btn-fr-all" name="search" value="search" onclick="showPharmacyByPincode()">
  </div>
  </div> 
  <div class="col-sm-3"></div>
 

<div class="clearfix"></div>
 <hr>
                             <div class="table-responsive" id="myDIV">
                	<table width="100" border="1" class="medicine-tbl" id="pharmacy1">
  <tr>
    <th>Sr.No</th>
    <th style="font-weight:600">Store</th>
    <th style="font-weight:600">Address</th>
    <th style="font-weight:600">Contact</th>
    <th style="font-weight:600">Send</th>
  </tr>
  
</table>

                
                </div>   
                            
                        </div>
                        <div class="clearfix"></div>
                        <hr> 
                       <ul class="list-inline pull-right">
                            <li> <a href="#step3" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all">Previous</a></li>
                            <li><button type="button" class="btn-fr-all" onclick="submitPrescToPharmacy()">place order</button></li> 
                        </ul> 
                        
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step3">
                   
                        <div class="step3">
        					<!-- <a href="#" data-toggle="tooltip" title="" data-original-title="Reset" onclick="resetFunction()" style="float: right; font-size: 20px;  color: #555555; margin-right: 1%;"><span class="flaticon-user" aria-hidden="true"></span></span></a> -->
            	<div class="clearfix"></div>
            	<div id="myRadioGroup" class="diliveryType">
    <div  class="diliveryType1 text-center">
    Home<input type="radio" name="cars" checked="checked" value="0"  />
    
    Store<input type="radio" name="cars" value="1" />
    </div>
    <div id="Cars0" class="desc">
    
    <a href="#" data-toggle="modal" data-target="#newAddress" title="" data-original-title="Add New"  style="float: right; font-size: 20px;  color: #555555; margin-right: 1%;"><span class="flaticon-user" aria-hidden="true"></span></span></a>
    <div class="clearfix"></div>
    <hr>
    <div class="gap"></div>
    <div class="diliveryType1" id="diliveryType1">
      <label><div class="col-sm-10">${patientAddressDetails.cityName},${patientAddressDetails.address},pin-code-${patientAddressDetails.pincode},contact-${patientAddressDetails.contact}</div><div class="col-sm-2 text-right"><input type="radio" value="permanent" name="addressType"/></div></label>
      
        <c:forEach items="${addressList}" var="addressList" varStatus="count">
      
      <label><div class="col-sm-10">${addressList.city},${addressList.adderss},pincode-${addressList.pincode},contact-${addressList.contact}</div><div class="col-sm-2 text-right"><input type="radio" value="${addressList.medicalRequestId}" name="addressType"/></div></label>
      </c:forEach>
      </div>
     
            <div class="clearfix"></div>
            <hr>
      <ul class="list-inline pull-right mar-top">
            <li> <a href="#step1" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all">Previous</a></li>
            <li> <a href="step2" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all" id="change">Save and Continue</a></li>
                            
     </ul>
     
    </div>
    <div id="Cars1" class="desc" style="display: none;">
  
     <div class="clearfix"></div>
			<hr>
     <ul class="list-inline pull-right mar-top">
	            <li> <a href="#step1" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all">Previous</a></li>
	            <li> <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all"  onclick="validate()">Save and Continue</a></li>
	                            
    		 </ul>
</div>
           
                       
                       
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
            
        </div>
    
   </div>

                </div>
            </div>
        </div>
    </div>
  </div>
</section>
<!-- prescription modal -->
<div id="largeModal" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 20%;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Consult & description</h4>
					</div>
					<div class="modal-body" id="displayTable">
 						  <form id="drconsult">
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-3 col-form-label" >Problem : </label>
    <label  class="col-sm-9 col-form-label" id="problem11">
    </label>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-3 col-form-label">Discussion :<span id="discussion"></span></label>
    <label  class="col-sm-9 col-form-label" id="problem12">
    </label>
  </div>
  
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-3 col-form-label">Note :<span id="note"></span></label>
    <label  class="col-sm-9 col-form-label" id="problem13">
    </label>
  </div>
  <div class="form-group row">
  	<div class="col-sm-12 text-right">
    
    </div>
  </div>
  
 
  <div class="table-responsive">
        	<table width="100%" border="0" class="tbl table table-bordered table table-hover" id="prescTable">
   <tr align="center">
    <th>Sr.No</th>
    <th>Medicine</th>
    <th>Quantity</th>
    <th>Instructions</th>
    <th>Timing</th>
  </tr>

</table> 

        </div>
</form>	

					</div>
					 <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Add</button>
                    <button type="button" class="btn btn-primary">Send</button>
                </div>
					
				</div>
			</div>
		</div>
		
		
     <div id="newAddress" class="modal fade member">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add new member</h4>
                </div>
                                
                <div class="modal-body">
                    	<div class="row"> 
                    	
                    	<div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
            	
    	
    <label for="exampleInputEmail1" class="reqd">Contact </label>
    <input type="text" class="text-input" id="contact" name="contact" placeholder="Contact" onkeypress="return IsNumeric(event);" min="13">
  </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1" class="reqd">Address</label>
    <textarea class="input-textarea" rows="1" placeholder="Address" id="address" name="address" ></textarea>

  </div>
            </div>
           <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1" >Land Mark </label>
    <input type="text" class="text-input" id="landmark" name="landmark" placeholder="landmark">
  </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1" class="reqd">City</label>
    <input type="email" class="text-input" id="city" name="city" placeholder="City" >
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1" class="reqd">Pincode</label>
    <input type="email" class="text-input" id="setPincode" name="pincode" placeholder="Pincode" onkeypress="return IsNumeric(event);" >
  </div>
            </div>
            
             
            
            
            
                
                        </div>
                   
                    
                </div>
                <div class="modal-footer">
                <input type="submit" onclick="addAddress()">
<!--             <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all" id="change" onclick="closeModal()">Save and Continue</a></li>
 -->
                          </div>
              
              </div> 
            </div>
        </div>
 
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 

		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
  <script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>


<script>

$(document).ready(function() {
    $("input[name$='cars']").click(function() {
        var test = $(this).val();

        $("div.desc").hide();
        $("#Cars" + test).show();
    });
});

        $(function(){
            var codes = $('.highlight code');
            codes.each(function (ind, el) {
                hljs.highlightBlock(el);
            });

            $('.lobipanel').lobiPanel();
            $('#demoPanel11').lobiPanel();
            $('#lobipanel-basic')
                    .on('beforeUnpin.lobiPanel', function () {
                        console.log("beforeClose");
                    })
                    .on('onClose.lobiPanel', function () {
                        console.log("onClose");
                    })
                    .on('onTitleChange.lobiPanel', function () {
                        console.log(this, arguments);

                    })
                    .lobiPanel();
            $('#lobipanel-custom-control').lobiPanel({
                reload: false,
                close: false,
                editTitle: false
            });
            $('#lobipanel-stateful').lobiPanel({
                stateful: true
            });
            $('#lobipanel-font-awesome').lobiPanel({
                reload: {
                    icon: 'fa fa-refresh'
                },
                editTitle: {
                    icon: 'fa fa-edit',
                    icon2: 'fa fa-save'
                },
                unpin: {
                    icon: 'fa fa-arrows'
                },
                minimize: {
                    icon: 'fa fa-chevron-up',
                    icon2: 'fa fa-chevron-down'
                },
                close: {
                    icon: 'fa fa-times-circle'
                },
                expand: {
                    icon: 'fa fa-expand',
                    icon2: 'fa fa-compress'
                }
            });
            $('#lobipanel-constrain-size').lobiPanel({
                minWidth: 300,
                minHeight: 300,
                maxWidth: 600,
                maxHeight: 480
            });
            $('#lobipanel-from-url').on('loaded.lobiPanel', function (ev, lobiPanel) {
                var $body = lobiPanel.$el.find('.panel-body');
                $body.html('<div class="highlight"><pre><code>' + $body.html() + '</code></pre></div>');
                hljs.highlightBlock($body.find('code')[0]);
            }).lobiPanel({
                loadUrl: 'bootstrap/dist/css/bootstrap.min.css',
                bodyHeight: 400
            });
            $('#lobipanel-multiple').find('.panel').lobiPanel({
                sortable: true,
                beforeTitleChange: function(lobiPanel, title){
                    console.log("beforeTitleChange", arguments);
                    if (!title) {
                        return false;
                    }
                }
            });
        });
    </script>
<script>
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

$('.datepicker').datepicker({
	  autoclose: true,
	  
	  format: "dd-mm-yyyy"}).datepicker('setDate', '0');
</script>
<!-- <script>
$(document).ready(function () {
    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();
    
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);
    
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);

    });
    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}


//according menu

$(document).ready(function()
{
    //Add Inactive Class To All Accordion Headers
    $('.accordion-header').toggleClass('inactive-header');
	
	//Set The Accordion Content Width
	var contentwidth = $('.accordion-header').width();
	$('.accordion-content').css({});
	
	//Open The First Accordion Section When Page Loads
	$('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
	$('.accordion-content').first().slideDown().toggleClass('open-content');
	
	// The Accordion Effect
	$('.accordion-header').click(function () {
		if($(this).is('.inactive-header')) {
			$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle().toggleClass('open-content');
		}
		
		else {
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle().toggleClass('open-content');
		}
	});
	
	return false;
});

</script> -->
<script>
function getDoctors() {
											 
		 var patientId=document.getElementById("patientId").value; 
		
		 $('#doctorId option').remove();
		
		 $
		 
														.getJSON(
																'${getDoctorsByPatientId}',
																{
																	patientId : patientId,
																	
																	ajax : 'true'
																},
																function(data) {
															
																	var len = data.length;
																	var strVar="";
																	strVar+="<option value=0>--select--</option>";
																	for (var i = 0; i < len; i++) {
																		
																		strVar += "<option value="+data[i].doctorId+">"+data[i].fName+"<\/option>";
															
																	} 
																	 $('#doctorId').append($(strVar));
																	
																	 
																})
		 
		 
	 }
	 
function searchDoctor() {
	 
	 /* $(include).empty();   */
	  $('#prescriptionList td').remove();
	 var doctorId=document.getElementById("doctorId").value; 
	
	 var startdate=document.getElementById("startdate").value;
	 var enddate=document.getElementById("enddate").value;
	 
	 var patientId=document.getElementById("patientId").value;
	 document.getElementById("doctorId").value=0; 

	 
	  if(enddate!=null && enddate!=""||doctorId!=0){
		  
		  
	 $
	 
													.getJSON(
															'${getConsultingDetailsByDoctorHaveingPresc}',
															{
																doctorId : doctorId,
																startdate : startdate,
																enddate : enddate,
																patientId : patientId,
																ajax : 'true'
															},
															function(data) {
																
																	 $.each(
																				data,
																				function(key, data) {
																					var tr = $('<tr></tr>');
																
																					
																					
																					tr.append($('<td></td>').html(1+key));
																					tr.append($('<td></td>').html(data.patientName));
																					tr.append($('<td></td>').html(data.date));
																					tr.append($('<td></td>').html(data.doctorName));																				
																					tr.append($('<td></td>').html(data.hospitalName));
																					tr.append($('<td></td>').html('<a href="#"  data-toggle="modal" data-target="#largeModal" onClick="showPrescription(\''+data.patientProblem+'\',\''+data.discussion+'\',\''+data.note+'\','+data.meetId+')"><i class="flaticon-eye" title="View"></i></a>'));
																					tr.append($('<td></td>').html('<a  href="#step3" data-toggle="tab" aria-controls="step3" role="tab"><input type="radio" value="set" name="set" onClick="prescValues(\''+data.patientName+'\',\''+data.doctorName+'\','+data.doctorId+',\''+data.hospitalName+'\','+data.meetId+')"></a>'));
																					
																					
																				 	 $('#prescriptionList').append(tr);
																				    
																			})
																});
															 
																} 

	  
	 
	  else{
		  alert("Please Select doctor or date!!");
	  }
	  
 }

function showPrescription(patientProblem,discussion,note,meetId)
{	 
	
	document.getElementById("problem11").innerHTML =patientProblem; 
	 document.getElementById("problem12").innerHTML =discussion; 
	 document.getElementById("problem13").innerHTML =note;  
	  $('#prescTable td').remove();
 
	
	 $
		.getJSON(
				'${getPrescriptionByMeetingId}',
				{
					meetId : meetId,
					
					ajax : 'true'
				},
				function(data) {
					
					$.each(
							data,
								function(key, display) {

					var tr = $('<tr></tr>');
					

					tr.append($('<td></td>').html(key+1));
					tr.append($('<td></td>').html(display.medicineName));
					tr.append($('<td></td>').html(display.medicineQuantity));
					tr.append($('<td></td>').html(display.medicineInstruction));
					tr.append($('<td></td>').html(display.medicineTiming));
					
				 	 $('#prescTable').append(tr);
							})

					

				}) 
      
	 
}

	</script>
	<script>

function showOrderdPharmacy()
{	
    var patientId = document.getElementById("patientId").value;
	
	$('#orderdMedical td').remove();
	
	 $
		.getJSON(
				'${getPharmacyByPatientId}',
				{
					patientId : patientId,
					
					ajax : 'true'
				},
				function(data) {
					
					
					$.each(
							data,
								function(key, display) {
								
					var tr = $('<tr></tr>');
					

					tr.append($('<td></td>').html(key+1));
					
					tr.append($('<td></td>').html(display.medicalName));
					tr.append($('<td></td>').html(display.address));
					tr.append($('<td></td>').html(display.contact));
					tr.append($('<td></td>').html('<input name="medical" value="'+display.medicalId+'" type="radio">'));
					
					
				 	 $('#orderdMedical').append(tr);
							})		

				})   
	  
}

function showPharmacyByPincode()
{	 
	
	 var pincode = document.getElementById("pincode").value;
	
	/* $('#pharmacy td').remove(); */
	
	 $
		.getJSON(
				'${getPharmacyByPincode}',
				{
					pincode : pincode,
					
					ajax : 'true'
				},
				function(data) {
					
					$.each(
							data,
								function(key, data) {
								
					var tr = $('<tr></tr>');
					

					tr.append($('<td></td>').html(key+1));
					
					tr.append($('<td></td>').html(data.medicalName));
					tr.append($('<td></td>').html(data.address));
					tr.append($('<td></td>').html(data.contact));
					tr.append($('<td></td>').html('<input value="'+data.medicalId+'" name="medical" type="radio">'));
					
					
				 	 $('#pharmacy1').append(tr); 
							})

					

				}) 
      
	 
}


function submitPrescToPharmacy()
{	 
	if (!$("input[name='medical']:checked").val()) {
	var setDeliveryType = document.querySelector('input[name="cars"]:checked').value;
	
	var setMedicalId = $("input:radio[name=medical]:checked").val()
	
	var setPatientId = document.getElementById("patientId").value;
	
	var setPatientName = document.getElementById("setPatientName").value;
	
	var setDoctorId = document.getElementById("setDoctorId").value;
	
	var setDoctorName = document.getElementById("setDoctorName").value;

	var setHospitalName = document.getElementById("setHospitalName").value;
	
	var setMeetId = document.getElementById("setMeetId").value;
	/* var addressType = document.querySelector('input[name="addressType"]:checked').value;
	alert("addressType"+addressType);
	alert("hi"); */
	if(setDeliveryType==1)
		{
		
		var setContact = "na";
		var setPincode = "000";
		var setLandmark = "na";
		var setAddress = "na";
		var setCity = "na";
		var addressStatus="store";
		}
	else
		{
		if (!$("input[name='addressType']:checked").val()) {
			var setContact = document.getElementById("contact").value;	
			var setPincode = document.getElementById("setPincode").value;
			var setLandmark = document.getElementById("landmark").value;
			var setAddress = document.getElementById("address").value;
			var setCity = document.getElementById("city").value;
			var addressStatus="new";
 
			}
		else
			{
			var setContact = "na";
			var setPincode = "000";
			var setLandmark = "na";
			var setAddress = "na";
			var setCity = "na";
			var addressStatus=document.querySelector('input[name="addressType"]:checked').value;
			}
	
	
		}
	
	 $
		.getJSON(
				'${submitMedicineToPharmacy}',
				{
					setPatientId : setPatientId,
					setPatientName : setPatientName,
					setDoctorId : setDoctorId,
					setDoctorName : setDoctorName,
					setHospitalName : setHospitalName,
					setDeliveryType : setDeliveryType,
					setMeetId : setMeetId,
					setContact : setContact,
					setPincode : setPincode,
					setLandmark : setLandmark,
					setAddress : setAddress,
					setCity : setCity,
					setMedicalId : setMedicalId,
					addressStatus : addressStatus,
					
					ajax : 'true'
				},
				function(data) {
					
					alert("Order Placed Successfully");	 
					location.reload();
				})
				
	}
	else
		{
		alert("please select pharmacy");
		}
	
	}

</script>
<script>

function prescValues(patientName,doctorName,doctorId,hospitalName,meetId)
{	 
    document.getElementById("setPatientName").value = patientName;
	document.getElementById("setDoctorId").value = doctorId;
	document.getElementById("setDoctorName").value = doctorName;
    document.getElementById("setMeetId").value = meetId;
    document.getElementById("setHospitalName").value = hospitalName; 
    showOrderdPharmacy();
    

}

/* function changeOnDeliveryType(nameSelect)
{
    if(nameSelect){
        admOptionValue = document.getElementById("admOption").value;
        if(admOptionValue == nameSelect.value){
            document.getElementById("admDivCheck").style.display = "block";
        }
        else{
            document.getElementById("admDivCheck").style.display = "none";
        }
    }
    else{
        document.getElementById("admDivCheck").style.display = "none";
    }
} */

/*  function validate()

{
	if (!$("input[name='addressType']:checked").val()) {
		alert("Address is mandatory");
		document.getElementById("change").href = "";
		}
	
	
	else
		{
		 ('.nav-tabs a[href="#step2"]').tab('show');
		}
	

}  */

/* function validate()
{
    	if (!$("input[name='addressType']:checked").val()) {
    		$('.nav-tabs a[href="#step3"]').trigger('click');
    	}
    	else
    		{
    		$('.nav-tabs a[href="#step2"]').trigger('click');
    		}
} */
function resetFunction() {
	
    document.getElementById("address").innerHTML="";
    document.getElementById("setPincode").value="";
    document.getElementById("city").value="";
    document.getElementById("contact").value="";
}
function closeModal()
{	
	$("#newAddress").modal("hide");
}
function addAddress()
{   $("#newAddress").modal("hide");
$('#tempararyAddress').remove();
	var setContact = document.getElementById("contact").value;	
	var setPincode = document.getElementById("setPincode").value;
	var setLandmark = document.getElementById("landmark").value;
	var setAddress = document.getElementById("address").value;
	var setCity = document.getElementById("city").value;
	
	var strVar="";
	strVar += "      <label id=\"tempararyAddress\"><div class=\"col-sm-10\">"+setCity+","+setAddress+",pincode-"+setPincode+",contact-"+setContact+"<\/div><div class=\"col-sm-2 text-right\"><input type=\"radio\" value=\"shj\" name=\"dddc\"\/><\/div><\/label>";
	
	strVar += "";
	$('#diliveryType1').append(strVar);
}
</script>
</body>
</html>