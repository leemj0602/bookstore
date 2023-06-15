<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
<link rel="stylesheet" type="text/css" href="../css/editBookForm.css">
</head>
<body>
<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");
	
	String idStr = request.getParameter("id");
	int id = Integer.parseInt(idStr);
	String title = "";
	String author = "";
	String description = "";
	String genre = "";
	String date = "";
	int quantity = 0;
	double price = 0;
	String publisher = "";
	String isbn = "";
	double rating = 0;
	boolean found = false;
	ResultSet rs = null;
	
  	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}
  	
	else {
		try {
			// Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Define Connection URL
			String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=root1234&serverTimezone=UTC";

			// Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// Create Statement object
			Statement stmt = conn.createStatement();

			// Execute SQL Command
			String sqlStr = "SELECT * FROM books WHERE id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			// Process Result
			if (rs.next()) {
				found = true;
			}
		} catch(Exception e) {
			out.print("Error: " + e);
		}
		
		if (found) {
			title = rs.getString("title");
			author = rs.getString("author");
			description = rs.getString("description");
			genre = rs.getString("genre");
			date = rs.getString("date");
			quantity = rs.getInt("quantity");
			price = rs.getDouble("price");
			publisher = rs.getString("publisher");
			isbn = rs.getString("isbn");
			rating = rs.getDouble("rating");
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
			<li class="write"><a href="#">Edit Book</a></li>
		</ul>
	</nav>

	<main role="main">
		<section class="panel important">
			<h2>New Book</h2>
			<form action="updateBook.jsp">
				<div class="twothirds">
					Title:
					<br>
					<input type="text" name="title" id="title" value="<%=title%>" readonly style="background-color: #cccbcc"/>
					<br>

					Author:
					<br>
					<input type="text" name="author" id="author" value="<%=author%>" readonly style="background-color: #cccbcc" />
					<br>

					Description:
					<br>
					<textarea name="description" style="width: 310px; height: 150px" id="description" readonly style="background-color: #cccbcc"><%=description%></textarea>
					<br>
					<br>

					Genre:
					<br>
					<input type="text" name="author" id="author" value="<%=genre%>" readonly style="background-color: #cccbcc"/>
					<br>

					Date:
					<br>
					<input type="text" name="date" value="<%=date%>" readonly style="background-color: #cccbcc"/>
					<br>

					Quantity:
					<br>
					<input type="text" name="quantity" id="quantity" pattern="^[0-9]+$" value="<%=quantity%>" />
					<br>

					Price (S$):
					<br>
					<input type="text" name="price" id="price" pattern="^[0-9]+(\.[0-9]{1,2})?$" value="<%=price%>" />
					<br>

					Publisher:
					<br>
					<input type="text" name="publisher" id="publisher" value="<%=publisher%>" readonly style="background-color: #cccbcc"/>
					<br>

					ISBN:
					<br>
					<input type="text" name="isbn" id="isbn" value="<%=isbn%>" readonly style="background-color: #cccbcc"/>
					<br>

					Rating:
					<br>
					<input type="text" name="rating" id="rating" pattern="^(?:[0-4](?:\.\d)?|5(?:\.0)?)$" value="<%=rating%>" />
					<br>

					<input type="submit" value="Submit" />
				</div>
			</form>
		</section>
	</main>
</body>
</html>