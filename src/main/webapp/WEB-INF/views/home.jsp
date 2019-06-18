<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

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
          
<style type="text/css">
#remotes .videoContainer video {
	 
	width: 100%;
}
</style>
</head>
<body style="background: #272822;">
	<div class="tabl">
		<div class="Row">
			<div class="ri">
				<table style="width: 100%;">
					<tr>
						<td style="width: 20%;">

							<div class="videoContainer">
								<video id="localVideo" 
									oncontextmenu="return false;"></video>
								<div id="localVolume" class="volume_bar"></div>
							</div>

							<div id="remotes" style="margin-top: 5px;"></div>
							<!-- <div class="iconsBlk">
						    	<a href="#" class="endCall" onclick="window.app.leaveConversation()"><span class="flaticon-phone"></span></a>
						    	<a href="#" class="recieveCall"><span class="flaticon-phone-hang-up"></span></a>
						    </div> -->
						</td>

					</tr>
				</table>

				<br>

			</div>

		</div>
	</div>

	<script type="text/javascript">
            
            if(window.location.href.indexOf("?") > -1) {

            }else{
                var THEROOM = window.performance && window.performance.now && window.performance.timing && window.performance.timing.navigationStart ? window.performance.now() + window.performance.timing.navigationStart : Date.now();
                document.location = document.URL+'?'+THEROOM+'/';
            }

        </script>

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
</body>
</html>
<style type="text/css">
.messages {
	max-height: 23em !important;
}
</style>



