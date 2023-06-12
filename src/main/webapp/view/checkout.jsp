<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color: #49b79c; color: white; font-size: 1.5em; text-align: center;">
	<%@page import="books.*"%>
	<%@page import="java.util.*"%>
	<%@page import="java.sql.*"%>

	<%
	Book book = new Book();
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	int memberId = (int) session.getAttribute("memberId");

	@SuppressWarnings("unchecked")
	ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");

	try {
		// Step 1: Load JDBCDriver 
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=Password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create Statement object 
		Statement stmt = conn.createStatement();

		for (int i = 0; i < bookCart.size(); i++) {
			Book cartBook = bookCart.get(i);

			// Step 5: Execute SQL Command 
			String sqlStr = "INSERT INTO orders (bookId, memberId) VALUES(?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, cartBook.getId());
			pstmt.setInt(2, memberId);
			int count = pstmt.executeUpdate();
		}

		// Step 6: Close connection
		conn.close();
	} catch (Exception e) {
		out.println("Error :" + e);
	}

	session.removeAttribute("bookCart");
	%>
	<h1>Success!</h1>
	<p>Thank you for your purchase!</p>
	<p>
		We have sent a confirmation email to
		<%=sessUserEmail%>.
	</p>
	<a href="index.jsp">
		<button style="width: 100px; height: 40px; font-size: 20px; border-radius: 10px;">Home</button>
	</a>
</body>
</html>