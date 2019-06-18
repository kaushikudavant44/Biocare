/*// var client = new Paho.MQTT.Client('iot.eclipse.org', Number("1883"), "client-" + Math.random());
var wsbroker = "iot.eclipse.org";  //mqtt websocket enabled broker
var wsport = 443 // port for above
//var wsbroker = "iot.eclipse.org";  //mqtt websocket enabled broker
//var wsport = 443 
var wsbroker = "test.mosquitto.org";  //mqtt websocket enabled broker
var wsport = 8081 

 //var wsbroker = "broker.hivemq.com";  //mqtt websocket enabled broker
//var wsport = 8000 // port for above
var videoCallTimer;
var client = new Paho.MQTT.Client(wsbroker, wsport,
        "myclientid_bionishce_" + parseInt(Math.random() * 100, 10));
 //client = new Paho.MQTT.Client("broker.hivemq.com", 8000, "clientId"+Math.random());
 
//set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

//connect the client
//client.connect({onSuccess:onConnect});




var options = {
        useSSL: true,
        timeout: 3,
        onSuccess: onConnect,
        onFailure: function (message) {
          console.log("Connection failed: " + message.errorMessage);
        }
      };
  
        client.connect(options);
        
        
        
//called when the client connects
function onConnect() {
// Once a connection has been made, make a subscription and send a message.
console.log("onConnect");
 
client.subscribe("bionische");
var doctorId=document.getElementById("doctorIdTopic").value;
client.subscribe("doctor"+doctorId);
message = new Paho.MQTT.Message("ganesh");
message.destinationName = "/ganesh";
client.send(message); 
}

function subscribeToPatient(patientId)
{
	//var patientId=document.getElementById("patientId").value;
	client.subscribe("patient"+patientId);
	sendMessagePatient_Doctor(patientId, "hello");
	document.getElementById("chating").style.display="block";
	var patientName=document.getElementById("patientName").value;
	$('#chatingName').text(patientName);
}

function subscribeToDoctor()
{
	var doctorId=document.getElementById("doctorId").value;
	client.subscribe("doctor"+doctorId);
}

//called when the client loses its connection
function onConnectionLost(responseObject) {
if (responseObject.errorCode !== 0) {
  console.log("onConnectionLost:"+responseObject.errorMessage);
}
}

//called when a message arrives
function onMessageArrived(message) {
console.log("onMessageArrived:"+message.payloadString);
 
var data = JSON.parse(message.payloadString);

 

if(data.type==0 && data.sender!=1)
{
	
	var strVar="";
	strVar += "<div class=\"container1\">";
	strVar += "  <p>"+ data.message +"<\/p>";
	strVar += "  <span class=\"time-right\">"+getCurrentTime()+"<\/span>";
	 
 	strVar += "<\/div>";

 $('#chatingBox').append($(strVar));
 5
  
  
 
 
var x = document.getElementById("snackbar");
x.className = "show";
}
else if(data.type==1)
{
 
	document.getElementById("snackbar").style.display = "block";
}
else if(data.type==2 && data.sender==0)
{
	 document.getElementById("videoCallDiv").style.display="none";
	//  var firstUrl=document.getElementById("firstUrl").value;
	  
	 endVideoCall();
	//alert(data.message);
	//document.getElementById("videoCall").style.display = "none";
}

else if(data.type==11 && data.sender==0)
{
	 document.getElementById("videoCallDiv").style.display="none";
	//  var firstUrl=document.getElementById("firstUrl").value;
	  
	 clearTimeout(videoCallTimer);
	//alert(data.message);
	//document.getElementById("videoCall").style.display = "none";
}

}
var patientIdTopic=null;
function sendMessagePatient_Doctor(patientId,msg)
{
	var doctorName=document.getElementById("doctorName").value;
	patientIdTopic=patientId;
	//var patientId=document.getElementById("patientId").value;
	var jsonString ='{"type" : "0", "message" : "'+msg+'", "sender" : "1", "doctorName" : "Dr. '+doctorName+'"}';
	 
	 
	 
	
	
	var message = new Paho.MQTT.Message(jsonString);
	message.destinationName = "patient"+patientId;
	message.qos = 0;
	 
	client.send(message);
	
	
	
	
	var strVar="";
	strVar += "<div class=\"container1 darker\">";
	strVar += "  <p>"+msg+"<\/p>";
	strVar += "  <span class=\"time-left\">" + getCurrentTime()
	+ "<\/span>";
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
	document.getElementById("messageBox").value="";

	sendMessagePatient_Doctor(patientIdTopic,messageStr);
	}

function getCurrentTime(){
    var date = new Date();
    var hh = date.getHours();
    var mm = date.getMinutes();

    hh = hh < 10 ? '0'+hh : hh; 
    mm = mm < 10 ? '0'+mm : mm;

    curr_time = hh+':'+mm;
    return curr_time;
}


function sendNotification() {
	var jsonString ='{"type" : "1", "message" : "sdfghj", "sender" : "1"}';
	  
	var message = new Paho.MQTT.Message(jsonString);
	message.destinationName = "bionische";
	message.qos = 0;
	 
	client.send(message);
	
}

function videoCallToPatient(familyId, doctorname, doctorId)
{
	 
	//document.getElementById("videoCall").style.display = "block";
	// document.getElementById("convId").value='doctor'+doctorId;
	// window.app.createConversation();
	 
	 
	client.subscribe("family"+familyId);
	
	var jsonString ='{"type" : "2", "message" : "Doctor '+doctorname +' is calling you", "sender" : "'+doctorId+'"}';
	  
	var message = new Paho.MQTT.Message(jsonString);
	message.destinationName = "family"+familyId;
	message.qos = 0;
	 
	client.send(message);
	 
	
	videoCallTimer=  setTimeout(function() {
		  var urlB = document.location+"";
    	  urlB = urlB.substring(0, urlB.indexOf('?'))+"/";
    	   
    	  window.open(urlB,'_self');
		}, 60000);
	  
}

*/



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
    
    
    var data= JSON.parse(JSON.stringify(jsonObject.data));
    document.getElementById("toDeviceType").value=data.fromDeviceType;
  /*  if(data.type==2){
    	 clearTimeout(videoCallTimer);
    document.getElementById("videoCallReceive").style.display="block";
    document.getElementById("videoCallUrl").value=jsonObject.notification.click_action;
    $("#callMsg").text(jsonObject.notification.body);
    document.getElementById("doctorPhoto").src=jsonObject.notification.icon;
    document.getElementById("audio").play(); 
     var options = {
            body: jsonObject.notification.body,
            icon: jsonObject.notification.icon,
            
         };
      var notification = new Notification(jsonObject.notification.title,options); 
    videoCallTimer=  setTimeout(function() {
    	//alert("kjhg");
    	location.reload();
    	}, 45000);
    }
    else*/ if(data.type==3){
     
    	document.getElementById("chating").style.display = "block";
    	document.getElementById("fcmToken").value=data.fromFcm;
    	
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
    
    if(data.type!=3 && data.type!=2){
      var options = {
              body: jsonObject.notification.body,
              icon: jsonObject.notification.icon,
              
           };
        var notification = new Notification(jsonObject.notification.title,options);  
        
        
    }
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




