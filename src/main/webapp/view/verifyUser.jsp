<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String role = "";
	boolean found = false;

	try {
		// Step 1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create Statement object
		Statement stmt = conn.createStatement();

		// Step 5: Execute SQL Command
		String sqlStr = "SELECT * FROM users WHERE email = ? AND password = ?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);

		pstmt.setString(1, email);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		if (rs.next()) {
			found = true;
			role = rs.getString("role");
		}
	} catch (Exception e) {
		out.print("Error: " + e);
	}

	if (found) {
		session.setAttribute("sessUserEmail", email);
		session.setAttribute("sessUserRole", role);

		if (role.equals("Member")) {
			response.sendRedirect("index.jsp");
		}

		else if (role.equals("Admin")) {
			response.sendRedirect("admin.jsp");
		}
	}

	else {
		response.sendRedirect("login.jsp?errCode=invalidLogin");
	}
	%>
</body>
</html>