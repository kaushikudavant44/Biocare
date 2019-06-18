<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 
<!DOCTYPE html>
<html lang="en">
<head>
<title>Video Chat</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="en-us" http-equiv="Content-Language" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/videocall/f.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/videocall/filedrop.css"
	rel="stylesheet" type="text/css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/videocall/css/rrssb.css"
	rel="stylesheet" />
	<link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/mobilevideo.css">
       <link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
#local .videoContainer video {
	 
	width: 100%;
}
circle:hover {
  fill: red;
}

.fa-plus-circle:hover {
 color:red; 
}
</style>
<style>
p {
	display: block;
	font-size: 1.35em;
	line-height: 1.5em;
	margin-bottom: 22px;
}

a {
	color: #5a9352;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.center {
	display: block;
	text-align: center;
}

/** page structure **/
#w {
	display: block;
	width: 750px;
	margin: 0 auto;
	padding-top: 30px;
}

#content {
	display: block;
	width: 100%;
	background: #fff;
	padding: 25px 20px;
	padding-bottom: 35px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
}

#searchfield {
	display: block;
	width: 100%;
	text-align: center;
	margin-bottom: 35px;
}

#searchfield form {
	display: inline-block;
	background: #eeefed;
	padding: 0;
	margin: 0;
	padding: 5px;
	border-radius: 3px;
	margin: 5px 0 0 0;
}

#searchfield form .biginput {
	width: 600px;
	height: 40px;
	padding: 0 10px 0 10px;
	background-color: #fff;
	border: 1px solid #c8c8c8;
	border-radius: 3px;
	color: #aeaeae;
	font-weight: normal;
	font-size: 1.5em;
	-webkit-transition: all 0.2s linear;
	-moz-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

#searchfield form .biginput:focus {
	color: #858585;
}

.flatbtn {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	display: inline-block;
	outline: 0;
	border: 0;
	color: #f3faef;
	text-decoration: none;
	background-color: #6bb642;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	font-size: 1.2em;
	font-weight: bold;
	padding: 12px 22px 12px 22px;
	line-height: normal;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	text-transform: uppercase;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
	-moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
	box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}

.flatbtn:hover {
	color: #fff;
	background-color: #73c437;
}

.flatbtn:active {
	-webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
	box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
}

/* .autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto;}
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; border-bottom: 1px dashed #999; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }  */
</style>


</head>
<body style="background: #272822;">


	<c:url var="sendVideoCallToDoctor" value="/sendVideoCallToDoctor" />
	<c:url var="getDoctorCircle" value="/getDoctorCircle" />
	    <input type="hidden" id="token"> 
	<div class="tabl">
		<div class="Row">
			<div class="ri">
				<table style="width: 100%;">
					<tr>
						<td style="width: 20%;">

							<div class="videoContainer" id="local">
								<video id="localVideo"   playsinline
									oncontextmenu="return false;"></video>
								<div id="localVolume" class="volume_bar"></div>
							</div>

							<div id="remotes"  style="margin-top: -5px;"></div>
							  <div class="iconsBlk">
						    	 
  

    <svg id="mute-audio" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="-10 -10 68 68" class="" >
   
      <circle cx="24" cy="24" r="34" >
        <title>Mute audio</title>
      </circle>
      <path class="on" transform="scale(0.6), translate(17,18)" d="M38 22h-3.4c0 1.49-.31 2.87-.87 4.1l2.46 2.46C37.33 26.61 38 24.38 38 22zm-8.03.33c0-.11.03-.22.03-.33V10c0-3.32-2.69-6-6-6s-6 2.68-6 6v.37l11.97 11.96zM8.55 6L6 8.55l12.02 12.02v1.44c0 3.31 2.67 6 5.98 6 .45 0 .88-.06 1.3-.15l3.32 3.32c-1.43.66-3 1.03-4.62 1.03-5.52 0-10.6-4.2-10.6-10.2H10c0 6.83 5.44 12.47 12 13.44V42h4v-6.56c1.81-.27 3.53-.9 5.08-1.81L39.45 42 42 39.46 8.55 6z" fill="white"></path>
      <path class="off" transform="scale(0.6), translate(17,18)" d="M24 28c3.31 0 5.98-2.69 5.98-6L30 10c0-3.32-2.68-6-6-6-3.31 0-6 2.68-6 6v12c0 3.31 2.69 6 6 6zm10.6-6c0 6-5.07 10.2-10.6 10.2-5.52 0-10.6-4.2-10.6-10.2H10c0 6.83 5.44 12.47 12 13.44V42h4v-6.56c6.56-.97 12-6.61 12-13.44h-3.4z" fill="white"></path>
    </svg>

     

     

    <svg id="hangup" class="" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="-10 -10 68 68" onclick="self.close();">
      <circle cx="24" cy="24" r="34">
        <title>Hangup</title>
      </circle>
      <path transform="scale(0.7), translate(11,10)" d="M24 18c-3.21 0-6.3.5-9.2 1.44v6.21c0 .79-.46 1.47-1.12 1.8-1.95.98-3.74 2.23-5.33 3.7-.36.35-.85.57-1.4.57-.55 0-1.05-.22-1.41-.59L.59 26.18c-.37-.37-.59-.87-.59-1.42 0-.55.22-1.05.59-1.42C6.68 17.55 14.93 14 24 14s17.32 3.55 23.41 9.34c.37.36.59.87.59 1.42 0 .55-.22 1.05-.59 1.41l-4.95 4.95c-.36.36-.86.59-1.41.59-.54 0-1.04-.22-1.4-.57-1.59-1.47-3.38-2.72-5.33-3.7-.66-.33-1.12-1.01-1.12-1.8v-6.21C30.3 18.5 27.21 18 24 18z" fill="white"></path>
    </svg>
   
<c:if test="${sessionScope.doctorDetails.doctorId>0}">
<a href="javascript:addDoctor();"> <i class="fa fa-plus-circle" style="font-size:52px;margin-left: -25px;color: black"  aria-hidden="true"></i> </a>
</c:if> 
  
  
						    </div>  
						</td>

					</tr>
				</table>
 
				<br>
<!-- VideoCall -->
 
  
  
  <div class="modal" id="addVideo">
    <div class="modal-dialog" style="width: 300px">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add New Doctor</h4>
         <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
          <div   style="text-align: center;   position: relative;">
      <input
											required type="text"
											id="autocomplete"
													size="16" placeholder="Enter Doctor..." autocomplete="off" 	
											  
											  class="form control searchBox">
											  
											  <input type="hidden" id="toDoctorId" name="toDoctorId">
    <input type="hidden" name="doctorId" id="doctorId" value="${sessionScope.doctorDetails.doctorId}">
   <input type="hidden" id="videoCallUrl">
    </div>
    
    
        
        </div>
      
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal" onclick="videoCallToDoctor()">Connect <i class="fa fa-arrow-circle-o-right"></i></button>
            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="cancelCall()">Cancel</button> 
        </div>
        
      </div>
    </div>
  </div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
            function endVideoCall() {
				
            	window.close(); 
            	
			}
            if(window.location.href.indexOf("?") > -1) {

            }else{
                var THEROOM = window.performance && window.performance.now && window.performance.timing && window.performance.timing.navigationStart ? window.performance.now() + window.performance.timing.navigationStart : Date.now();
                document.location = document.URL+'?'+THEROOM+'/';
            }

        </script>
<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/js/vendor/jquery.1.10.2.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/peer.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/build/dep/bigint.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/build/dep/crypto.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/build/dep/eventemitter.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/build/otr.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/js/rrssb.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/filedrop-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/hoverIntent.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/rollups/aes.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/components/enc-base64-min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/rollups/sha256.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/videocall/js/js.js"
		type="text/javascript"></script>
		
		<script
		src="${pageContext.request.contextPath}/resources/js/jquery.autocomplete.min.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/chatroom/notification_doctor.js" type="text/javascript"></script> 
	<script type="text/javascript">
            

            function copyToClipboard(element) {
              var $temp = $("<input>");
              $("body").append($temp);
              $temp.val($(element).text()).select();
              document.execCommand("copy");
              $temp.remove();
              alert("Link copied!");
            }
 
        </script>

	<script
		src="${pageContext.request.contextPath}/resources/videocall/js/simplewebrtc.js"></script>
	<script>

            setInterval(function(){
                $('#sessionInput').val($('#purl').html());
            }, 1750);

            // grab the room from the URL
            var room = (document.URL.split('?')[1]).split('/#')[0];

            // create our webrtc connection
            var webrtc = new SimpleWebRTC({
                // the id/element dom element that will hold "our" video
                localVideoEl: 'localVideo',
                // the id/element dom element that will hold remote videos
                remoteVideosEl: '',
                // immediately ask for camera access
                autoRequestMedia: true,
                debug: false,
                detectSpeakingEvents: true
            });

            // when it's ready, join if we got a room from the URL
            webrtc.on('readyToCall', function () {
                // you can name it anything
                if (room) webrtc.joinRoom(room);
            });

            function showVolume(el, volume) {
                if (!el) return;
                if (volume < -45) { // vary between -45 and -20
                    el.style.height = '0px';
                } else if (volume > -20) {
                    el.style.height = '100%';
                } else {
                    el.style.height = '' + Math.floor((volume + 100) * 100 / 25 - 220) + '%';
                }
            }
            webrtc.on('channelMessage', function (peer, label, data) {
                if (data.type == 'volume') {
                    showVolume(document.getElementById('volume_' + peer.id), data.volume);
                }
            });
            webrtc.on('videoAdded', function (video, peer) {
                console.log('video added', peer);
                var remotes = document.getElementById('remotes');
                if (remotes) {
                    var d = document.createElement('div');
                    d.className = 'videoContainer';
                    d.id = 'container_' + webrtc.getDomId(peer);
                    d.appendChild(video);
                    var vol = document.createElement('div');
                    vol.id = 'volume_' + peer.id;
                    vol.className = 'volume_bar';
                    video.onclick = function () {
                        video.style.width = video.videoWidth + 'px';
                        video.style.height = video.videoHeight + 'px';
                    };
                    d.appendChild(vol);
                    remotes.appendChild(d);
                }
            });
            webrtc.on('videoRemoved', function (video, peer) {
                console.log('video removed ', peer);
                var remotes = document.getElementById('remotes');
                var el = document.getElementById('container_' + webrtc.getDomId(peer));
                if (remotes && el) {
                    remotes.removeChild(el);
                }
            });
            webrtc.on('volumeChange', function (volume, treshold) {
                //console.log('own volume', volume);
                showVolume(document.getElementById('localVolume'), volume);
            });

            // Since we use this twice we put it here
            function setRoom(name) {
                //$('form').remove();
                //$('h1').text(name);
                $('#subTitle').text('Link to join: ' + location.href);
                $('body').addClass('active');
            }

            if (room) {
                setRoom(room);
            } else {
                $('#createRoom').submit(function () {
                    var val = $('#sessionInput').val().toLowerCase().replace(/\s/g, '-').replace(/[^A-Za-z0-9_\-]/g, '');
                    webrtc.createRoom(val, function (err, name) {
                        console.log(' create room cb', arguments);

                        var newUrl = location.pathname + '?' + name;
                        if (!err) {
                            history.replaceState({foo: 'bar'}, null, newUrl);
                            setRoom(name);
                        } else {
                            console.log(err);
                        }
                    });
                    return false;
                });
            }

            var button = $('#screenShareButton'),
                setButton = function (bool) {
                    button.text(bool ? 'share screen' : 'stop sharing');
                };
            webrtc.on('localScreenStopped', function () {
                setButton(true);
            });

            setButton(true);

            button.click(function () {
                if (webrtc.getLocalScreen()) {
                    webrtc.stopScreenShare();
                    setButton(true);
                } else {
                    webrtc.shareScreen(function (err) {
                        if (err) {
                            setButton(true);
                        } else {
                            setButton(false);
                        }
                    });

                }
            });
        </script>
        
        
        
        <script type="text/javascript">
		var currencies = [];

		function addDoctor() {
			 document.getElementById("addVideo").style.display="block";
			$.getJSON('${getDoctorCircle}', {

				ajax : 'true'
			}, function(data) {

			 
				
				$.each(data, function(key, doctorList) {

					currencies.push({
						value : doctorList.doctorName,
						data : doctorList.doctorId
					});
					 

				});

			});
		}
		</script>
		<script type="text/javascript">
		$(function() {

			$('#autocomplete')
					.autocomplete(
							{

								lookup : currencies,

								onSelect : function(suggestion) {

								 

									document.getElementById("toDoctorId").value = suggestion.data;

									 
								}

							});

		});

	 

		 
 function cancelCall() {
	 document.getElementById("addVideo").style.display="none";
}
 
 function videoCallToDoctor()
 {
 	 
 	 
	var doctorId=document.getElementById("toDoctorId").value;
 	var fromToken=document.getElementById("token").value;
 	
 	 var fromDoctorId = document.getElementById("doctorId").value;
 	 
 	var videoCallUrl=window.location.href;
 	
 	 $
 		.getJSON(
 				'${sendVideoCallToDoctor}',
 				{
 					videoCallUrl : videoCallUrl,
 					fromDeviceType : 2,
 					fromToken : fromToken,
 					doctorId : doctorId,
 					ajax : 'true'
 				},
 				function(data) {
 					 
 					location.reload();
 				});
 }
	</script>
	
</body>
</html>
<style type="text/css">
.messages {
	max-height: 23em !important;
}
</style>



