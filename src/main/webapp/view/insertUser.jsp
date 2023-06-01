<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String confirmPassword = request.getParameter("confirmPassword");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	boolean registered = false;

	if (email.equals("") || password.equals("") || confirmPassword.equals("") || firstName.equals("") || lastName.equals("")) {
		response.sendRedirect("registerPage.jsp?code=missing_info");
	}

	else {
		if (password.equals(confirmPassword)) {
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
				String updateStr = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
				PreparedStatement pstmt = conn.prepareStatement(updateStr);
				
				pstmt.setString(1, firstName);
				pstmt.setString(2, lastName);
				pstmt.setString(3, email);
				pstmt.setString(4, password);
				
				int count = pstmt.executeUpdate();
				
				if (count > 0) {
					registered = true;
				}
				
			} catch (Exception e) {
				out.print("Error: " + e);
			}
			
			if (registered) {
				response.sendRedirect("login.jsp?code=register_successful");
			}
		}

		else {
			response.sendRedirect("registerPage.jsp?code=passwords_mismatch");
		}
	}
	%>
</body>
</html>