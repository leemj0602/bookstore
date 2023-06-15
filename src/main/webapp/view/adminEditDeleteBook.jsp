<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
<link rel="stylesheet" type="text/css" href="../css/adminEditBook.css">
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
	%>
	<header role="banner">
		<h1>Administrator Panel</h1>
		<ul class="utilities">
			<li class="users" style="margin-top: 25px;"><a href="#">My
					Account</a></li>
			<li class="logout"><a href="invalidateSession.jsp">Log Out</a></li>
		</ul>
	</header>

	<section>
		<h2>New Book</h2>
		<table border=1 style="margin-top: 70px;">
			<tr>
				<td style="text-align: center;"><strong>ID</strong></td>
				<td style="text-align: center;"><strong>Title</strong></td>
				<td style="text-align: center;"><strong>Author</strong></td>
				<td style="text-align: center;"><strong>Description</strong></td>
				<td style="text-align: center;"><strong>Genre</strong></td>
				<td style="text-align: center;"><strong>Date</strong></td>
				<td style="text-align: center;"><strong>Quantity</strong></td>
				<td style="text-align: center;"><strong>Price</strong></td>
				<td style="text-align: center;"><strong>Publisher</strong></td>
				<td style="text-align: center;"><strong>ISBN</strong></td>
				<td style="text-align: center;"><strong>Rating</strong></td>
				<td style="text-align: center;"><strong>Action</strong></td>
			</tr>
			<%
			int id = 0;
			String title;
			String author;
			String description;
			String genre;
			String date;
			int quantity;
			double price;
			String publisher;
			String isbn;
			double rating;
			String image;

			try {
				// Step 1: Load JDBC sDriver 
				Class.forName("com.mysql.jdbc.Driver");

				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=root1234&serverTimezone=UTC";

				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);

				// Step 4: Create Statement object 
				Statement stmt = conn.createStatement();

				// Step 5: Execute SQL Command 
				String sqlStr = "SELECT * FROM books";
				ResultSet rs = stmt.executeQuery(sqlStr);

				while (rs.next()) {
					id = rs.getInt("id");
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
					image = rs.getString("image");
			%>
			<tr>
				<td style="text-align: center;"><%=id%></td>
				<td style="text-align: center;"><%=title%></td>
				<td style="text-align: center;"><%=author%></td>
				<td style="text-align: center;"><%=description%></td>
				<td style="text-align: center;"><%=genre%></td>
				<td style="text-align: center;"><%=date%></td>
				<td style="text-align: center;"><%=quantity%></td>
				<td style="text-align: center;"><%=price%></td>
				<td style="text-align: center;"><%=publisher%></td>
				<td style="text-align: center;"><%=isbn%></td>
				<td style="text-align: center;"><%=rating%></td>

				<td style="text-align: center;">
				<a href="editBookForm.jsp?id=<%=id%>"><button>Edit</button></a> 
				<br>
				<a href="deleteBook.jsp?id=<%=id%>"><button>Delete</button></a></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			out.print("Error: " + e);
			}
			}
			%>
		</table>
	</section>
</body>