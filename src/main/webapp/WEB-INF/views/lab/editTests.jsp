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
	           <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fSelect.css" />

</head>
<body>
	<jsp:include page="../include/labHeader.jsp" />

	<c:url var="deleteTestByLabId"
		value="/deleteTestByLabId" />
		

	<div class="clearfix"></div>
	<section class="doc_login doc_filter"> 
	<div class="dashboard_nm text-center"><h4>Edit Lab Tests </h4></div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">
				<jsp:include page="../include/labLeftMenu.jsp" /> 
 
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
					<div class="bhoechie-tab-content"></div>

					<div class="bhoechie-tab-content active">
						<div class="filter_div doc_fil">
						 <form action="addLabTestsToLab" method="GET">
						 	<div class="col-md-12 col-sm-12">
							<h3>Add Tests</h3>
							</div>
							<div class="col-sm-10">
							 <select class="slct_lst  multiSelect"" id="testId" name="testId" required multiple="multiple">
      		    <option selected="selected" value="" disabled="disabled">Select Test</option>
      		    <c:forEach items="${allLabTests}" var="allLabTests"
									varStatus="count">
									<c:set var = "flag" value = ""/>
									<c:forEach items="${labTestList}" var="labTestList">
									 <c:choose>
									<c:when test="${labTestList.labTestId==allLabTests.labTestId}">
											<c:set var = "flag" value = "disabled"/>
									</c:when>
									</c:choose>
									 </c:forEach>
									<option <c:out value = "${flag}"/> value="${allLabTests.labTestId}"><c:out
											value="${allLabTests.labTestName}" /></option>
									 
									
											
											
								</c:forEach>
      		</select> 
      		 
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
								
								<th>Test Name</th>
							    <th>Delete</th>
								
							</tr>							
						</thead>
						
					<c:forEach items="${labTestList}" var="labTestList" varStatus="myIndex">
                    <tr id="${labTestList.labTestId}">
                         <td>${myIndex.index+1}</td>
						 <td>${labTestList.labTestName}</td>		
						<td><span class="icon-rubbish-bin" onclick="deleteTestFromLab(${labTestList.labTestId})"></span></td> 
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
function deleteTestFromLab(testID){
	
	var success=confirm("Do you want to delete?");
	if(success==true){
		deleteTest(testID);
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
     	<script
		src="${pageContext.request.contextPath}/resources/js/fSelect.js"></script>  
		
			<script>
(function($) {
    $(function() {
        window.fs_test = $('.multiSelect').fSelect();
    });
})(jQuery);
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

  
 
 function deleteTest(testId) { 
	 
	 
	 $.getJSON('${deleteTestByLabId}',

				{
		            testId : testId,
					ajax : 'true',

				}, function(data) {
					
					 
  
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
  
$('.datepicker').datepicker({ format: "yyyy-mm-dd",  autoclose: true})
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