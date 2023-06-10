<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Panel</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
</head>
<body>
	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");
	String message = request.getParameter("status");

  	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}
  	
  	else {
  		if (message != null) {
  			if (message.equals("error_occurred")) {
  	%>
	<script>window.alert("An error has occurred!")</script>
	<%
  			}
  			
  			else if (message.equals("successful")) {
  	%>
	<script>window.alert("Successful!")</script>
	<%
  			}
  		}
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
			<li class="write"><a href="#">New Book</a></li>
			<li class="write"><a href="#">Edit Book</a></li>
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
					<select name="genre" style="margin-left: 2px; height: 30px; width: 300px; border-width: 0.5px; width: 310px;">
						<option value="Fantasy">Fantasy</option>
						<option value="Romance">Romance</option>
						<option value="Science Fiction">Science Fiction</option>
					</select>
					<br>
					<br>

					Date:
					<br>
					<input type="date" name="date" required />
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
					<input type="text" name="isbn" id="isbn" pattern="^[0-9]+$" required />
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