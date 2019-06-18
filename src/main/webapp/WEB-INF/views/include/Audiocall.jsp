<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <style>
@import "https://fonts.googleapis.com/css?family=Raleway";
* { box-sizing: border-box; }
body { 
  margin: 0; 
  padding: 0; 
  background: #333;
  font-family: Raleway; 
  text-transform: uppercase; 
  font-size: 11px; 
}
h1{ margin: 0; }
#contact { 
  -webkit-user-select: none; /* Chrome/Safari */        
  -moz-user-select: none; /* Firefox */
  -ms-user-select: none; /* IE10+ */
  margin: 4em auto;
  width: 100px; 
  height: 30px; 
  line-height: 30px;
  background: teal;
  color: white;
  font-weight: 700;
  text-align: center;
  cursor: pointer;
  border: 1px solid white;
}

#contact:hover { background: #666; }
#contact:active { background: #444; }

#contactForm { 
  display: none;

  border: 6px solid salmon; 
  padding: 2em;
  width: 400px;
  text-align: center;
  background: #fff;
  position: fixed;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  -webkit-transform: translate(-50%,-50%)
  
}

input, textarea { 
  margin: .8em auto;
  font-family: inherit; 
  text-transform: inherit; 
  font-size: inherit;
  
  display: block; 
  width: 280px; 
  padding: .4em;
}
textarea { height: 80px; resize: none; }

.formBtn { 
  width: 140px;
  display: inline-block;
  
  background: teal;
  color: #fff;
  font-weight: 100;
  font-size: 1.2em;
  border: none;
  height: 30px;
}

</style> -->
<style>.panel-actions {
  margin-top: -20px;
  margin-bottom: 0;
  text-align: right;
}
.panel-actions a {
  color:#333;
}
.panel-fullscreen {
    display: block;
    z-index: 9999;
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    overflow: auto;
}
/* .panel-body1{
height:100%;
} */


</style>
</head>


 <c:url var="getAudioBypatientIdAndstatus" value="/getAudioBypatientIdAndstatus" />
 <c:url var="updateVideoBypatientIdAndstatus" value="/updateVideoBypatientIdAndstatus" />
 
<body>

 
            <div class="panel panel-default audioCalling" id="callDiv1">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel title</h3>
                    <ul class="list-inline panel-actions">
                   <a class="pointer1" onclick="reload()"><span
						class="glyphicon glyphicon-remove"></span></a>
                        <li class="ful-scren-icon"><a href="#"  role="button" id="panel-fullscreen" title="Toggle fullscreen"><i class="glyphicon glyphicon-resize-full"></i></a></li>
                    </ul>
                    
                </div>
                <div class="panel-body1">
                <iframe allow="geolocation; microphone; camera" id="iframeId1"
					name="iframeId1" scrolling="auto"  allowfullscreen></iframe>
                     
                </div>
            </div>
      

        
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 

<script>
$(function() {
	  
	  // contact form animations
	  $('#contact').click(function() {
	    $('#contactForm').fadeToggle();
	  })
	  $(document).mouseup(function (e) {
	    var container = $("#contactForm");

	    if (!container.is(e.target) // if the target of the click isn't the container...
	        && container.has(e.target).length === 0) // ... nor a descendant of the container
	    {
	        container.fadeOut();
	    }
	  });
	  
	});

</script>
 <script>
document.getElementById("callDiv1").style.display="none";
 
</script> 
 <script type="text/javascript">
 

 (function fooo() {
	
	 
	
	$.getJSON('${getAudioBypatientIdAndstatus}', {
				 
					 
					
					ajax : 'true',
				},function(data){
					
					 
					if(data!=null && data!=0)
						{	
						
						   if(data.status==0)
						   {
							   
							   playAudio();
 								 if (confirm("Dr."+data.string1 + " Is Calling You")) {
 									 
 									 pauseAudio();
 									document.getElementById("callDiv1").style.display="block";
								    document.getElementById("iframeId1").src="https://localhost:9001/demos/audio-receiver.html?firstname="+data.patientId;
								   // document.getElementById("iframeId1").src="https://consult.bionische.com/demos/audio-receiver.html?firstname="+data.patientId;
									 
								    } else {
								    console.log("fail"); 
								    reload();
								    }
						   }
						}
					}
	);
	
	
	 var time= setTimeout(function() { 
		  fooo();
		  
		  },
	  10000);
	 
	  })();  

 
  
 </script>
  <script type="text/javascript">
		function updatevideoCall(patientId) {
			
			
			  var patientId = document.getElementById("patientId").value;
		
			
			
 
			$.getJSON('${updateVideoBypatientIdAndstatus}', {

				
              
                patientId : patientId,
				 
               
				
				ajax : 'true',
			},

			function(data) {
				 
								
			});
		 
		}
	</script>
<script>
	function reload(){
		updatevideoCall();
		document.location.reload(true);
		
	}
	</script>
 
  


 
  
 

<script>
$(document).ready(function () {
    //Toggle fullscreen
    $("#panel-fullscreen").click(function (e) {
        e.preventDefault();
        
        var $this = $(this);
    
        if ($this.children('i').hasClass('glyphicon-resize-full'))
        {
            $this.children('i').removeClass('glyphicon-resize-full');
            $this.children('i').addClass('glyphicon-resize-small');
        }
        else if ($this.children('i').hasClass('glyphicon-resize-small'))
        {
            $this.children('i').removeClass('glyphicon-resize-small');
            $this.children('i').addClass('glyphicon-resize-full');
        }
        $(this).closest('.panel').toggleClass('panel-fullscreen');
    });
});




</script>

</body>
</html> --%>