<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link href="${pageContext.request.contextPath}/resources/css/videoCallPat.css" rel="stylesheet" type="text/css">
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
</head> 
<body>
<jsp:include page="../include/patientHeader.jsp" />  

 <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  <c:url var="submitDoctorRating" value="/submitDoctorRating" />		
  <c:url var="submitLabRating" value="/submitLabRating" />	
<section class="doc_login">
<div class="dashboard_nm text-center"><h4>Add Patient History </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <div class="bhoechie-tab-content active">
                <div class="inssurance_buy padding_none">
	
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <!-- <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Patient Details</a></li> -->
   <!--  <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Add Proper History</a></li> -->
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  <!-- <div role="tabpanel" class="tab-pane fade in active" id="home">
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
     <p><a href="#" class="history_sbmt">submit</a></p>
  </div> -->
  
   <div class="doc_availble dr-site">
  <div role="tabpanel" class="tab-pane fade in active" id="profile"><div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <form  action="${pageContext.request.contextPath}/submitPatientPersonalHistoryRegProcess" method="POST"> 
  
  <input type="hidden" name="patientId" value="${patientId}">
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
        <textarea placeholder="Answer" name="Chief"></textarea>
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
         
        
        <div class="cont_blk past_history">
         
            <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                        
                          <label><input type="checkbox"  name="illness" value="1" >Rheumatic Fever</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox"  name="illness" value="2">Tuberculosis</label>
                          
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
                
            <span class="input input--nao">
                            <div class="gender_sec"> 
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="3">Malaria</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox"  name="illness" value="4">Kala-azar</label>
                         
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
            <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="5">Jaundice</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox" name="illness" value="6">STD (sexually transmitted diseases like, Aids etc)</label>
                         
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
            <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="7">H/O Contact with persons suffering from tuberculosis or any other disease</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox" name="illness" value="8">H/O exposure to STD</label>
                         
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span> 
                    <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="9">Any illness which demanded 'blood transfusion' e.g- accidents etc</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox" name="illness" value="10">Childhood illness (pertusis etc.)</label>
                         
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
                    <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="11">Systemic hypertension</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox" name="illness" value="12">Diabetes mellitus</label>
                         
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
                    <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="13">Trauma or Injury</label>
                          </div>
                             <div class="checkbox">
                          <label><input type="checkbox" name="illness" value="14">Past Hospital admissions</label>
                         
                        </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
                    <span class="input input--nao">
                            <div class="gender_sec">
                             <div class="checkbox">
                                       
                          <label><input type="checkbox" name="illness" value="15">Any other major medical or psychlatric illness in the past</label>
                          </div>
                            </div>
                        <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                        </svg>
                    </span>
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
                            <div class="gender_sec" id='form-id'>
                            
    <input   name='test' type='radio' value="a" />Yes
   
    <input name='test' type='radio' value="NO" /> No

<div id='show-me' style='display:none'> <textarea  placeholder="Number of children" name="Maritalstatus" onkeypress="return IsNumeric(event);"></textarea></div>                  
                            </div>
                       
                    
        </div>
        
        <div class="clearfix"></div>
        <hr>
         <strong>2. Occupation (nature and environment job) and education, unemployment</strong>
        <textarea placeholder="Answer" name="Occupation"></textarea>
         <hr>
         <strong>3. Income (asked indirectly) and social status</strong>
        <textarea placeholder="Answer" name="Income"></textarea>
        <hr>
         <strong>4. Addiction (tea, coffee, smoking, alcoholism, substance abuse e.g chewing tobacco, ganja, heroin; try to estimate the amount of consumption of tobacco or alcohol)</strong>
        <textarea placeholder="Answer" name="Addiction"></textarea>
        <hr>
         <strong>5. Dietary habit(for diagnosis of avitaminosis, malnutrition, obesity)</strong>
        <textarea placeholder="Answer" name="Dietary" ></textarea>
        <hr>
         <strong>6. History of Contraception</strong>
        <textarea placeholder="Answer" name="Contraception"></textarea>
        <hr>
         <strong>7. High Risk behaviour (e.g IV drug abuse, multiple sexual partner, homosexuality etc)-important in hepatitis B or C infection, AIDS and SBE.</strong>
        <textarea placeholder="Answer" name="HighRiskbehaviour" ></textarea>
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
     
        <textarea placeholder="Answer" name="FamilyHistory" d></textarea>
         
       
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
       
        <div class="gender_sec" id='form-id'>
                            
    <input name="test1" type='radio' value="a" />yes
   
    <input   name="test1" type='radio' value="NO" />no

<div id='show-me1' style='display:none'><textarea placeholder="Answer" name="Treatment" ></textarea></div>
                            </div>
                        
                 
       
           
        <div class="clearfix"></div>
        <hr>
         <strong>2.Any H/O drug allergy or reactions.</strong>
    
     <div class="gender_sec" id='form-id'>
                            
    <input name="test2"  type='radio' value="a" />Yes
   
    <input name="test2"  type='radio' value="NO" /> No

    <div id='show-me2' style='display:none'> <textarea  placeholder="Answer" name="drugallergy" ></textarea></div>
                            </div>
       
              
       <div class="clearfix"></div>
         <hr>
         <strong>3.Any surgical intervention or H/O accidents in significant past.</strong>
         <div class="gender_sec" id='form-id'>
                          
    <input  name='test3' type='radio' value="a" />Yes
   
    <input name='test3' type='radio' value="NO" /> No

<div id='show-me3' style='display:none'> <textarea  placeholder="Answer" name="surgicalintervention" ></textarea></div>
                            </div>
       
       
               
         <div class="clearfix"></div>
        <hr>
         <strong>4. Prolonged use of oral contraceptives (may precipitate CVA), penicillamine(used in wilson's disease; may develop nephrotic syndrome), vitamin C (may produce oxalate stone) etc.</strong>
         <div class="gender_sec" id='form-id'>
                            
    <input name='test4' type='radio' value="a" />Yes
   
    <input name='test4' type='radio' value="NO" /> No

<div id='show-me4' style='display:none'> <textarea  placeholder="Answer" name="contraceptives"></textarea></div>
                            </div>
       
              
        <div class="clearfix"></div>
        <hr>
         <div class="clearfix"></div>
       <strong>5. Blood transfusion</strong>
      
      <div class="panel-body">
     
        <textarea placeholder="Answer" name="Bloodtransfusion" d></textarea>
       
         
      </div>
    
    
                        
                   
        <div class="clearfix"></div>
        <hr>
         <strong>6. Intake of NSAID (may produce acute gastric erosion, NSAID-induced asthma etc.)</strong>
      
      <div class="panel-body">
        <textarea placeholder="Answer" name="Intake" d></textarea>
      </div>     
                  
         <div class="clearfix"></div>
        <hr>
         <strong>7. Regular user of oral contraceptives, vitamins, laxatives, sedatives or herbal remedies.</strong>
      
                           
      
      <div class="panel-body">
        <textarea placeholder="Answer" name="contraceptives1" d></textarea>
      </div>
                        
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
        <textarea placeholder="Answer" name="PsychologicalHistory" d></textarea>
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
        <textarea placeholder="Answer" name="Menarche" d></textarea>
        <hr>
         <strong>2.Duration of the period.</strong>
        <textarea placeholder="Answer" name="durationperoid" d></textarea>
        <hr>
         <strong>3.Quantity of blood loss(usually assessed by number of pads consumed or passage of clots).</strong>
        <textarea placeholder="Answer" name="bloodloss"></textarea>
        <hr>
         <strong>4.Dysmenorrhoea, amenorrhoea or other menstrual irregularities.</strong>
        <textarea placeholder="Answer" name="Dysmenorrhoea" d></textarea>
        <hr>
         <strong>5.Date of last menstrual period.</strong>
        <textarea placeholder="Answer" name="menstrual" d></textarea>
        <hr>
         <strong>6.Menopause, post-menopausal bleeding.</strong>
        <textarea placeholder="Answer" name="Menopause" d></textarea>
        <hr>
         <strong>7.Obstetric history: </strong>
         <div class="clearfix"></div>
         	<strong>a) No.of pregnancies</strong> 
             <textarea placeholder="Answer" name="pregnancies" d></textarea>
             <hr>
            <strong> b) Outcome of pregnancies : H/O abortions or carried to term:live birth (male/female)</strong>
             <textarea placeholder="Answer" name="Outcomepregnancies" d></textarea>
              <hr>
             <strong>c) Complications during pregnancy (e.g hypertension, gestational diabetes mellitus)</strong>
             <div class="cont_blk past_history">
            
             <div class="gender_sec" id='form-id'>
                            
    <input   name='test5' type='radio' value="a" />Yes
   
    <input name='test5' type='radio' value="NO" /> No

<div id='show-me5' style='display:none'> <textarea  placeholder="Answer" name="Complicationspregnancy"></textarea></div>
                            </div>
                </div>
                <div class="clearfix"></div>
                 <hr>
            <strong> d) Mode of delivery (Vaginal , foreeps, caesaream)</strong>
             <textarea placeholder="Answer" name="Modedelivery" d></textarea>
              <hr>
            <strong> e) Last child birth</strong>
             <input placeholder="Answer" type="text" class="datepicker lstchild" name="Lastbirth" disable>
        
      </div>
    </div>
  </div>   
  <div class="clearfix"></div>

<!--   <p><strong>Notice:</strong> Lorem Ipsum is simply dummy text of the printing and typesetting industry.</label></p>
 -->  <p><label><input type="checkbox" value=""> &nbsp;<strong>I Agree</strong></label></p>
  <div class="clearfix"></div>
 
  <input type="submit" class="history_sbmt btn-fr-all" name="Submit">
    </form>  
  
   
   </div></div>
   </div>
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
<%-- <jsp:include page="../include/videoCall.jsp"/> --%>
  
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
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
  <script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script>


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
$('.datepicker').datepicker({ format: "dd-mm-yyyy", autoclose: true})
$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
</script>
<script>
  /* $('#datetimepicker1').datetimepicker({ format: 'DD/MM/YYYY' });
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
 $("input[name='test']").click(function () {
	    $('#show-me').css('display', ($(this).val() === 'a') ? 'block':'none');
	});
  $("input[name='test1']").click(function () {
	    $('#show-me1').css('display', ($(this).val() === 'a') ? 'block':'none');
	}); 
	 
   $("input[name='test2']").click(function () {
	    $('#show-me2').css('display', ($(this).val() === 'a') ? 'block':'none');
	});  
  

$("input[name='test3']").click(function () {
	    $('#show-me3').css('display', ($(this).val() === 'a') ? 'block':'none');
	});
$("input[name='test4']").click(function () {
	    $('#show-me4').css('display', ($(this).val() === 'a') ? 'block':'none');
	});
$("input[name='test5']").click(function () {
    $('#show-me5').css('display', ($(this).val() === 'a') ? 'block':'none');
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
		 
  
  
  <!-- <script>$('input.example').on('change', function() {
	    $('input.example').not(this).prop('checked', false);  
	});</script>
  
  -->
  
  
</body>
</html>
