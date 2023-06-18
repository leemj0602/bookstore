<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Member</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
</head>
<body>
	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");
	String message = request.getParameter("status");
	ResultSet rs = null;
	String firstName;
	String lastName;

    	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}

 	else {
		try {
			// Step 1: Load JDBCDriver 
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=root1234&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// Step 4: Create Statement object 
			Statement stmt = conn.createStatement();

			// Step 5: Execute SQL Command 
			String sqlStr = "SELECT first_name, last_name FROM users where role = \"Member\"";
			rs = stmt.executeQuery(sqlStr);
	%>
	<header role="banner">
		<a href="adminMenu.jsp"><h1>Administrator Panel</h1></a>
		<ul class="utilities">
			<li style="margin-top: 25px;"><a
				href="invalidateSession.jsp">Log Out</a></li>
		</ul>
	</header>

	<section class="panel important" style="margin-top: 80px">
		<h2>Delete Member</h2>
		<form action="deleteMember.jsp">
			<div class="twothirds">
				Select member: <br> <select name="first_name"
					style="margin-left: 2px; height: 30px; width: 300px; border-width: 0.5px; width: 310px;">
					<%
					while (rs.next()) {
						firstName = rs.getString("first_name");
						lastName = rs.getString("last_name");
					%>
					<option value="<%=firstName%>"><%=firstName + " " + lastName%></option>
					<%
					}
					} catch (Exception e) {
					out.print("Error: " + e);
					}
   					}
					%>
				</select> <br> <input type="submit" value="Delete" />
			</div>
		</form>
	</section>
</body>
</html>