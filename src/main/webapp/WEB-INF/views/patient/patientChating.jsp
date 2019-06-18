<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <% String WsUrl = getServletContext().getInitParameter("WsUrl"); %> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='minimum-scale=1.0, initial-scale=1.0,
	width=device-width, maximum-scale=1.0, user-scalable=no'/>
<title>single-room-chat</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chatroom/site.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chatroom/chatroom.js"></script>
<script type="text/javascript">
var location1 = window.location;
var baseUrleee=location1.hostname + (location1.port ? ':' + location1.port+'/biocare' : '') + '/chat';
var wsUri = 'ws://'+baseUrleee;
var proxy = CreateProxy(wsUri);

document.addEventListener("DOMContentLoaded", function(event) {
	console.log(document.getElementById('loginPanel'));
	proxy.initiate({
		loginPanel: document.getElementById('loginPanel'),
		msgPanel: document.getElementById('msgPanel'),
		txtMsg: document.getElementById('txtMsg'),
		txtLogin: document.getElementById('txtLogin'),
		msgContainer: document.getElementById('msgContainer')
	});
});

</script>
</head>
<body>
<div id="container">
	<div id="loginPanel">
		<!-- <div id="infoLabel">Type a name to join the room</div> -->
		<!-- <div style="padding: 10px;"> -->
			<input id="txtLogin"  type="hidden" value="Ganesh" class="loginInput"
				onkeyup="proxy.login_keyup(event)" />
			<button type="button" class="loginInput" onclick="proxy.login()">Login</button>
		<!-- </div> -->
	</div>
	<div id="msgPanel" style="display: none">
	<input type="hidden" value="${doctorId}" id="receiverId">
		<input type="hidden" value="${patientId}" id="senderId">
		<div id="msgContainer" style="overflow: auto;"></div>
		<div id="msgController">
			<textarea id="txtMsg" 
				title="Enter to send message"
				onkeyup="proxy.sendMessage_keyup(event)"
				style="height: 20px; width: 100%"></textarea>
			<button style="height: 30px; width: 100px" type="button"
				onclick="proxy.logout()">Logout</button>
		</div>
	</div>
</div>
</body>
</html>