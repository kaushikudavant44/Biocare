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
	<link href="${pageContext.request.contextPath}/resources/css/home_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="../include/doctorHeader.jsp" />

	<c:url var="submitfreequentlyUsedMedicine"
		value="/submitfreequentlyUsedMedicine" />
		<c:url var="deleteMedicineById"
		value="/deleteMedicineById" />
		
		<c:url var="getPrescriptionByMeetingId"
		value="/getPrescriptionByMeetingId" />
   	<c:url var="addFreequentlyUsedMedicineList"
		value="/addFreequentlyUsedMedicineList" />

	<div class="clearfix"></div>
	<section class="doc_login doc_filter"> 
	<div class="dashboard_nm text-center"><h4>Medicine Categories List  </h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/leftmenu.jsp" /> 
 
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="filter_div doc_fil">
						 <form action="submitfreequentlyUsedMedicine" method="GET">
						 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h3>Add Medicines</h3>
							</div>
							<div class="col-sm-10">
							<input type="text" name="medicineName" id="medicineName" placeholder="Enter Medicines Name" required>
							
							</div>
							
							<div class="col-sm-2">
							 <input type="submit" value="Add New " class="btn-fr-all" onclick="addMedicines()">	 
											
							</div>
						</form>	
						</div>
						<div class="clearfix"></div>
						<hr>
						
						<div class="table-responsive">
						<table width="100%" border="0" class="table table-striped table-hover table-bordered table-hd" id="addedMedicine">	
						<thead>
							<tr>
								<th>Sr</th>
								
								<th>MedicineName</th>
							    <th>Delete</th>
								
							</tr>							
						</thead>
						
					<c:forEach items="${freequantlyUsedMedicinesList2}" var="freequantlyUsedMedicinesList2" varStatus="myIndex">
                    <tr id="${freequantlyUsedMedicinesList2.freequantlyUsedMedicinesId}">
                         <td>${myIndex.index+1}</td>
						 <td>${freequantlyUsedMedicinesList2.medicineName}</td>		
						<td><span class="icon-rubbish-bin" onclick="deleteMedicinesFromDataBaseAlert(${freequantlyUsedMedicinesList2.freequantlyUsedMedicinesId})"></span></td> 
						</tr>
						</c:forEach>
						
						</table>
						</div>
						
					</div>
				</div>

			</div>
		</div>
	</div>
	</section>
<script>
function deleteMedicinesFromDataBaseAlert(frequentlyUsedMedicineId){
	
	var success=confirm("Do you want to delete?");
	if(success==true){
		deleteMedicinesFromDataBase(frequentlyUsedMedicineId);
	}
	
}
</script>

	<div class="clearfix"></div>
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
		src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'>
</script>
	<script>
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

 /* function addMedicines() { 
	 
     $('#addedMedicine td').remove(); 
	 
	 var medicineName=document.getElementById("medicineName").value;
	
	 
	 $.getJSON('${submitfreequentlyUsedMedicine}',

				{
		      medicineName : medicineName,

					ajax : 'true',

				}, function(data) {
					var i=0;
					$
					.each(
							data,
							function(key, medicineList) {
								
								alert(i);
								var tr = $('<tr id='+i+'></tr>');
								
								tr.append($('<td></td>').html(key+1));
								tr.append($('<td></td>').html(medicineList.medicineName));
								tr.append($('<td></td>').html('<span class="glyphicon glyphicon-trash" onclick="deleteMedicine('+i+')"></span>'));								
								i--;
								 $('#addedMedicine').append(tr);  								 					   

							}) 
				});
	 
	 document.getElementById("medicineName").value = "";
		
} */
  
 
 function deleteMedicine(id){
	// alert(id);
	    $("#" + id).remove(); 
	}
	
 function deleteMedicinesFromDataBase(medicineId) { 
	 
	// alert(medicineId);
	 $.getJSON('${deleteMedicineById}',

				{
		            medicineId : medicineId,
					ajax : 'true',

				}, function(data) {
					
					//alert(data.message)
  
					location.reload();				
					
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