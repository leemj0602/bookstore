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
	int index = Integer.parseInt(request.getParameter("index"));

	Book book = new Book();

	@SuppressWarnings("unchecked")
	//check for existing bookCart session
	ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");

	bookCart.remove(index);

	session.setAttribute("bookCart", bookCart);

	response.sendRedirect(request.getHeader("referer"));
	%>
</body>
</html>