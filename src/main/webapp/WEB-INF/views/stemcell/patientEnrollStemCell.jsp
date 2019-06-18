<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/docs/3.3/favicon.ico">

    <title>home for health</title>
 
    <!-- Bootstrap core CSS -->     
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chosen.css">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--<link href="Carousel%20Template%20for%20Bootstrap_files/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!--<script src="Carousel%20Template%20for%20Bootstrap_files/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    
   
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap-datepicker/css/datepicker.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  </head>
<!-- NAVBAR
================================================== -->
  <body>
  <c:url var="getDoctorhospitalId" value="/getDoctorhospitalId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />
    <c:url var="gethospitalByCityId" value="/gethospitalByCityId" />
       <c:url var="getConsulthospitalByCityId" value="/getConsulthospitalByCityId" /> 
        <c:url var="getStemcellPlanByCompanyId" value="/getStemcellPlanByCompanyId" /> 
    
  
  
    <div class="navbar-wrapper">
    <div id="top-bg">
    	<div class="container">
        	<div class="top-right">
            	<ul>
                	<li><a href="#">Login </a></li>
                    <li><a href="#">Sign Up</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
            </div>
        </div>
    </div>
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-responsive" alt="/"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
              <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Department</a></li>
                 <li><a href="#">Services</a></li>
                <li><a href="#">Appointment</a></li>
                 <li><a class="last" href="#">Contact</a></li>
                
                <!--<li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>-->
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/inner-head.jpg" alt="First slide">
        </div>
      </div>
    </div><!-- /.carousel -->


<section id="headign-bg">
	<div class="container">
    	<div class="page-title">
    	<h2>Patient Enroll StemCell(request)</h2>
        <ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="#">Pages</a></li>
			<li class="active"><a>StemCell Enroll</a></li>
		</ul>
        </div>
    </div>
</section>

<section class="four-tab">

     <form action="${pageContext.request.contextPath}/displayPatientEnroll" method="POST">

 <input type="hidden" name="stemCellBankId" id="stemCellBankId" >

<input type="hidden" name="planId" id="planId" >  -->
				<input type="hidden" id="countryName" value="" name="countryName"/>
				<input type="hidden" id="stateName" value="" name="stateName"/>
				<input type="hidden" id="cityName" value="" name="cityName"/>
				<input type="hidden" id="hospitalName" value="" name="hospitalName"/>

   <div class="container">
   	<div class="row">
   	
   	
        <div class="col-sm-12"><ul class="nav nav-tabs">
           <c:forEach items="${plandetailsList}" var = "plandetailsList">
       <li class="active">
       <input type="checkbox" name="checkbox" id="mcheck" value="${plandetailsList.planId}" onclick="mycheck()">
       <a href="#home">${plandetailsList.planName}  <strong>${plandetailsList.planType}</strong> <strong>${plandetailsList.planCost}</strong></a></li>
        </c:forEach>
        </br>
        
        
     
      </ul></div>
         <div class="col-sm-12">

        </div>
      </div> --></div>
     </div>
   </div>
</section>

<section id="registration">
	<div class="container">
    	
    
        	 <div class="row">
        	 <script>
						  function callMultipleMethods(){
							  
							  getStateBYCountry1();
							  getAllFields();
						  }
						  </script>
						  
						   <script>
						  function callMultipleMethodsecond(){
							  
							  getCityBYState1();
							  getAllFields();
						  }
						  </script>
						  
						    <script>
						  function callMultipleMethodthird(){
							  
							  getHospitalBYCity1();
							  getAllFields();
						  }
						  </script>
						   <script>
						  function callMultipleMethodfourth(){
							  
							  getAllFields();
						  }
						  </script>
						   <script>
						  function callMultipleMethods1(){
							  
							  getStateBYCountry();
							  getAllFields1();
						  }
						  </script>
						  
						   <script>
						  function callMultipleMethod2(){
							  
							  getCityBYState();
							  getAllFields1();
						  }
						  </script>
						  
						    <script>
						  function callMultipleMethod3(){
							  
							  getHospitalBYCity();
							  getAllFields1();
						  }
						  </script>
						    <script>
							  function callMultipleMethod4(){
								  
								  getAllFields1();
							  }
						  </script>
						 <div class="col-sm-3 col-md-3">
        	  <div class="form-group">
       
       
						     <label for="state">Country 
					<select  class="input-text"  id="countryId1" name="countryId" onChange="callMultipleMethods()">
                  <option>--select--</option>
							 <c:forEach items="${countryList}" var = "countryList">
                             <option value="${countryList.countryId}">${countryList.countryName}</option>
                             </c:forEach>
                  </select>
                  </label>
                  
						</div>
						</div>
						
					 <div class="col-sm-3 col-md-3">
						<div class="form-group">
						   <label for="state">State
						                <select class="input-text"  id="stateId1" name="stateId" onChange="callMultipleMethodsecond()">
							 
                             <option value="">---select---</option>
                          </select>
                          </label>
						</div>
						</div>
						<div class="col-sm-3 col-md-3">
						<div class="form-group">
					     <label for="state">City
					       
					
<select  class="input-text"  id="cityId1" name="cityId"  onChange="callMultipleMethodthird()">
							 <option value="">--select--</option> 
                    </select>
						</label>
						</div>
						</div>
						 <div class="col-sm-3 col-md-3">
						<div class="form-group">
					       <label for="state">hospitals
					
<select  class="input-text"  id="hospitalId1" name="hospitalId" onChange="callMultipleMethodfourth()">
							 <option value="">--select--</option> 
                    </select>
						</label></div>
						</div> 
						
						</br>  
						</div> 
						
						
						  <h1>OR</h1>
						  <hr>
						  
						 <div class="col-sm-3 col-md-3">
        	  <div class="form-group">
       
						     <label for="state">Country 
					<select  class="input-text"  id="countryId" name="countryId" onChange="callMultipleMethods1()">
                  <option>--select--</option>
							 <c:forEach items="${countryList}" var = "countryList">
                             <option value="${countryList.countryId}">${countryList.countryName}</option>
                             </c:forEach>
                  </select>
                  </label>
                  
						</div>
						</div>
						
					 <div class="col-sm-3 col-md-3">
						<div class="form-group">
						   <label for="state">State
						                <select  class="input-text"  id="stateId" name="stateId" onChange="callMultipleMethod2()">
							 
                             <option value="">--select--</option>
                          </select>
                          </label>
						</div>
						</div>
					 <div class="col-sm-3 col-md-3">
						<div class="form-group">
					       <label for="state">City
					       
				  <select  class="input-text"  id="cityId" name="cityId" onChange="callMultipleMethod3()">
							 <option value="">--select--</option> 
                    </select>
						</label>
						</div>
						</div>
						 <div class="col-sm-3 col-md-3">
						<div class="form-group">
					       <label for="state">hospitals
					<select  class="input-text"  id="hospitalId" name="hospitalId" onChange="callMultipleMethod4()">
							 <option value="">--select--</option> 
                    </select>
						</label></div>
						</div></br> 
						 
		<%-- 			
        <div class="col-sm-3 col-md-3">
        	  <div class="form-group">
       
						     <label for="state">StemCell Banks 
					<selsect  class="input-text"  id="stemCellBankId" name="stemCellBankId" onChange="getPlanBYCompany()">
                  <option>--select--</option>
							 <c:forEach items="${stembankList}" var = "stembankList">
                             <option value="${stembankList.stemCellBankId}">${stembankList.stemCellBankName}</option>
                             </c:forEach>
                  </select> 
                  </label>
                  
						</div>
						</div> 
						<div class="col-sm-3 col-md-3">
						<div class="form-group">
					       <label for="state">Plans
					<select  class="input-text"  id="planId" name="planId">
							 <option value="">--select--</option> 
                    </select>
						</label></div>
						</div></br> --%>
						

             <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                	    <label for="exampleInputEmail1">Pregnancy Type</label>
                	
                    	<select data-placeholder="select gender" class="chosen-select form-control input-text" id="pregnancyType" name="pregnancyType">
                    	                     	  <option value=""></option>
                    	  <option value="single">single</option>
                    	              <option value="dual">dual</option>
                    	              <option value="triple">triple</option>
                    	              <option value="Quadruple">Quadruple</option>
                    	  
                    	
                    	</select>
    
        </div>
                </div>
                 <div class="col-sm-4 col-md-4">
                	<div class="form-group">
                    	<label for="exampleInputEmail1">Expected-Delivery Date</label>
    <input type="text"  class="input-text" name="expectedDeliveryDate" id="expectedDeliveryDate" required/>
                    </div>
                </div>
                


                <div class="col-sm-12 col-md-12">
                 <div class="form-group">
                    	<input type="submit" value="Submit" class="btn btn-success" onclick="Validate()">
                    </div>
            </div>
            </div>
        	
        </form>
    
    </div>
</section>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
     
    <!--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>-->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
   
    <script src="${pageContext.request.contextPath}/resources/js/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script>
  $('#expectedDeliveryDate').datetimepicker({ format: 'YYYY-MM-DD' });
  $('#birth_Date').datetimepicker({ format: 'YYYY-MM-DD' });
			
  </script>
 <script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});
</script>
	
   <script type="text/javascript">
            function Validate()
            {
                var e = document.getElementById("bloodGroup");
                var e = document.getElementById("pregnancyType");

                var strUser = e.options[e.selectedIndex].value;

              //  var strUser1 = e.options[e.selectedIndex].text;
                if(strUser==0)
                {
                    alert("Please select");
                }
            }
        </script> 
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
     <script>

 function getStateBYCountry() {
											 
	//alert("kk");     
		 var countryId=document.getElementById("countryId").value; 
		 
		  //alert(countryId);
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
																	for (var i = 0; i < len; i++) {
																		
																		strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
																 
																	} 
																	 $('#stateId').append($(strVar))

												    				})
		 
		 
	 }
	</script>
	<script>
 	function mycheck()
	{
		var checkbox=document.getElementsByName("checkbox");
		alert("kk");
		var planId;
		

	for(i=0;i<checkbox.length;i++)
		{
		
		if(checkbox[i].checked===true)
			{
			
			alert(checkbox[i].value);
			planId=checkbox[i].value;
			//planId.push(checkbox[i].value);
			
			alert("id"+checkbox[i].value);
			$(this)[0].checked = true;
			}
			
		}	
	
	$("input:checkbox").on('click', function() {
		// in the handler, 'this' refers to the box clicked on
		var $box = $(this);
		if ($box.is(":checked")) {
		  // the name of the box is retrieved using the .attr() method
		  // as it is assumed and expected to be immutable
		  var group = "input:checkbox[name='" + $box.attr("name") + "']";
		  // the checked state of the group/box on the other hand will change
		  // and the current value is retrieved using .prop() method
		  $(group).prop("checked", false);
		  $box.prop("checked", true);
		} else {
		  $box.prop("checked", false);
		}
		});
	

}
 
//the selector will match all input controls of type :checkbox
//and attach a click event handler

/**
 *
 * Author : Kaushik Udavant
 */
/* $("input:checkbox").on('click', function() {
// in the handler, 'this' refers to the box clicked on
var $box = $(this);
if ($box.is(":checked")) {
  // the name of the box is retrieved using the .attr() method
  // as it is assumed and expected to be immutable
  var group = "input:checkbox[name='" + $box.attr("name") + "']";
  // the checked state of the group/box on the other hand will change
  // and the current value is retrieved using .prop() method
  $(group).prop("checked", false);
  $box.prop("checked", true);
} else {
  $box.prop("checked", false);
}
});
 */ 
</script>
	
	
	   <script>

 function getStateBYCountry1() {
											 
	    
		 var countryId1=document.getElementById("countryId1").value; 
		 
		  /* alert(countryId); */
		 $
														.getJSON(
																'${getStateByCountryId}',
																{
																	countryId : countryId1,
														 			
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';		

																	
																	
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																		
																		strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
																 
																	} 
																	html += '</option>';
																	$('#stateId1').html(html);
																	$("#stateId1").trigger("chosen:updated");
																	 $('#stateId1').append($(strVar))

												    				})
		 
												    				
	 }
	</script>
	
	
	
	

	
	<script>

 function getCityBYState() {
										 
		 var stateId=document.getElementById("stateId").value; 
		 
		 $
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : stateId,
																	
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';		

																	
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																
																		strVar += "<option value="+data[i].cityId+">"+data[i].cityName+"<\/option>";
																 
																	}
																	html += '</option>';
																	$('#cityId').html(html);
																	$("#cityId").trigger("chosen:updated");
																	 $('#cityId').append($(strVar))

																})
		 
		 
	 }
	</script>
	<script>
	
	function getCityBYState1() {
										 
		 var stateId1=document.getElementById("stateId1").value; 
		 
		 $
														.getJSON(
																'${getCityByStateId}',
																{
																	stateId : stateId1,
																	
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';		
	
																	
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																
																		strVar += "<option value="+data[i].cityId+">"+data[i].cityName+"<\/option>";
																 
																	} 
																	html += '</option>';
																	$('#cityId1').html(html);
																	$("#cityId1").trigger("chosen:updated");
																	 $('#cityId1').append($(strVar))

																})
		 
		 
	 }
	</script>
	
	
	<script>

 function getHospitalBYCity() {
	 //alert("mm");
										 
		 var cityId=document.getElementById("cityId").value; 
		// alert(cityId);
		 
		 $
														.getJSON(
																'${gethospitalByCityId}',
																{
																	cityId : cityId,
																	
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose hospitals...</option>';		
														
																	
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																
																		strVar += "<option value="+data[i].hospitalId+">"+data[i].hospitalName+"<\/option>";
																 
																	} 
																	html += '</option>';
																	$('#hospitalId').html(html);
																	$("#hospitalId").trigger("chosen:updated");
																	 $('#hospitalId').append($(strVar))

																})
		 
		 
	 }
 </script>
 
 
   
   <script>

 function getHospitalBYCity1() {
	 //alert("mm");
										 
		 var cityId1=document.getElementById("cityId1").value; 
		// alert(cityId);
		 
		 $
														.getJSON(
																'${getConsulthospitalByCityId}',
																{
																	cityId : cityId1,
																	
																	ajax : 'true'
																},
																function(data) {
														
																	var html = '<option value="" disabled="disabled" selected >Choose hospitals...</option>';		
	
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																
																		strVar += "<option value="+data[i].hospitalId+">"+data[i].hospitalName+"<\/option>";
																 
																	} 
																	html += '</option>';
																	$('#hospitalId1').html(html);
																	$("#hospitalId1").trigger("chosen:updated");
																	 $('#hospitalId1').append($(strVar))

																})
		 
		 
	 }
 </script>
 
 <script>

 function getPlanBYCompany() {
	 alert("mm");
										 
		 var stemCellBankId=document.getElementById("stemCellBankId").value; 
		alert(stemCellBankId);
		 
		 $
														.getJSON(
																'${getStemcellPlanByCompanyId}',
																{
																	stemCellBankId : stemCellBankId,
																	
																	ajax : 'true'
																},
																function(data) {
														
																	var html = '<option value="" disabled="disabled" selected >Choose City...</option>';		
		
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																
																		strVar += "<option value="+data[i].planId+">"+data[i].planName+"<\/option>";
																 
																	} 
																	 $('#planId').append($(strVar))

																})
		 
		 
	 }
 </script>
 
 
 <script>
 
 function getAllFields(){
	 var countryId = document.getElementById("countryId1");
	 var countryName = countryId.options[countryId.selectedIndex].text;
	 document.getElementById("countryName").value=countryName;
	 
	 
	 var stateId = document.getElementById("stateId1");
	 var stateName = stateId.options[stateId.selectedIndex].text;
	 document.getElementById("stateName").value=stateName;
	 
	 
	 var cityId=document.getElementById("cityId1");
	 var cityName = cityId.options[cityId.selectedIndex].text;
	 document.getElementById("cityName").value=cityName;
	   
	 var hospitalId=document.getElementById("hospitalId1");
	 var hospitalName = hospitalId.options[hospitalId.selectedIndex].text;
	 document.getElementById("hospitalName").value=hospitalName;
	 
  }
 </script>
 
 <script>
 
 function getAllFields1(){
	 var countryId = document.getElementById("countryId");
	 var countryName = countryId.options[countryId.selectedIndex].text;
	 document.getElementById("countryName").value=countryName;
	 
	 
	 var stateId = document.getElementById("stateId");
	 var stateName = stateId.options[stateId.selectedIndex].text;
	 document.getElementById("stateName").value=stateName;
	 
	 
	 var cityId=document.getElementById("cityId");
	 var cityName = cityId.options[cityId.selectedIndex].text;
	 document.getElementById("cityName").value=cityName;
	   
	 var hospitalId=document.getElementById("hospitalId");
	 var hospitalName = hospitalId.options[hospitalId.selectedIndex].text;
	 document.getElementById("hospitalName").value=hospitalName;
	 
  }
 </script>
 
</body>
</html>