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
  //  document.getElementById("toDeviceType").value=data.fromDeviceType;
   
    
   
     var options = {
              body: jsonObject.notification.body,
              icon: jsonObject.notification.icon,
              
           };
        var notification = new Notification(jsonObject.notification.title,options); 
        
        
    
});

 
 

