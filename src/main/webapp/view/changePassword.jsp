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
	int memberId = (int) session.getAttribute("memberId");

	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	String confirmPassword = request.getParameter("confirmPassword");
	boolean changed = false;

	try {
		// Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		// Define Connection URL
		String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

		// Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		//Execute SQL Command
		//Search for correct password of user
		String sqlSearch = "SELECT * FROM users WHERE password = ? AND id = ?";
		PreparedStatement search = conn.prepareStatement(sqlSearch);

		search.setString(1, oldPassword);
		search.setInt(2, memberId);

		ResultSet rs = search.executeQuery();

		if (rs.next()) {
			if (newPassword.equals(confirmPassword)) {
		// Execute SQL Command
		String sqlUpdate = "UPDATE users SET password = ? WHERE id = ?";
		PreparedStatement update = conn.prepareStatement(sqlUpdate);

		update.setString(1, newPassword);
		update.setInt(2, memberId);

		int count = update.executeUpdate();

		if (count > 0) {
			changed = true;
		}
			} else {
		response.sendRedirect("userProfile.jsp?code=passwords_mismatch");
			}
		} else {
			response.sendRedirect("userProfile.jsp?code=wrong_password");
		}
	} catch (Exception e) {
		out.print("Error: " + e);
	}

	if (changed) {
		response.sendRedirect("userProfile.jsp?code=password_changed");
	}
	%>
</body>
</html>