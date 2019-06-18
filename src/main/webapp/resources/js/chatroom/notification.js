// var client = new Paho.MQTT.Client('iot.eclipse.org', Number("1883"), "client-" + Math.random());
 client = new Paho.MQTT.Client("iot.eclipse.org", Number("80"), "clientId"+Math.random());
 
//set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

//connect the client
client.connect({onSuccess:onConnect});

//called when the client connects
function onConnect() {
// Once a connection has been made, make a subscription and send a message.
console.log("onConnect");
client.subscribe("ga");
client.subscribe("ganesh");

/*message = new Paho.MQTT.Message("ganesh");
message.destinationName = "/ganesh";
client.send(message); */
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
alert(message.payloadString);
var x = document.getElementById("snackbar");
x.className = "show";
}

function sendMsg()
{
	var message = new Paho.MQTT.Message("Message Payload");
	message.destinationName = "ga";
	message.qos = 0;
	 
	client.send(message);
	
	}
