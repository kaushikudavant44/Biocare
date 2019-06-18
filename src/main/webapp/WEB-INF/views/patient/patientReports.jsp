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
<style>
	.reports_check .find_appoint {float: left; margin-left: 14%;}
</style>
 

</head>   

      
<body onload="reportMessage('${message}')">
  <jsp:include page="../include/patientHeader.jsp"/>
  
   <c:url var="getDoctorsAndLabsForRating" value="/getDoctorsAndLabsForRating" />	
  
<div class="clearfix"></div> 
<section class="doc_login doc_filter">
<div class="dashboard_nm text-center"><h4>Patient Reports </h4></div>
<div class="container-fluid">
	<div class="row">
        <div class="bhoechie-tab-container">
            <jsp:include page="../include/patientLeftMenu.jsp"/> 
            
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
	                <div class="bhoechie-tab-content">
	      			</div>
	 
	                <div class="bhoechie-tab-content active">
	                	<p align="center" style="color: green;" id="messageAnimation">${message}</p>
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
         
     <div id="collapse1" class="panel-collapse collapse in">
        <div class="reports_check">
        
        	<div class="find_appoint">
        		<div class="row">
        			<div class="col-md-5 ">
        				<h3>View Reports</h3>
        				<form action="getPatientReportByPatient" method="GET" >
        					<div class="row">
        						<div class="col-md-12">
        							<select required class="slct_lst" id="patientId" name="patientId">
      		
								 <%-- <c:choose>
  			<c:when test="${memberLength>1}">	
        
      		    <option value="">select member</option> --%>
      			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
      		
       <%--  </c:when>
        <c:otherwise>
       
      		         			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
       
        </c:otherwise>
        </c:choose>	 --%>
      		</select>
        						</div>
        						<div class="col-md-6">
        							<label>From Date</label>
      		<input type="text" name="fromDate" id="fromDate" placeholder="From Date" class="datepicker" readonly>
        						</div>
        						<div class="col-md-6">
        							<label>To Date</label>
      		<input type="text" name="toDate" id="toDate" placeholder="To Date" class="datepicker" readonly>
        						</div>
        						
        						<%-- <div class="col-md-12">
        							<label>OR Test Type</label>
      		<select class="slct_lst" id="testType" name="testType">
      		   <option value="">select Test</option>
      			<c:forEach items="${labTestsListPatient}" var="labTestsListPatient"
									varStatus="count">
									<option value="${labTestsListPatient.labTestId}"><c:out
											value="${labTestsListPatient.labTestName}" /></option>
								</c:forEach> 
      		</select>
        						</div> --%>
        					</div>
        				
      		<input type="submit" name="submit" value="Submit" placeholder="Submit" class="subt_appt" >
      		</form>
        			</div>
        			<div class="col-md-2 hidden-sm hidden-xs"><div class="border-right"></div></div>
        			<div class="col-md-5 ">
        			
        	<h3>Upload Reports</h3>
        			<form action="submitOwnReportsByPatient" method="POST" enctype="multipart/form-data">
        			<div class="row">
        				<div class="col-md-12">
        					<select class="input-text"  name="patientId" >
										<%-- <c:choose>
  			<c:when test="${memberLength>1}">	
        
      		    <option value="">select member</option> --%>
      			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
      		
    <%--     </c:when>
        <c:otherwise>
       
      		         			<c:forEach items="${patientDetailList}" var="patientDetailList"
									varStatus="count">
									<option value="${patientDetailList.patientId}"><c:out
											value="${patientDetailList.fName}" /></option>
								</c:forEach>
       
        </c:otherwise>
        </c:choose>	 --%>
										</select>
        				</div>
        				<div class="col-md-5">
        					<select class="input-text" id="testId" name="testId" >
											<option>select Test</option>
      		   <c:forEach items="${labTestsListPatient}" var="labTestsList"
									varStatus="count">
									<option value="${labTestsList.labTestId}"><c:out
											value="${labTestsList.labTestName}" /></option>
								</c:forEach> 
										</select>
        				</div>
        				
        				
        				<!-- <input type="file" name="reportFile" id="file-7" required  class="inputfile inputfile-6" accept="application/pdf, .jpg, .png, .jpeg"  data-multiple-caption="{count} files selected" placeholder="select file" multiple />

<label for="file-7"><span class="flaticon-news mar-top"> &nbsp;Select report</span> </label> -->


				<div class="col-md-7">
				<div class="box3 patient-inputfile">
			                 
					<input type="file" name="reportFile" id="file-7" required  class="inputfile inputfile-6" accept="application/pdf, .jpg, .png, .jpeg"  data-multiple-caption="{count} files selected" placeholder="select file"   />
					<label for="file-7"><span></span> <strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> Choose a file&hellip;</strong></label>
				</div>
        		</div>
        			</div>
        			
      		
      		  
<!-- 					<input type="file" name="file-7[]" id="file-7" accept="image/*, pdf" class="inputfile inputfile-6" data-multiple-caption="{count} files selected" multiple/>
 -->					
      		
      		<input type="submit" name="submit" value="Submit" placeholder="Submit" class="subt_appt mar-top30" >
      		</form>
        			</div>
        		</div>
        	
        	
        	
        </div>
       
        
        
        </div>
      </div>
      <!-- <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body"><div class="find_appoint">
        	<h3>Fill the Details</h3>
        	<input type="text" name="name" placeholder="username">
      		<select class="slct_lst">
      		    <option>select</option>
      			<option>nmkhjgjh</option>
      			<option>nmkhjgjh</option>
      			<option>nmkhjgjh</option>
      		</select>
        	
      		<input type="submit" name="submit" placeholder="Submit" class="subt_appt">
        </div>
        </div>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body"><div class="find_appoint">
        	<h3>Fill the Details</h3>
        	<input type="text" name="name" placeholder="username">
      		<select class="slct_lst">
      		    <option>select</option>
      			<option>nmkhjgjh</option>
      			<option>nmkhjgjh</option>
      			<option>nmkhjgjh</option>
      		</select>
        	
      		<input type="submit" name="submit" placeholder="Submit" class="subt_appt">
        </div>
        </div> -->
      <!-- </div>
      
       <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
        	<div class="find_appoint">
        	<h3>Fill the Details</h3>
        	<input type="text" name="name" placeholder="username">
      		<select class="slct_lst">
      		    <option>select</option>
      			<option>nmkhjgjh</option>
      			<option>nmkhjgjh</option>
      			<option>nmkhjgjh</option>
      		</select>
      		
      		<input type="submit" name="submit" placeholder="Submit" class="subt_appt">
        </div>
        
        </div>
      </div> -->
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
 <jsp:include page="../include/footer.jsp"/> 
<!-- Bootstrap core JavaScript================================================== --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrolla.jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js'></script>

<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>  --%>
 <%--  <script src="${pageContext.request.contextPath}/resources/js/lobipanel.js"></script>
  <script src="${pageContext.request.contextPath}/resources/highlight.pack.js"></script> --%>
<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
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

			[].slice.call(document.querySelectorAll('input.input__field'))
					.forEach(function(inputEl) {
						// in case the input is already filled..
						if (inputEl.value.trim() !== '') {
							classie.add(inputEl.parentNode, 'input--filled');
						}

						// events:
						inputEl.addEventListener('focus', onInputFocus);
						inputEl.addEventListener('blur', onInputBlur);
					});

			function onInputFocus(ev) {
				classie.add(ev.target.parentNode, 'input--filled');
			}

			function onInputBlur(ev) {
				if (ev.target.value.trim() === '') {
					classie.remove(ev.target.parentNode, 'input--filled');
				}
			}
		})();
	</script>
	 
	 


	 
	<script type="text/javascript">
		 

	 
  /*
	By Osvaldas Valutis, www.osvaldas.info
	Available for use under the MIT License
*/

'use strict';

;( function ( document, window, index )
{
	var inputs = document.querySelectorAll( '.inputfile' );
	Array.prototype.forEach.call( inputs, function( input )
	{
		var label	 = input.nextElementSibling,
			labelVal = label.innerHTML;

		input.addEventListener( 'change', function( e )
		{
			var fileName = '';
			if( this.files && this.files.length > 1 )
				fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
			else
				fileName = e.target.value.split( '\\' ).pop();

			if( fileName )
				label.querySelector( 'span' ).innerHTML = fileName;
			else
				label.innerHTML = labelVal;
		});

		// Firefox bug fix
		input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
		input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
	});
}( document, window, 0 ));
  
</script>

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
$(function() {
	  $('.panel-default a').click(function() {
	    if ($(this).hasClass('activestate')) {
	      $(this).removeClass('activestate');
	    } else {
	      $('.panel-default a').removeClass('activestate');
	      $(this).addClass('activestate');
	    }
	  });
	});
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
</script>
<script type="text/javascript">
 
$('.datepicker').datepicker({
	  autoclose: true,
	  
	  format: "dd-mm-yyyy"}).datepicker("setDate", new Date)
	  
	 /*  $('.datepicker').datepicker({
	  autoclose: true,
	  startDate: new Date(),
	  format: "yyyy-mm-dd"}).datepicker() */
	  
	  
	  function reportMessage(message)
	  {	
	     if(message=="success")
	    	 {
	    	   alert("Report Uploaded Successfully");
	    	   message="";
	    	 }
	     else if(message=="failed")
	    	 {
	    	 alert("Failed To Upload Report");
	    	 message="";
	    	 }
	
	  }
	  

</script>
 <script>
                        setTimeout(function() {
    $('#messageAnimation').fadeOut('slow');
}, 5000);
                        </script>
 
</body>
</html>