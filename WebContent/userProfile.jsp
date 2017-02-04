<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="util.MyConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>My Profile</title>

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
	<%
		ResultSet rs = null;
		Statement st = MyConnection.getConnection().createStatement();
		rs = st.executeQuery("select * from userdetails where userId = ?");
		rs.next();
	%>
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
				<li><a href="UserDashboard.jsp">Dashboard</a></li>
				<li><a href="allBooks.jsp">View Books</a></li>
				<li class="active"><a href="userProfile.jsp">My Profile</a></li>
				<li><a href="aboutus.html">About Us</a></li>
				<li><a href="index.html" class="btn btn-info btn-lg"> <span
						class="glyphicon glyphicon-user"></span>Logout
				</a></li>
			</ul>
			</nav>
			<div class="col-sm-9">
				<h3 align="center">Profile Details:</h3>
				<br>
				<p>
					First Name :
					<%=rs.getFirstName("firstname")%>
				</p>
				<p>
					Last Name :
					<%=rs.getLastName("laststname")%></p>
				<p>
					Password :
					<%=rs.getPassword("password")%></p>
				<p>
					Username :
					<%=rs.getUserName("username")%></p>
				<p>
					Phone No. :
					<%=rs.getContact("contact")%></p>
			</div>
		</div>
	</div>
</body>
</html> --%>