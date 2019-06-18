<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>WebRTC Screen Sharing | Plugin-free</title>

        <script>
            if(!location.hash.replace('#', '').length) {
                location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
                location.reload();
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/+MuazKhan">
        <meta name="author" content="Muaz Khan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <link rel="stylesheet" href="https://cdn.webrtc-experiment.com/style.css">

        <style>
            video {
                -moz-transition: all 1s ease;
                -ms-transition: all 1s ease;
                -o-transition: all 1s ease;
                -webkit-transition: all 1s ease;
                transition: all 1s ease;
                vertical-align: top;
                width: 100%;
            }
            input {
                border: 1px solid #d9d9d9;
                border-radius: 1px;
                font-size: 2em;
                margin: .2em;
                width: 30%;
            }
            select {
                border: 1px solid #d9d9d9;
                border-radius: 1px;
                height: 50px;
                margin-left: 1em;
                margin-right: -12px;
                padding: 1.1em;
                vertical-align: 6px;
                width: 18%;
            }
            .setup {
                border-bottom-left-radius: 0;
                border-top-left-radius: 0;
                font-size: 1.5em;
                margin-bottom: 20px;
                margin-top: 20px;
                border-radius: 5px;
            }
            p { padding: 1em; }
            li {
                border-bottom: 1px solid rgb(189, 189, 189);
                border-left: 1px solid rgb(189, 189, 189);
                padding: .5em;
            }
        </style>
        <script>
            document.createElement('article');
            document.createElement('footer');
        </script>

        <!-- scripts used for screen-sharing -->
        <script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
        <script src="https://cdn.webrtc-experiment.com/DetectRTC.js"></script>
        <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
        <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
        <script src="https://cdn.webrtc-experiment.com/BandwidthHandler.js"></script>
        <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
        <script src="https://cdn.webrtc-experiment.com/Pluginfree-Screen-Sharing/conference.js"> </script>
    </head>

    <body>
        <article>
            <header style="text-align: center;">
                <h1>
                    WebRTC Screen Sharing | Plugin-free
                </h1>
                <p>
                    <a href="https://www.webrtc-experiment.com/">HOME</a>
                    <span> &copy; </span>
                    <a href="https://MuazKhan.com/" target="_blank">Muaz Khan</a>

                    .
                    <a href="http://twitter.com/WebRTCWeb" target="_blank" title="Twitter profile for WebRTC Experiments">@WebRTCWeb</a>

                    .
                    <a href="https://github.com/muaz-khan?tab=repositories" target="_blank" title="Github Profile">Github</a>

                    .
                    <a href="https://github.com/muaz-khan/WebRTC-Experiment/issues?state=open" target="_blank">Latest issues</a>

                    .
                    <a href="https://github.com/muaz-khan/WebRTC-Experiment/commits/master" target="_blank">What's New?</a>
                </p>
            </header>

            <div class="github-stargazers"></div>

            <h2 style="display: block;text-align: center;border:0;margin-bottom:0;">High Quality screen sharing application using <a href="https://www.webrtc-experiment.com/">WebRTC</a>!</h2>

            <section id="logs-message" class="experiment" style="display: none;text-align: center;font-size: 1.5em;line-height: 2;color: red;">WebRTC getDisplayMedia API.</section>

            <!-- just copy this <section> and next script -->
            <section class="experiment">
                <section class="hide-after-join" style="text-align: center;">                    
                    <input type="text" id="room-name" placeholder="Enter " style="width: 80%; text-align: center; display: none;">
                    <button id="share-screen" class="setup">Share Your Screen</button>
                </section>

                <!-- local/remote videos container -->
                <div id="videos-container"></div>

                <section id="unique-token" style="display: none; text-align: center; padding: 20px;"></section>
            </section>

            <script>
                // Muaz Khan     - https://github.com/muaz-khan
                // MIT License   - https://www.webrtc-experiment.com/licence/
                // Documentation - https://github.com/muaz-khan/WebRTC-Experiment/tree/master/Pluginfree-Screen-Sharing
                var config = {
                    // via: https://github.com/muaz-khan/WebRTC-Experiment/tree/master/socketio-over-nodejs
                    openSocket: function(config) {
                        // var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';
                        var SIGNALING_SERVER = 'https://webrtcweb.com:9559/';
                        config.channel = config.channel || location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');
                        var sender = Math.round(Math.random() * 999999999) + 999999999;
                        io.connect(SIGNALING_SERVER).emit('new-channel', {
                            channel: config.channel,
                            sender: sender
                        });
                        var socket = io.connect(SIGNALING_SERVER + config.channel);
                        socket.channel = config.channel;
                        socket.on('connect', function () {
                            if (config.callback) config.callback(socket);
                        });
                        socket.send = function (message) {
                            socket.emit('message', {
                                sender: sender,
                                data: message
                            });
                        };
                        socket.on('message', config.onmessage);
                    },
                    onRemoteStream: function(media) {
                        if(isbroadcaster) return;
                        var video = media.video;
                        videosContainer.insertBefore(video, videosContainer.firstChild);
                        rotateVideo(video);
                        document.querySelector('.hide-after-join').style.display = 'none';
                    },
                    onRoomFound: function(room) {
                        if(isbroadcaster) return;
                        conferenceUI.joinRoom({
                            roomToken: room.roomToken,
                            joinUser: room.broadcaster
                        });
                        document.querySelector('.hide-after-join').innerHTML = '<img src="https://cdn.webrtc-experiment.com/images/key-press.gif" style="margint-top:10px; width:50%;" />';
                    },
                    onNewParticipant: function(numberOfParticipants) {
                        var text = numberOfParticipants + ' users are viewing your screen!';
                        
                        if(numberOfParticipants <= 0) {
                            text = 'No one is viewing your screen YET.';
                        }
                        else if(numberOfParticipants == 1) {
                            text = 'Only one user is viewing your screen!';
                        }
                        document.title = text;
                        showErrorMessage(document.title, 'green');
                    },
                    oniceconnectionstatechange: function(state) {
                        var text = '';
                        if(state == 'closed' || state == 'disconnected') {
                            text = 'One of the participants just left.';
                            document.title = text;
                            showErrorMessage(document.title);
                        }
                        if(state == 'failed') {
                            text = 'Failed to bypass Firewall rules. It seems that target user did not receive your screen. Please ask him reload the page and try again.';
                            document.title = text;
                            showErrorMessage(document.title);
                        }
                        if(state == 'connected' || state == 'completed') {
                            text = 'A user successfully received your screen.';
                            document.title = text;
                            showErrorMessage(document.title, 'green');
                        }
                        if(state == 'new' || state == 'checking') {
                            text = 'Someone is trying to join you.';
                            document.title = text;
                            showErrorMessage(document.title, 'green');
                        }
                    }
                };
                function showErrorMessage(error, color) {
                    var errorMessage = document.querySelector('#logs-message');
                    errorMessage.style.color = color || 'red';
                    errorMessage.innerHTML = error;
                    errorMessage.style.display = 'block';
                }
                function getDisplayMediaError(error) {
                    if (location.protocol === 'http:') {
                        showErrorMessage('Please test this WebRTC experiment on HTTPS.');
                    } else {
                        showErrorMessage(error.toString());
                    }
                }
                function captureUserMedia(callback) {
                    var video = document.createElement('video');
                    video.muted = true;
                    video.volume = 0;
                    try {
                        video.setAttributeNode(document.createAttribute('autoplay'));
                        video.setAttributeNode(document.createAttribute('playsinline'));
                        video.setAttributeNode(document.createAttribute('controls'));
                    } catch (e) {
                        video.setAttribute('autoplay', true);
                        video.setAttribute('playsinline', true);
                        video.setAttribute('controls', true);
                    }
                    if(navigator.getDisplayMedia || navigator.mediaDevices.getDisplayMedia) {
                        function onGettingSteam(stream) {
                            video.srcObject = stream;
                            videosContainer.insertBefore(video, videosContainer.firstChild);
                            addStreamStopListener(stream, function() {
                                location.reload();
                            });
                            config.attachStream = stream;
                            callback && callback();
                            rotateVideo(video);
                            addStreamStopListener(stream, function() {
                                location.reload();
                            });
                            showPrivateLink();
                            document.querySelector('.hide-after-join').style.display = 'none';
                        }
                        if(navigator.mediaDevices.getDisplayMedia) {
                            navigator.mediaDevices.getDisplayMedia({video: true}).then(stream => {
                                onGettingSteam(stream);
                            }, getDisplayMediaError).catch(getDisplayMediaError);
                        }
                        else if(navigator.getDisplayMedia) {
                            navigator.getDisplayMedia({video: true}).then(stream => {
                                onGettingSteam(stream);
                            }, getDisplayMediaError).catch(getDisplayMediaError);
                        }
                    }
                    else {
                        if (DetectRTC.browser.name === 'Chrome') {
                            if (DetectRTC.browser.version == 71) {
                                showErrorMessage('Please enable "Experimental WebPlatform" flag via chrome://flags.');
                            } else if (DetectRTC.browser.version < 71) {
                                showErrorMessage('Please upgrade your Chrome browser.');
                            } else {
                                showErrorMessage('Please make sure that you are not using Chrome on iOS.');
                            }
                        }
                        if (DetectRTC.browser.name === 'Firefox') {
                            showErrorMessage('Please upgrade your Firefox browser.');
                        }
                        if (DetectRTC.browser.name === 'Edge') {
                            showErrorMessage('Please upgrade your Edge browser.');
                        }
                        if (DetectRTC.browser.name === 'Safari') {
                            showErrorMessage('Safari does NOT supports getDisplayMedia API yet.');
                        }
                    }
                }
                /* on page load: get public rooms */
                var conferenceUI = conference(config);
                /* UI specific */
                var videosContainer = document.getElementById("videos-container") || document.body;
                document.getElementById('share-screen').onclick = function() {
                    var roomName = document.getElementById('room-name') || { };
                    roomName.disabled = true;
                    captureUserMedia(function() {
                        conferenceUI.createRoom({
                            roomName: (roomName.value || 'Anonymous') + ' shared his screen with you'
                        });
                    });
                    this.disabled = true;
                };
                function rotateVideo(video) {
                    video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
                    setTimeout(function() {
                        video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
                    }, 1000);
                }
                function showPrivateLink() {
                    var uniqueToken = document.getElementById('unique-token');
                    uniqueToken.innerHTML = '<a href="' + location.href + '" target="_blank">Copy & Share This Private Room Link</a>';
                    uniqueToken.style.display = 'block';
                }
            </script>

            <section class="experiment">
                <h2 id="advantages">
                    <a href="#advantages">Advantages</a>
                </h2>
                <ol>
                    <li>As of 2019, this demo is now 100% Plugin-free!! Believe that! No Chrome extension! No Firefox addon!</li>
                    <li>Share screen from Chrome, Firefox or Edge. Safari support is coming soon.</li>
                    <li>
                        You can open private i.e. secure rooms:<br /><br />
                        <ol>
                            <li>Use hashes to open private rooms: <strong>#private-room</strong></li>
                            <li>Use URL parameters to open private rooms: <strong>?private=room</strong></li>
                        </ol>
                    </li>
                    <li>Upto 10 people can view your screen. System restrictions (CPU/RAM) still applies.</li>
                </ol>
            </section>

            <section class="experiment"><small id="send-message"></small></section>

        </article>

        <a href="https://github.com/muaz-khan/WebRTC-Experiment/tree/master/Pluginfree-Screen-Sharing" class="fork-left"></a>

        <footer>
            <p>
                <a href="https://www.webrtc-experiment.com/">WebRTC Experiments</a>
                � <a href="https://plus.google.com/+MuazKhan" rel="author" target="_blank">Muaz Khan</a>
                <a href="mailto:muazkh@gmail.com" target="_blank">muazkh@gmail.com</a>
            </p>
        </footer>

        <!-- commits.js is useless for you! -->
        <script src="https://cdn.webrtc-experiment.com/commits.js" async> </script>
    </body>
</html>