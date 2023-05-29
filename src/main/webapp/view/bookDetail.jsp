<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<link rel="stylesheet" href="../css/bookDetail.css">
<link rel="stylesheet" href="../css/header.css">
</head>

<%
String sessUserEmail = (String) session.getAttribute("sessUserEmail");
String sessUserRole = (String) session.getAttribute("sessUserRole");

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

<body>
	<%
	String idStr = request.getParameter("id");
	int id = Integer.parseInt(idStr);

	String title = "";
	String author = "";
	String description = "";
	String genre = "";
	String date = "";
	int quantity = 0;
	double price = 0;
	String publisher = "";
	String isbn = "";
	double rating = 0;
	String image = "";

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
		String sqlStr = "SELECT * FROM books WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();

		//Step 6: Process result
		if (rs.next()) {
			title = rs.getString("title");
			author = rs.getString("author");
			description = rs.getString("description");
			genre = rs.getString("genre");
			date = rs.getString("date");
			quantity = rs.getInt("quantity");
			price = rs.getDouble("price");
			publisher = rs.getString("publisher");
			isbn = rs.getString("isbn");
			rating = rs.getDouble("rating");
			image = rs.getString("image");
		}

		// Step 7: Close connection
		conn.close();
	} catch (Exception e) {
		out.println("Error :" + e);
	}
	%>
	<div class="container">
		<article class="item-pane">
			<div class="item-preview">
				<div class="book">
					<img src="../images/<%=image%>" id="bookDetailPage">
				</div>
			</div>
			<div class="item-details">
				<h1><%=title%></h1>
				<span class="subtitle"><%=author%></span>
				<div class="pane__section">
					<p><%=description%></p>
				</div>
				<div class="pane__section">
					<dl>
						<dt>Genre</dt>
						<dd><%=genre%></dd>
						<dt>Date of Publication</dt>
						<dd><%=date%></dd>
						<dt>Publisher</dt>
						<dd><%=publisher%></dd>
						<dt>Quantity</dt>
						<dd><%=quantity%></dd>
						<dt>Rating</dt>
						<dd><%=rating%></dd>
						<dt>ISBN</dt>
						<dd><%=isbn%></dd>
					</dl>
				</div>
				<div class="pane__section clearfix">
					<span class="item-price"><%=price%><span class="item-price__units">SGD</span></span>
					<a class="button buy-button" href="#">Purchase</a>
				</div>
			</div>
		</article>
	</div>
</body>

<%@ include file="footer.html"%>

</html>