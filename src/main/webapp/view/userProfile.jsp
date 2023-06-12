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
	String sessUserRole = (String) session.getAttribute("sessUserRole");
	int memberId = (int) session.getAttribute("memberId");

	if (sessUserRole != null && sessUserRole.equals("Member")) {
	%>
	<%@ include file="loggedInHeader.html"%>
	<%
	} else {
	%>
	<%@ include file="header.html"%>
	<%
	}
	%>
	<br>
	<br>
	<br>
	<br>
	<%
	String first_name = "", last_name = "", email = "", phone = "", birthday = "";
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
		String sqlStr = "SELECT * FROM users WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1, memberId);
		ResultSet rs = pstmt.executeQuery();

		//Step 6: Process result
		if (rs.next()) {
			first_name = rs.getString("first_name");
			last_name = rs.getString("last_name");
			email = rs.getString("email");
			birthday = rs.getString("birthday");
			birthday = birthday != null ? birthday : "";
			phone = rs.getString("phone");
			phone = phone != null ? phone : "";
		}

		// Step 7: Close connection
		conn.close();
	} catch (Exception e) {
		out.println("Error :" + e);
	}
	%>
	<form action="updateUserInfo.jsp" method="post">
		First Name:
		<input type="text" name="first_name" value=<%=first_name%>>
		Last Name:
		<input type="text" name="last_name" value=<%=last_name%>>
		Email:
		<input type="email" name="email" value=<%=email%>>
		Phone Number:
		<input type="tel" name="phone" pattern="^\+65(6|8|9)\d{7}$" placeholder="+6599999999" value=<%=phone%>>
		Birthday:
		<input type="date" name="birthday" value=<%=birthday%>>
		<input type="submit" value="Update Profile">
	</form>
	<%@ include file="footer.html"%>
</body>
</html>