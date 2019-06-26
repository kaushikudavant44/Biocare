<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<link
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css"
	rel="stylesheet" type="text/css">


<link
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/blogs/js/nicedit.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/home_page.css"
	rel="stylesheet" type="text/css">


<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
</script>

</head>
<body>
	<jsp:include page="../include/doctorHeader.jsp" />


	<div class="clearfix"></div>
	<section class="doc_login">
	<div class="dashboard_nm text-center">
		<h4>Add New Blog</h4>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="bhoechie-tab-container">

				<jsp:include page="../include/leftmenu.jsp" />

				<div
					class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab doc_profile">

					<div class="bhoechie-tab-content active">
						<form method="POST"
							action='${pageContext.request.contextPath}/saveNewBlog'
							enctype="multipart/form-data" name="newBlogForm" >

							<div class="row editpg">
								<input type="hidden" value="${doctorBankAccountInfo.id}"
									name="id">
								<div class="col-sm-4">
									<div class="form-group">
										<label>Blog Title</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<input type="text" required class="input-text"
											name="blogTitle" id="blogTitle" data-rule-required="true" />
									</div>
								</div>
							</div>


						 <div class="row editpg">
								<div class="col-sm-4">
									<div class="form-group">
										<label>Blog Image</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<input type="file" name="blogImage" id="blogImage" />
									</div>
								</div>
							</div>


							<div class="row editpg">
								<div class="col-sm-4">
									<div class="form-group">
										<label>Blog Content</label>
									</div>
								</div>

							</div>

							<div id="sample">
								<textarea id="blogContent"
									style="width: 100%; height: 400px;"></textarea>
							</div>

							<hr>
							<div class="col-sm-12 text-center">
								<div class="form-group">

									<button type="submit" class="btn-fr-all">Submit</button>

								</div>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	</section>
	<div class="clearfix"></div>

	<jsp:include page="../include/footer.jsp" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
   /*  Submit form using Ajax */
   $('button1[type=submit]').click(function(e) {
   
      //Prevent default submission of form
      e.preventDefault();
      $(this).prop('disabled',true);
      
      
		var content = document.getElementsByClassName('nicEdit-main')[0].innerHTML;

      var postData= $('form[name=newBlogForm]').serialize();
      
      alert("Data  "+postData);
     console.log("Post Data is "+postData);
      
      $.post({
         url : 'saveNewBlog',
         data : postData,
         type : 'POST',
         cache : false,
         contentType : false,
         processData : false,

         success : function(res) {
         
        	 
        	 alert(res);
        	 
        	 
          /*   if(res.validated){
               //Set response
               $('#resultContainer pre code').text(JSON.stringify(res.employee));
               $('#resultContainer').show();
            
            }else{
              //Set error messages
              $.each(res.errorMessages,function(key,value){
  	            $('input[name='+key+']').after('<span class="error">'+value+'</span>');
              });
            } */
         }
      })
   });
});
</script>


	<script>
		document.getElementById("demo1").addEventListener("click", myFunction);

		function myFunction() {

			console.log('value ' + val);
			alert(val);
		}
	</script>



	<!-- Bootstrap core JavaScript================================================== -->

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap-pincode-input.js"></script>


</body>
</html>