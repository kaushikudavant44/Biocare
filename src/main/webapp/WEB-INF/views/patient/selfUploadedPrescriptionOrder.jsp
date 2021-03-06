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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/radiology.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>

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
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
	
	<style>
 textarea {
  width: 460px;
  height: 180px;
}

textarea {
  padding: 10px;
  font: 20px/28px 'Open Sans', sans-serif;
  letter-spacing: 1px;
}

textarea {
  display: block;
  position: absolute;
  z-index: 2;
  margin: 46px;
  border: 2px solid #74637f;
  border-radius: 0;
  color: #444;
  background-color: transparent;
  overflow: auto;
  resize: none;
  transition: transform 1s;
}
textarea:focus, button:focus {
  outline: none;
  box-shadow: 0 0 0 2px #c6aada;
}


.file-upload {
  background-color: #ffffff;
  width: 600px;
  margin: 0 auto;
  padding: 20px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #15824B;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #1f8eb2;
  position: relative; transition:all linear 500ms
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #1FB264;
  border: 4px dashed #ffffff; 
}
.image-upload-wrap:hover .drag-text h3 {color: #fff}
.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #1f8eb2;
  padding: 60px 0;
}

.file-upload-image {
 max-height: 307px;
    max-width: 400px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 234px;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;

  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}
</style>
	
</head>         

  <c:url var="getLast10ConsultingDeatils" value="/getLast10ConsultingDeatils" />
<c:url var="getDoctorsByPatientId" value="/getDoctorsByPatientId" />
<c:url var="getConsultingDetailsByDoctorHaveingPresc" value="/getConsultingDetailsByDoctorHaveingPresc" />
<c:url var="getPrescriptionByMeetingId" value="/getPrescriptionByMeetingId" />
<c:url var="addProductToCart" value="/addProductToCart" />
<c:url var="getPharmacyByPincode" value="/getPharmacyByPincode" />
<c:url var="saveAndGetPatientAddress" value="/saveAndGetPatientAddress" />
<c:url var="deletePatientAddress" value="/deletePatientAddress" /> 
<body>
<jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Order Medicine </h4></div>
<div class="container-fluid">
	
	
	<div class="row">
	
    <!--     <div class="bhoechie-tab-container"> -->
    	 <div class="bhoechie-tab-container">
             <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
             <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active card">
                
           <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active" id="one">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                            <span class="round-tab">
                                <i class="icon-prescription-1"></i>
                            </span>
                        </a>
                        <h4 class="small-title"> Upload Prescription</h4>
                    </li>

                    <li role="presentation" id="second" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="icon-facebook-placeholder-for-locate-places-on-maps"></i>
                            </span>
                        </a>
                        <h4 class="small-title">  Address </h4>
                    </li>
                    <li role="presentation" id="three" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="icon-cross"></i>
                            </span>
                        </a>
                        <h4 class="small-title"> Select Medical </h4>
                    </li>

                   
                </ul>
            </div>
            
   <form role="form" action="${pageContext.request.contextPath}/orderUploadedPrescription" method="POST" id="orderPlaced" enctype="multipart/form-data"> 
  
    <input type="hidden" name="address" id="orderAddress">
    <input type="hidden" name="selectedMedical" id="orderMedicalId">
  
  <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="step1">
                        <div class="step1">
  <div class="file-upload">
 	
  
  <div class="image-upload-wrap">
    <input class="file-upload-input" type='file' name="file" onchange="readURL(this);" accept="image/*" multiple/>
    <div class="drag-text">
      <h3>Drag and drop a file or select add Image</h3>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" src="#" alt="your image" />
    <div class="image-title-wrap">
    <!--   <button type="button" onclick="removeUpload()" class="btn btn-primary remove-image">Remove <span class="image-title">Uploaded Image</span></button> -->
        <!-- <button type="submit" class="btn btn-primary remove-image" style="background:#36cd35; border-bottom:#36cd35" >Submit <span class="image-title">Uploaded Image</span></button></p> -->
  	<a  class="btn-fr-all btn_red" onclick="removeUpload()">Remove</a>
  		<a class="btn-fr-all" href="#step2" data-toggle="tab" aria-controls="step2" role="tab" onclick="buyNow()">Buy Now</a>
    </div>
  </div>

</div>
</div></div>
        	 
            
       <!--  </div> -->
       <div class="tab-pane" role="tabpanel" id="step2">
                        <div id="myRadioGroup" class="diliveryType">
    <div  class="diliveryType1 text-center">
    Home<input type="radio" name="cars" checked="checked" value="0" />
    
    Store<input type="radio" name="cars" value="1" />
    </div>
     <div id="Cars0" class="desc">
    <div class="add-new-add">
    <a class="btn-fr-all" href="#" onclick="addNewAddressModal()">New Address </a></div>
    <div class="clearfix"></div>
    <!-- <a href="#" data-toggle="modal" data-target="#newAddress" title="" data-original-title="Add New"><span class="flaticon-user" aria-hidden="true"></span></span></a> -->
    	
    	<div class="row">
    		<div class="col-md-12 col-sm-12">
    		<div class="medical-address">
    			<div class="row">
    				<div class="col-md-10 col-sm-10">
    				<b>Default Address</b>
    				</br>
    				<h5>${name}</h5>
    				<p>${patientAddressDetails.address},${patientAddressDetails.pincode}</p>
    				<p>${patientAddressDetails.contact}</p>
    				
    			
    				</div>
    				<div class="col-md-2 col-sm-2">
    				<div class="pull-right medi-icon">
    					<span><input type="radio" class="mar-bot15 next-step" href="#step3" data-toggle="tab" aria-controls="step3" role="tab"  onclick="setAddress(0)"></span>
    				
    					
    					<div class="clearfix"></div>
    					</div>
    				</div>
    			</div>
    			</div>
    			
    		</div>
    	</div>
    	
    	<div id="addressList">
    	<c:forEach items="${allPatientAddressList}" var="allPatientAddressList"	varStatus="count">
    	<div class="row">
    		<div class="col-md-12 col-sm-12">
    		<div class="medical-address">
    			<div class="row">
    				<div class="col-md-10 col-sm-10 col-xs-8">
    				
    				<h5>${allPatientAddressList.fullName}</h5>
    				<p>${allPatientAddressList.house},${allPatientAddressList.locality},${allPatientAddressList.street},${allPatientAddressList.city} ${allPatientAddressList.state}</p>
    				<p>${allPatientAddressList.contactNo}</p>
    				
    			
    				</div>
    				<div class="col-md-2 col-sm-2 col-xs-4">
    				<div class="pull-right medi-icon">
    					<span><input type="radio" class="mar-bot15 next-step" href="#step3" data-toggle="tab" aria-controls="step3" role="tab" value="${allPatientAddressList.patientAddressListId}"  onclick="setAddress(${allPatientAddressList.patientAddressListId})"></span>
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Edit" onclick="editAddress('${allPatientAddressList.fullName}','${allPatientAddressList.house}','${allPatientAddressList.locality}','${allPatientAddressList.street}','${allPatientAddressList.city}',${allPatientAddressList.pincode},'${allPatientAddressList.state}','${allPatientAddressList.country}',${allPatientAddressList.patientAddressListId},'${allPatientAddressList.contactNo}')">
    					<span class="icon-user" aria-hidden="true" ></span></a>
    					
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Remove" onclick="deleteAddress(${allPatientAddressList.patientAddressListId})">
    					<span class="icon-rubbish-bin"></span></a>
    					
    					<div class="clearfix"></div>
    					</div>
    				</div>
    			</div>
    			</div>
    			
    		</div>
    	</div>
    	</c:forEach>
    	</div>
    </div>
     <div id="Cars1" class="desc" style="display: none;">
     <h3>please pick your order from store"s location</h3>
        <div class="text-center"><img src="${pageContext.request.contextPath}/resources/images/pharm.png" class="img-responsive img-center"></div>
         <ul class="list-inline pull-right">
                            
                            <li><button type="button" class="btn-fr-all next-step" href="#step3" data-toggle="tab" aria-controls="step3" role="tab">Save and continue</button></li>
                        </ul> 
    </div>
           
                       
                       
                    </div>
                        <!-- <ul class="list-inline pull-right">
                            
                            <li><button type="button" class="btn-fr-all next-step">Save and continue</button></li>
                        </ul> -->
                    </div>
                    
                    
     <div class="tab-pane" role="tabpanel" id="step3">
                       <div class="table-responsive">
                	<table width="100" border="1" class="medicine-tbl">
  <tr>
  	<th>Sr</th>
   
   <th>Store</th>
    <th>Address</th>
  <th>Phone Number</th>
     <th>Send</th>
  </tr>
  <c:forEach items="${medicalDetailsList}" var="medicalDetailsList" varStatus="myIndex">
  <tr>
    <td>${myIndex.index+1}</td>
    <td>${medicalDetailsList.medicalName} </td>
    <td>${medicalDetailsList.address},${medicalDetailsList.int3}</td>
    <td>${medicalDetailsList.contact}</td>
    <td><input type="button" onclick="placeOrder(${medicalDetailsList.medicalId})"  value="Place Order" class="btn-fr-all"></td>
  </tr>
  </c:forEach>
</table>

                
                </div>
                       <br>
                        <div class="row">
                        	<div class="col-md-12 col-ms-12">
                        		<div class="filter_div mar-bot20">
                    
                    	<h3>Enter Pincode</h3>
                    	<div class="col-sm-8">
                        
                        
  <input type="text" name="pincode" id="pincode" placeholder="Enter address pincode" onkeypress="return IsNumeric(event);">
  </div>
  <div class="col-sm-4">
  <input type="button" class="btn-fr-all" name="search" value="search" onclick="showPharmacyByPincode()">
  </div>
					      		
                    </div>
                        	</div>
                        	
                        </div>
                        <div class="table-responsive" id="pharmacyByPincodeDiv">
                

                
                </div>
                        <!-- <ul class="list-inline pull-right mar-top20">
                            
                            <li><input type="submit" class="btn-fr-all btn-info-full next-step" value="place order"></li>
                        </ul> -->
                    </div>   
                      <div class="clearfix"></div>            
        </div>
        
           </form>
     </div>
 </div>
 </div>
 </div>
 </div>
 </div>
 
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
    <label  class="col-sm-3 col-form-label" id="problem11">
    </label>
    <div class="col-sm-6">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-3 col-form-label">Discussion :<span id="discussion"></span></label>
    <label  class="col-sm-3 col-form-label" id="problem12">
    </label>
    <div class="col-sm-6">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-3 col-form-label">Note :<span id="note"></span></label>
    <label  class="col-sm-3 col-form-label" id="problem13">
    </label>
    <div class="col-sm-6">
    </div>
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
					 
				</div>
			</div>
		</div>
		
			<div id="newAddress" class="modal fade member">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">New Address</h4>
                </div>
                                
                <div class="modal-body">
                    	<div class="row"> 
                    	
                    	<div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
            	<input type="hidden" value="0" id="editaddressId">       
    <label for="fullname" class="reqd">Full Name </label>
    <input type="text" class="text-input" id="fullName"  placeholder="Full Name" >
  </div>
            </div>
           
                    	
                    	<div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
            	
    	
    <label for="exampleInputEmail1" class="reqd">Contact </label>
    <input type="text" class="text-input" id="contact" name="contact" placeholder="Contact" onkeypress="return IsNumeric(event);" min="13">
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
            	
    <label for="flatadd" class="reqd">Flat/House/Office No</label>
    <input type="text" class="text-input" id="house" name="" placeholder="Flat/House/Office No" >
  </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
            	
    <label for="locality" class="reqd">Locality</label>
    <input type="text" class="text-input" id="locality" name="" placeholder="Locality" >
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
            	
    <label for="society" class="reqd">Street/Society</label>
    <input type="text" class="text-input" id="street" name="" placeholder="Street/Society" >
  </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="city" class="reqd">City</label>
     <input type="text" class="text-input" id="addressCity" name="" placeholder="city" >
            </div>
           </div>
           <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="city" class="reqd">State</label>
    <input type="text" class="text-input" id="addressState" name="" placeholder="state" >
  </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="country" class="reqd">Country</label>
    <input type="text" class="text-input" id="addressCountry" name="" placeholder="country" >
  </div>
            </div>
            
           <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1" class="reqd">Pincode</label>
    <input type="text" class="text-input" id="addressPincode" name="pincode" placeholder="Pincode" onkeypress="return IsNumeric(event);" >
  </div>
            </div>
                           
  </div>
                   
                    
                </div>
                <div class="modal-footer">
                <input type="submit" class="btn-fr-all" onclick="addAddress()">

                          </div>
              
              </div> 
            </div>
        </div>
 
</section>


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
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
  <script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>
  
  <script>
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
	 $('.datepicker').datepicker({ format: "dd-mm-yyyy", autoclose:"true"})
  </script>
  
  <script>
  $(document).ready(function() {
	    $("input[name$='cars']").click(function() {
	        var test = $(this).val();

	        $("div.desc").hide();
	        $("#Cars" + test).show();
	    });
	});
  
  </script>

  <script>
  
  function addNewAddressModal()
  {
	  $('#newAddress').find('input:text').val('');
	  $('#newAddress').modal('show');
  }
  </script>
	<script type="text/javascript">
		
		function readURL(input) {
			  if (input.files && input.files[0]) {

			    var reader = new FileReader();

			    reader.onload = function(e) {
			      $('.image-upload-wrap').hide();

			      $('.file-upload-image').attr('src', e.target.result);
			      $('.file-upload-content').show();

			      $('.image-title').html(input.files[0].name);
			    };

			    reader.readAsDataURL(input.files[0]);

			  } else {
			    removeUpload();
			  }
			}

			function removeUpload() {
			  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
			  $('.file-upload-content').hide();
			  $('.image-upload-wrap').show();
			}
			$('.image-upload-wrap').bind('dragover', function () {
			        $('.image-upload-wrap').addClass('image-dropping');
			    });
			    $('.image-upload-wrap').bind('dragleave', function () {
			        $('.image-upload-wrap').removeClass('image-dropping');
			});
			    
			    
			    function buyNow()
			    {
			    	 $('#second').addClass("active");
			    	 $('#one').removeClass("active");  
			    	 $('#one').addClass("disabled");
			    	 
			    	// document.getElementById("orderMeetId").value =meetId ; 
			    	 //document.getElementById("orderDoctorId").value =doctorId ; 
			    }
			    
			    
			    function showPharmacyByPincode()
			    {	 
			  	  $('#pharmacyByPincodeDiv').html("");
			    	 var pincode = document.getElementById("pincode").value;
			    	 var deliveryStatus = $("input:radio[name=cars]:checked").val();
			    	 
			    	 $
			    		.getJSON(
			    				'${getPharmacyByPincode}',
			    				{
			    					pincode : pincode,
			    					deliveryStatus : deliveryStatus,
			    					
			    					ajax : 'true'
			    				},
			    				function(data) {
			    					
			    					
			    					if(data!="")
			    						{
			    						
			    						var strVar="";
			    						strVar += "<table width=\"100\" border=\"1\" class=\"medicine-tbl\" id=\"pharmacyByPincode\">";
			    						strVar += "  <tr>";
			    						strVar += "  	<th>Sr<\/th>";
			    						strVar += "   ";
			    						strVar += "   <th>Store<\/th>";
			    						strVar += "    <th>Address<\/th>";
			    						strVar += "  <th>Phone Number<\/th>";
			    						strVar += "     <th>Send<\/th>";
			    						strVar += "  <\/tr>";
			    						strVar += " ";
			    						strVar += "<\/table>";

			    						$('#pharmacyByPincodeDiv').append(strVar); 
			    						
			    					
			    					$.each(
			    							data,
			    								function(key, data) {
			    								
			    					var tr = $('<tr></tr>');
			    					

			    					tr.append($('<td></td>').html(key+1));
			    					
			    					tr.append($('<td></td>').html(data.medicalName));
			    					tr.append($('<td></td>').html(data.address));
			    					tr.append($('<td></td>').html(data.contact));
			    				    tr.append($('<td></td>').html('<input class="btn-fr-all" type="button" onclick="placeOrder('+data.medicalId+')" value="Place Order">')); 
			    					
			    					
			    				 	 $('#pharmacyByPincode').append(tr); 
			    							})
			    						}
			    					else
			    						{
			    						var strVar="";
			  						strVar += "<div class=\"notFound\">";
			  						strVar += " ";
			  						strVar += " 	<img src=\"${pageContext.request.contextPath}\/resources\/images\/notfound.png\" class=\"img-responsive\" alt=\"Not Found\">";
			  						strVar += " 	";
			  						strVar += " 	<p>Result Not Found<\/p>";
			  						strVar += " ";
			  						strVar += " <\/div>";
			  						strVar += "     ";

			  						 $('#pharmacyByPincodeDiv').append(strVar);
			    						
			    						}
			    					

			    				}) 
			          
			    	 
			    }
			    
			    
			    function addAddress()
			    {	 
			    	var fullName= document.getElementById("fullName").value;
			        var contact= document.getElementById("contact").value;
			    	var pincode= document.getElementById("addressPincode").value;
			    	var locality= document.getElementById("locality").value;
			    	var house= document.getElementById("house").value;
			    	var street= document.getElementById("street").value;
			    	var state= document.getElementById("addressState").value;
			    	var city= document.getElementById("addressCity").value;
			    	var country=document.getElementById("addressCountry").value;
			    	var id=document.getElementById("editaddressId").value;
			    	
			    	
			    	if(fullName==""||contact==""||pincode==""||locality==""||house==""||street==""||state==""||city==""||country=="")
			    		{	
			    		alert("Please Fill The Mandatory Fields");
			    		}
			    	else
			    		{
			    		$("#newAddress .close").click()
			    		$('#addressList').html("");
			    	 $
			    		.getJSON(
			    				'${saveAndGetPatientAddress}',
			    				{
			    					fullName : fullName,
			    					contact : contact,
			    					locality : locality,
			    					pincode : pincode,
			    					house : house,
			    					street : street,
			    					state : state,
			    					city : city,
			    					country : country,
			    					id : id,
			    					ajax : 'true'
			    				},
			    				function(data) {
			    					
			    					if(data==null)
			    						{
			    						alert("failed to add");
			    						}
			    					else
			    						{
			    						
			    						$.each(
			    	  							data,
			    	  								function(key, data) {
			    					
			    						var strVar="";
			    						strVar += "<div class=\"row\">";
			    						strVar += "    		<div class=\"col-md-12 col-sm-12\">";
			    						strVar += "    		<div class=\"medical-address\">";
			    						strVar += "    			<div class=\"row\">";
			    						strVar += "    				<div class=\"col-md-10 col-sm-10 col-xs-8\">";
			    						
			    					    strVar += "    				<h5>"+data.fullName+"<\/h5>";  
			    					    strVar += "    				<p>"+data.house+"," +data.locality+","+data.street+","+data.city+" "+data.pincode+","+data.state+"<\/p>"; 
			    					    strVar += "    				<p>"+data.contactNo+"<\/p>";  
			    						
			    						strVar += "    				<\/div>";
			    						strVar += "    				<div class=\"col-md-2 col-sm-2 col-xs-4\">";
			    						strVar += "    				<div class=\"pull-right medi-icon\">";
			    						strVar += "    				<span>	<input type=\"radio\" href=\"#step3\" data-toggle=\"tab\" aria-controls=\"step3\" role=\"tab\" class=\"mar-bot15 next-step\" name=\"address\" value='"+data.patientAddressListId+"'><\/span>";                                                                                                                       
			    						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Edit\" onclick=\"editAddress('"+data.fullName+"','"+data.house+"','"+data.locality+"','"+data.street+"','"+data.city+"','"+data.pincode+"','"+data.state+"','"+data.country+"','"+data.patientAddressListId+"','"+data.contactNo+"')\"><span class=\"icon-user\" aria-hidden=\"true\"><\/span><\/a>";
			    					
			    						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Remove\" onclick=\"deleteAddress('"+data.patientAddressListId+"')\"><span class=\"icon-rubbish-bin\"><\/span><\/a>";
			    					
			    						strVar += "    					<div class=\"clearfix\"><\/div>";
			    						strVar += "    					<\/div>";
			    						strVar += "    				<\/div>";
			    						strVar += "    			<\/div>";
			    						strVar += "    			<\/div>";
			    					
			    						strVar += "    		<\/div>";
			    						strVar += "    	<\/div>";
			    						
			    						$('#addressList').append(strVar); 
			    						
			    						})
			    					
			    						}

			    				}) 
			    		}
			          
			    }
			      
			     function editAddress(name,house,locality,street,city,pincode,state,country,id,contact)
			      {
			    	 
			    	 document.getElementById("fullName").value=name;
			    	 document.getElementById("contact").value=contact;
			    	 document.getElementById("addressPincode").value=pincode;
			    	 document.getElementById("locality").value=locality;
			    	 document.getElementById("house").value=house;
			    	 document.getElementById("street").value=street;
			    	 document.getElementById("addressState").value=state;
			    	 document.getElementById("addressCity").value=city;
			    	 document.getElementById("addressCountry").value=country;
			    	 document.getElementById("editaddressId").value=id;
			    	
			    	 $('#newAddress').modal('show');
			    	 
			    	  
			      }
			      
			      function deleteAddress(addressId)
			      {
			    	  if(confirm("Delete Address?"))
			    		  {
			    	  
			    	  $
			    			.getJSON(
			    					'${deletePatientAddress}',
			    					{
			    						addressId : addressId,
			    						ajax : 'true'
			    					},
			    					function(data) {
			    						
			    						if(data==null)
			    						{
			    						alert("failed to delete");
			    						}
			    					else
			    						{
			    						$('#addressList').html("");
			    						$.each(
			    	  							data,
			    	  								function(key, data) {
			    					
			    						var strVar="";
			    						strVar += "<div class=\"row\">";
			    						strVar += "    		<div class=\"col-md-12 col-sm-12\">";
			    						strVar += "    		<div class=\"medical-address\">";
			    						strVar += "    			<div class=\"row\">";
			    						strVar += "    				<div class=\"col-md-10 col-sm-10 col-xs-8\">";
			    						strVar += "    				";
			    					    strVar += "    				<h5>"+data.fullName+"<\/h5>";  
			    					    strVar += "    				<p>"+data.house+"," +data.locality+","+data.street+","+data.city+" "+data.pincode+","+data.state+"<\/p>"; 
			    					    strVar += "    				<p>"+data.contactNo+"<\/p>";  
			    						
			    						strVar += "    				<\/div>";
			    						strVar += "    				<div class=\"col-md-2 col-sm-2 col-xs-4\">";
			    						strVar += "    				<div class=\"pull-right medi-icon\">";
			    						strVar += "    			<span>		<input type=\"radio\" href=\"#step2\" data-toggle=\"tab\" aria-controls=\"step2\" role=\"tab\" class=\"mar-bot15\" name=\"address\" value='"+data.patientAddressListId+"'><\/span";
			    						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Edit\" onclick=\"editAddress('"+data.fullName+"','"+data.house+"','"+data.locality+"','"+data.street+"','"+data.city+"','"+data.pincode+"','"+data.state+"','"+data.country+"','"+data.patientAddressListId+"','"+data.contactNo+"')\"><span class=\"icon-user\" aria-hidden=\"true\"><\/span><\/a>";
			    					
			    						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Remove\" onclick=\"deleteAddress('"+data.patientAddressListId+"')\"><span class=\"icon-rubbish-bin\"><\/span><\/a>";
			    					
			    						strVar += "    					<div class=\"clearfix\"><\/div>";
			    						strVar += "    					<\/div>";
			    						strVar += "    				<\/div>";
			    						strVar += "    			<\/div>";
			    						strVar += "    			<\/div>";
			    					
			    						strVar += "    		<\/div>";
			    						strVar += "    	<\/div>";
			    						
			    						$('#addressList').append(strVar); 
			    						
			    						})
			    					
			    						}

			    				}) 
			    						
			    		  }
			    	  
			      } 
			      
			      function setAddress(addressId)
			      {
			    	  document.getElementById("orderAddress").value=addressId;
			      }
			      
			      function addNewAddressModal()
			      {
			    	  $('#newAddress').find('input:text').val('');
			    	  $('#newAddress').modal('show');
			      }
			      
			      function placeOrder(medicalId)
			      
			      {
			    	  document.getElementById("orderMedicalId").value=medicalId;
			    	  
			    	  $('#orderPlaced').submit(); 
			      }
		</script>
		
</body>
</html>