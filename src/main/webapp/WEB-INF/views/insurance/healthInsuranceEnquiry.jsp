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
<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head> 
<body>
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
<section class="healthSec1">
<form action="${pageContext.request.contextPath}/getInsurancePremium" method="post">
	<div class="container-fluid">
        <div class="owl-carousel owl-theme">
            <div class="item">
            <div class="col-sm-6">
             <img src="${pageContext.request.contextPath}/resources/images/city.png" class="img-responsive" alt="city">
             </div>
             <div class="col-sm-6">
             <h3>We need a little info to line up the best health insurance quotes for you!<br> <span>Where do you live currently?</span></h3>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.1s">
             <div class="circle_sec" onclick="getCountry('India')">
              <img src="${pageContext.request.contextPath}/resources/images/india.png" class="img-responsive" alt="india">
             </div>
             <h5 onclick="getCountry('India')">India</h5>
             </div>
             <div class="clearfix"></div>
             <hr>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.3s" >
             <div class="circle_sec" onclick="getCountry('US')">
             <img src="${pageContext.request.contextPath}/resources/images/usa.png" class="img-responsive" alt="usa">
             </div>
             <h5 onclick="getCountry('US')">US </h5>
             </div>
             <div class="clearfix"></div>
             <hr>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.5s" >
             <div class="circle_sec">
             <img src="${pageContext.request.contextPath}/resources/images/other.png" class="img-responsive" alt="other">
             </div>
             <div class="form-group">
  			 <h5>Other Country</h5>
  			<input type="text" class="form-control"  id="text_tag_input"  name="tags" placeholder="your Country here" onclick="openNav()">
			</div>
             </div>
             <input type="hidden" id="selectedCountry" name="selectedCountry">
             </div>
             		<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
  <div class="container-fluid">
  <h2>Select countries</h2>
  <p class="text-center"><input type="text" name="search" placeholder="Search.."></p>
  <div class="clearfix"></div>
    <div class="tags_select">
    <div class="row">
    <div class="col-sm-12">
    	<div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">India</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Australia</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Afghanistan</a>
	    </div>
	    <div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">USA</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Canada</a>
	    <a href="javascript:void(0)" onclick="closeNav()">china</a>
	    </div>
	    <div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">Japan</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Brazil</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Zimbabwe</a>
	    </div>
	    <div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">India</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Australia</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Afghanistan</a>
	    </div>
	    </div>
	    <div class="clearfix"></div>
	    <hr>
	     <div class="col-sm-12">
    	<div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">India</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Australia</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Afghanistan</a>
	    </div>
	    <div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">USA</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Canada</a>
	    <a href="javascript:void(0)" onclick="closeNav()">china</a>
	    </div>
	    <div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">Japan</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Brazil</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Zimbabwe</a>
	    </div>
	    <div class="col-sm-3">
	    <a href="javascript:void(0)" onclick="closeNav()">India</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Australia</a>
	    <a href="javascript:void(0)" onclick="closeNav()">Afghanistan</a>
	    </div>
	    </div>
	    </div>
	    </div>
   </div>
  </div>
</div>
            </div>
            <div class="item">
            <div class="col-sm-6">
             <img src="${pageContext.request.contextPath}/resources/images/family.jpg" class="img-responsive" alt="family">
             </div>
             <div class="col-sm-6">
             <h3>We need a little info to line up the best health insurance quotes for you!<br> <span>Tell us about the members your like to insure</span></h3>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.7s">
             <div class="circle_sec">
             <img src="${pageContext.request.contextPath}/resources/images/healthIn.png" class="img-responsive" alt="other">
             </div>
             <h5>Number of adults</h5>
             
              <div class="btn-group" data-toggle="buttons">
    <label class="btn btn-cyan btn-rounded active form-check-label">
        <input class="form-check-input  adult" type="radio" autocomplete="off" name="no_of_adult" id="myRadio6" value="1" checked="checked"> 1 
    </label>

    <label class="btn btn-cyan btn-rounded form-check-label">
        <input class="form-check-input  adult" type="radio" autocomplete="off" name="no_of_adult" id="myRadio7" value="2"  > 2
    </label> 
    </div>
              
             </div>
             <div class="clearfix"></div>
             <hr>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.9s">
             <div class="circle_sec">
              <img src="${pageContext.request.contextPath}/resources/images/healthIn.png" class="img-responsive" alt="other">
             </div>
             <h5>Number of children (Below 21 years)</h5>
              <div class="btn-group" data-toggle="buttons" id="inline_content">
             
              
            
    <label class="btn btn-cyan btn-rounded form-check-label active">
        <input class="form-check-input child" type="radio"    value="0"  id="myRadio1" name="no_of_child" checked="checked"> 0 
    </label>

    <label class="btn btn-cyan btn-rounded form-check-label">
        <input class="form-check-input child" type="radio"  value="1" id="myRadio2" name="no_of_child" > 1
    </label>

    <label class="btn btn-cyan btn-rounded form-check-label">
        <input class="form-check-input child" type="radio"  value="2" id="myRadio3" name="no_of_child"> 2 
    </label>
     <label class="btn btn-cyan btn-rounded form-check-label">
        <input class="form-check-input child" type="radio"  value="3" id="myRadio4" name="no_of_child"> 3
    </label>
</div>
              <span id="result"></span>
              <div class="clearfix"></div>
              <hr>
              <div class="next-owlbtn"><button type="button" class="next_owl">Next</button></div>
             </div>
             </div>
            </div>
            <div class="item">
            <div class="col-sm-6">
             <img src="${pageContext.request.contextPath}/resources/images/family.jpg" class="img-responsive" alt="family">
             </div>
             <div class="col-sm-6">
             <h3>We need a little info to line up the best health insurance quotes for you!<br> <span>How old is the eldest member to be insured?</span></h3>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.1s">
             <div class="circle_sec">
             <img src="${pageContext.request.contextPath}/resources/images/healthIn.png" class="img-responsive" alt="other">
             </div>
             <h5>Select the eldest member age</h5>
            <div class="slidecontainer inputchng">
  <input type="range" min="21" max="100" value="21" class="slider" onfocus="adultAge();" id="myRange">
  <p>Age: <span id="demo" ></span></p>
   <input type="hidden" name="ageAdult1" id="ageAdult1" value='21' > 
</div>
             </div>
             <!--  <div id="2ndAdult">
             <div class="clearfix"></div>
             <hr>
             <div class="city_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.3s">
             <div class="circle_sec">
             <span class="glyphicon glyphicon-heart"></span>
             </div>
          
             <h5>Select Age (Adult 2)</h5>
             <div class="slidecontainer inputchng">
  <input type="range" min="21" max="100" value="50" class="slider" id="myRange1">
  <p>Age: <span id="demo1"></span></p>
     <input type="hidden" name="ageAdult2"  > 
</div>
</div> 
</div>-->
 <div class="form_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.1s">
             <div class="form-group need_talk">
            <p class="text-center"><button type="submit" value="Submit">check your premiums</button></p>
           </div></div>
             </div>
            </div>
           <%--  <div class="item">
            <div class="col-sm-6">
             <img src="${pageContext.request.contextPath}/resources/images/talk.png" class="img-responsive" alt="contact">
             </div>
             <div class="col-sm-6">
             <h3>We need a little info to line up the best health insurance quotes for you!<br> <span>Need to talk? Leave your number.</span></h3>
             <div class="form_sec animate" data-animate="slideInRight" data-duration="1.0s" data-delay="0.1s">
             <div class="form-group need_talk">
  			<input type="text" class="form-control" id="usr" placeholder="First Name">
  			<input type="text" class="form-control" id="usr1" placeholder="Email Id">
            <input type="text" class="form-control" id="usr2" placeholder="Mobile No.">
            <p class="text-center"><button type="submit" value="Submit">check your premiums</button></p>
			</div>
             </div>
             </div>
            </div> --%>
          </div>
    </div>
    </form>
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
$('.animate').scrolla({
		mobile: false,
		once: true
	});


</script>
<script>
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}
$('.tags_select a').click(function() {
    var value = $(this).html();
    var input = $('#text_tag_input');
    input.val(input.val() + value);
    return false;
});

var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function() {
    output.innerHTML = this.value;
}
$('.owl-carousel').on('click', 'h5', function(e) {
	  var carousel = $('.owl-carousel').data('owl.carousel');
	  e.preventDefault();
	  carousel.to(carousel.relative($(this).index()-1));
	});
$('.next_owl').click(function(){
    $('.owl-carousel').trigger('to.owl.carousel', 2)
  });
</script>

<script>
/* document.mainForm.onclick = function(){
if (document.getElementById('myRadio1').checked) {
	   value = document.getElementById('myRadio1').value;
	} else if (document.getElementById('myRadio2').checked) {
	   value = document.getElementById('myRadio2').value;
	} else if (document.getElementById('myRadio3').checked) {
	   value = document.getElementById('myRadio3').value;
	}
	alert(value);
}  */
/* 
$(document).ready(function() {
    $('.adult').change(function() {
    	var val=$(this).val();
       alert('adult ' +val);
  
       
       if(val=='1')
    	   {
    	  
    	  
    	   alert("1");
    	   }
       if(val=='2')
	   {
    	   
    	   //document.getElementById('2ndAdult');
    	   
    	   
    	   
    	   
    	   var strVar="";
    	   strVar += " <div class=\"clearfix\"><\/div>";
    	   strVar += "             <hr>";
    	   strVar += "             <div class=\"city_sec animate\" data-animate=\"slideInRight\" data-duration=\"1.0s\" data-delay=\"0.3s\">";
    	   strVar += "             <div class=\"circle_sec\">";
    	   strVar += "             <span class=\"glyphicon glyphicon-heart\"><\/span>";
    	   strVar += "             <\/div>";
    	   strVar += "          ";
    	   strVar += "             <h5>Select Age (Adult 2)<\/h5>";
    	   strVar += "             <div class=\"slidecontainer inputchng\">";
    	   strVar += "  <input type=\"range\" min=\"21\" max=\"100\" value=\"50\" class=\"slider\" id=\"myRange1\">";
    	   strVar += "  <p>Age: <span id=\"demo1\"><\/span><\/p>";
    	   strVar += "     <input type=\"hidden\" name=\"ageAdult2\"  > ";
    	   strVar += "<\/div>";
    	   strVar += "<\/div>";

 		  $('#2ndAdult').append($(strVar)); 

	  // alert("2");
	   }
    	   
    });
});

$(document).ready(function() {
    $('.child').change(function() {
    	 alert('child '+$(this).val());
    });
});

 */


function getCountry(selectedCountry)
{
	//alert(selectedCountry);
	document.getElementById('selectedCountry').value=selectedCountry;
	
	}
</script>



<script type="text/javascript">

  var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;

slider.oninput = function() {
	
 
  output.innerHTML = this.value;
  document.getElementById("ageAdult1").value=this.value;
 
}

 

</script>







</body>
</html>
             