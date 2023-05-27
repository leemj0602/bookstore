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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" type="text/css" href="../css/index.css">
</head>

<%@ include file="header.html"%>

<section class="welcome">
	<h1>Shop for your favorite books.</h1>
</section>

<body>
	<nav class="nav-bar">
		<div class="nav1">
			<form action="result.jsp" method="post" class="search">
				<input type="text" name="search" placeholder="Search Book">
				<button type="submit">
					<i class="bi bi-search"></i>
				</button>
			</form>
			<form action="result.jsp" class="category">
			<input type="submit" name="category" value="Fantasy">
			<input type="submit" name="category" value="Romance">
			<input type="submit" name="category" value="Science Fiction">
			</form>
			<!-- 			
			<a href="category.jsp?cat=fantasy">Fantasy</a>
			<a href="result.jsp?cat=romance">Romance</a>
			<a href="result.jsp?cat=science fiction">Science Fiction</a>	
 -->
		</div>
	</nav>
	<h1 style="font-size: 2em; text-align: center;">Some books that might interest you!</h1>
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
			<form action="bookDetail.jsp" style="border: 0px;">
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
					<button name="id" value="<%=id%>">See the Book</button>
				</div>
			</form>
		</div>

		<%
		}
		%>
	</main>
</body>

<%@ include file="footer.html"%>

</html>