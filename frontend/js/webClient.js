var btnConnect, btnClose;
var btnSend;
var txtWrite, txtRead;
var wsconx;
var clientName;
var isConnected = false;
//var wsURL = "ws://localhost:80";
var wsURL = "ws://echo.websocket.org";

window.onload = function () {
	btnSend = document.getElementById("btnSend");
	btnConnect = document.getElementById("btnConnect");
	btnClose = document.getElementById("btnClose");

   txtRead = document.getElementById("txtareaRead");
   txtRead.textContent = "";
   txtWrite = document.getElementById("txtareaWrite");
   txtWrite.textContent = "";
   
	clientName = document.getElementById("txtfname").value ;
	clientName += " ";
	clientName += document.getElementById("txtlname").value;
	
	var reqexpr = /.*[A-Z,a-z].*/;
	if ( ! reqexpr.test(clientName) ) {
		clientName = "Me";
	}
	
	
	btnConnect.onclick = function () {
		try {
			wsconx = new WebSocket(wsURL);
		
			txtRead.textContent = "Connecting to " + wsURL + ".....";
			
			
		} 
		catch (e) {
			txtRead.textContent += "\n\n";
			txtRead.textContent = clientName +", Error connecting to " +wsURL;
			if ( wsconx.readyState == WebSocket.OPEN) {
				wsconx.close();
			}
		}
	}

   		
	btnClose.onclick = function () {
		try {
			wsconx.close();
			txtRead.textContent += "\nClosed connection";
		} 
		catch (e) {
			txtRead.textContent += "\n\n";
			txtRead.textContent += clientName +", Error closing connection to " +wsURL;
		}
	}
	
	btnSend.onclick = function () {
			if ( hasWSConnection() === true ) {
			try {
				wsconx.send(txtWrite.value);
				txtWrite.textContent = "";
			}
			catch (e) {
				txtRead.textContent += "\n\n";				
				txtRead.textContent += clientName +", Error sending message to "+wsURL;
				wsconx.close();
			
			} 
		}
		txtWrite.textContent = "";
	}

} /* end window.onload */

function hasWSConnection () {
	if (isConnected === true ) {
		return true;
	}
   else if (wsconx.readyState === WebSocket.OPEN) {
			isConnected = true;
			txtRead.textContent += "\n\nConnected....";
			return true;
   }
   else if (wsconx.readyState === WebSocket.CLOSED  || wsconx.readyState === WebSocket.CLOSING ) {
			isConnected = false;
			txtRead.textContent += "\nWS Connection is closed";
			return false;
   }
  else {
  			isConnected = false;
  			txtRead.textContent += "\n\nWaiting to connect....";
  			return false;
  }

return false;
}//end checkWS



