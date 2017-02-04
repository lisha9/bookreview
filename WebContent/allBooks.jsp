<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Books</title>
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
	<%! Connection connection;
		ResultSet resultSet;
	%>

	<% 
	request.getAttribute("connection");
	System.out.println("List of Books:");
	Statement statement = connection.createStatement();
	resultSet = statement.executeQuery("Select * from bookdetails");
	
	while (resultSet.next()) {
		out.println("<table border='1'><tr><th> ISBN </th><th> Name </th><th> Author </th><th> Description </th><th> Edit/Delete </th></tr>" );
		out.println("<tr><td>" + resultSet.getString(1) + "</td><td>" + resultSet.getString(2) + "</td>");
		out.println("<td>" + resultSet.getString(3) + "</td>");
		out.println("<td>" + resultSet.getString(4) + "</td>");
		out.println("<td><a href='bookDetails.jsp'>Click here</td>");
		out.print("</tr></table>");
	}
	%>
	</div>
			</div>
		</div>
	</div>

</body>
</html>