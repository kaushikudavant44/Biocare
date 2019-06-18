<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en"> 
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
<link href="${pageContext.request.contextPath}/resources/css/videoCall2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head> 
<body>
<jsp:include page="../include/patientHeader.jsp" /> 

 <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  <c:url var="submitDoctorRating" value="/submitDoctorRating" />		
  <c:url var="submitLabRating" value="/submitLabRating" />	 
</div>
<div class="clearfix"></div>
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>View Patient History </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
           
                <div class="bhoechie-tab-content active">
                 
            <input type="hidden" value="${patientId}">
             
            
                
                 <a href="${pageContext.request.contextPath}/getEditPatientHistoryDetails/${patientId}" data-toggle="tooltip" data-original-title="Edit" class="edit-history medi-icon"><span class="icon-user" aria-hidden="true"></span></a>
                
                	<div class="inssurance_buy padding_none">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
   <!--  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Patient Details</a></li> -->
   <!--  <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">View Proper History</a></li> -->
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  <div role="tabpanel" class="tab-pane fade in" id="home">
        <div class="cont_blk">
				<span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="input-1" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">First Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="input-1" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Last Name</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="number" name="quantity" min="20" max="100"id="input-1" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Age</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
                        <div class="gender_sec"> 
                       	 <div class="checkbox">
                  <label>Gender :</label>
                 
                </div>
                         <div class="checkbox">
                                   
                      <label><input type="checkbox" value="">Male</label>
                      </div>
                         <div class="checkbox">
                      <label><input type="checkbox" value="">Female</label>
                     
                    </div>
        				</div>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao">
                        <option>Religion</option>
                        <option>Hindu </option>
                        <option>Muslim</option>
                        <option>Christian</option>
                        <option>Bramhin</option>
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<select class="selectpicker input__field input__field--nao">
                        <option>Occupation</option>
                        <option>Business </option>
                        <option>Professional Doctor</option>
                        <option>Professional Engineer</option>
                        <option>Professional Lawyer</option>
					</select>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="input-1" />
					<label class="input__label input__label--nao" for="input-1">
						<span class="input__label-content input__label-content--nao">Address</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
                <div class='input-group adult_b' id='datetimepicker1'>
                         <span class="input input--nao">
                            <input type='text' class="input__field input__field--nao"  placeholder="Date of Admission (dd/mm/yy)"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
                    </span>
                       
                </div>
                <div class='input-group adult_b' id='datetimepicker1'>
                         <span class="input input--nao">
                            <input type='text' class="input__field input__field--nao"  placeholder="Date of Examination (dd/mm/yy)"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
                    </span>
                       
                </div>
                </div>
        <div class="clearfix"></div>
     <p><a href="#" class="history_sbmt btn-fr-all">submit</a></p>
  </div>
  
   <div class="doc_availble dr-site">
  <div role="tabpanel" class="tab-pane fade in active" id="profile"><div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Chief or presenting Complaints
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <textarea  name="Chief" disabled="disabled">${patientHistoryChiefComplaints.complaints}</textarea>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Past History
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        <strong>History of Past illness like:</strong>
         <%-- <c:forEach items="${patientPersonalHistory}" var="patientPersonalHistory" varStatus="count">
              
                if(count%2==0){
                
                <span >$patientPersonalHistory.maritalStatus
                <div>
               }
                <label><input  name="messagetick" id="messagetick2" type="checkbox" />Yes</label>
                if(count%2!=0){
                
                
                </span
                 </div>
          
      </c:forEach> --%>
        
        <div class="cont_blk past_history">
         <c:forEach items="${patientHistoryIllnessList}" var="patientHistoryIllnessList" varStatus="count">
            <c:choose>
            
               
            <c:when test="${count.index%2==0}">
            <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                             </c:when>
                             </c:choose>
                             <%-- <c:out value="${count}" /> --%>
                            
                          
                         
                                       
                          <label><input type="checkbox" name="illness"   checked="checked" disabled="disabled">${patientHistoryIllnessList.illnessName}</label>
                          </div> 
                             <div class="checkbox">
                      
                          <c:choose>
                    <c:when test="${count.index%2!=0}">  
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
                </c:when> 
                 </c:choose>
         </c:forEach>
               
          </div>
      </div>
    </div>
  </div>
  </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
         Personal History
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
      <strong>1. Marital status with number of children</strong>
       <div class="cont_blk past_history">
       <textarea   name="Maritalstatus" disabled="disabled">${patientPersonalHistory.maritalStatus}</textarea>
        </div>
       
        <div class="clearfix"></div>
        <hr>
         <strong>2. Occupation (nature and environment job) and education, unemployment</strong>
        <textarea  name="Occupation" disabled="disabled">${patientPersonalHistory.occupation}</textarea>
         <hr>
         <strong>3. Income (asked indirectly) and social status</strong>
        <textarea  name="Income" disabled="disabled">${patientPersonalHistory.anualIncome}</textarea>
        <hr>
         <strong>4. Addiction (tea, coffee, smoking, alcoholism, substance abuse e.g chewing tobacco, ganja, heroin; try to estimate the amount of consumption of tobacco or alcohol)</strong>
        <textarea  name="Addiction" disabled="disabled">${patientPersonalHistory.addiction}</textarea>
        <hr>
         <strong>5. Dietary habit(for diagnosis of avitaminosis, malnutrition, obesity)</strong>
        <textarea  name="Dietary" disabled="disabled">${patientPersonalHistory.dietaryHabits}</textarea>
        <hr>
         <strong>6. History of Contraception</strong>
        <textarea  name="Contraception" disabled="disabled">${patientPersonalHistory.historyOfConterception}</textarea>
        <hr>
         <strong>7. High Risk behaviour (e.g IV drug abuse, multiple sexual partner, homosexuality etc)-important in hepatitis B or C infection, AIDS and SBE.</strong>
        <textarea  name="HighRiskbehaviour" disabled="disabled">${patientPersonalHistory.highRiskBehaviour}</textarea>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingSix">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
        Family History
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
      <div class="panel-body">
     
        <textarea  name="FamilyHistory" disabled="disabled" >${patientFamilyHistory.familyHistory}</textarea>
         
       
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
         Treatment History
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
      <div class="cont_blk past_history">
        <strong>1.Treatment received so far, for the present illness.</strong>
    <textarea   name="Treatment" disabled="disabled">${patientTreatementHistoryp.treatmentReceived}</textarea>
    
    
        <div class="clearfix"></div>
        <hr>
         <strong>2.Any H/O drug allergy or reactions.</strong>
     <textarea name="drugallergy"  disabled="disabled">${patientTreatementHistoryp.allergyReactions}</textarea>
       <div class="clearfix"></div>
         <hr>
         <strong>3.Any surgical intervention or H/O accidents in significant past.</strong>
         <textarea name="surgicalintervention"  disabled="disabled">${patientTreatementHistoryp.surgicalIntervention}</textarea>
         <div class="clearfix"></div>
        <hr>
         <strong>4. Prolonged use of oral contraceptives (may precipitate CVA), penicillamine(used in wilson's disease; may develop nephrotic syndrome), vitamin C (may produce oxalate stone) etc.</strong>
        <textarea name="contraceptives"  disabled="disabled">${patientTreatementHistoryp.useOralContraceptives}</textarea>
        <div class="clearfix"></div>
        <hr>
         <strong>5. Blood transfusion</strong>
       
        <textarea  name="Bloodtransfusion" disabled="disabled">${patientTreatementHistoryp.bloodTransfusion}</textarea>
      
        <div class="clearfix"></div>
        <hr>
         <strong>6. Intake of NSAID (may produce acute gastric erosion, NSAID-induced asthma etc.)</strong>
       
        <textarea  name="Intake" disabled="disabled">${patientTreatementHistoryp.intakeNsaid}</textarea>
     
         <div class="clearfix"></div>
        <hr>
         <strong>7. Regular user of oral contraceptives, vitamins, laxatives, sedatives or herbal remedies.</strong>
       
        <textarea  name="contraceptives" disabled="disabled">${patientTreatementHistoryp.regularUsezoralContraceptives}</textarea>
     
        <div class="clearfix"></div>
        </div>
       
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFive">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
         Psychological History
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
      <div class="panel-body">
        <textarea  name="PsychologicalHistory" disabled="disabled">${patientPsychologicalHistory.psychologicalHistory}</textarea>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFive">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
        Menstrual and obstetric History
        </a>
      </h4>
    </div>
    <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
      <div class="panel-body">
       <strong>1.Menarche.</strong>
        <textarea  name="Menarche" disabled="disabled">${menstrualObstetricHistory.menarche}</textarea>
        <hr>
         <strong>2.Duration of the period.</strong>
        <textarea  name="durationperoid" disabled="disabled">${menstrualObstetricHistory.durationOfPeriod}</textarea>
        <hr>
         <strong>3.Quantity of blood loss(usually assessed by number of pads consumed or passage of clots).</strong>
        <textarea  name="bloodloss" disabled="disabled">${menstrualObstetricHistory.qtyOfBloodLoss}</textarea>
        <hr>
         <strong>4.Dysmenorrhoea, amenorrhoea or other menstrual irregularities.</strong>
        <textarea  name="Dysmenorrhoea" disabled="disabled">${menstrualObstetricHistory.menstrualErregularities}</textarea>
        <hr>
         <strong>5.Date of last menstrual period.</strong>
        <textarea  name="menstrual" disabled="disabled">${menstrualObstetricHistory.dateOfLastPeriod}</textarea>
        <hr>
         <strong>6.Menopause, post-menopausal bleeding.</strong>
        <textarea  name="Menopause" disabled="disabled">${menstrualObstetricHistory.menopause}</textarea>
        <hr>
         <strong>7.Obstetric history: </strong>
         <div class="clearfix"></div>
         	<strong>a) No.of pregnancies</strong> 
             <textarea  name="pregnancies" disabled="disabled">${menstrualObstetricHistory.noOfPregnancies}</textarea>
             <hr>
            <strong> b) Outcome of pregnancies : H/O abortions or carried to term:live birth (male/female)</strong>
             <textarea  name="Outcomepregnancies" disabled="disabled">${menstrualObstetricHistory.outcomeOfPregnancies}</textarea>
              <hr>
             <strong>c) Complications during pregnancy (e.g hypertension, gestational diabetes mellitus)</strong> 
             <div class="cont_blk past_history">
              <textarea name="Complicationspregnancy"  disabled="disabled">${menstrualObstetricHistory.complicationsDuringPregnancies}</textarea>
                </div>
                <div class="clearfix"></div>
                 <hr>
            <strong> d) Mode of delivery (Vaginal , foreeps, caesaream)</strong>
             <textarea  name="Modedelivery" disabled="disabled">${menstrualObstetricHistory.made_of_delivery}</textarea>
              <hr>
            <strong> e) Last child birth</strong>
             <textarea class="datepicker"  name="Lastbirth" disabled="disabled">${menstrualObstetricHistory.last_child_birth}</textarea>
        
      </div>
    </div>
  </div>
    
  
   
   </div></div>
				</div>
				<div class="page-alerts collapse" id="alert-1" style="display:none">
    
</div>
			</div>
		</div>
	</div>
</div>
</section>
	



<div class="clearfix"></div>
<jsp:include page="../include/footer.jsp" />  
  
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>
<script>
$('.datepicker').datepicker({ format: "dd-mm-yyyy", autoclose: true})
$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
</script>
<script>
 /*  $('#datetimepicker1').datetimepicker({ format: 'DD/MM/YYYY' });
  $('.adult_b').datetimepicker({ format: 'DD/MM/YYYY' }); */
  function validateForm() {
    var x = document.forms["myForm"]["fname"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
}
 $(function () {
     $('input[type=checkbox]').click(function () {
         //    for (i = 0; i < chks.length; i++) {
    //        chks[i].checked = false;
    //     }
    //     if (chks.length > 1)
   //         $(this)[0].checked = true;
     });
 });
 $(document).ready(function() {
  $('.panel-collapse').on('show.bs.collapse', function () {
    $(this).siblings('.panel-heading').addClass('active');
  });

  $('.panel-collapse').on('hide.bs.collapse', function () {
    $(this).siblings('.panel-heading').removeClass('active');
  });
});
$('input[name="messagetick"]').click(function() {
    $('.contactmessage').toggle(this.checked);
});
$('input[name="messagetick1"]').click(function() {
    $('.contactmessage1').toggle(this.checked);
});
$('input[name="messagetick2"]').click(function() {
    $('.contactmessage2').toggle(this.checked);
});
$('input[name="messagetick3"]').click(function() {
    $('.contactmessage3').toggle(this.checked);
});
$('input[name="messagetick4"]').click(function() {
    $('.contactmessage4').toggle(this.checked);
});
$('input[name="messagetick5"]').click(function() {
    $('.contactmessage5').toggle(this.checked);
});


</script>
<script src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
		</script>
		
		 <!-- Feed Back -->
  <script>
 function feedBackNotification(){
	  
	  var displayDiv=document.getElementById("alert-1");
	  displayDiv.style.display="block";					
				$
				 
				.getJSON(
						'${getDoctorsAndLabsForRating}',
						{
													
							ajax : 'true'
						},
						function(data) {
														
										var len = data.doctorsInfo.length;
										var lengt = data.labInfo.length;
										
									
										var strVar="";
										var strV="";
										
										for ( var i = 0; i < len; i++) {
											
										
										strVar += "<div class=\"alert alert-Thanks For Your Feedback  page-alert\">";
										strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
										strVar += "        <strong>"+data.doctorsInfo[i].doctorName+"-"+data.doctorsInfo[i].date+"<\/strong><strong class=\"pull-right\">"+data.doctorsInfo[i].patientName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\" class=\"feed_bk\" onClick=\"openFeedBackModel('"+data.doctorsInfo[i].patientName+"',"+data.doctorsInfo[i].patintId+","+data.doctorsInfo[i].doctorId+","+data.doctorsInfo[i].meetId+")\"> Give Feedback<\/a>";
									
										strVar += "    <\/div>";

										
										}
										for ( var j = 0; j < lengt; j++) {
											
											
											strVar += "<div class=\"alert alert-Thanks For Your Feedback page-alert\">";
											strVar += "        <button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×<\/span><span class=\"sr-only\">Close<\/span><\/button>";
											strVar += "        <strong>"+data.labInfo[j].labName+"-"+data.labInfo[j].date+"<\/strong><strong class=\"pull-right\">"+data.labInfo[j].labTestName+"<\/strong><div class=\"gap_feed\"><\/div><a href\"#\"  class=\"feed_bk\" onClick=\"openLabFeedBackModel('"+data.labInfo[j].patientName+"',"+data.labInfo[j].patientId+","+data.labInfo[j].labId+","+data.labInfo[j].appointId+")\"> Give Feedback<\/a>";
											strVar += "        <a href\"#\" class=\"feed_bk\"> Not Now<\/a>";
											strVar += "    <\/div>";

											
											}
										
										$('#alert-1').html(strVar);
										
										$("#alert-1").trigger("chosen:updated"); 
									
							
							
														 
						})
						
			}	

function openFeedBackModel(patientName,patientId,doctorId,meetId)
{
	document.getElementById("ratPatientName").value=patientName;
	document.getElementById("ratPatientId").value=patientId;
	document.getElementById("ratdoctorId").value=doctorId;
	document.getElementById("ratMeetId").value=meetId;
	
	  $('#ratingModal').modal('show');




}

function openLabFeedBackModel(patientName,patientId,labId,appId)
{
	
	document.getElementById("ratLPatientName").value=patientName;
	document.getElementById("ratLPatientId").value=patientId;
	document.getElementById("ratLlabId").value=labId;
	document.getElementById("ratLappId").value=appId;
	
	  $('#labRatingModal').modal('show');




}

function saveFeedBack() {
	 
	 var ratPatientId=document.getElementById("ratPatientId").value; 
	 var ratdoctorId=document.getElementById("ratdoctorId").value; 
	 var ratPatientName=document.getElementById("ratPatientName").value; 
	 var rating=document.getElementById("combostar").value; 
	 var review=document.getElementById("review").value; 
	 var ratMeetId=document.getElementById("ratMeetId").value; 
	 
	 $
													.getJSON(
															'${submitDoctorRating}',
															{
																ratPatientId : ratPatientId,
																ratdoctorId : ratdoctorId,
																ratPatientName : ratPatientName,
																rating : rating,
																review : review,
																ratMeetId : ratMeetId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("review").value=""; 
																 
																location.reload();
																

															})
	 
	 
}
function saveLabFeedBack() {
	 
	 var ratLPatientId=document.getElementById("ratLPatientId").value; 
	 var ratLlabId=document.getElementById("ratLlabId").value; 
	 var ratLPatientName=document.getElementById("ratLPatientName").value; 
	 var rating=document.getElementById("labcombostar").value; 
	 var labReview=document.getElementById("labReview").value; 
	 var ratLappId=document.getElementById("ratLappId").value; 
	 
	  
	 $
													.getJSON(
															'${submitLabRating}',
															{
																ratLPatientId : ratLPatientId,
																ratLlabId : ratLlabId,
																ratLPatientName : ratLPatientName,
																rating : rating,
																labReview : labReview,
																ratLappId : ratLappId,
																ajax : 'true'
															},
															function(data) {
																
																document.getElementById("labReview").value="";
																alert(data.message);
																location.reload();
																

															})
	 
	 
}  
</script>		
</body>
</html>
