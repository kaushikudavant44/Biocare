/*// var client = new Paho.MQTT.Client('iot.eclipse.org', Number("1883"), "client-" + Math.random());
var audio = null;
var senderId;
var videoCallTimer;
//var wsbroker = "iot.eclipse.org";  //mqtt websocket enabled broker
//var wsport = 443 // port for above
//var wsbroker = "broker.hivemq.com";  //mqtt websocket enabled broker
//var wsport = 8883 // port for above
var wsbroker = "test.mosquitto.org";  //mqtt websocket enabled broker
var wsport = 8081 
var client = new Paho.MQTT.Client(wsbroker, wsport,
        "myclientid_bionishce_" + parseInt(Math.random() * 100, 10));
client = new Paho.MQTT.Client("broker.hivemq.com", 8000, "clientId"
		+ Math.random());

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({
	onSuccess : onConnect,
	 useSSL: true,
     timeout: 3,
});


 


var options = {
        useSSL: true,
        timeout: 3,
        onSuccess: onConnect,
        onFailure: function (message) {
          console.log("Connection failed: " + message.errorMessage);
        }
      };
  
        client.connect(options);
     


// called when the client connects
function onConnect() {
	// Once a connection has been made, make a subscription and send a message.
	console.log("onConnect");

	client.subscribe("bionische");
	var patientId = document.getElementById("patientIdTopic").value;
	client.subscribe("patient" + patientId);
	var familyId = document.getElementById("familyIdTopic").value;
	client.subscribe("family" + familyId);
	
	 * message = new Paho.MQTT.Message("ganesh"); message.destinationName =
	 * "/ganesh"; client.send(message);
	 
}

function subscribeToPatient() {
	var patientId = document.getElementById("patientIdTopic").value;
	client.subscribe("patient" + patientId);

}

function subscribeToDoctor() {
	var doctorId = document.getElementById("doctorIdTopic").value;
	client.subscribe("doctor" + doctorId);
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
	if (responseObject.errorCode !== 0) {
		console.log("onConnectionLost:" + responseObject.errorMessage);
	}
}

// called when a message arrives
function onMessageArrived(message) {
	console.log("onMessageArrived:" + message.payloadString);
 
	var data = JSON.parse(message.payloadString);
	//playAudio();
 
	if (data.type == 0 && data.sender != 0) {
		document.getElementById("chating").style.display = "block";

		var strVar = "";
		strVar += "<div class=\"container1\">";
		//strVar += "  <img src=\"\/w3images\/bandmember.jpg\" alt=\"Avatar\" style=\"width:100%;\">";
		strVar += "  <p>" + data.message + "<\/p>";
		strVar += "  <span class=\"time-right\">" + getCurrentTime()
				+ "<\/span>";
		strVar += "<\/div>";

		$('#chatingBox').append($(strVar));
		$('#chatingName').text(data.doctorName);
		
	} else if (data.type == 1) {

		document.getElementById("snackbar").style.display = "block";
	} 

	else if (data.type == 2 && data.sender != 0) {
		 
		//var audio = new Audio('/biocare/resources/sound/taki_taki.mp3');
		//audio.play();
		 
		   document.getElementById("audio").play(); 
          window.addEventListener("load", function () { document.getElementById("audio").play(); });
          
		//alert(callStatus);
		
			//pauseAudio();
			//	 document.getElementById("videoCall").style.display = "block";
			//	 document.getElementById("convId").value='doctor'+data.sender;
			var familyId = document.getElementById("familyIdTopic").value;
			if (window.location.href.indexOf("?room=") > -1) {

			} else {
				senderId=data.sender;
				 $("#callMsg").text(" "+data.message+" ");
				 
				 $("#videoCallDiv").show();
				$("#videoCallReceive").modal();
				if (true) {
					document.getElementById("audio").pause(); 
				//var THEROOM = window.performance && window.performance.now && window.performance.timing && window.performance.timing.navigationStart ? window.performance.now() + window.performance.timing.navigationStart : Date.now();
				document.location = document.URL + '?room=' + familyId + ''
						+ data.sender + '/';
				
			} else {
				var jsonString = '{"type" : "2", "message" : "Call Not received !!", "sender" : "0"}';

				var familyId = document.getElementById("familyIdTopic").value;
				var message = new Paho.MQTT.Message(jsonString);
				message.destinationName = "family" + familyId;
				message.qos = 0;

				client.send(message);
			}
			}

			  videoCallTimer=setTimeout(function() {


			  document.getElementById("audio").pause(); 
				 $("#videoCallDiv").hide();
				$("#videoCallReceive").hide();
			  
				}, 60000);

	}
	
	 * var x = document.getElementById("snackbar"); x.className = "show";
	 
}

function sendMessagePatient_Doctor(msg) {
	var patientId = document.getElementById("patientIdTopic").value;
	var jsonString = '{"type" : "0", "message" : "' + msg
			+ '", "sender" : "0"}';

	var message = new Paho.MQTT.Message(jsonString);
	message.destinationName = "patient" + patientId;
	message.qos = 0;

	client.send(message);

	var strVar = "";
	strVar += "<div class=\"container1 darker\">";
	//strVar += "  <img src=\"\/w3images\/avatar_g2.jpg\" alt=\"Avatar\" class=\"right\" style=\"width:100%;\">";
	strVar += "  <p>" + msg + "<\/p>";
	strVar += "  <span class=\"time-left\">" + getCurrentTime() + "<\/span>";
	strVar += "<\/div>";

	$('#chatingBox').append($(strVar));
	document.getElementById("messageBox").focus();
}
function sendemsg(e) {
	if (e.keyCode == 13) {

		sendMessage();
	}
}

function sendMessage()
{
	 
	var messageStr = document.getElementById("messageBox").value;
	document.getElementById("messageBox").value = "";

	sendMessagePatient_Doctor(messageStr);
	}

function getCurrentTime() {
	var date = new Date();
	var hh = date.getHours();
	var mm = date.getMinutes();

	hh = hh < 10 ? '0' + hh : hh;
	mm = mm < 10 ? '0' + mm : mm;

	curr_time = hh + ':' + mm;
	return curr_time;
}

function sentRejectCall()
{
	document.getElementById("audio").pause(); 
	var jsonString = '{"type" : "2", "message" : "Call Not received !!", "sender" : "0"}';

	var familyId = document.getElementById("familyIdTopic").value;
	var message = new Paho.MQTT.Message(jsonString);
	message.destinationName = "doctor" + senderId;
	message.qos = 0;

	client.send(message);
	 
	}

function receivedCall()
{
	 clearTimeout(videoCallTimer);
	document.getElementById("audio").pause(); 
	var familyId = document.getElementById("familyIdTopic").value;
	document.getElementById("videoCallDiv").style.display="block";
	
	var jsonString = '{"type" : "11", "message" : "Received !!", "sender" : "0"}';

	var familyId = document.getElementById("familyIdTopic").value;
	var message = new Paho.MQTT.Message(jsonString);
	message.destinationName = "doctor" + senderId;
	message.qos = 0;

	client.send(message);
	
	document.location = document.URL + '?room=' + familyId + ''
			+ senderId + '/';
	}*/
 
 
 var videoCallTimer;
 var config = {
		  apiKey: "AIzaSyCUWc_nMV_StE2zLVfw9-eRmRa0euFc85c",
		    authDomain: "biocare-56c75.firebaseapp.com",
		    databaseURL: "https://biocare-56c75.firebaseio.com",
		    projectId: "biocare-56c75",
		    storageBucket: "biocare-56c75.appspot.com",
		    messagingSenderId: "922246627895"
};
firebase.initializeApp(config);

const messaging = firebase.messaging();
messaging
   .requestPermission()
   .then(function () {
      
       console.log("Notification permission granted.");
       
       // get the token in the form of promise
       console.log("Token - "+ JSON.stringify(messaging.getToken()));
    
       return messaging.getToken()
   })
   .then(function(token) {
       
       document.getElementById("token").value=token;
   })
   .catch(function (err) {
      
       console.log("Unable to get permission to notify.", err);
   });
messaging.onMessage(function(payload) {
    
    
    var jsonObject= JSON.parse(JSON.stringify(payload));

    console.log("Message received. ", JSON.stringify(payload));
    
    try{
    var data= JSON.parse(JSON.stringify(jsonObject.data));
    
    
    
   
    document.getElementById("toDeviceType").value=data.fromDeviceType;
    document.getElementById("fcmToken").value=data.fromFcm;
    if(data.type==2){
    
    	 clearTimeout(videoCallTimer);
    document.getElementById("videoCallReceive").style.display="block";
    document.getElementById("videoCallUrl").value=jsonObject.notification.click_action;
    $("#callMsg").text(jsonObject.notification.body);
    document.getElementById("doctorPhoto").src=jsonObject.notification.icon;
    document.getElementById("audio").play(); 
   /*  var options = {
            body: jsonObject.notification.body,
            icon: jsonObject.notification.icon,
            
         };
      var notification = new Notification(jsonObject.notification.title,options); */
    videoCallTimer=  setTimeout(function() {
    	//alert("kjhg");
    	location.reload();
    	}, 45000);
    }
    else if(data.type==3){
    	 
    	document.getElementById("chating").style.display = "block";
    	 
    	
		var strVar = "";
		strVar += "<div class=\"container1\">";
		//strVar += "  <img src=\"\/w3images\/bandmember.jpg\" alt=\"Avatar\" style=\"width:100%;\">";
		strVar += "  <p>" + jsonObject.notification.body + "<\/p>";
		strVar += "  <span class=\"time-right\">" + getCurrentTime()
				+ "<\/span>";
		strVar += "<\/div>";

		$('#chatingBox').append($(strVar));
		$('#chatingName').text(jsonObject.notification.title);
    	
		
		
		
		
    }
    }
    catch(err){
    	
    }
       var options = {
              body: jsonObject.notification.body,
              icon: jsonObject.notification.icon,
              
           };
        var notification = new Notification(jsonObject.notification.title,options);  
        
        
    
});

function getCurrentTime() {
	var date = new Date();
	var hh = date.getHours();
	var mm = date.getMinutes();

	hh = hh < 10 ? '0' + hh : hh;
	mm = mm < 10 ? '0' + mm : mm;

	curr_time = hh + ':' + mm;
	return curr_time;
}



function receivedCall()
{
	 
	document.addEventListener("visibilitychange", onchange);
	function onchange (evt) {
	  document.getElementById("audio").pause();
	}
	 document.getElementById("videoCallReceive").style.display="none";
	var videoCallUrl=document.getElementById("videoCallUrl").value;
	window.open(videoCallUrl);
	}

function sendemsg(e) {
	if (e.keyCode == 13) {
		
		sendMessage();
	}
}

 

