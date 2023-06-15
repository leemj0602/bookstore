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

	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}

	else {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
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
			String updateStr = "DELETE FROM books WHERE id = ?";
			PreparedStatement pstmt = conn.prepareStatement(updateStr);

			pstmt.setInt(1, id);

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