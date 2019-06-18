<%@ page language="java" contentType="text/html;  charset=UTF-8"
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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

</head> 
<body>
<c:url var="getPremiumByCover" value="/getPremiumByCover" />
<c:url var="getPolicyBuyDetails" value="/getPolicyBuyDetails" />
<c:url var="getComparePolicy"
		value="/getComparePolicy" />
<jsp:include page="../include/patientHeader.jsp" />  

<div class="header">
<!-- Carousel================================================== -->
		<!--<div id="myCarousel" class="carousel carousel-fade slide" data-ride="carousel"> 
 
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active"> <img class="first-slide" src="images/banner1.png" alt="health care">
    </div>
    <div class="item"> <img class="first-slide" src="images/banner1.png" alt="health care"></div>
    <div class="item"> <img class="first-slide" src="images/banner1.png" alt="health care"></div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>-->
<!-- /.carousel --> 
</div>
<div class="clearfix"></div>
<section class="premiumSec">
	<div class="container">
    <div class="header" id="myHeader">
    	<div class="title">Company & Plan Name</div>
        <div class="title">Cover Amount </div>
        <div class="title">Critical Factors </div>
        <div class="title">Premium (Incl. of all taxes)</div>
        <div class="title">&nbsp;</div>
    </div>
    <div class="clearfix"></div>
    <c:forEach items="${companyList}" var="companyList" varStatus="count">
    <form action="${pageContext.request.contextPath}/getPolicyBuyDetails">
     <div class="content">
     <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="premium_blk">
        	<div class="company_nm">
            <a href="#" data-toggle="tooltip"  data-placement="top" title="select to compare"><input type="checkbox" name="checkbox" id="myCheck" class="cd-add-to-cart"  value="${companyList.companyId}"></a>
            
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"> <img src="${pageContext.request.contextPath}/resources/images/.jpg" class="img-responsive" alt="premium_logo">
            <h5>${companyList.companyName}</h5></a>
            <fieldset class="rating">
            
            <input type="hidden" value="${companyList.companyName}" name=companyName>
            
           <input type="hidden" value="${companyList.companyId}" name="companyId" id="companyId">
            <input type="hidden" value="${companyList.betweenAge}" name="age">
             <input type="hidden" value="${companyList.membersType}" name="family">
             <c:forEach var = "i" begin = "1" end ="${companyList.ratings}" >
              <div id="ratStar1">   
             <span class="fa fa-star starChecked" style="color:orange;float:left;"></span>
             </div>
        </c:forEach>
        <c:forEach var = "i" begin = "${companyList.ratings}" end ="4" >
              <div id="ratStar1">   
             <span class="fa fa-star starChecked" style="color:#ccc;float:left;"></span>
             </div>
        </c:forEach>
    </fieldset>
     <h6 class="text-center"><a data-toggle="collapse" data-parent="#accordion" href="#${companyList.companyName}">Reviews</a> </h6> 
            </div>
            <div class="coverage_amt">
            <select id="${companyList.companyId}cover" onChange="getPremium(${companyList.companyId})" name="cover">
            <c:forEach items="${companyList.coverDetails}" var="coverDetails" varStatus="count">
            
										<option value="${coverDetails.premiumId}"><c:out
												value="${coverDetails.cover}" /></option>
									</c:forEach>
           </select>
             <input type="hidden" value="${companyList.coverDetails[0].cover}" name="cover1" id="cover1">    
            </div>
            <div class="critical_fact">
            	 <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><ul  class="list">
            	 
            	 
            	<c:forEach items="${companyList.criticalFactors}" var="critical" varStatus="count">
                	<li>${critical}<br> <span>Single Private Room</span></li>
                 </c:forEach>  
                </ul></a>
            </div>
        	<div class="premium_tax">
        	<%-- <c:forEach items="${companyList.CoverDetails}" var="CoverDetails" varStatus="count"> --%>
            	 <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">₹<h5 id="${companyList.companyId}premium">${companyList.coverDetails[0].premium}</h5><span>Annually</span></a>
            	<%--  </c:forEach> --%> <input type="hidden" value="${companyList.coverDetails[0].premium}" name="premium" id="premium">
            	
            </div>
            <div class="cost">
            	 <a data-toggle="collapse" data-parent="#accordion" href=""><h5> cost per day <br><span id="${companyList.companyId}perDay"">₹${companyList.premiumPerday}</span></h5></a>
                  <p class="text-center"><input type="submit" value="BuyNow"  class="buy_btn" ></p>
             </div>
        </div>
         <div class="clearfix"></div>
        
        <a data-toggle="collapse" data-parent="#accordion" href="#${companyList.companyId}details"><p class="text-center"><strong>show details</strong></p><div class="arrow bounce"> </div></a>
        <div class="clearfix"></div>
      <div id="${companyList.companyId}details" class="panel-collapse collapse">
        <div class="panel-body">
        <strong>Coverage Highlights</strong>
        <hr>
        <c:forEach items="${companyList.companyFeatures}" var="companyFeatures" varStatus="count">
        <ul class="list">
        	<li>${companyFeatures.planName} <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a> </li>
            <li>${companyFeatures.prePostHospitalization} <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
            <li>Network Hospital: ${companyFeatures.networkHospital} <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
                                                          
     <c:if  test="${companyFeatures.coPay=='no'}">
            <li><strike>CoPay</strike> <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
     </c:if> 
     <c:if test="${companyFeatures.coPay=='yes'}">
            <li>CoPay <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
     </c:if>   	
     
     <c:if test="${companyFeatures.coPay=='yes'}">     	 
          	<li>Renevability<a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a> </li>
     </c:if>
     <c:if test="${companyFeatures.coPay=='no'}">     	 
          	<li><strike>Renevability</strike><a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a> </li>
     </c:if>
     
        </ul>
         
       <ul class="list list1">                                  
           <c:if test="${companyFeatures.preExistingDiseaseCover=='no'}">
            <li><strike>PreExistingDiseaseCover</strike> <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>
           <c:if test="${companyFeatures.preExistingDiseaseCover=='yes'}">
            <li>PreExistingDiseaseCover <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
          </c:if>
            
           <c:if test="${companyFeatures.roomRentEligibility=='no'}"> 
            <li><strike>RoomRentEligibility</strike> <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>
           <c:if test="${companyFeatures.roomRentEligibility=='yes'}"> 
            <li>RoomRentEligibility <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>
       
            <c:if test="${companyFeatures.maternityCover=='no'}"> 
            <li><strike>MaternityCover</strike> <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>
           <c:if test="${companyFeatures.maternityCover=='yes'}"> 
            <li>MaternityCover <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>
          
           <c:if test="${companyFeatures.outpatientBenefit=='no'}"> 
            <li><strike>OutpatientBenefit</strike> <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>
           <c:if test="${companyFeatures.outpatientBenefit=='yes'}"> 
            <li>OutpatientBenefit <a href="#" data-toggle="tooltip"  data-placement="right" title="AVAILABLE - Coverage of 60 days pre hospitalization"> <span class="glyphicon glyphicon-question-sign"></span></a></li>
           </c:if>           
         
        </ul>
        </c:forEach>
        </div>
      </div>
      <div id="${companyList.companyName}" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="row">
            <c:forEach items="${companyList.insuranceReview}" var="review" varStatus="count">
                <div class="col-sm-12">
                    <div class="col-sm-10">
                            <p>${review.companyReview}</p>
                            <p class="nm_review"><strong>${review.patientname}</strong></p>
                            <p>Date: ${review.date}</p>
                    </div>
                    <div class="col-sm-2">
                        <div class="photo">
                            <img src="${pageContext.request.contextPath}/resources/images/bnk_pht.jpg" class="img-responsive" alt="photo">
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr>
            </c:forEach>    
                
            </div>
        </div>
      </div>
    </div>
   </div>
   </form>
     </c:forEach>
  </div> 
  
  
  
  
  
  
  <div class="cd-cart-container">
	
	 
 <a href="#0" class="checkout btn cd-cart-trigger" data-toggle="modal" data-target="#exampleModal" id="submit_prog" onclick="getComparePolicy()">Compare</a>
		 
<!-- 		 <input type="submit" id="submit_prog" onclick="getComparePolicy()" value='Compare' style="color:blue" />
 -->		 
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><strong>Compare Health Insurance Offers</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
        <table class="compare_offer" id="table1">
    <thead>    
   
  
    </thead>
    <tbody>
    
    
    </tbody>
    
     
</table>

      </div>
      <hr>
      <%-- <div class="modal_offer">
      <table>
  <tr>
    <td><div class="company_nm">
      	<img src="${pageContext.request.contextPath}/resources/images/premium_logo.jpg" class="img-responsive" alt="cmpny_logo">
        <h5>Health care</h5>
        <p class="text-center"><a href="buy.html" class="buy_btn">Buy Now</a></p>
      </div></td>
    <td><div class="company_nm">
      	<img src="${pageContext.request.contextPath}/resources/images/premium_logo.jpg" class="img-responsive" alt="cmpny_logo">
        <h5>Health care</h5>
        <p class="text-center"><a href="buy.html" class="buy_btn">Buy Now</a></p>
      </div></td>
  </tr>
</table>
      </div> --%>
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
 <script>
 //07-04-2018
window.onscroll = function() {myFunction()};

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
} 
</script>
 
  
  
 
 <script>
$(document).ready(function() {
      var prog = 'input[name="checkbox"]';
    var $submit = $("#submit_prog").hide();
    $(document).on("change", prog, function() {
    	
    	/*
      console.log($(prog).is(":checked"))
      $submit.toggle($(prog).is(":checked"));
      var c[]=$(prog).is(":checked"); */
      var numberOfChecked = $('input:checkbox:checked').length;
      
     // alert("numberOfChecked "+numberOfChecked);
      if(numberOfChecked>1)
    	  {
    	 // $("#submit_prog").toggle();   
    	  $("#submit_prog").show();
    	    if(numberOfChecked>3)
    	  {
    	  alert("Select maximum 3 Companies for compare");
    	  $(this).prop('checked',false);
    	  }  
    	  }
      else
    	  {
    	  $("#submit_prog").hide();
    	  }
      
      
      
     });  
		//$('<input type="checkbox" name="checkbox" value="3">').appendTo("div");
    
   /*  var prog[] =  $("input[name='checkbox']:checked")
    
     $(document).on("change", prog, function() {
    	 
    	 alert("fghjkl "+prog.length);
     }); */
    
    
    
  });
  
</script>


 
 
 
 
 <!-- <script type="text/javascript">
       $(document).ready(function() {                
           $('#myCheck').click(function () {
                if($("#myCheck").is(':checked')){
                    $('#btnApprovepo').css('visibility','visible');                    
                }else{
                    $('#btnApprovepo').css('visibility','hidden');                                             
                }
            });
        });
</script>  -->

<!-- <script type="text/javascript">
       $(document).ready(function() {                
                	$('#myCheck').click(function(){
                		if(this.checked)
                		{
                    $('.cd-cart-trigger').css('visibility','visible');                    
                }else{
                    $('.cd-cart-trigger').css('visibility','hidden');                                             
                }
            });
        });
</script>  -->

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 <script>
 function getPremium(companyId)
 { //alert(companyId);
 var idcov=companyId+"cover";

 var cover=document.getElementById(idcov).value;
 var cover1= document.getElementById(idcov).options[document.getElementById(idcov).selectedIndex].text;
// alert(cover1);
 
 document.getElementById("cover1").value=cover1;
 $
	.getJSON(
			'${getPremiumByCover}',
			{
				cover : cover,
				cover1 : cover1,
				
				ajax : 'true'
			},
			function(data) {
			//alert(data);
				var id=companyId+"premium";
				var id1=companyId+"premium1";
				var perDayId=companyId+"perDay";
			    var perDayCost=data/30;
				//alert(perDayCost);
				document.getElementById(id).innerHTML =data;
				document.getElementById('premium').value =data;
				document.getElementById(perDayId).innerHTML ="₹"+perDayCost;


			});
 
 
}
 
 function getReviews(companyId)
 { //alert(companyId);
	 
	 
	 $
		.getJSON(
				'${getReviewByCompanyId}',
				{
					companyId : companyId,
					
					ajax : 'true'
				},
				function(data) {
				
				//	alert(data);
					

				});
	 
	 
 }
 
 
 
 
 
 
 
 
 
 /* function buynow(companyId,age,family,premiumId)
 {
	 alert(premiumId);
	 var id=premiumId+"premium";
	 
	var cover= document.getElementById(premiumId).options[document.getElementById(premiumId).selectedIndex].text;
	var premium=document.getElementById(id).innerHTML;
	alert(premium);
	
	 var res = family.split("+");
	 var adult=res[0];
	 var child=res[1];
		 
	   alert(premium+"child"+cover); 
	 
	 $
		.getJSON(
				'${getPolicyBuyDetails}',
				{
					companyId : companyId,
					age : age,
					adult : adult,
					child : child,
					premium : premium,
					cover : cover,
					
					ajax : 'true'
				},
				function(data) {
					
					alert(data);
					
					if(data!='' || data!=null)
						{
						window.open("${pageContext.request.contextPath}/showPolicyBuy");
						}

				});
	 
	 
 }
 
 
  */
 
 

 </script>
 
 
 <script>
 function getComparePolicy(companyId) { 
	
//alert("hihi");

 

 
//$(document).ready(function() {
 //   $("button").click(function(){
    	
    	var checkbox = document.getElementsByName("checkbox");
    	var company='';
        var companyId=[];
        var cover=[];
        var premium=[];
       // $.each($("input[name='checkbox']:checked"), function(){     
        	
       for(i=0;i<checkbox.length;i++)	
    	   {
    	   if(checkbox[i].checked===true){
    		   
    		   company +=checkbox[i].value + "";
    		 //  alert(checkbox[i].value);
    		   var id=checkbox[i].value+"cover";
    		   var id1=checkbox[i].value+"premium";
    		 //  alert(id);
    		   
    		    
    		   var cover1 = document.getElementById(id).options[document.getElementById(id).selectedIndex].text;
    		   var premium1=document.getElementById(id1).innerHTML;
    		  
    		   
    		   companyId.push(checkbox[i].value);
    		   cover.push(cover1);
    		//   alert(cover1);
    		   premium.push(premium1);
    	//	   alert("premium"+premium1);
    		   
    	   }
    	   }
    	  
$.getJSON('${getComparePolicy}',
		
		{
	
	  
	         companyId: JSON.stringify(companyId),
	         cover : JSON.stringify(cover),
	         premium : JSON.stringify(premium),
	         
			ajax : 'true'
	
		},

function(data){
		//alert(data);
 var listSize=data.length;
// alert("List Size "+listSize)
		$('#table1 td').remove();
 $('#table1 th').remove();
		 var key=0;
 var tr = $('<tr></tr>');
 tr.append($('<th scope="col"></th>').html("companyName"));
  
  
			for(var i=0;i<listSize;i++)
				{ 
				
				
						//	alert("ffff"+data[i].companyName);
				
				tr.append($('<td></td>').html(data[i].companyName));
			 
				}
			
			
			
			
			$('#table1 tbody').append(tr);
			 tr = $('<tr></tr>');
			 tr.append($('<th scope="col"></th>').html("Plan Name"));
			  
			  
				for(var i=0;i<listSize;i++)
					{ 
					
					
								//alert("ffff"+data[i].int1);
					
								tr.append($('<td></td>').html(data[i].planName));
				 
					}

			 $('#table1 tbody').append(tr);
			 tr = $('<tr></tr>');
			 tr.append($('<th scope="col"></th>').html("Premium"));
			  
			  
				for(var i=0;i<listSize;i++)
					{ 
					
					
							 
					
					tr.append($('<td></td>').html(data[i].int1));
				 
					}
				
				
				$('#table1 tbody').append(tr);
				 tr = $('<tr></tr>');
				 tr.append($('<th scope="col"></th>').html("cover"));
				  
				  
					for(var i=0;i<listSize;i++)
						{ 
						
						
									 
						
									tr.append($('<td></td>').html(data[i].coverAmount));
					 
						}
					
					$('#table1 tbody').append(tr);
					 tr = $('<tr></tr>');
					 tr.append($('<th scope="col"></th>').html("preAndPostHospitalization"));
					  
					  
						for(var i=0;i<listSize;i++)
							{ 
							
							
										 
							
										tr.append($('<td></td>').html(data[i].preAndPostHospitalization));
						 
							}
						$('#table1 tbody').append(tr);
						 tr = $('<tr></tr>');
						 tr.append($('<th scope="col"></th>').html("coPay"));
						  
						  
							for(var i=0;i<listSize;i++)
								{ 
								
								
										 
											tr.append($('<td></td>').html(data[i].coPay));
							 
								}
							$('#table1 tbody').append(tr);
							 tr = $('<tr></tr>');
							 tr.append($('<th scope="col"></th>').html("preExistingDeseaseCover"));
							  
							  
								for(var i=0;i<listSize;i++)
									{ 
									
									
												 
									
												tr.append($('<td></td>').html(data[i].preExistingDeseaseCover));
								 
									}
								$('#table1 tbody').append(tr);
								 tr = $('<tr></tr>');
								 tr.append($('<th scope="col"></th>').html("networkHospital"));
								  
								  
									for(var i=0;i<listSize;i++)
										{ 
										
										
												 
										
													tr.append($('<td></td>').html(data[i].networkHospital));
									 
										}
									$('#table1 tbody').append(tr);
									 tr = $('<tr></tr>');
									 tr.append($('<th scope="col"></th>').html("roomRentEligibility"));
									  
									  
										for(var i=0;i<listSize;i++)
											{ 
											
											 
											
														tr.append($('<td></td>').html(data[i].roomRentEligibility));
										 
											}
										
										$('#table1 tbody').append(tr);
										 tr = $('<tr></tr>');
										 tr.append($('<th scope="col"></th>').html("outpatientBenefit"));
										  
										  
											for(var i=0;i<listSize;i++)
												{ 
												
												
															 
												
															tr.append($('<td></td>').html(data[i].outpatientBenefit));
											 
												}
											
			 
		
	  	 $('#table1 tbody').append(tr);
					
					 
});
}

 



</script>
 
 
</body>
</html>
