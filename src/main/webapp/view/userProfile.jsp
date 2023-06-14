<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/userProfile.css">
<title>Insert title here</title>
</head>
<%@ page import="java.sql.*"%>
<body>
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
	String message = request.getParameter("code");
	if (message != null) {
		if (message.equals("wrong_password")) {
	%>
	<script>
		window.alert("Old password is wrong! Please try again!")
	</script>
	<%
	} else if (message.equals("passwords_mismatch")) {
	%>
	<script>
		window.alert("Passwords Mismatch!")
	</script>
	<%
	} else if (message.equals("password_changed")) {
	%>
	<script>
		window.alert("Password Changed!")
	</script>
	<%
	}
	}
	String first_name = "", last_name = "", email = "", phone = "", birthday = "";
	try {
	// Load JDBCDriver 
	Class.forName("com.mysql.jdbc.Driver");

	// Define Connection URL
	String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

	// Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);

	// Execute SQL Command 
	String sqlUserInfo = "SELECT * FROM users WHERE id = ?";
	PreparedStatement pstmtInfo = conn.prepareStatement(sqlUserInfo);
	pstmtInfo.setInt(1, memberId);
	ResultSet rsInfo = pstmtInfo.executeQuery();

	// Process result
	if (rsInfo.next()) {
	first_name = rsInfo.getString("first_name");
	last_name = rsInfo.getString("last_name");
	email = rsInfo.getString("email");
	birthday = rsInfo.getString("birthday");
	birthday = birthday != null ? birthday : "";
	phone = rsInfo.getString("phone");
	phone = phone != null ? phone : "";
	}
	%>
	<h1>Profile</h1>
	<div class="profile">
		<form action="updateUserInfo.jsp" method="post">
			<label>First Name:</label>
			<input type="text" name="first_name" value=<%=first_name%>>
			<br>
			<label>Last Name:</label>
			<input type="text" name="last_name" value=<%=last_name%>>
			<br>
			<label>Email:</label>
			<input type="email" name="email" value=<%=email%>>
			<br>
			<label>Phone Number:</label>
			<input type="tel" name="phone" pattern="^\+65(6|8|9)\d{7}$" placeholder="+6599999999" value=<%=phone%>>
			<br>
			<label>Birthday:</label>
			<input type="date" name="birthday" value=<%=birthday%>>
			<br>
			<input type="submit" value="Update Profile">
		</form>
	</div>

	<h1>Change Password</h1>
	<div class="password">
		<form method="post" action="changePassword.jsp">
			<input type="password" name="oldPassword" placeholder="Old Password" required>
			<br>
			<input type="password" name="newPassword" placeholder="New Password" required>
			<br>
			<input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
			<br>
			<input type="submit" value="Change Password">
		</form>
	</div>
	<div class="orders">
		<h1>Your Orders</h1>
		<%
		int id = 0;
		String title, author, image;
		double price;

		// Execute SQL Command 
		String sqlUserOrders = "SELECT * FROM books, users, orders WHERE books.id = orders.bookId AND users.id = orders.memberId AND orders.memberId = ?";
		PreparedStatement pstmtOrders = conn.prepareStatement(sqlUserOrders);
		pstmtOrders.setInt(1, memberId);
		ResultSet rsOrders = pstmtOrders.executeQuery();

		// Process result
		while (rsOrders.next()) {
			id = rsOrders.getInt("id");
			title = rsOrders.getString("title");
			author = rsOrders.getString("author");
			image = rsOrders.getString("image");
			price = rsOrders.getDouble("price");
		%>
		<div class="product">
			<div class="product-image">
				<img src="../images/<%=image%>" alt="" class="book-img">
			</div>
			<div class="product-details">
				<div class="product-title"><%=title%></div>
				<p class="product-description"><%=author%></p>
				<br>
			</div>
			<div class="product-price">
				$<%=price%>
			</div>
			<div class="view-details">
				<a href="bookDetail.jsp?id=<%=id%>" style="text-decoration: underline;">View details</a>
			</div>

		</div>
	</div>
	<%
	}
	// Close connection
	conn.close();
	} catch (Exception e) {
	out.println("Error :" + e);
	}
	%>
</body>

<%@ include file="footer.html"%>

</html>