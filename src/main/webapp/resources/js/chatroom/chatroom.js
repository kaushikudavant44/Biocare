var CreateProxy = function(wsUri) {

	var websocket = null;
	var audio = null;
	var elements = null;
	
	var playSound = function() {
		if (audio == null) {
			audio = new Audio('/biocare/resources/css/chatroom/unconvinced.mp3');
		}
		
		audio.play();
	};
	
	var showMsgPanel = function() {
			/*elements.loginPanel.style.display = "none";*/
			elements.msgPanel.style.display = "block";
			elements.txtMsg.focus();
	};
			
	var hideMsgPanel = function() {
			/*elements.loginPanel.style.display = "block";*/
			elements.msgPanel.style.display = "none";
			elements.txtLogin.focus();
	};
	
	var displayMessage = function(msg) {
		if (elements.msgContainer.childNodes.length == 100) {
			elements.msgContainer.removeChild(elements.msgContainer.childNodes[0]);
		}
		
		var div = document.createElement('div');
		div.className = 'msgrow';
		var textnode = document.createTextNode(msg);
		div.appendChild(textnode); 
		elements.msgContainer.appendChild(div);
		
		elements.msgContainer.scrollTop = elements.msgContainer.scrollHeight;
	};
	
	var clearMessage = function() {
		elements.msgContainer.innerHTML = '';
	};

	return {
		login: function() {
			elements.txtLogin.focus();
			
			var name = elements.txtLogin.value.trim();
			if (name == '') { return; }
			
			elements.txtLogin.value = '';
			
			// Initiate the socket and set up the events
			if (websocket == null) {
		    	websocket = new WebSocket(wsUri);
		    	
		    	websocket.onopen = function() {
		    		
		    		var receiverId=document.getElementById("receiverId").value;
					var senderId=document.getElementById("senderId").value;
		    		var message = { messageType: 'LOGIN', message: name , receiver: receiverId, senderId: senderId};
		    		websocket.send(JSON.stringify(message));
		        };
		        websocket.onmessage = function(e) {
		        	var obj = JSON.parse(e.data);
		        	//alert(obj.message);
		        	displayMessage(obj.message);
		        	showMsgPanel();
		        	playSound();
		        };
		        websocket.onerror = function(e) {};
		        websocket.onclose = function(e) {
		        	websocket = null;
		        	clearMessage();
		        	hideMsgPanel();
		        };
			}
		},
		sendMessage: function() {
			elements.txtMsg.focus();
			
			if (websocket != null && websocket.readyState == 1) {
				var input = elements.txtMsg.value.trim();
				if (input == '') { return; }
				
				elements.txtMsg.value = '';
				var receiverId=document.getElementById("receiverId").value;
				var senderId=document.getElementById("senderId").value;
				var message = { messageType: 'MESSAGE', message: input, receiver: receiverId, senderId: senderId};
				
				// Send a message through the web-socket
				websocket.send(JSON.stringify(message));
			}
		},
		login_keyup: function(e) { if (e.keyCode == 13) { this.login(); } },
		sendMessage_keyup: function(e) { if (e.keyCode == 13) { this.sendMessage(); } },
		logout: function() {
			if (websocket != null && websocket.readyState == 1) { websocket.close();}
		},
		initiate: function(e) {
			elements = e;
			elements.txtLogin.focus();
		}
	}
};