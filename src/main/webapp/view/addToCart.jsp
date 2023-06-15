<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="books.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.sql.*"%>

	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");

	if (sessUserEmail == null) {
		response.sendRedirect("login.jsp");
	} else {

		int id = Integer.parseInt(request.getParameter("id"));
		String title = "";
		String author = "";
		String image = "";
		double price = 0;

		try {
			// Step 1: Load JDBC Driver 
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/book_store_db?user=root&password=root1234&serverTimezone=UTC";

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
		image = rs.getString("image");
		price = rs.getDouble("price");
			}

			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}

		Book book = new Book(id, title, author, price, image);

		@SuppressWarnings("unchecked")
		//check for existing bookCart session
		ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");

		if (bookCart == null) {
			bookCart = new ArrayList<Book>();
		}
		bookCart.add(book);

		session.setAttribute("bookCart", bookCart);

		response.sendRedirect(request.getHeader("referer"));
	}
	%>
</body>
</html>