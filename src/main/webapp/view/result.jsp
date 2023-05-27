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
		String search = request.getParameter("search");
		String category = request.getParameter("category");
		int id = 0;
		String title = null, author = null, description = null, genre = null, date = null, publisher = null, isbn = null,
				image = null;
		int quantity = 0;
		double price = 0, rating = 0;
		PreparedStatement pstmt;
		ResultSet rs;

		try {
			//Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			//Define Connection URL
			String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

			//Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			if (category != null) {
				//Execute SQL Command
				String sqlStr = "SELECT * FROM books WHERE genre = ?";

				//Set parameter
				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, category);
				System.out.println(pstmt);
				rs = pstmt.executeQuery();

				while (rs.next()) {
			id = rs.getInt("id");
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
				<form action="bookDetail.jsp">
					<button type="submit" name="id" value="<%=id%>">See the Book</button>
				</form>
			</div>
		</div>
		<%
		}
			} else {
				//Execute SQL Command
				String sqlStr = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ?";

				//Set parameters
				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, search + "%");
				pstmt.setString(2, search + "%");
				System.out.println(pstmt);
				rs = pstmt.executeQuery();

				//Process Result
				while (rs.next()) {
			id = rs.getInt("id");
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
				<form action="bookDetail.jsp">
					<button type="submit" name="id" value="<%=id%>">See the Book</button>
				</form>
			</div>
		</div>
		<%
		}
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