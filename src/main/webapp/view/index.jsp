<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>National Book Store</title>

<!-- Fonts...... -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300&display=swap" rel="stylesheet">

<!-- Google icons  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" type="text/css" href="../css/index.css">
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

<body>
	<section class="welcome">
		<h1>Shop for your favorite books.</h1>
	</section>

	<nav class="nav-bar">
		<div class="nav1">
			<form action="result.jsp" method="post" class="search" style="border: 1px solid black; border-radius: 5px; margin: 10px;">
				<input type="text" name="search" placeholder="Search Book" required>
				<button type="submit" style="background: none; border: none;">
					<span class="material-symbols-outlined" style="vertical-align: middle;"> search </span>
				</button>
			</form>

			<form action="result.jsp" class="category">
				<input type="submit" name="category" value="Fantasy">
				<input type="submit" name="category" value="Romance">
				<input type="submit" name="category" value="Science Fiction">
			</form>
		</div>
	</nav>

	<h1 style="font-size: 2em; text-align: center; padding-top: 1em;">Some books that might interest you!</h1>

	<main>
		<%
		int id = 0;
		String title;
		String author;
		double rating;
		String image;

		// Step 1: Load JDBCDriver 
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create Statement object 
		Statement stmt = conn.createStatement();

		// Step 5: Execute SQL Command 
		String sqlStr = "SELECT * FROM books";
		ResultSet rs = stmt.executeQuery(sqlStr);

		while (rs.next() && id <= 5) {
			id = rs.getInt("id");
			title = rs.getString("title");
			author = rs.getString("author");
			rating = rs.getDouble("rating");
			image = rs.getString("image");
		%>

		<div class="books">
			<div>
				<img src="../images/<%=image%>" alt="" class="book-img">
			</div>
			<div class="descp">
				<h2 class="book-name">
					<%=title%>
				</h2>
				<h3 class="author">
					by
					<%=author%>
				</h3>
				<h3 class="rating">
					<%=rating%>
				</h3>
				<p class="info">Popular book that is well-loved by many in National Library Store</p>
				<form action="bookDetail.jsp">
					<button type="submit" name="id" value="<%=id%>">See the Book</button>
				</form>
			</div>
		</div>
		<%
		}
		%>
	</main>
</body>

<%@ include file="footer.html"%>

</html>