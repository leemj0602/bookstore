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
	int id = Integer.parseInt(request.getParameter("id"));

	Book book = new Book(id);

	@SuppressWarnings("unchecked")
	//check for existing bookCart session
	ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");

	if (bookCart == null) {
		bookCart = new ArrayList<Book>();
	}
	bookCart.add(book);

	session.setAttribute("bookCart", bookCart);

	response.sendRedirect(request.getHeader("referer"));
	%>
</body>
</html>