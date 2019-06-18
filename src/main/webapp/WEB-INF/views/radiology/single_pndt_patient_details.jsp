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
<link href="${pageContext.request.contextPath}/resources/css/radiology.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


</head>         
<body>
<jsp:include page="../include/doctorHeader.jsp"/> 
<div class="clearfix"></div>

<section class="doc_login inssurance_buy radiology ">
<div class="container-fluid">
<div class="row">
        <div class="bhoechie-tab-container">
 <jsp:include page="../include/radiology_left_menu.jsp"/> 
  <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
                <div class="panel-body panel-form">
                	<div class="row">
                   
                            <form class="form-horizontal" action="${pageContext.request.contextPath}/savePndtPatientDetails" method="post">
                           
                           <div class="bs-example">
                           <ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#sectionA">Section A</a></li>
								<li><a data-toggle="tab" href="#sectionB" >Section B</a></li>
								<li><a data-toggle="tab" href="#sectionC" >Section C</a></li>
								<li><a data-toggle="tab" href="#sectionD">Section D</a></li>
							</ul>
							
							<div class="tab-content">
								<div id="sectionA" class="tab-pane fade  active in">
								<div class="row">
                	<div class="col-md-4 col-sm-4 col-xs-4">
                	<div class="xform-group">
                	<label for="nameField">4.Total Number of Living children </label>
                		
                			<input type="text" class="form-control top-space-large" id="totalChild" name="totChilds" placeholder="" value="${pndtPatientDetails.numberOfChild}" readonly/>
                			
                      </div>
                       </div>                         	             
                		<div class="col-md-4 col-sm-4 col-xs-4">
                		<div class="xform-group">
                		<label for="nameField">(a).Number of Living sons with age of each living son(in years or months) </label>
                	<input type="text" class="form-control" value="${pndtPatientDetails.numberOfMaleChild}">
                       </div>
                       </div> 
                       <div class="col-md-4 col-sm-4 col-xs-4">
                		<div class="xform-group">
                		<label for="nameField">(b) Number of living Daughters with age of each living daughter (in years of months): </label>
                	<input type="text" class="form-control" value="${pndtPatientDetails.numberOfFemaleChild}">
                       </div>
                       </div> 
                       <div class="clearfix"></div>
                       <hr>
                       
                       <div class="col-md-4 col-sm-4 col-xs-4">
                       <div class="xform-group">
                		<label for="nameField">5. ${pndtPatientDetails.relativeType}</label>
                	<input type="text" class="form-control top-space-large"  value="${pndtPatientDetails.relativeName}">
                       </div>
                       
                       </div>
                       
                       <div class="col-md-4 col-sm-4 col-xs-4">
                       <div class="xform-group">
                		<label for="nameField">6.Full postal address of the patients with Contact Number, if any :  </label>
                	<input type="text" class="form-control " value="${pndtPatientDetails.address}">
                       </div>
                       
                       </div>
                       
                         <div class="col-md-4 col-sm-4 col-xs-4">
                       <div class="xform-group">
                		<label for="nameField">7.(a) Referred by ( Full Name and address of Doctor(s) /Genetic counselling Centre) :   </label>
                	<input type="text" class="form-control " value="${pndtPatientDetails.refDoctor}">
                       </div>
                       
                       </div>
                       
                       <div class="clearfix"></div>
                       <hr>
                       
                       <div class="col-md-6 col-sm-6 col-xs-6">
                       <div class="xform-group">
                		<label for="nameField">7.(b) Self- Referral by Gynaecologist/Radiologist/Registered Medical Practitioner
conducting the diagnostic procedures:   </label>
                	<input type="text" class="form-control" value="${pndtPatientDetails.selfDoctor}">
                       </div>
                       
                       </div>
                       
                       <div class="col-md-6 col-sm-6 col-xs-6">
                       <div class="xform-group">
                		<label for="nameField">8.Last menstrual period /weeks of pregnancy   </label>
                	
                	<input type="text" class="form-control top-space-large" id="nameField" name="lastMenstPeriod" placeholder="Last Menstrual Period" value="${pndtPatientDetails.weeksOfPregnancy}" />
                       </div>
                       
                       </div>
                       
                       <!-- <div class="col-md-4 col-sm-4 col-xs-4">
                       <div class="xform-group">
                		<label for="nameField">&nbsp;   </label>
                	
                	<input type="text" class="form-control top-space-large" name="totDays" id="totWeekNDay" placeholder="total Days" onfocus="calculateWeeksAndDays()"/>
                       </div>
                       
                       </div> -->
                       
                	</div>
								</div>
								
				<div id="sectionB" class="tab-pane fade">
					<div class="row">
            		<div class="col-md-5 col-sm-5 col-xs-5">
            			<div class="xform-group">
            			<label for="nameField">9. Name of the doctor performing the procedure</label>
            			<input type="text" class="form-control top-space" value="${pndtPatientDetails.nameOfDoctor}">
            			</div>
            		</div>
            		<div class="col-md-7 col-sm-7 col-xs-7">
            		<div class="xform-group">
            			<label for="nameField">10. Indications </label>
            			<table width="100%" border="0" class="indication" id="indicationTable" name="indication" >
					    	<tbody>
					    	<tr>
					    			<th>Sr. No</th>
					    			<th>Indication</th>
					    		</tr>
					    	  <c:forEach items="${indicationModelList}" var="indicationModelList">
					    		
					    		<tr>
					    			<td>${indicationModelList.id}</td>
					    			<td>${indicationModelList.indications}</td>
					    		</tr>
					    	</c:forEach>  
					   		</tbody>
					    	</table>
            			
        		</div>
        		</div>
            	
 				<div class="clearfix"></div>
 				<hr>
 
 
 					<div class="col-md-4 col-sm-4 col-xs-4">
            			 <div class="xform-group">
                		<label for="nameField">12.Date on which declaration of pregnant woman/ person was obtained :</label>
                	
                	<input type="text" class="form-control form_datetime top-space" value="${pndtPatientDetails.pregWomenObtainDate}">
                       </div>
            		</div>
            		
            		<div class="col-md-4 col-sm-4 col-xs-4">
            			 <div class="xform-group">
                		<label for="nameField">13.Date on which procedures carried out :</label>
                	
                	<input type="text" class="form-control form_datetime top-space-large" value="${pndtPatientDetails.dateProcCarOut}">
                       </div>
            		</div>
            		
            		<div class="col-md-4 col-sm-4 col-xs-4">
            			 <div class="xform-group">
                		<label for="nameField">14.Result of the non-invasive procedure carried out :</label>
                	
                	<input type="text" class="form-control" value="${pndtPatientDetails.resOfNonInvasiveProc}">
                       </div>
            		</div>
 <div class="clearfix"></div>
 				<hr>
 				
 				<div class="col-md-6 col-sm-6 col-xs-6">
 				<label for="nameField">15.The result of pre-natal diagnostic procedures was conveyed to :</label>
 				<div class="xform-group">
                			<input type="text" class="form-control top-space-large"  value="${pndtPatientDetails.resOfPreNatalDiagnoProc}">
                       </div>
 			</div>
            		
            		<div class="col-md-6 col-sm-6 col-xs-6">
            			 <div class="xform-group">
                		<label for="nameField">16. Any indication for MTP as per the abnormality detected in the diagnostic
procedures/tests :</label>
                	
                	<input type="text" class="form-control top-space" value="${pndtPatientDetails.indicationMTPAbnormal}">
                       </div>
            		</div>
 
            	</div>
            	</div>
            	<div id="sectionC" class="tab-pane fade">
            	<div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-4">
                	<div class="xform-group">
                	<label for="nameField">17. Name of the doctor/s performing the procedure/s: </label>
                	<input type="text" class="form-control top-space" id="" name="" placeholder="" value="${pndtPatientDetails.nameOfDoctor}">

                      </div>
                       </div>
                       
                       <div class="col-md-4 col-sm-4 col-xs-4">
                       <label for="nameField">18.History of genetic/medical disease in the family (specify): </label>
                      <input type="text" class="form-control top-space" id="" name="" placeholder="" value="${pndtPatientDetails.genDiseaseHistory}">
                       </div>
                       <div class="col-md-4 col-sm-4 col-xs-4">
                       <label for="nameField">19.Indication/s for the diagnosis procedure : </label>
                       <input type="text" class="form-control top-space-large" id="" name="" placeholder="" value="${pndtPatientDetails.indicationDiangoProc}">
                       </div>
                       
                       
                      
                       <div class="clearfix"></div>
                        <hr>
                        
                       <!-- <div class="col-md-12 col-sm-12 col-xs-12">
                       <label for="nameField" class="col-md-9">19. Indication/s for the diagnosis procedure : </label>
                     <div class="col-md-3 col-sm-3 col-xs-3">  
                       <select class="form-control" name="prevChild">
				    	<option>Yes</option>
				         <option>No </option>
				      </select>
				      </div>
                       <div class="row">
                			<div class="col-md-6 col-sm-6 col-xs-6">
                			<label for="nameField">A. Previous child/children with:</label>
                			<select class="form-control top-space">
					         <option>No</option>
					         <option>Yes</option>
    					 </select>
                			</div>
                			<div class="col-md-6 col-sm-6 col-xs-6 ">
                			<label for="nameField">B. Advanced maternal age (35 years)</label>
                				<select class="form-control top-space" name="prevChild">
    	<option>Not Applicable</option>
         <option>(i) Chromosomal disorders </option>
         <option>(ii) Metabolic disorders</option>
         <option>(iii) Congenital anomaly</option> 
         <option>(iv) Mental Disability</option> 
         <option>(v) Haemoglobinopathy</option> 
         <option>(vi) Sex linked disorders</option> 
         <option>(vii) Single gene disorder</option> 
         <option value="8">(viii) Any other (specify)</option> 
     </select>
                			</div>
                			
                			<div class="col-md-6 col-sm-6 col-xs-6">
                			<label for="nameField" class="mar-top10">C. Mother/father/sibling has genetic disease (specify)</label>
                			<select class="form-control top-space" name="genDisease">
         
         <option>Known</option>
         <option>Not Known</option>
                                                     
     </select>
                			</div>
                			
                			<div class="col-md-6 col-sm-6 col-xs-6">
                			<label for="nameField" class="mar-top10">D. Other (specify)</label>
                			<input type="text" class="form-control top-space-large" name="" id="" placeholder="Specify">
                			</div>
                			
                		</div>
                       </div> -->
                       
                       <div class="col-md-6 col-sm-6 col-xs-6">
                      <label for="nameField"> 20. Date on which consent of pregnant woman / person was obtained in Form G
prescribed in PC&PNDT Act, 1994: </label>
<input type="text" class="form-control form_datetime  top-space" id="" name="" placeholder="" value="${pndtPatientDetails.dateConsentOfPrgWomen}">
                       </div>
                       
                       <div class="col-md-6 col-sm-6 col-xs-66">
                       	 <label for="nameField" class="mar-top10"> 21.Invasive procedures carried out </label>
                       	<input type="text" class="form-control top-space-large" name="" id="" value="${pndtPatientDetails.invasiveProcCarOut}" placeholder="">
                       </div>
                       
                       <!-- <div class="col-md-4 col-sm-4 col-xs-4">
                       		<input type="text" class="form-control top-space-large" name="" id="" placeholder="Specify">
                       	</div> -->
                       	
                       <div class="clearfix"></div>
                       	<hr>
                       
                       <div class="col-md-6 col-sm-6 col-xs-6">
                			<label for="nameField" >22. Any complication/s of invasive procedure(specify)</label>
                			<input type="text" class="form-control top-space" name="" id="" placeholder="Specify" value="${pndtPatientDetails.complicationInvasiveProc}">
                	</div>
                	<div class="col-md-6 col-sm-6 col-xs-6">
                	<label for="nameField">23. Additional tests recommended (Please mention if applicable)</label>
                <input type="text" class="form-control top-space" name="" id="" placeholder="Specify" value="${pndtPatientDetails.additionalTestRecommended}">
                
                	</div>
                	
                	<div class="col-md-12 col-sm-12 col-xs-12 mar-top">
                			<label for="nameField" >24. Result of the Procedures/ Tests carried out (report in brief of the invasive tests/
procedures carried out)</label>
                			<input type="text" class="form-control top-space" name="" id="" placeholder="Specify" value="${pndtPatientDetails.resultOfProcedure}">
                	</div>
                	
                	<div class="clearfix"></div>
                       	<hr>
                      
                	<div class="col-md-6 col-sm-6 col-xs-6">
                			<label for="nameField" >25. Date on which procedures carried out:</label>
                			<input type="text" class="form-control form_datetime" name="" id="" placeholder="Specify" value="${pndtPatientDetails.dateResOfProcedure}">
                	</div> 
                	<div class="col-md-6 col-sm-6 col-xs-6">
                			<label for="nameField" >26. The result of pre-natal diagnostic procedures was conveyed to</label>
                			<input type="text" class="form-control" name="" id="" placeholder="Specify" value="${pndtPatientDetails.invasivePreNatalDiagnoProc}">
                			
                	</div>	
                	<div class="col-md-12 col-sm-12 col-xs-12 mar-top">
                			<label for="nameField" >27. Any indication for MTP as per the abnormality detected in the diagnostic
procedures/tests</label>
                			<input type="text" class="form-control top-space" name="" id="" placeholder="Specify" value="${pndtPatientDetails.indicationMTPabnormality}">
                	</div> 
                	<div class="clearfix"></div>
                       	<hr>
                  
                	<div class="submit-btn text-center"><input type="submit" value="Submit " class="btn-fr-all"></div>
                       	
                </div>
            	
            	</div>
            	
            	<div id="sectionD" class="tab-pane fade">
            	 <div class="row">
   				<div class="col-lg-12 ">
   				<form>
                    	<h3 class="text-center">DECLARATION OF THE PERSON UNDERGOING
<span>PRENATAL DIAGNOSTIC TEST/ PROCEDURE </span></h3>
<p>
	I, Mrs./Mr.<input type="text" class="letter-input"> declare that by
undergoing <input type="text" class="letter-input"> Prenatal Diagnostic Test/ Procedure. I do
not want to know the sex of my foetus.
</p>
<div class="top-space pull-left">Date: </div>
<div class="top-space-large div-sm pull-right">Signature/Thump impression of the person undergoing
the Prenatal Diagnostic Test/ Procedure</div>
<div class="clearfix"></div>
<hr>
<h6>In Case of thumb Impression:</h6>
Identified by (Name)<input type="text" class="letter-input">Age:<input type="text" class="letter-input"> Sex:<input type="text" class="letter-input">
Relation (if any):<input type="text" class="letter-input">
Address & Contact No.:<textarea type="text" class="letter-input" rows="1"></textarea>
Signature of a person attesting thumb impression: <input type="text" class="letter-input">Date:<input type="text" class="letter-input">
   
   <div class="clearfix"></div>
   <hr>
   
  <h3 class="text-center"> DECLARATION OF DOCTOR/ PERSON CONDUCTING
<span>PRE NATAL DIAGNOSTIC PROCEDURE/TEST</span> </h3>
<p></>I,<input type="text" class="letter-input">(name of the person conducting
ultrasonography / image scanning) declares that the while conducting ultrasonography
/image scanning on Ms/Mr<input type="text" class="letter-input"> (name of
the pregnant woman or the person undergoing pre natal diagnostic procedure/test), I
have neither detected nor disclosed the sex of her foetus to anybody in any manner.</p>
Date: <input type="text" class="letter-input"> Signature:<input type="text" class="letter-input">
 
 
 <div class="top-space-large div-sm pull-right">
Name in Capitals, Registration Number with Seal of
the Gynaecologist/Radiologist/Registered Medical Practitioner
Conducting Diagnostic procedure.   </div>
<div class="clearfix"></div>              
                    </form> 
   				
   				</div>
</div>
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
 </section>
 
 <div id="largeModal11" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-body">
					<div class="baby_details card_sec">


						<div class="clearfix"></div>
						<!-- <hr>
<a href="#" class="history_sbmt">Confirm</a> -->
						<div class="circle1">
							<i class="fa fa-list-ul" aria-hidden="true"></i>
						</div>
						<ul class="card_list">
							<li><h3>
									Doctor <span>Name</span>
								</h3> <span>(Gynacologist)</span></li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><strong>Mother Name :</strong> fgfgfshxgh</li>
							<li><label><strong>Delivery Type : </strong> Normal
									: <input type="checkbox" name="deliveryType" value="Normal">
									Vacuume : <input type="checkbox" name="deliveryType"
									value="Vacuume" checked> Forceps :<input
									type="checkbox" name="deliveryType" value="Forceps"
									checked> Caesarean :<input type="checkbox"
									name="deliveryType" value="Caesarean" checked> </label></li>
							<li><label><strong>sex : </strong><input
									type="checkbox" name="sex" value="Male"> Male <input
									type="checkbox" name="sex" value="Female"> Female</label></li>
						</ul>
						<div class="card_img">
							<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
 
 
    
 <jsp:include page="../include/footer.jsp"/> 
 
 <!-- Bootstrap core JavaScript================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		
		

	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
		
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
	
		
		
		
		<script type="text/javascript">
 
$('.form_datetime').datepicker({
	  autoclose: true,
	  
	  format: "dd-mm-yyyy"}).datepicker()
	 
	  
</script>
	
	<!-- <script>
		
		$(function() {
			

		jQuery(".panel-heading").click(
				function() {
					jQuery(this).next(".panel-collapse").addClass('thePanel');
					jQuery('#accordion .panel-collapse').not('.thePanel')
							.slideUp("slow");
					jQuery(".thePanel").slideToggle("slow").removeClass(
							'thePanel');
				});
	</script> -->
	<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	
	
	
	

 </body>