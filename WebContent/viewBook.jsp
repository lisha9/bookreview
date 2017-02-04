<%@page import="model.BookDetail"%>
<%@page import="util.MyConnection"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book Review System</title>

<!-- Bootstrap -->


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">

<style type="text/css">
.bookCover {
	display: inline-block;
	margin-left: 30px;
}

.reviewStyle {
	width: 550px;
	height: 200px;
	margin-top: 150px;
	margin-left: 30px;
	margin-below: 30px;
	overflow: scroll;
	background-color: #D3D3D3;
}

.input[type=search] {
	width: 130px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image: url('searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

.input[type=search]:focus {
	width: 100%;
}

fieldset, label {
	margin: 0;
	padding: 0;
}

/****** Style Star Rating Widget *****/
.rating {
	border: none;
	float: left;
}

.rating-static {
	width: 60px;
	height: 16px;
	display: block;
	background:
		url('http://www.itsalif.info/blogfiles/rating/star-rating.png') 0 0
		no-repeat;
}

.rating-50 {
	background-position: 0 0;
}

.rating-40 {
	background-position: -12px 0;
}

.rating-30 {
	background-position: -24px 0;
}

.rating-20 {
	background-position: -36px 0;
}

.rating-10 {
	background-position: -48px 0;
}

.rating-0 {
	background-position: -60px 0;
}

.rating-5 {
	background-position: -48px -16px;
}

.rating-15 {
	background-position: -36px -16px;
}

.rating-25 {
	background-position: -24px -16px;
}

.rating-35 {
	background-position: -12px -16px;
}

.rating-45 {
	background-position: 0 -16px;
}
</style>

<title>Book Details</title>
</head>
<body>
	<form method="post">
		<div>
			<input type="text" name="bookName" placeholder="Search"><br>
			<input type="submit" value="Search" formaction="./viewBook">
		</div>
	</form>

	<%
		Connection connection = (Connection) getServletContext().getAttribute("connection");
		BookDetail bookDetail = (BookDetail) session.getAttribute("bookDetail");
		ResultSet resultSet = bookDetail.getResultSet();
		resultSet.beforeFirst();
		
	%>

	<jsp:include page='bookmessage.jsp'></jsp:include>
	<c:if test="${bookDetail == null }">
		<c:set var="message" value="Book Not Found" scope="session" />
		<c:redirect url="./viewBook.jsp" />
	</c:if>
	<div style="text-align: center">
		<h2>
			<font color="Blue">Book Details</font>
		</h2>
	</div>

	<div style="margin-left: 30px; display: inline-block">
		<!-- Write a query to get images dynamically -->

		<img alt="Error loading" src="" class="img-rounded">
	</div>
	<div class="bookCover">

		<jsp:include page='bookmessage.jsp'></jsp:include>
		<h3>Book Name:</h3>
		<p>
			<%= bookDetail.getBookName() %>
		</p>

		<br>
		<h3>Author:</h3>
		<p>
			<%= bookDetail.getAuthor() %>
		</p>
		<h3>Description:</h3>
		<p>
			<%= bookDetail.getDescription() %>
		</p>
		<h3>Ratings:</h3>
		<p>
			<%	
			int rating = bookDetail.getRating();
			if(rating == 1){
		%>
			<span class="rating-static rating-10"></span>
			<%	} 
			if(rating == 2){
		%>
			<span class="rating-static rating-20"></span>
			<%}
			if(rating == 3){
		%>
			<span class="rating-static rating-30"></span>
			<%}
			if(rating == 4){
		%>
			<span class="rating-static rating-40"></span>
			<%}
			if(rating == 5){
		%>
			<span class="rating-static rating-50"></span>
			<%}
		%>

		</p>
	</div>


	<div class="reviewStyle">
		<h3>Comments:</h3>

		<%
	while(resultSet.next()){
		if(resultSet.getString("comment") != null){
%>


		<div id="review1">
			<h4>Name:</h4>
			<p><%= resultSet.getString("username") %></p>
			<p><%= resultSet.getDate("date") %>
			<p><%= resultSet.getString("comment") %>
		</div>


		<%
		} else{
			out.println("NO comments found!");
		}
	}//end while

%>

	</div>
	<div style="margin: 30px">
		<form method="post">
			<button type="submit" class="btn-info" formaction="./addComment">Add
				Review</button>
			<jsp:include page='bookmessage.jsp'></jsp:include>
		</form>
	</div>
</body>
</html>