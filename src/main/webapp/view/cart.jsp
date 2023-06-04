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

	<%
	@SuppressWarnings("unchecked")
	ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");
	if (bookCart == null) {
		out.print("No items in cart!");
	} else {
		for (int i = 0; i < bookCart.size(); i++) {
			Book displayBook = bookCart.get(i);
			out.print("Book " + (i + 1) + ":<br>");
			out.print(displayBook.getId() + "<br>");
		}
	}
	%>
</body>
</html>