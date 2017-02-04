<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>My Dashboard</title>

<!-- Bootstrap -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<style>
.affix {
	top: 20px;
}

h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
	font-family: "Ubuntu", Helvetica, Arial, sans-serif !important;
	font-color: #0074D9;
}

.center {
	border-radius: 20px;
	padding: 20px;
	position: absolute;
	width: 270px;
	height: 320px;
	left: 50%;
	top: 50%;
	margin-left: -100px; /* half of the width  */
	margin-top: -100px;
}
</style>
</head>
<body>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<div style="background-color: White">
		<a href="./index.html"><img src="CSPL-Logojpg.jpg"
			class="img-rounded" style="width: 250px; height: 75px"></a>
		<marquee>
			<font size="5px" color="red">Welcome to Cybage Book Review
				Management System</font>
		</marquee>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<nav class="col-sm-3">
			<ul class="nav nav-pills nav-stacked" data-spy="affix"
				data-offset-top="205">
				<li class="active"><a href="UserDashboard.jsp">Dashboard</a></li>
				<li><a href="allBooks.jsp">View Books</a></li>
				<li><a href="serProfile.jsp">My Profile</a></li>
				<li><a href="aboutus.html">About Us</a></li>
				<li><a href="./logout" class="btn btn-info">Logout</a></li>
			</ul>
			</nav>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-xs-4">
						<label for="ex1">Looking for a book??</label><br>
						<form method="post">
							<input class="form-control" id="search" type="text"
								name="bookName" placholder="Enter Book Name"><br> <input
								type="submit" class="btn btn-info" id="seachbutton"
								formaction="./viewBook" value="Search">
						</form>
					</div>
				</div>
				
		<img src="reg.jpg">
	
			</div>
		</div>
	</div>
	
</body>
</html>
