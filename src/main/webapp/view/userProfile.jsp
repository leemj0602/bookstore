<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!-- Javascripts   Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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

	<!-- modal button -->
	<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
		Change Password<i class="bi bi-caret-right"></i>
	</button>
	<!-- modal-content -->
	<div id="changePasswordModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title fs-3">Change Password</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body fs-4">
					<form method="post" action="changePassword.jsp">
						<input type="password" name="oldPassword" placeholder="Old Password" required>
						<input type="password" name="newPassword" placeholder="New Password" required>
						<input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
						<input type="submit" value="Change Password">
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	// Step 7: Close connection
	conn.close();
	} catch (Exception e) {
	out.println("Error :" + e);
	}
	%>
	<%@ include file="footer.html"%>
</body>
</html>