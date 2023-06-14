<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	int memberId = (int) session.getAttribute("memberId");

	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String birthday = request.getParameter("birthday");
	int rowsAffected = 0;

	try {
		// Step 1: Load JDBCDriver 
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create Statement object 
		Statement stmt = conn.createStatement();

		// Step 5: Execute SQL Command 
		String sqlStr = "UPDATE users SET first_name = ?, last_name = ?, email = ?, birthday = ?, phone = ? WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setString(1, first_name);
		pstmt.setString(2, last_name);
		pstmt.setString(3, email);
		pstmt.setString(4, birthday);
		pstmt.setString(5, phone);
		pstmt.setInt(6, memberId);
		rowsAffected = pstmt.executeUpdate();

		// Step 6: Close connection
		conn.close();
	} catch (Exception e) {
		out.println("Error :" + e);
	}

	if (!email.equals(sessUserEmail) && rowsAffected > 0) {
		session.setAttribute("sessUserEmail", email);
	} else {
	}
	response.sendRedirect(request.getHeader("referer"));
	%>
</body>
</html>