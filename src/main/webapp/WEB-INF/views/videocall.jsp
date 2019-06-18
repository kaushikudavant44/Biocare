<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>NextRTC Example Webapp</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
           <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/mobilevideo.css">
</head>
<body onload="window.app.joinConversation();">
<div id="container" class="jumbotron">

<!-- <div class="iconsBlk">
    	<a href="#" class="endCall" onclick="window.app.leaveConversation()"><span class="flaticon-phone"></span></a>
    	<a href="#" class="recieveCall"><span class="flaticon-phone-hang-up"></span></a>
    </div>-->
</div> 
<div style="display: none">

<div>
    Conversation id:<input id="convId" type="text" value="${roomName}" />
    <button onclick="window.app.createConversation()">Create</button>
    <button onclick="window.app.createBroadcastConversation()">Create broadcast</button>
    <button onclick="window.app.joinConversation()">Join</button>
    <button onclick="window.app.leaveConversation()">Leave</button>
    <button onclick="window.app.upperCase()">UpperCase</button>
</div>
<div>
    <ul id="log">

    </ul>
</div>
</div>
<div>
    <video id="template" autoplay controls></video>
</div>

<script src="${pageContext.request.contextPath}/resources/js/videocall/bundle.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 			


</body>
</html>