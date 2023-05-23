<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/result.css">
</head>
<body>
	<%@ include file="header.html"%>

	<main>
		<%@page import="java.sql.*"%>
		<%
		String searchTitle = request.getParameter("searchBook");
		String title = null, author = null, description = null, genre = null, date = null, publisher = null, isbn = null,
				image = null;
		int quantity = 0;
		double price = 0, rating = 0;

		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// Step 4: Execute SQL Command
			String sqlStr = "SELECT * FROM books WHERE title LIKE ?";

			// Step 5: Create PreparedStatement object
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, searchTitle + "%");
			ResultSet rs = pstmt.executeQuery();

			// Step 6: Process Result
			while (rs.next()) {
				title = rs.getString("title");
				author = rs.getString("author");
				description = rs.getString("description");
				genre = rs.getString("genre");
				date = rs.getString("date");
				publisher = rs.getString("publisher");
				isbn = rs.getString("isbn");
				image = rs.getString("image");
				quantity = rs.getInt("quantity");
				price = rs.getDouble("price");
				rating = rs.getDouble("rating");
		%>
		<div class="books">
			<div>
				<img src="../images/<%=image%>" alt="" class="book-img">
			</div>
			<div class="descp">
				<h2 class="book-name">
					<%=title%>
				</h2>
				<h3 class="author">
					by
					<%=author%>
				</h3>
				<h3 class="rating">
					<%=rating%>
				</h3>
				<p class="info">Popular book that is well-loved by many in National Library Store</p>
				<button type="submit" id="b1">See the Book</button>
			</div>
		</div>
		<%
		}

		// Step 7: Close connection
		conn.close();
		} catch (Exception e) {
		out.println("Error :" + e);
		}
		%>
	</main>
	
	<%@ include file="footer.html"%>
</body>
</html>