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
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="include/doctorHeader.jsp" />


	<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />


	<div class="clearfix"></div>
<section class="doc_login walletdash">
	<div class="dashboard_nm text-center"><h4><span>B</span>ionische <span>W</span>allet </h4></div>
	<div class="container-fluid">
		<div class="review_sec wallet2">
    <div class="pay_sec">
    	<div class="row">
        	<div class="col-sm-6 text-left">
            	<h3><strong>Amount : </strong> Rs. 320</h3>
            </div>
            <div class="col-sm-6 text-right">
            	<h3><strong>Transaction Id : </strong> B25642545KJH</h3>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <hr>
    <div class="methd">
    	<h4>Choose Payment Method</h4>
    </div>
        <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'Credit')" id="defaultOpen">Credit Card</button>
  <button class="tablinks" onclick="openCity(event, 'Debit')">Debit Card</button>
  <button class="tablinks" onclick="openCity(event, 'Net')">Net Banking</button>
</div>

<div id="Credit" class="tabcontent">
 <div class="row">
 	     <div class="col-sm-12">
            
            <ul class="cardlist">
                <li> <div class="col-sm-3 type_line"><strong>Card Type</strong></div><div class="col-sm-9"><input type="radio" name="card1" value="visa" checked> <img src="${pageContext.request.contextPath}/resources/images/card1.jpg" class="img-responsive" alt="visa"> <input type="radio" name="card1" value="visa" checked><img src="${pageContext.request.contextPath}/resources/images/card2.jpg" class="img-responsive" alt="mestro"> <input type="radio" name="card1" value="visa" checked> <img src="${pageContext.request.contextPath}/resources/images/card3.jpg" class="img-responsive" alt="master"> <input type="radio" name="card1" value="visa" checked> <img src="${pageContext.request.contextPath}/resources/images/card4.jpg" class="img-responsive" alt="rupay"></div></li>
                <li> <div class="col-sm-3"><strong>Card Number</strong></div><div class="col-sm-9"><input type="number" name="card-number" maxlength="20"></div></li>
                <li><div class="col-sm-3"><strong>Name on Card</strong></div><div class="col-sm-9"><input type="text" name="name"></div></li>
                <li><div class="col-sm-3"><strong>CVV Number</strong></div><div class="col-sm-9 cvv_num"><input type="number" name="cvv" maxlength="4"><img src="${pageContext.request.contextPath}/resources/images/cvv.png" class="img-responsive" alt="cvv"></div></li>
                <li><div class="col-sm-3"><strong>Expiry Date</strong></div><div class="col-sm-9">
                	<select class="month">
                        <option>Month</option>
                		<option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>
                    <select class="year">
                        <option>Year</option>
                        <option>1990</option>
                        <option>1991</option>
                        <option>1992</option>
                        <option>1993</option>
                        <option>1994</option>
                        <option>1995</option>
                        <option>1996</option>
                        <option>1997</option>
                        <option>1998</option>
                        <option>1999</option>
                        <option>2000</option>
                        <option>2002</option>
                        <option>2003</option>
                        <option>2004</option>
                        <option>2005</option>
                        <option>2006</option>
                        <option>2007</option>
                        <option>2008</option>
                        <option>2009</option>
                        <option>2010</option>
                        <option>2011</option>
                        <option>2012</option>
                        <option>2013</option>
                        <option>2014</option>
                        <option>2015</option>
                        <option>2016</option>
                        <option>2017</option>
                        <option>2018</option>
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                        <option>2027</option>
                        <option>2028</option>
                        <option>2029</option>
                        <option>2030</option>
                </select>
                </div></li>
                <li class="pay_btn text-center"><input type="submit" class="btn-fr-all" value="Make Payment"></li>
            </ul>
            </div>
    </div>
 </div>

<div id="Debit" class="tabcontent">
  <div class="row">
 	     <div class="col-sm-12">
            
            <ul class="cardlist">
                <li> <div class="col-sm-3"><strong>Card Number</strong></div><div class="col-sm-9"><input type="number" name="card-number" maxlength="20"></div></li>
                <li><div class="col-sm-3"><strong>Name on Card</strong></div><div class="col-sm-9"><input type="text" name="name"></div></li>
                <li><div class="col-sm-3"><strong>CVV Number</strong></div><div class="col-sm-9"><input type="number" name="cvv" maxlength="4"></div></li>
                <li><div class="col-sm-3"><strong>Expiry Date</strong></div><div class="col-sm-9">
                	<select class="month">
                        <option>Month</option>
                		<option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>
                    <select class="year">
                        <option>Year</option>
                        <option>1990</option>
                        <option>1991</option>
                        <option>1992</option>
                        <option>1993</option>
                        <option>1994</option>
                        <option>1995</option>
                        <option>1996</option>
                        <option>1997</option>
                        <option>1998</option>
                        <option>1999</option>
                        <option>2000</option>
                        <option>2002</option>
                        <option>2003</option>
                        <option>2004</option>
                        <option>2005</option>
                        <option>2006</option>
                        <option>2007</option>
                        <option>2008</option>
                        <option>2009</option>
                        <option>2010</option>
                        <option>2011</option>
                        <option>2012</option>
                        <option>2013</option>
                        <option>2014</option>
                        <option>2015</option>
                        <option>2016</option>
                        <option>2017</option>
                        <option>2018</option>
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                        <option>2027</option>
                        <option>2028</option>
                        <option>2029</option>
                        <option>2030</option>
                </select>
                </div></li>
                 <li class="pay_btn text-center"><input type="submit" class="btn-fr-all" value="Make Payment"></li>
            </ul>
            </div>
    </div>
</div>

<div id="Net" class="tabcontent">
  <div class="row">
 	     <div class="col-sm-12">
            
            <ul class="cardlist">
                <li> <div class="col-sm-3"><strong>Card Number</strong></div><div class="col-sm-9"><input type="number" name="card-number" maxlength="20"></div></li>
                <li><div class="col-sm-3"><strong>Name on Card</strong></div><div class="col-sm-9"><input type="text" name="name"></div></li>
                <li><div class="col-sm-3"><strong>CVV Number</strong></div><div class="col-sm-9"><input type="number" name="cvv" maxlength="4"></div></li>
                <li><div class="col-sm-3"><strong>Expiry Date</strong></div><div class="col-sm-9">
                	<select class="month">
                        <option>Month</option>
                		<option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>
                    <select class="year">
                        <option>Year</option>
                        <option>1990</option>
                        <option>1991</option>
                        <option>1992</option>
                        <option>1993</option>
                        <option>1994</option>
                        <option>1995</option>
                        <option>1996</option>
                        <option>1997</option>
                        <option>1998</option>
                        <option>1999</option>
                        <option>2000</option>
                        <option>2002</option>
                        <option>2003</option>
                        <option>2004</option>
                        <option>2005</option>
                        <option>2006</option>
                        <option>2007</option>
                        <option>2008</option>
                        <option>2009</option>
                        <option>2010</option>
                        <option>2011</option>
                        <option>2012</option>
                        <option>2013</option>
                        <option>2014</option>
                        <option>2015</option>
                        <option>2016</option>
                        <option>2017</option>
                        <option>2018</option>
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                        <option>2027</option>
                        <option>2028</option>
                        <option>2029</option>
                        <option>2030</option>
                </select>
                </div></li>
            </ul>
            </div>
    </div>
</div>
</div>
	</div>
</section>


	<div class="clearfix"></div>
	<jsp:include page="include/footer.jsp" />
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
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
	<script>
 function getPrescriptionDetails(meetId) { 
	 
	 $('#prescTable'+meetId+' td').remove();
	 
	 $.getJSON('${getPrescriptionByMeetingId}',

				{
		 meetId : meetId,

					ajax : 'true',

				}, function(data) {
					
					
					
					$
					.each(
							data,
							function(key, prescriptionList) {

								var tr = $('<tr></tr>');
								
								tr.append($('<td></td>').html(key+1));
								tr.append($('<td></td>').html(prescriptionList.medicineName));
								tr.append($('<td></td>').html(prescriptionList.medicineQuantity));
								tr.append($('<td></td>').html(prescriptionList.medicineInstruction));
								tr.append($('<td></td>').html(prescriptionList.medicineTiming));
								
								$('#prescTable'+meetId+' tbody').append(tr);
							})
				});
}
</script>
	<script>

/* $(document).ready(function(){
    $( ".time1" ).hover(function() {
           $('.bs-example-modal-lg').modal({
        show: true
    });
  });  
}); */
$(document).ready(function() {
    $(".appoint_tm > li").click(function(){
      /* $(".appoint_tm > li.highlighted").removeClass("highlighted"); */
      $(this).addClass("highlighted");
      $(".highlighted").addClass('disabled');
    });
});


</script>

	<script type="text/javascript">
jQuery(document).ready(function() {
    var owl = jQuery('.owl-carousel');
    owl.owlCarousel({
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 1000,
      autoplayHoverPause: false
    });
    jQuery('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [2000])
    })
    jQuery('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
  
$('.datepicker').datepicker({ format: "dd-mm-yyyy",  autoclose: true})
$('#popoverOption').popover({ trigger: "hover" });

$(document).ready(function() {    
    $("#medicine_nm").val("xyz nlkjhj"); 
    $("#qnty").val("5"); 
    $("#instruction").val("before food");
    $("#timing").val("night");
});

</script>

</body>
</html>