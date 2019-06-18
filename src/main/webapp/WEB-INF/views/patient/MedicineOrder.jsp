<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
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
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/redmond/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobipanel.css"/>	


</head> 
<body>
 <jsp:include page="../include/patientHeader.jsp"/> 
<div class="clearfix"></div>

<seaction id="medicine">
 <jsp:include page="../include/patientLeftMenu.jsp"/> 
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
    <h1> Order Medicine Online </h1>
    <div class="bhoechie-tab-content active">
    <div class="row">
        <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Upload Prescription">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-save"></i>
                            </span>
                        </a>
                       <h4 class="small-title"> Upload Prescription</h4>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step2" role="tab" title="Select Medical">
                           <span class="round-tab">
                                <i class="glyphicon glyphicon-home"></i>
                            </span>
                            
                        </a>
                        <h4 class="small-title">Address </h4>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step3" role="tab" title="Address">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                        <h4 class="small-title"> Select Medical  </h4>
                    </li>

                    <!--<li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                    </li>-->
                </ul>
            </div>

            
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="step1">
                        <div class="step1">
                            <div class="medicine-blk">
                
                	<!--<button onclick="myFunction()">UPLOAD PRESCRIPTION  </button>-->
                </div>
                <div class="table-responsive" id="myDIV">
                
                
                
                	<table width="100" border="1" class="medicine-tbl">
  <tr>
    <td style="font-weight:600">Date</td>
    <td style="font-weight:600">Hospital</td>
    <td style="font-weight:600">Doctor</td>
    <td style="font-weight:600">View Prescription</td>
    <td style="font-weight:600">Send</td>
  </tr>
  <tr>
    <td> 26 / 6 / 2018</td>
    <td>Om Hospital</td>
    <td>Dr. wasim Shaikh</td>
    <td><span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span></td>
    <td><input type="button" value="Send" class="btn-fr-all"></td>
  </tr>
</table>

                
                </div>
                        </div>
                        <ul class="list-inline pull-right mar-top">
                             <li><button type="button" class="btn btn-primary btn-info-full next-step">Place Order</button></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step2">
                        <div class="step2">
                        <form>
                        <div class="store-search">
  <input type="text" name="search" placeholder="Search..">
  </div>
</form>
                            <div class="table-responsive" id="myDIV">
                	<table width="100" border="1" class="medicine-tbl">
  <tr>
    <td style="font-weight:600">Store</td>
    <td style="font-weight:600">Address</td>
    <td style="font-weight:600">Phone Number</td>
    <td style="font-weight:600">Send</td>
  </tr>
  <tr>
    <td> Medplus </td>
    <td> Shop No.2, H.No.1-11-243/2, Sree Madhu Enclave, Shamlal Building, Begumpet-500 016 </td>
    <td>1234567890</td>
    <td><input type="button" value="Send" class="btn-fr-all"></td>
  </tr>
</table>

                
                </div>
                            
                        </div>
                        <ul class="list-inline pull-right mar-top">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                        </ul>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="step3">
                        <div class="step3">
                        <form>
    	<div class="row">
        	<div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1">Full Name</label>
    <input type="text" class="text-input" id="exampleInputEmail1" placeholder="Full Name">
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="text-input" id="exampleInputEmail1" placeholder="Email">
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1">Contact </label>
    <input type="text" class="text-input" id="exampleInputEmail1" placeholder="Contact ">
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1">City</label>
    <input type="email" class="text-input" id="exampleInputEmail1" placeholder="City">
  </div>
            </div>
            
            <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1">Pincode</label>
    <input type="email" class="text-input" id="exampleInputEmail1" placeholder="Pincode">
  </div>
            </div>
            
             <div class="col-md-4 col-sm-4 col-xs-4">
            	<div class="form-group">
    <label for="exampleInputEmail1">State </label>
    <input type="text" class="text-input" id="exampleInputEmail1" placeholder="State ">
  </div>
            </div>
            
            <div class="col-md-12 col-sm-12 col-xs-12">
            	<div class="form-group">
    <label for="exampleInputEmail1">Address</label>
    <textarea class="input-textarea" rows="3" placeholder="Address"></textarea>

  </div>
            </div>
        </div>
    </form>
                        </div>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                           <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                           
                        </ul>
                    </div>
                    
                    <div class="clearfix"></div>
                </div>
            
        </div>
    
   </div>
   </div>
</div>
</seaction>

<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

<script src='${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>

 
 <!-- <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>  -->

<%--<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script> --%>


  
<!-- <script type="text/javascript" src="http://autocompletejs.com/releases/0.3.0/autocomplete-0.3.0.min.js"></script> -->
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


//according menu

$(document).ready(function()
{
    //Add Inactive Class To All Accordion Headers
    $('.accordion-header').toggleClass('inactive-header');
	
	//Set The Accordion Content Width
	var contentwidth = $('.accordion-header').width();
	$('.accordion-content').css({});
	
	//Open The First Accordion Section When Page Loads
	$('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
	$('.accordion-content').first().slideDown().toggleClass('open-content');
	
	// The Accordion Effect
	$('.accordion-header').click(function () {
		if($(this).is('.inactive-header')) {
			$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle().toggleClass('open-content');
		}
		
		else {
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle().toggleClass('open-content');
		}
	});
	
	return false;
});

</script>

<!--<script>
	$('.continue').click(function(){
  $('.nav-tabs > .active').next('li').find('a').trigger('click');
});
$('.back').click(function(){
  $('.nav-tabs > .active').prev('li').find('a').trigger('click');
});
</script>-->

<!--<script type="text/javascript">
$(function() {
  $('.form_datetime').datetimepicker({
	  		format: 'DD-MM-YYYY HH:mm'
             
	    });
  		
});
</script> -->


<script>
function myFunction() {
    var x = document.getElementById("myDIV");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
</script>
</body>
</html>
