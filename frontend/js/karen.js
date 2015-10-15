var date;
var me = {firstname: "Karen", lastname: "Hunter"};
var lb = "<br> <br>";
var divLocation;

window.onload = function () {
try {	
	greeting();
	showHideById('aside_myFavs',false);
} catch ( e) {
	console.log(e.message);
} 


try {
	var r = document.getElementById("radioFalse");
	r.checked = "checked";
}
catch (e) {
	console.log(e.message);
	}
	
try {
	divLocation = document.getElementById("txtLoc");
	document.getElementById("locButton").onclick = function () {
		   var geoLocator = window.navigator.geolocation;
			geoLocator.getCurrentPosition(successPos, errPos); 
		}
}
catch (e) {
	console.log("getCurrentPosition failed\n" + e.message );
}
/*if ( navigator.appCodeName  ) {
alert("Browser " + navigator.appCodeName);
	}
*/



};  // end window.onload

 

function greeting () {
	date = new Date();
	var hello = document.getElementById("header");
   var hr = date.getHours();
   
	var s;
	 
   if ( hr >= 0 && hr <= 12 ) {
   	s= date ;
   	s += lb;
   	s += "Good Morning " + me.firstname;
   } 
   else if ( hr >= 12 && hr <= 18 ) {
   	s= date ;
   	s += lb;
   	s += "Good Afternoon " + me.lastname;
   }
   else {
   	s= date ;
   	s += lb;
   	s += "Good Evening " + me.firstname ;
   }
   
   hello.innerHTML = s;
   
} // greeting


function showHideById(id, v) {
	//var x = id;
	var o = document.getElementById(id);
	
  	if ( v  ) {
   	o.style.display ="inline";
  	}
  	else {
  		o.style.display ="none";
  	}
} // end showFavs

function loadFavs() {
	if ( typeof(localStorage) === "undefined" ) {
		alert("window.localStorage isn't defined. Can't use this");
		return;
	}
	var nvgr = document.getElementById("nav_myFavs");
	var key, val;
	
//Try to get all child Nodes for nvgr	
try {
	var nvgrChildNodes = document.getElementById("nav_myFavs").childNodes;
} catch (e) {
	alert("Attempt to get nav_myFavs child Nodes failed\n" + e.message );
}
try {	
	if ( localStorage.length > 0 ) {
		for (var i = 0; i < localStorage.length; i++) {
			var anchor = document.createElement("a");
			var lb = document.createElement("br");
			key = localStorage.key(i);
			val = localStorage.getItem(key);
			console.log("local storage value " + val + "\n");
			anchor.innerHTML = key.replace("_"," ");
			anchor.href = val;
			anchor.target = "blank";
			var isfound = false;
			
			if ( nvgrChildNodes.length > 0 ) {
				
				for (var j = 0; j < nvgrChildNodes.length; j++) {
					if ( nvgrChildNodes[j].textContent == key.replace("_"," ") )
						isfound = true
				}
				
			}
			if ( isfound == false ) {
					nvgr.appendChild(anchor);
					nvgr.appendChild(lb);
  			}
		
		} // end for		
	} // end if
}
catch (e) {
	alert("Unable to loadFavs. \n" + e.message);
	}
} // loadFavs

function addFav() {
	if ( typeof(localStorage) === "undefined" ) {
		alert("window.localStorage isn't defined. Can't use this");
		return;
	}
	
 var t= document.getElementById("txtTitle").value;
 var u = document.getElementById("txtUrl").value;
 
try {  if ( ! isDefined(t)  || ! isDefined(u) ) { return; } }
catch (e) 
{
	alert("function isDefined failed \n" + e.message);
}
try {
	var k = t.replace(" ","_"	);
 	localStorage.setItem(k,u);
	alert("Added  " + k + ", " + u + "\nlocalStorage.length is: " + localStorage.length);
	clearTextField("id", "txtTitle");
	clearTextField("id", "txtUrl");
 }
 catch (e) {
 	alert("Unable to add " + k + "\n" + e.message);
 	return;
 	}
} // end addFav

function isDefined (v) {
 if ( v == undefined ||
 		v == null ||
 		v == "" ) 
 		  return false;
 else 
 		  return true;
} // isDefined

function clearTextField(method, f) {
try {
	switch( method ) {
	case 'name' : document.getElementsByName(f).value = ""; break;
	case 'id' : document.getElementById(f).value = ""; break;
	case 'class' : document.getElementsByClassName(f).value = ""; break;
	} // end switch
} 
catch (e) {
		alert("unable to clear text field " + f);
}

} // end clearTextField


// Callback function
function successPos (pos) {
 divLocation.innerHTML = "Latitude: " + pos.coords.latitude;
  divLocation.innerHTML += "\nLongitude: " + pos.coords.longitude;
} // successPos

function errPos(err) {
 divLocation.innerHTML = "Error pulling you're current location. See console log for more information";
} // errPos
