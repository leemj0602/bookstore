<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		String title = request.getParameter("title");

		String quantityStr = request.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);

		String priceStr = request.getParameter("price");
		double price = Double.parseDouble(priceStr);

		String ratingStr = request.getParameter("rating");
		double rating = Double.parseDouble(ratingStr);

		boolean found = false;

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
			String updateStr = "UPDATE books SET quantity = ?, price = ?, rating = ? WHERE title = ?";
			PreparedStatement pstmt = conn.prepareStatement(updateStr);

			pstmt.setInt(1, quantity);
			pstmt.setDouble(2, price);
			pstmt.setDouble(3, rating);
			pstmt.setString(4, title);

			int count = pstmt.executeUpdate();

			if (count > 0) {
		found = true;
			}
		} catch (Exception e) {
			out.print("Error: " + e);
		}

		if (found) {
			response.sendRedirect("adminMenu.jsp?status=successful");
		}

		else {
			response.sendRedirect("adminMenu.jsp?status=error_occured");
		}
	}
	%>
</body>
</html>