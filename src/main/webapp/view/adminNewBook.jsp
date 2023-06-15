<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Book</title>
<link rel="stylesheet" type="text/css" href="../css/adminNewBook.css">
</head>
<body>
	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");
	String message = request.getParameter("status");

  	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}
	%>
	<header role="banner">
		<h1>Administrator Panel</h1>
		<ul class="utilities">
			<li class="users" style="margin-top: 25px;"><a href="#">My Account</a></li>
			<li class="logout"><a href="invalidateSession.jsp">Log Out</a></li>
		</ul>
	</header>

	<nav role='navigation'>
		<ul class="main">
			<li class="write"><a href="adminNewBook.jsp">New Book</a></li>
		</ul>
	</nav>

	<main role="main">
		<section class="panel important">
			<h2>New Book</h2>
			<form action="insertBook.jsp">
				<div class="twothirds">
					Title:
					<br>
					<input type="text" name="title" id="title" required />
					<br>

					Author:
					<br>
					<input type="text" name="author" id="author" required />
					<br>

					Description:
					<br>
					<textarea name="description" style="width: 310px; height: 150px" id="description" required></textarea>
					<br>
					<br>

					Genre:
					<br>
					<input type="text" name="author" id="author" required />
					<br>

					Date:
					<br>
					<input type="text" name="date" required />
					<br>

					Quantity:
					<br>
					<input type="text" name="quantity" id="quantity" pattern="^[0-9]+$" required />
					<br>

					Price (S$):
					<br>
					<input type="text" name="price" id="price" pattern="^[0-9]+(\.[0-9]{1,2})?$" required />
					<br>

					Publisher:
					<br>
					<input type="text" name="publisher" id="publisher" required />
					<br>

					ISBN:
					<br>
					<input type="text" name="isbn" id="isbn" required />
					<br>

					Rating:
					<br>
					<input type="text" name="rating" id="rating" pattern="^(?:[0-4](?:\.\d)?|5(?:\.0)?)$" required />
					<br>

					<input type="submit" value="Add" />
				</div>
			</form>
		</section>
	</main>
</body>
</html>