<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*"%>
	<%
	String searchTitle = request.getParameter("search");
	String title = null, author = null, description = null, genre = null, date = null, publisher = null, isbn = null;
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
		String sqlStr = "SELECT * FROM books WHERE title = ?";

		// Step 5: Create PreparedStatement object
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setString(1, searchTitle);
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		if (rs.next()) {
			title = rs.getString("title");
			author = rs.getString("author");
			description = rs.getString("description");
			genre = rs.getString("genre");
			date = rs.getString("date");
			publisher = rs.getString("publisher");
			isbn = rs.getString("isbn");
			quantity = rs.getInt("quantity");
			price = rs.getDouble("price");
			rating = rs.getDouble("rating");
		}

		// Step 7: Close connection
		conn.close();
	} catch (Exception e) {
		out.println("Error :" + e);
	}
	%>
	<p>
		title:
		<%=title%><br>
		author:
		<%=author%><br>
		description:
		<%=description%><br>
		genre:
		<%=genre%><br>
		date:
		<%=date%><br>
		publisher:
		<%=publisher%><br>
		isbn:
		<%=isbn%><br>
		quantity:
		<%=quantity%><br>
		price: $<%=price%><br>
		rating:
		<%=rating%>/5
		<br>
	</p>
</body>
</html>