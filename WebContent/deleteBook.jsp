<%@page import="util.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Delete Book</title>

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
				<li><a href="AdminDashboard.jsp">Dashboard</a></li>
				<li><a href="allBooks.jsp">View Books</a></li>
				<li><a href="AddBook.jsp">Add New Book</a></li>
				<li class="active"><a href="deleteBook.jsp">Delete Book</a></li>
				<li><a href="index.html" class="btn btn-info btn-lg"> <span
						class="glyphicon glyphicon-user"></span>Logout
				</a></li>
			</ul>
			</nav>
			<div class="col-sm-9">
				<h2>Select Books to be deleted</h2>
				<%!Connection connection;
					ResultSet resultSet;%>

				<form method="post" action="./delete">
					<%
						connection = (Connection) getServletContext().getAttribute("connection");
						out.println("List of Books:");
						Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
								ResultSet.CONCUR_UPDATABLE);
						resultSet = statement.executeQuery("Select * from bookdetails");
						if (resultSet.next()) {
							out.println(
									"<table border='1'><tr><th>Select</th><th> ISBN </th><th> Name </th><th> Author </th><th> Description </th></tr>");
							do {
								String isbn = resultSet.getString("isbn");
								out.println("<tr><td><input type='checkbox' name='selected' value= '" + isbn + "'</td>");

								out.println("<td>" + resultSet.getString("isbn") + "</td><td>" + resultSet.getString("bookname")
										+ "</td>");
								out.println("<td>" + resultSet.getString("author") + "</td>");
								out.println("<td>" + resultSet.getString("description") + "</td>");

							} while (resultSet.next());
							out.print("</tr></table>");
							out.println("<input type='submit' value='delete'></input>");
						} else {
							out.println("<b>No Books are available</b>");
						}
					%>
				</form>

				<jsp:include page='bookmessage.jsp'></jsp:include>

			</div>
		</div>
	</div>
</body>
</html>