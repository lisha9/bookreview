function validateForm() {
	var fname = document.forms["registerForm"]["firstname"].value;
	if (fname == "") {
		alert("First name must be filled out");
		fname.autofocus;
		return false;
	}

	var lname = document.forms["registerForm"]["lastname"].value;
	if (lname == "") {
		alert("Last name must be filled out");
		return false;
	}

	var pwd = document.forms["registerForm"]["password"].value;
	if (pwd == "") {
		alert("Password must be filled out");
		return false;
	}

	var rePassword = document.forms["registerForm"]["rePassword"].value;
	if (rePassword == "") {
		alert("Password must be filled out");
		return false;
	}

	var email = document.forms["registerForm"]["emailId"].value;
	if (email == "") {
		alert("Email-id must be filled out");
		return false;
	}

	var phone = document.forms["registerForm"]["phone"].value;
	if (phone == "") {
		alert("Phone number must be filled out");
		return false;
	}

	if (rePassword != pwd) {
		alert("Confirm your password correctly");
		return false;
	}

	var letters = /^[A-Za-z]+$/;
	if (!fname.value.match(letters)) {
		alert("Enter alphabets only for first name");
		return false;
	}

	if (!lname.value.match(letters)) {
		alert("Enter alphabets only for last name");
		return false;
	}

	if(isNaN(phone)){
		alert("Enter numbers only for phone number");
		return false;
	}
}