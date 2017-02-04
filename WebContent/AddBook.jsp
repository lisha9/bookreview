<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="js/addBook.js"></script>
<script src="js/addBook.js"></script>
<meta charset="ISO-8859-1">
<title>Add New Book</title>

<style>
.mystyle {
	
}
</style>
</head>
<body>

	<div style="background-color: White">
		<a href="./index.html"><img src="CSPL-Logojpg.jpg"
			class="img-rounded" style="width: 250px; height: 75px"></a>
		<marquee>
			<font size="5px" color="Red">Welcome to Cybage Book Review
				Management System</font>
		</marquee>
	</div>
	<div class="container">
		<div class="row">
			<nav class="col-sm-3">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="205">
					<li><a href="AdminDashboard.jsp">Dashboard</a></li>
					<li><a href="allBooks.jsp">View Books</a></li>
					<li class="active"><a href="AddBook.jsp">Add New Book</a></li>
					<li><a href="deleteBook.jsp">Delete Book</a></li>
					<li><a href="index.html" class="btn btn-info btn-lg"> <span
							class="glyphicon glyphicon-user"></span>Logout
					</a></li>
				</ul>
			</nav>
			<div class="col-sm-9">
				<div style="background-color: White" class="col-xs-4">
					<br>
					<form name="addbookForm" method="post"
						onsubmit="return validateForm()" style="background-color: White">

						<div class="form-horizontal">
							<font color="Black">ISBN:</font> <input type="number"
								class="form-control" id="isbn" name="isbn">
						</div>
						<div class="form-horizontal">
							<font color="Black">Book Name:</font> <input type="text"
								class="form-control" id="bookname" name="bookName">
						</div>
						<div class="form-horizontal">
							<font color="Black">Author:</font> <input type="text"
								class="form-control" id="author" name="author">
						</div>
						<div class="form-horizontal">
							<font color="Black">Description:</font> <input type="text"
								class="form-control" id="description" name="description">
						</div>
						<div class="form-horizontal">
							<font color="Black">Image:</font> <input type="file"
								class="form-control" id="image" name="image">
						</div>
						<br>
						<div class="form-horizontal">
							<button type="submit" class="btn btn-info" formaction="./addbook">Add</button>
							<br>
							<jsp:include page='bookmessage.jsp'></jsp:include>
							<br>
						</div>
					</form>
				</div>
				<img src="reg.jpg">
			</div>
		</div>
	</div>
</body>
</html>