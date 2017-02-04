function validateForm() {
	var isbn = document.forms["addbookForm"]["isbn"].value;
	if (isbn == "") {
		alert("ISBN must be filled out");
		isbn.autofocus;
		return false;
	}
	if(isNaN(isbn)){
		alert("Enter numbers only for phone number");
		return false;
	}

	var bname = document.forms["addbookForm"]["bookname"].value;
	if (bname == "") {
		alert("Book name must be filled out");
		return false;
	}

	var author = document.forms["addbookForm"]["author"].value;
	if (author == "") {
		alert("Author must be filled out");
		return false;
	}

	var letters = /^[A-Za-z]+$/;
	if (!author.value.match(letters)) {
		alert("Enter alphabets only for first name");
		return false;
	}
}