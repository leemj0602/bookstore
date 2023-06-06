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
	Book book = new Book();

	@SuppressWarnings("unchecked")
	ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");

	session.removeAttribute("bookCart");
	response.sendRedirect("index.jsp");
	%>
</body>
</html>