var wsc;
var echoWS = "ws://http://www.websocket.org/echo.html";
var btnSub;

window.onload = function () {
	init;
};

function init() {
  btnSub = document.getElementById("btnSubmit");
 } // end init

function connect() {
	try {
		wsc = new WebSocket(echoWS);
	} 
	catch () {
		alert("Connect error to " + echoWS);
	}
}