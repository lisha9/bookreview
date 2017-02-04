function validateForm() {
	var userid = document.forms["loginForm"]["userId"].value;
	if (userid == "") {
		alert("Username must be filled out");
		fname.autofocus;
		return false;
	}

	for(var i=0; i<userid.length; i++){
		var char1 = userid.charAt(i);
		var cc = char1.charCodeAt(0);
		if((cc>47 && cc<58) || (cc>64 && cc<91) || (cc>96 && cc<123)){
		}
		else {
			alert("Username should be alphanumeric");
			return false;
		}     
	}
	var pwd = document.forms["loginForm"]["password"].value;
	if (pwd == "") {
		alert("Password must be filled out");
		return false;
	}
}