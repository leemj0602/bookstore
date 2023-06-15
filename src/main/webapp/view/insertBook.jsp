<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Book</title>
</head>
<body>
	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");

	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}

	else {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String genre = request.getParameter("genre");
		String date = request.getParameter("date");
		String quantityStr = request.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);
		String priceStr = request.getParameter("price");
		double price = Double.parseDouble(priceStr);
		String publisher = request.getParameter("publisher");
		String isbn = request.getParameter("isbn");
		String ratingStr = request.getParameter("rating");
		double rating = Double.parseDouble(ratingStr);
		boolean inserted = false;

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
			String insertStr = "INSERT INTO books (title, author, description, genre, date, quantity, price, publisher, isbn, rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(insertStr);

			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, description);
			pstmt.setString(4, genre);
			pstmt.setString(5, date);
			pstmt.setInt(6, quantity);
			pstmt.setDouble(7, price);
			pstmt.setString(8, publisher);
			pstmt.setString(9, isbn);
			pstmt.setDouble(10, rating);

			int count = pstmt.executeUpdate();

			if (count > 0) {
				inserted = true;
			}
		} catch (Exception e) {
			out.print("Error: " + e);
		}

		if (inserted) {
			response.sendRedirect("adminMenu.jsp?status=successful");
		}

		else {
			response.sendRedirect("adminMenu.jsp?status=error_occurred");
		}
	}
	%>
</body>
</html>