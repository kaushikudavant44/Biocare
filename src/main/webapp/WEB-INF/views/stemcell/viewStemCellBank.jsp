<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />

<title>View Stem Cell View</title>       
    
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chosen.css">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

<link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-dropdownhover.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/animate%20(1).css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">

<style>
.soon-blk { background:#fff; padding:200px 150px;}
.soon-blk h3 { font-size:90px; color:#333; text-align:center; font-weight:bold;  font-family: PlayfairDisplay-BlackItalic;}
.pad-0 { padding:0px;}
.stem-logo { padding: 50px 150px 0;}
.img-center { text-align: center;  display: inline-block;}
.typewriter h3 {
  color: #000;
  font-family: monospace;
  overflow: hidden; /* Ensures the content is not revealed until the animation */
  border-right: .10em solid #a5cd39; /* The typwriter cursor */
  white-space: nowrap; /* Keeps the content on a single line */
  margin: 0 auto; /* Gives that scrolling effect as the typing happens */
    animation: 
    typing 3.5s steps(30, end),
    blink-caret .0s step-end infinite;
}

/* The typing effect */
@keyframes typing {
  from { width: 0 }
  to { width: 100% }
}

/* The typewriter cursor effect */
@keyframes blink-caret {
  from, to { border-color: transparent }
  90% { border-color: Green }
}
</style>


</head>

<!-- NAVBAR
================================================== -->
<body>
 <c:url var="getCityByStateId" value="/getCityByStateId" />
  <c:url var="getStateByCountryId" value="/getStateByCountryId" />
  <c:url var="getCityByStateId" value="/getCityByStateId" />

 <c:url var="getStemCellReviewBystemcellBankId" value="/getStemCellReviewBystemcellBankId" /> 
 
 <div class="col-md-6 col-sm-6 pad-0">
 <div class="stem-logo text-center"><img src="${pageContext.request.contextPath}/resources/images/stem_logo.jpg" class="img-responsive img-center"alt="logo"></div>
 	<div class="typewriter soon-blk ">
 		<h3>Coming Soon</h3>
 	</div>
 </div>
 <div class="col-md-6 col-sm-6 pad-0">
 
  <img src="${pageContext.request.contextPath}/resources/images/stembg.jpg" class="img-responsive" alt="health care"> 
 </div>
 
 
	<%-- <jsp:include page="../include/stemcellHeader.jsp" />  --%>
	  
	<!-- <section id="headign-bg">
		<div class="container">
			<div class="page-title">
				<h2>Stem-Cell Banks</h2>
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="#">Pages</a></li>
					<li class="active"><a>Appointment</a></li>
				</ul>
			</div>
		</div>
	</section> -->



	<%-- <section id="appointment">
		<div class="container">
		
		<h1 align="center">Comming Soon...</h1>

			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="appointment-bg">
						<h4>StemCell Bank!</h4>
						<form action="${pageContext.request.contextPath}/getStemCellBank" method="get">
						<div class="form-group">
						     <label for="state">Country</label>
					<select  class="input-text"  id="countryId" name="countryId" onChange="getStateBYCountry()">
                  <option>--select--</option>
							 <c:forEach items="${countryList}" var = "countryList">
                             <option value="${countryList.countryId}">${countryList.countryName}</option>
                             </c:forEach>
                  </select>
						</div>
						
						
				<div class="form-group">
						   <label for="state">State</label>
						                <select  class="input-text"  id="stateId" name="stateId" onChange="getCityBYState()">
							 
                             <option value="">--select--</option>
                          </select>
						</div>
						
					
			 <div class="form-group">
					       <label for="state">City</label>
					
<select  class="input-text"  id="cityId" name="cityId" >
							 <option value="">--select--</option> 
                    </select>
						</div>
						
                	 
<div class="form-group">
								<input type="submit" value="Submit" class="btn btn-success">
							</div>
						</form>

					</div>


				</div>
				<div class="col-md-8 col-sm-8 ">
					<div class="vertical-scrollbar">
						<div class="full-width">
							
							<c:forEach items="${getStemcellBankDetails}" var="getStemcellBankDetails" varStatus="count">
							<div class="row">
								<div class="col-md-3 col-sm-3">
									<div class="picimg">
										<img src="${pageContext.request.contextPath}/resources/images/doctor1.jpg" class="img-responsive"
											alt="doctor">
									</div>

								</div>
								<div class="col-md-9 col-sm-9 ">
									<div class="left-side">
										<h4 class="drname"><c:out value="${getStemcellBankDetails.stemCellBankName}" /></h4>
										<span><c:out value="${getStemcellBankDetails.stemCellBankAddress}" /></span>
										<p>
											<strong><c:out value="${getStemcellBankDetails.contact1}" /></strong>
										</p>
										<p><c:out value="${getStemcellBankDetails.emailId}" /></p>

									</div>
									
									<div class="right-side">
										<span><c:out value="${getStemcellBankDetails.rating}" /></span>
										
										
										
										
										
										 <c:forEach var = "i" begin = "1" end = "${getStemcellBankDetails.rating}">
       									<span class="fa fa-star starChecked" style="color:orange;float:left;" id="rating" name="rating"></span>
     										 </c:forEach>
										
										
										<c:forEach var = "i" begin = "${getStemcellBankDetails.rating}" end = "4">
       									<span class="fa fa-star starChecked" style="float:left;" id="rating" name="rating"></span>
     										 </c:forEach>
     										 
										<!-- <span class="fa fa-star starChecked" style="color:blue;float:left;" id="rating" name="rating"></span> -->
										
										<!-- <script>
										var rating="";

										rating +=" <div id=\"ratStar1\">";
 
										var calRating= Math.round(reviewList.rating);
										for(var r=0;r<calRating;r++)
										  {
										  
											rating +="<span class=\"fa fa-star starChecked\" style=\"color:blue;float:left;\"><\/span> ";

										  }
										for(var r=calRating;r<5;r++)
										  {
										  rating +="<span class=\"fa fa-star \" style=\"float:left;\"><\/span>";
										 
										  }

										rating +="<\/div>"; 
										</script> -->
					
										
									 <p data-toggle="collapse" href="#collapseExample${getStemcellBankDetails.stemCellBankId}"
											role="button" aria-expanded="false"
											aria-controls="collapseExample" onclick="getStemCellBankReview (${getStemcellBankDetails.stemCellBankId})">Review</p> 
											
											
											
							<form action="${pageContext.request.contextPath}/showEnrollPatientStemCell" method="GET">
											
								<input type="hidden" name="stemCellBankId" id="stemCellBankId">
											
								<input type="submit" value="Enroll" class="btn btn-success">
								</form>
								
								
									</div>
								</div>

							 </div>
							 <div class="clearfix"></div>
						<hr>


							 <div class="collapse collapse-appointment collapseExample" id="collapseExample${getStemcellBankDetails.stemCellBankId}">
								<div class="card card-body">
									<div class="white-bg">
										<div class="reviws-img">
											<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-responsive">
										</div>its HardCoded Reviews, its hardcoded reviews....
										...good better best,,,reviews,,,its hardcoded..copy element..dummy element...
										<div class="date text-right"></div>
									</div>
								</div>

								<div class="card card-body">
									<div class="white-bg text-right">
										<div class="reviws-img-right">
											<img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-responsive">
										</div>
										Anim pariatur cliche reprehenderit, enim eiusmod high life
										accusamus terry richardson ad squid. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. <span class="text-left">Dr.
											Vaibhav Joy</span>
										<div class="date text-left">28-3-2018</div>
									</div>
								</div>
 


						</div> 
						</c:forEach>
						
						
						<div class="full-width">
							<div class="row">
								<div class="col-md-3 col-sm-3">
									<div class="picimg">
										<img src="${pageContext.request.contextPath}/resources/images/doctor.jpg" class="img-responsive"
											alt="doctor">
									</div>

								</div>
								<div class="col-md-9 col-sm-9 ">
									<div class="left-side">
										<h4 class="drname">CBR</h4>
										<span>contact2</span>
										<p>
											<strong>address</strong>
										</p>
								<p>Contact</p>

									</div>
									<div class="right-side">
										<span>rating</span>
										<p data-toggle="collapse" href="#collapseExample1"
											role="button" aria-expanded="false"
											aria-controls="collapseExample1">Reviwes</p>
										<a class="appoinment-btn hvr-rectangle-in" data-toggle="modal"
											data-target="#largeModal" href="#">Make an Appointment</a>
									</div>
								</div>

							</div>
							<div class="collapse" id="collapseExample1">
								<div class="card card-body">
									<div class="white-bg">
										<div class="reviws-img">
											<img src="images/doctor3.jpg" class="img-responsive">
										</div>
										Anim pariatur cliche reprehenderit, enim eiusmod high life
										accusamus terry richardson ad squid. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. <span class="text-right">Dr.
											Vaibhav Joy</span>
										<div class="date text-right">28-3-2018</div>
									</div>
								</div>

								<div class="card card-body">
									<div class="white-bg text-right">
										<div class="reviws-img-right">
											<img src="${pageContext.request.contextPath}/resources/images/doctor3.jpg" class="img-responsive">
										</div>
										Anim pariatur cliche reprehenderit, enim eiusmod high life
										accusamus terry richardson ad squid. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. <span class="text-left">Dr.
											Vaibhav Joy</span>
										<div class="date text-left">28-3-2018</div>
									</div>
								</div>

								<div class="card card-body">
									<div class="white-bg">
										<div class="reviws-img">
											<img src="${pageContext.request.contextPath}/resources/images/doctor3.jpg" class="img-responsive">
										</div>
										Anim pariatur cliche reprehenderit, enim eiusmod high life
										accusamus terry richardson ad squid. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. <span class="text-right">Dr.
											Vaibhav Joy</span>
										<div class="date text-right">28-3-2018</div>
									</div>
								</div>


								<div class="card card-body">
									<div class="white-bg text-right">
										<div class="reviws-img-right">
											<img src="${pageContext.request.contextPath}/resources/images/doctor3.jpg" class="img-responsive">
										</div>
										Anim pariatur cliche reprehenderit, enim eiusmod high life
										accusamus terry richardson ad squid. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. <span class="text-left">Dr.
											Vaibhav Joy</span>
										<div class="date text-left">28-3-2018</div>
									</div>
								</div>
							</div>
						</div>

						<div class="full-width">
							<div class="row">
								<div class="col-md-3 col-sm-3">
									<div class="picimg">
										<img src="${pageContext.request.contextPath}/resources/images/doctor.jpg" class="img-responsive"
											alt="doctor">
									</div>

								</div>
								<div class="col-md-9 col-sm-9 ">
									<div class="left-side">
										<h4 class="drname">xyz</h4>
										<span>Om Sai Hospital</span>
										<p>
											<strong>address</strong>
										</p>
																				<p>Contact</p>

									</div>
									<div class="right-side">
										<span>rating</span>
										<p>Reviwes</p>
										<a class="appoinment-btn hvr-rectangle-in" data-toggle="modal"
											data-target="#largeModal" href="#">Make an Appointment</a>
									</div>
								</div>

							</div>
						</div>

						<div class="full-width">
							<div class="row">
								<div class="col-md-3 col-sm-3">
									<div class="picimg">
										<img src="${pageContext.request.contextPath}/resources/images/doctor.jpg" class="img-responsive"
											alt="doctor">
									</div>

								</div>
								<div class="col-md-9 col-sm-9 ">
									<div class="left-side">
										<h4 class="drname">ABC</h4>
										<span>Om Sai Hospital</span>
										<p>
											<strong>address</strong>
										</p>
																				<p>Contact</p>

									</div>
									<div class="right-side">
										<span>rating</span>
										<p>Reviwes</p>
										<a class="appoinment-btn hvr-rectangle-in" data-toggle="modal"
											data-target="#largeModal" href="#">Make an Appointment</a>
									</div>
								</div>

							</div>
						</div>

						<div class="full-width">
							<div class="row">
								<div class="col-md-3 col-sm-3">
									<div class="picimg">
										<img src="images/doctor.jpg" class="img-responsive"
											alt="doctor">
									</div>

								</div>
								<div class="col-md-9 col-sm-9 ">
									<div class="left-side">
										<h4 class="drname"></h4>
										<span>Om Sai Hospital</span>
										<p>
											<strong>address</strong>
										</p>
										<p>Contact</p>
									</div>
									<div class="right-side">
										<span>rating</span>
										<p>Reviwes</p>
										<a class="appoinment-btn hvr-rectangle-in" data-toggle="modal"
											data-target="#largeModal" href="#">Make an Appointment</a>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!--<div class="row">
                	<div class="col-md-12 col-sm-12">
                    	<div class=""></div>
                    	
                    </div>
                </div>-->

					<!--<div class="owl-carousel owl-theme">
      <div class="item">
       
          <img src="images/doctor.jpg" class="img-responsive" alt="doctor">
           <div class="service-blk">
            <h3>Traumatology</h3>
            <a class="appoinment-btn hvr-rectangle-in" data-toggle="modal" data-target="#largeModal" href="#">Make an Appointment</a>
        </div>
      </div>
      <div class="item">
          <img src="images/doctor1.jpg" class="img-responsive" alt="doctor">
           <div class="service-blk">
            <h3>Pediatric</h3>
            <a class="appoinment-btn hvr-rectangle-in" data-toggle="modal" data-target="#largeModal" href="#">Make an Appointment</a>
        </div>
      </div>
      <div class="item">
          <img src="images/doctor3.jpg" class="img-responsive" alt="doctor">
          <div class="service-blk">
            <h3>Dental</h3>
            <a class="appoinment-btn hvr-rectangle-in" data-toggle="modal" data-target="#largeModal" href="#">Make an Appointment</a>
        </div>
      </div>
      <div class="item">
       
           <img src="images/doctor4.jpg" class="img-responsive" alt="doctor">
            <div class="service-blk">
            <h3>Urology</h3>
            <a class="appoinment-btn hvr-rectangle-in" data-toggle="modal" data-target="#largeModal" href="#">Make an Appointment</a>
        </div>
      </div>
      <div class="item">
          <img src="images/doctor1.jpg" class="img-responsive" alt="doctor">
          <div class="service-blk">
            <h3>Traumatology</h3>
            <a class="appoinment-btn hvr-rectangle-in" data-toggle="modal" data-target="#largeModal" href="#">Make an Appointment</a>
        </div>
      </div>
      <div class="item">
          <img src="images/doctor.jpg" class="img-responsive" alt="doctor">
           <div class="service-blk">
            <h3>Pediatric</h3>
            <a class="appoinment-btn hvr-rectangle-in" data-toggle="modal" data-target="#largeModal" href="#">Make an Appointment</a>
        </div>
      </div>
    </div>-->

				</div>
				</div>
				</div>
		 
			</div>
		</div>

	</section> --%>

	<div class="bs-example">
		<!-- Large modal -->

		<div id="largeModal" class="modal fade bs-example-modal-lg"
			tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Timing</h4>
					</div>
					<div class="modal-body">
						<ul class="timing">
							<li>1:00</li>
							<li>2:00</li>
							<li>3:00</li>
							<li>4:00</li>
							<li>5:00</li>
							<li>6:00</li>
							<li>7:00</li>
							<li>8:00</li>
							<li>9:00</li>
							<li>10:00</li>
							<li>11:00</li>
							<li>12:00</li>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-primary">OK</button>
					</div>
				</div>
			</div>
		</div>
  <%-- <jsp:include page="../include/stemcellFooter.jsp" /> --%> 
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chosen.jquery.min.js"></script>
		<!--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>-->
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
		<!-- Just to make our placeholder images work. Don't actually copy the next line! -->

		<script src="${pageContext.request.contextPath}/resources/js/holder.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>

		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/chosen.jquery.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/prism.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/resources/js/init.js" type="text/javascript" charset="utf-8"></script>


<script src="js/bootstrap-dropdownhover.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
         function getStemCellBankReview(stemCellBankId)
         {
        	//alert(stemCellId);
        	 //getStemCellReview(stemCellId)
        	 var i=0; 
        	 $
				.getJSON(
						'${getStemCellReviewBystemcellBankId}',
						{
							
							stemCellBankId : stemCellBankId,
							 
							ajax : 'true'
						},
						function(data) {
							//alert(data);
							 $("#collapseExample"+stemCellBankId).empty();
							 $.each(
										data,
										function(key, reviewList) {

											//stemCellReviewAppend(stemCellId, reviewList, i);
											stemCellBankReviewAppend(stemCellBankId, reviewList, i);
							i=i+1;
							
							}) 
						});
        	 // StemCellReviewAppend(stemCellId);  
        	 // $('#collapseExample').append(tr);
        	  }
         </script>
         

 

		<script src="js/owl.carousel.js"></script>
		<script>
            $(document).ready(function() {
              $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                responsiveClass: true,
				autoplay:true,
                responsive: {
                  0: {
                    items: 2,
                    nav: true
                  },
				  480: {
                    items: 3,
                    nav: false
                  },
                  600: {
                    items: 3,
                    nav: false
                  },
                  1000: {
                    items: 3,
                    nav: false,
                    loop: false,
                    margin:15,
					autoplay:true
                  }
                }
              })
            })
            
          </script>



		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.js"
			charset="UTF-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.fr.js"
			charset="UTF-8"></script>




		<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
	});
</script>
<script>
 var rating="";

rating +=" <div id=\"ratStar1\">";

var calRating= Math.round(reviewList.rating);
for(var r=0;r<calRating;r++)
  {
  
	rating +="<span class=\"fa fa-star starChecked\" style=\"color:blue;float:left;\"><\/span> ";

  }
for(var r=calRating;r<5;r++)
  {
  rating +="<span class=\"fa fa-star \" style=\"float:left;\"><\/span>";
 
  }

rating +="<\/div>"; 
 
</script>

 

<script type="text/javascript">


  function stemCellBankReviewAppend(stemCellBankId, reviewList, i)
        {
        	 
         	  var strVar="";
        	  if((i%2)==0)
        		  {
        		  
        		  strVar += "<div class=\"card card-body\">";
        		  strVar += "									<div class=\"white-bg\">";
        		  strVar += "										<div class=\"reviws-img\">";
                  strVar += "											<img src=\"${pageContext.request.contextPath}\/resources\/images\/avatar.jpg\" class=\"img-responsive\">";
        		  strVar += "										<\/div>"+reviewList.review+"<\/span><br/>";
        		  strVar += 										+rating;
                  strVar += "										";
        		  strVar += "										<!-- <p id=\"rating\"><\/p> -->";
        		  strVar += "										";
        		  strVar += "										<div class=\"date text-right top_spc\">"+reviewList.patientName+"<\/div>";
        		  strVar += "										<div class=\"date text-right\">"+reviewList.date+"<\/div>";
        		  strVar += "									<\/div>";
        		  strVar += "								<\/div>";
        		  strVar += "";
        		  }
        	  
        	  else{
        		  strVar += "								<div class=\"card card-body\">";
        		  strVar += "									<div class=\"white-bg text-right\">";
        		  strVar += "										<div class=\"reviws-img-right\">";
        		  strVar += "											<img src=\"${pageContext.request.contextPath}\/resources\/images\/avatar.jpg\" class=\"img-responsive\">";
        		  strVar += "										<\/div>"+reviewList.review+"<\/span><br/>";
        		  strVar += "										Anim pariatur cliche reprehenderit, enim eiu";
        		  strVar += "										accusamus terry richardson ad squid. Nihilkkk";
        		  strVar += "										helvetica, craft beer labore wes anderson cr";
        		  strVar += "										sapiente ea .<span class=\"text-left\"><div class=\"date text-left top_spc1 \">"+reviewList.patientName+"<\/div>";
        		  strVar += "								<\/span>";
        		  strVar += "										<div class=\"date text-left\">"+reviewList.date+"<\/div>";
        		  strVar += "									<\/div>";
        		  strVar += "								<\/div>";

        	  }
    		  
    		  
    		 
    		  $('#collapseExample'+stemCellBankId).append($(strVar)); 
         }
         </script>
    <script>

 function getStateBYCountry() {
											 
	     
		 var countryId=document.getElementById("countryId").value; 
		 
		  
		 $
														.getJSON(
																'${getStateByCountryId}',
																{
																	countryId : countryId,
																	
																	ajax : 'true'
																},
																function(data) {
																	var html = '<option value="" disabled="disabled" selected >Choose state...</option>';		

																	
																	
																	var len = data.length;
																	var strVar="";
																	for (var i = 0; i < len; i++) {
																		
																		strVar += "<option value="+data[i].stateId+">"+data[i].stateName+"<\/option>";
																 
																	} 
																	html += '</option>';
																	$('#stateId').html(html);
																	$("#stateId").trigger("chosen:updated");
																	 $('#stateId').append($(strVar))

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

</body>
</html>