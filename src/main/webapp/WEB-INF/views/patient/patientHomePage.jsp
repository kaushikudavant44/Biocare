<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/radiology.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/videoCallPat.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/><%-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dc_popup_notifications.css"/> --%>



<script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
            //document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
       
    </script>
</head>         

  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  <c:url var="passwordValidation" value="passwordValidation" />
  <c:url var="changePatientPassword" value="changePatientPassword" />	
  <c:url var="getVideoBypatientIdAndstatus" value="/getVideoBypatientIdAndstatus" />
    <c:url var="getPatientMissCallDetails" value="/getPatientMissCallDetails" />
     <c:url var="updateSeenPatientMissCallStatus" value="/updateSeenPatientMissCallStatus" />
  
<body onload="getPatientMissCallDetails();">
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Patient Dashboard </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
             <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            
              <div class="dc_notificationbar_container">
     
    </div>
    
    
    
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab patProfile">
                <div class="bhoechie-tab-content  active">
               
				     <div class="col-sm-12">
				     <div class="col-sm-2 text-center"> 
				        	<div class="profile_doc"> <!-- id="docImage" -->
				        	<a href="#" data-toggle="modal" data-target="#profileModal" class="profilePic"><img class="img-responsive" alt="patient_profile" src="${patientDetails.profilePhoto}"></a>
				           
				            </div>
				            <%-- <img src="166.62.32.164:8080/biocare/${getDoctorProfile.fName}" class="img-responsive verifd" alt="verified"> --%>
				          
				         
				            <div class="clearfix"></div>
				            <i class="verifd-nm1">Click on photo for upload new Profile Pic</i>
				        </div>
				     	<!-- <div class="col-sm-2">
				        	<div class="profile_doc">
				            	<img src="/hospital/resources/images/doc.jpg" class="img-responsive" alt="doc_profile">
				            </div>
				        </div> -->
				     <div class="col-sm-10">	
				     <div class="doc_detail patientDet">
				     	<table border="none">
				  <tbody><tr>
				  
				  
				    <td>Patient Name</td>
				     <td style="opacity:0.4">|</td>
				    <td><span id="docName">${patientDetails.fName} ${patientDetails.mName} ${patientDetails.lName}</span></td>
				  </tr>
				  <tr>
				    <td>Address</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.address}-${patientDetails.int2}</td>
				  </tr>
				  <tr>
				    <td>ID</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.patientId}</td>
				  </tr>
				  <tr>
				    <td>Blood Group</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.bloodGroup}</td>
				  </tr>
				  <tr>
				    <td>Gender</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.gender}</td>
				  </tr>
				 <tr>
				    <td>DOB</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.birthDate}</td>
				  </tr> 
				  <tr> 
				    <td>Contact</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.contactNo}</td>
				  </tr>
				   <tr>
				    <td>Email</td>
				     <td style="opacity:0.4">|</td>
				    <td>${patientDetails.email} </td> 
				  </tr>  
				  
				</tbody></table>
				    <%--  <a class="profWallet" href="${pageContext.request.contextPath}/showWalletDetails"><img src="/biocare/resources/images/wallet.png" class="img-responsive" alt="wallet"> <span>(0${walletDetails.walletAmount} Rs./-)</span></a>
				  --%>
				 	<a class="fas fa-wallet pull-right" href="${pageContext.request.contextPath}/showReferralCode/${patientDetails.patientId}/1"><img src="/biocare/resources/images/refer1.png" class="img-responsive" alt="refer now"></a>
				     </div>
				    </div> 	
				     	</div>
				     

<div class="clearfix"></div>

	<!-- <div class="member-btn member-btn1"><a href="#" class="btn-fr-all" onclick="feedBackNotification()"><span  class="fa fa-bell-o"></span>Rate Your Doctors</a></div> -->
	

<hr>
<div class="clearfix"></div>


	<div class="col-md-6 col-sm-6 padd-0"><h3 class="heading">Member lists</h3></div>
	<div class="col-md-6 col-sm-6 padd-0">
	<div class="member-btn"><a href="#" class="btn-fr-all" onclick="countMembers(${membersLength})">Add Member</a></div>
	
	
</div>

               
                
        	<div class="col-md-12 col-sm-12">
            	<div class="member-list table-responsive"><table width="100%" border="1">
  <tr>
    <th scope="col">id</th>
    <th scope="col">photo</th>
    <th scope="col">Name</th>
    <th scope="col">blood grp</th>
    <th scope="col">DOB</th>
    <th scope="col">Relation</th>
    <th scope="col">History</th>
    <th scope="col">edit</th>
  </tr>
  

  <c:forEach items="${patientDetailList}" var="patientDetailList" varStatus="count">
 
  <c:set var="numberOfRows" value="${numberOfRows+1}"/>
  <tr>
    <%-- <td><img src="${patientDetailList.profilePhoto}" class="img-responsive"></td> --%>
  
    <td>${patientDetailList.patientId}</td> 
    <td><img  height="42" width="42" src="http://104.238.116.176:8080/images/patient/${patientDetailList.patientId}/profile/${patientDetailList.profilePhoto}"></td>
    <td>${patientDetailList.fName} ${patientDetailList.lName}</td>
    <td>${patientDetailList.bloodGroup}</td>  
    <td>${patientDetailList.birthDate}</td>
    <td>${patientDetailList.string2}</td>
    <td>
   <%--  <a href="${pageContext.request.contextPath}/showPatientHistoryPage/${patientDetailList.patientId}" data-toggle="tooltip" title="Add/View History"><i class="icon-plus-black-symbol" aria-hidden="true"></i></a>
    --%> <a href="${pageContext.request.contextPath}/showPatientHistory/${patientDetailList.patientId}" data-toggle="tooltip" title="Add/View History"><i class="icon-eye-with-a-diagonal-line-interface-symbol-for-invisibility" aria-hidden="true"></i></a>
     </td>
    <td><a href="${pageContext.request.contextPath}/showPatientEditPage/${patientDetailList.patientId}"><i class="icon-user" aria-hidden="true"></i></a></td> 
   </tr>
   
    </c:forEach>
 <%--    <c:out value="${numberOfRows}"/> --%>
    
</table>
                	
                	
                		
                        	
                        </div> 
                </div> 
                
                 
    
            </div>
           
       
       <div class="page-alerts collapse" id="alert-1" style="display:none">
    
</div>
        	 
            
        </div>
        
     </div>
 </div>
 </div>	
</section>



           

     <div id="myModal" class="modal fade member">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add new member</h4>
                </div>
                                   <form action='${pageContext.request.contextPath}/submitPatientRegProcess' id="validation-form" enctype="multipart/form-data" method="POST">
                
                <div class="modal-body">
                    	<div class="row"> 
                    	
                    	
                    	
                        <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="fullname" class="reqd">First Name</label>
    <input type="text" class="input-text" id="fName" name="fName" value="" required >
                    </div>
                </div>
                
                		<div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="middlename">Middle Name</label>
    <input type="text" class="input-text" id="mName" name="mName">
                    </div>
                </div>
                
               			 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="lastname" class="reqd">Last Name</label>
    <input type="text" class="input-text" id="lName" name="lName" required>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">Relation</label>
              	<select class="input-text" required="" id="relation" name="relation" >
              	<option>--select--</option>
							<c:forEach items="${patientRelation}" var="patientRelation"	varStatus="count">
                             
                              <option value ="${patientRelation.relationType}">${patientRelation.relationType}</option>
                            </c:forEach>
                             
                    </select>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="gender"  class="reqd">Gender</label>
            	<select class="input-text" required="" id="gender" name="gender">
                  <option value="">--select--</option>
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
                </select>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="dob" class="reqd">Date Of Birth</label>
    		 <input class="input-text datepicker" required id="birthDate" readonly=""  name="birthDate" type="text">
                </div>
                    </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">Country</label>
              	 <select class="input-text" required="" id="countryId" name="countryId" onchange="getStateBYCountry()">
                             <option>--select--</option>
                             
								<c:forEach items="${countryList}" var="countryList"
									varStatus="count">
									<option value="${countryList.countryId}"><c:out
											value="${countryList.countryName}" /></option>
								</c:forEach>
                    </select>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">State</label>
              	<select class="input-text" required="" id="stateId" name="stateId" onchange="getCityBYState()">
							 
                             <option value="">--select--</option>
                          
                             
                    </select>
                    </div>
                </div>
               			 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">City</label>
              	 <select class="input-text" required="" id="cityId" name="cityId">
							 <option value="">--select--</option> 
                    </select>
                    </div> 
                </div>
                
                <div class="col-sm-12 col-md-12">
                	<div class="form-group">
                    	<label for="state" class="reqd">Address</label>
              	 <input class="input-text  capitl_none" required="" id="address" name="address"  maxlength="50">
                    </div> 
                </div>
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="state" class="reqd">Pincode</label>
              	 <input class="input-text  capitl_none" required="" id="pincode" name="pincode"  maxlength="6" onkeypress="return IsNumeric(event);">
                    </div> 
                </div>
                <div class="col-sm-4 col-md-4">
                	<div class="form-group contat">
                    	<label for="contact" class="reqd">Contact</label>
    		<input type="text" class="input-text  capitl_none" id="contactNo" name="contactNo" onkeypress="return IsNumeric(event);" onblur="verifyNum()" min="10" maxlength="13">
                    <span id='contactMessage' style="position: absolute;color: red; line-height: 17px; font-size: 12px !important;"></span>
                    <i class="glyphicon glyphicon-ok" aria-hidden="true" id="verifiedMark" style="display:none; color:green"></i>
                    </div>
                </div>
                
                
                <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="contact" class="reqd">Email</label>
    		<input type="email"  class="input-text  capitl_none" id="email" name="email" onblur="verifyEmail()"><p style="color:red;position:absolute" id="emailValidate"></p>
                    <span id='contactEmail' class="errormsg"></span>
                    </div>
                </div>
               
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="age">Qualification</label>
    		<input type="text"  class="input-text  capitl_none" id="qualification" name="qualification">
                    </div>
                </div>
                
                
                      <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                     <label for="blood">Blood Group</label>
              	 <select class="input-text"  id="bloodGroup" name="bloodGroup">
              	 <option value="">--Select--</option>
                  <option>O Positive</option>
                  <option>O Negative</option>
                  <option>AB Positive</option>
                  <option>AB Negative</option>
                  <option>A Positive</option>
                  <option>A Negative</option>
                  <option>B Positive</option>
                  <option>B Negative</option>
                </select>
                    </div>
                    </div>
                    
                    <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="age">Profile Photo</label>
    		<input type="file"  class="input-text  capitl_none" name="profilePhoto">
                    </div>
                </div>
              
             </div>
                   
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn-fr-all">Submit</button>
                    <!-- <button type="button" onclick="resetFunction()" class="btn-fr-all">Reset</button> -->
                </div>
              </form>
              </div> 
            </div>
        </div>
    
			
</section> 

<div class="modal fade uploadPic" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
   
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
<img id="myImg" src="#" class="img-responsive" alt="your image" />
 <!-- <input type='file' /> -->
 <p class="text-center"><label class="custom-file-upload">
    <input type="file"/>
    <i class="glyphicon glyphicon-open-file"></i>Select Photo
</label></p>
      </div>
      <div class="modal-footer">
        <p class="text-center"><button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary">Done</button></p>
      </div> 
    </div>
  </div>
</div>

<!-- profile  -->
<div class="modal fade uploadPic" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
   
      <div class="modal-body text-center">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
<img id="myImg" src="#" class="img-responsive" alt="your image" />
<div class="clearfix"></div>
<i class="verifd-nm1">Dimension: 200 X 200</i>
<div class="clearfix"></div>
<i class="verifd-nm1">Size of Image: Minimum 10 KB - Maximum 300 KB</i>
<div class="clearfix"></div>
<i class="verifd-nm1">Image Format: JPEG, JPG</i>
 <!-- <input type='file' /> -->
 <form action="${pageContext.request.contextPath}/updatePatientProfilesPhoto" enctype="multipart/form-data" method="POST">
 <p class="text-center"><label class="custom-file-upload">
    <input type="file" name="profilePhoto"/>
    <i class="glyphicon glyphicon-open-file"></i>Select Photo
</label></p>
      </div>
      <div class="modal-footer">
        <p class="text-center"><button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary" accept=".jpg, .png, .jpeg" >Done</button></p>
       </form>
      </div> 
      
    </div>
  </div>
</div>
 
  <div id="missCallModal" class="modal fade bs-example-modal-md prescription_mod" tabindex="-1" role="dialog" style="margin-top: 50px">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clearFields()">&times;</button>
					<h4 class="modal-title">Miss Call</h4>
				</div>
				<div class="modal-body">
					  
						<div >
						    <div class="form-group row">
							<table class="table table-striped table-bordered table-hover fixed_headers" width="100%" id="missCall">
									<thead>
										<tr class="first-tbl-bor">
											<th>Sr. No.</th>
											<th>Date & Time</th>
											<th>From</th>
										 
										</tr>
									</thead>
									<tbody>
									</tbody>
									</table>
									
							 </div>
</div>
					 
				</div>
				 <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="seenMissCall()">Seen</button>
        </div>
			</div>
		</div>
		
	</div>


<%-- <jsp:include page="../include/videoCall.jsp"/> --%>
  
<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp"/> 
<%-- <jsp:include page="../include/videocall.jsp"/> --%>
<jsp:include page="../include/Audiocall.jsp"/>

		
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.combostars.js">
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
<%-- 
<script src="${pageContext.request.contextPath}/resources/js/dc_popup_notifications.js"></script> --%>
<script>
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
$('.datepicker').datepicker({ format: "dd-mm-yyyy"})/*.datepicker("setDate", "0") */</script>

<script>
			$(function () {
				$('#combostar').on('change', function () {
					$('#starcount').text($(this).val());
				});
				$('#combostar').combostars();
			});
			
			$(function () {
				$('#labcombostar').on('change', function () {
					$('#starcount').text($(this).val());
				});
				$('#labcombostar').combostars();
			});
			
			
</script>




<script>
function getStateBYCountry() {
	 
	 var countryId=document.getElementById("countryId").value; 
	 $('#stateId option').remove();
	  
	 $
													.getJSON(
															'${getStateByCountryId}',
															{
																countryId : countryId,
																
																ajax : 'true'
															},
															function(data) {
																
																
																var len = data.length;
																var strVar="";
																strVar +="<option value=''>--select--<\/option>";
																for (var i = 0; i < len; i++) {
																	
																	strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
															 
																} 
																 $('#stateId').append($(strVar))

															})
	 
	 
}



function getCityBYState(){
									 
	 var stateId=document.getElementById("stateId").value; 
	
	 $('#cityId option').remove();
	 $
													.getJSON(
															'${getCityByStateId}',
															{
																stateId : stateId,
																
																ajax : 'true'
															},
															function(data) {
																
																
																var len = data.length;
																var strVar="";
																strVar +="<option value=''>--select--<\/option>";
																for (var i = 0; i < len; i++) {
															
																	strVar += "<option value="+data[i].cityId+">"+data[i].cityName+"<\/option>";
															 
																} 
																 $('#cityId').append($(strVar))

															})
	 
	 
}
</script>

  
 <script type="text/javascript">
$(document).ready(function(){
    $(".notification-prof a").click(function(){
        $(".page-alerts").hide();
    });
    $(".notification-prof a").click(function(){
        $(".page-alerts").show();
    });
});


 function countMembers(length)
 {
	 if(length>=4)
		 {
		 alert("You Cannot Add More Than 4 Members");
		 }
	 else
		 {
		  $('#myModal').modal('show');
		 }
 }
</script>
<script type="text/javascript">
function getPatientMissCallDetails() {
	 
	 
	
	 $
		.getJSON(
				'${getPatientMissCallDetails}',
				{
					 
					ajax : 'true'
				},
				function(data) {
					if(data!=null || data!='')
						{
						
						
						  $.each(
									data,
									function(key, list) {
										  $('#missCallModal').modal('show');
										var tr = $('<tr></tr>');
										
										 
										tr.append($('<td></td>').html(key+1));
										tr.append($('<td></td>').html(list.datetime));
										tr.append($('<td></td>').html(list.fromName));
										$('#missCall tbody').append(tr);
									})
						  
						}
				})
}

function seenMissCall() {
	
	
	 $
		.getJSON(
				'${updateSeenPatientMissCallStatus}',
				{
					 
					ajax : 'true'
				});
}

 /* 
$( window ).on( "load", function() {
	
	
	var color11 = '#333';
    var background_color = '#fffeec';
    var position ='top';
    var removebutton =true;
    var message='20% off everything sale!   <font size="1">(Auto close in 33 secs)</font>';
    var time = 10000;
  
    showNotificationBlock(color11,time,message,background_color,position,removebutton);
}); */
</script>
  
</body>
</html>