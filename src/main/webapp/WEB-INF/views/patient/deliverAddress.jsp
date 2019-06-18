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



<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<title>Welcome to Health care</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/ie-emulation-modes-warning.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hover.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/set2.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/radiology.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lobipanel.css" />
</head>
<body>

	<c:url var="saveAndGetPatientAddress" value="/saveAndGetPatientAddress" />
	<c:url var="deletePatientAddress" value="/deletePatientAddress" />
	<jsp:include page="../include/patientHeader.jsp" />

	<section class="doc_login" id="medicine">
	<div class="dashboard_nm text-center">
		<h4>Delivery Address</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/patientLeftMenu.jsp" />

				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content active card">
						<form
							action="${pageContext.request.contextPath}/showSelectMedical"
							method="GET" id="addressSubmit">
							<%-- <div id="myRadioGroup" class="diliveryType">
    <div  class="diliveryType1 text-center">
    Home<input type="radio" name="deliveryType" checked="checked" value="0" />
    
    Store<input type="radio" name="deliveryType" value="1" />
    </div>
     <div id="Cars0" class="desc">
    <div class="add-new-add"><a class="btn-fr-all" href="#" data-toggle="modal" data-target="#newAddress" title="" data-original-title="Add New">New Address </a></div>
    <!-- <a href="#" data-toggle="modal" data-target="#newAddress" title="" data-original-title="Add New"><span class="flaticon-user" aria-hidden="true"></span></span></a> -->
    	
    	<div class="row">
    		<div class="col-md-12 col-sm-12">
    		<div class="medical-address">
    			<div class="row">
    				<div class="col-md-11 col-sm-11">
    				
    				<h5>${name}</h5>
    				<p>${patientAddressDetails.address},${patientAddressDetails.pincode}</p>
    				<p>${patientAddressDetails.contact}</p>
    				
    			
    				</div>
    				<div class="col-md-1 col-sm-1">
    				<div class="pull-right medi-icon">
    					<input type="radio" value="0" name="address" onclick="proceedAddress()">
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><i class="flaticon-user" aria-hidden="true"></i></a>
    					<br>
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Remove" ><span class="flaticon-rubbish-bin"></span></a>
    					
    					<div class="clearfix"></div>
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
    				<div class="col-md-11 col-sm-11">
    				
    				<h5>${allPatientAddressList.fullName}</h5>
    				<p>${allPatientAddressList.house},${allPatientAddressList.locality},${allPatientAddressList.street},${allPatientAddressList.city} ${allPatientAddressList.state}</p>
    				<p>${allPatientAddressList.contactNo}1234567890</p>
    				
    			
    				</div>
    				<div class="col-md-1 col-sm-1">
    				<div class="pull-right medi-icon">
    					<input type="radio"  value="${allPatientAddressList.patientAddressListId}"  name="address" onclick="proceedAddress()">
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Edit" onclick="editAddress('${allPatientAddressList.fullName}','${allPatientAddressList.house}','${allPatientAddressList.locality}','${allPatientAddressList.street}','${allPatientAddressList.city}',${allPatientAddressList.pincode},'${allPatientAddressList.state}','${allPatientAddressList.country}',${allPatientAddressList.patientAddressListId},'${allPatientAddressList.contactNo}')"><i class="flaticon-user" aria-hidden="true" ></i></a>
    					<br>
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Remove" onclick="deleteAddress(${allPatientAddressList.patientAddressListId})"><span class="flaticon-rubbish-bin"></span></a>
    					
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
    </div>
    <div id="Cars1" class="desc" style="display: none;">
  
     <div class="clearfix"></div>
			<hr>
     <ul class="list-inline pull-right mar-top">
	            <li> <a href="#step1" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all">Previous</a></li>
	            <li> <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Address" class="btn-fr-all"  onclick="validate()">Save and Continue</a></li>
	                            
    		 </ul>
</div>
    </div> --%>
							<div id="myRadioGroup" class="diliveryType">
								<div class="diliveryType1 text-center">
									Home<input type="radio" name="deliveryType" checked="checked"
										value="0" /> Store<input type="radio" name="deliveryType"
										value="1" />
								</div>
								<div id="Cars0" class="desc">

									<div class="add-new-add">
										<a class="btn-fr-all" href="#" onclick="addNewAddressModal()"
											data-original-title="Add New">New Address </a>
									</div>
									<!-- <a href="#" data-toggle="modal" data-target="#newAddress" title="" data-original-title="Add New"><span class="flaticon-user" aria-hidden="true"></span></span></a> -->
									<div class="clearfix"></div>
									<div class="row">
										<div class="col-md-12 col-sm-12">
											<div class="medical-address">
												<div class="row">
													<div class="col-md-10 col-sm-8 col-xs-8">

														<h5>${name}</h5>
														<p>${patientAddressDetails.address},${patientAddressDetails.pincode}</p>
														<p>${patientAddressDetails.contact}</p>


													</div>
													<div class="col-md-2 col-sm-4 col-xs-4">
														<div class="pull-right medi-icon">
															<span><input class="mar-bot15" type="radio"
																value="0" name="address" onclick="proceedAddress()"></span>
															<!-- <a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><span class="flaticon-user" aria-hidden="true"></span></a>
    					
    					<a href="#" data-toggle="tooltip" data-placement="top" title="Remove" ><span class="flaticon-rubbish-bin"></span></a> -->

															<div class="clearfix"></div>
														</div>
													</div>

												</div>

											</div>
										</div>
									</div>

									<div id="addressList">
										<c:forEach items="${allPatientAddressList}"
											var="allPatientAddressList" varStatus="count">
											<div class="row">
												<div class="col-md-12 col-sm-12">
													<div class="medical-address">
														<div class="row">
															<div class="col-md-10 col-sm-8 col-xs-8">

																<h5>${allPatientAddressList.fullName}</h5>
																<p>${allPatientAddressList.house},${allPatientAddressList.locality},${allPatientAddressList.street},${allPatientAddressList.city}
																	${allPatientAddressList.state}-pincode:${allPatientAddressList.pincode}</p>
																<p>${allPatientAddressList.contactNo}</p>


															</div>
															<div class="col-md-2 col-sm-4 col-xs-4">
																<div class="pull-right medi-icon">
																	<span><input class="mar-bot15" type="radio"
																		value="${allPatientAddressList.patientAddressListId}"
																		name="address" onclick="proceedAddress()"></span> <a
																		href="#" data-toggle="tooltip" data-placement="top"
																		title="Edit"
																		onclick="editAddress('${allPatientAddressList.fullName}','${allPatientAddressList.house}','${allPatientAddressList.locality}','${allPatientAddressList.street}','${allPatientAddressList.city}',${allPatientAddressList.pincode},'${allPatientAddressList.state}','${allPatientAddressList.country}',${allPatientAddressList.patientAddressListId},'${allPatientAddressList.contactNo}') "><span
																		class="icon-user" aria-hidden="true"></span></a> <a
																		href="#" data-toggle="tooltip" data-placement="top"
																		title="Remove"
																		onclick="deleteAddress(${allPatientAddressList.patientAddressListId})"><span
																		class="icon-rubbish-bin"></span></a>

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


								<div id="Cars1" class="desc" style="display: none">
									<h3>please pick your order from store"s location</h3>
									<div class="text-center">
										<img src="/biocare/resources/images/pharm.png"
											class="img-responsive img-center">
									</div>
									<ul class="list-inline pull-right">

										<li><button type="button" class="btn-fr-all next-step"
												href="#step3" data-toggle="tab" aria-controls="step3"
												role="tab" aria-expanded="true" onclick="proceedAddress()">Save
												and continue</button></li>
									</ul>
								</div>



							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="newAddress" class="modal fade member">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">New Address</h4>
				</div>

				<div class="modal-body">
					<div class="row">

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">
								<input type="hidden" value="0" id="editaddressId"> <label
									for="fullname" class="reqd">Full Name </label> <input
									type="text" class="text-input" id="fullName">
							</div>
						</div>


						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">


								<label for="exampleInputEmail1" class="reqd">Contact </label> <input
									type="text" class="text-input" id="contact" name="contact"
									onkeypress="return IsNumeric(event);" min="13">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">
								<label for="exampleInputEmail1" class="reqd">Pincode</label> <input
									type="text" class="text-input" id="addressPincode"
									name="pincode" onkeypress="return IsNumeric(event);">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">

								<label for="locality" class="reqd">Locality</label> <input
									type="text" class="text-input" id="locality" name="">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">

								<label for="flatadd" class="reqd">Flat/House/Office No</label> <input
									type="text" class="text-input" id="house" name="">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">

								<label for="society" class="reqd">Street/Society</label> <input
									type="text" class="text-input" id="street" name="">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">
								<label for="country" class="reqd">Country</label> <input
									type="text" class="text-input" id="addressCountry" name="">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">
								<label for="city" class="reqd">State</label> <input type="text"
									class="text-input" id="addressState" name="">
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="form-group">
								<label for="city" class="reqd">City</label> <input type="text"
									class="text-input" id="addressCity" name="">
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




	<jsp:include page="../include/footer.jsp" />


	<!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>

	<script>


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
						strVar += "    				<div class=\"col-md-10 col-sm-8 col-xs-8\">";
						strVar += "    				";
					    strVar += "    				<h5>"+data.fullName+"<\/h5>";  
					    strVar += "    				<p>"+data.house+"," +data.locality+","+data.street+","+data.city+" "+data.pincode+","+data.state+"<\/p>"; 
					    strVar += "    				<p>"+data.contactNo+"<\/p>";  
						strVar += "    				";
						strVar += "    			";
						strVar += "    				<\/div>";
						strVar += "    				<div class=\"col-md-2 col-sm-4 col-xs-4\">";
						strVar += "    				<div class=\"pull-right medi-icon\">";
						strVar += "    					<span> <input type=\"radio\"  class=\"mar-bot15\" name=\"address\" value='"+data.patientAddressListId+"'> </span>";
						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Edit\" onclick=\"editAddress('"+data.fullName+"','"+data.house+"','"+data.locality+"','"+data.street+"','"+data.city+"','"+data.pincode+"','"+data.state+"','"+data.country+"','"+data.patientAddressListId+"','"+data.contactNo+"')\"><span class=\"icon-user\" aria-hidden=\"true\"><\/span><\/a>";
						strVar += "    					";
						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Remove\" onclick=\"deleteAddress('"+data.patientAddressListId+"')\"><span class=\"icon-rubbish-bin\"><\/span><\/a>";
						strVar += "    					";
						strVar += "    					<div class=\"clearfix\"><\/div>";
						strVar += "    					<\/div>";
						strVar += "    				<\/div>";
						strVar += "    			<\/div>";
						strVar += "    			<\/div>";
						strVar += "    			";
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

function addNewAddressModal()
{
	  $('#newAddress').find('input:text').val('');
	 document.getElementById("editaddressId").value=0;

	  $('#newAddress').modal('show');
}



function deleteAddress(addressId)
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
						strVar += "    				<div class=\"col-md-10 col-sm-8 col-xs-8\">";
						strVar += "    				";
					    strVar += "    				<h5>"+data.fullName+"<\/h5>";  
					    strVar += "    				<p>"+data.house+"," +data.locality+","+data.street+","+data.city+" "+data.pincode+","+data.state+"<\/p>"; 
					    strVar += "    				<p>"+data.contactNo+"<\/p>";  
						strVar += "    				";
						strVar += "    			";
						strVar += "    				<\/div>";
						strVar += "    				<div class=\"col-md-2 col-sm-4 col-xs-4\">";
						strVar += "    				<div class=\"pull-right medi-icon\">";
						strVar += "    					<span> <input type=\"radio\"   href=\"#step2\" data-toggle=\"tab\" aria-controls=\"step2\" role=\"tab\" class=\"mar-bot15\" name=\"address\" value='"+data.patientAddressListId+"'> </span>";
						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Edit\" onclick=\"editAddress('"+data.fullName+"','"+data.house+"','"+data.locality+"','"+data.street+"','"+data.city+"','"+data.pincode+"','"+data.state+"','"+data.country+"','"+data.patientAddressListId+"','"+data.contactNo+"')\"><span class=\"icon-user\" aria-hidden=\"true\"><\/span><\/a>";
						strVar += "    					";
						strVar += "    					<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Remove\" onclick=\"deleteAddress('"+data.patientAddressListId+"')\"><span class=\"icon-rubbish-bin\"><\/span><\/a>";
						strVar += "    					";
						strVar += "    					<div class=\"clearfix\"><\/div>";
						strVar += "    					<\/div>";
						strVar += "    				<\/div>";
						strVar += "    			<\/div>";
						strVar += "    			<\/div>";
						strVar += "    			";
						strVar += "    		<\/div>";
						strVar += "    	<\/div>";
						
						$('#addressList').append(strVar); 
						
						})
					
						}

				}) 
						
	  
} 

function proceedAddress()
{
	$('#addressSubmit').submit();
}


$(document).ready(function() {
    $("input[name$='deliveryType']").click(function() {
        var test = $(this).val();

        $("div.desc").hide();
        $("#Cars" + test).show();
    });
});
</script>
</body>
</html>