<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/cart.css">
</head>
<body>
	<%@page import="books.*"%>
	<%@ page import="java.util.*"%>

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

	<h1 style="text-align: center; position: relative; top: 60px;">Cart</h1>
	<br>
	<br>
	<br>
	<br>
	<div class="shopping-cart">
		<%
		int id = 0;
		String image, title, author;
		double price = 0, total = 0;
		@SuppressWarnings("unchecked")
		ArrayList<Book> bookCart = (ArrayList<Book>) session.getAttribute("bookCart");
		if (bookCart == null) {

		} else {
			for (int i = 0; i < bookCart.size(); i++) {
				Book displayBook = bookCart.get(i);
				id = displayBook.getId();
				image = displayBook.getImage();
				title = displayBook.getTitle();
				author = displayBook.getAuthor();
				price = displayBook.getPrice();
				total += price;
		%>
		<div class="product">
			<div class="product-image">
				<img src="../images/<%=image%>" alt="" class="book-img">
			</div>
			<div class="product-details">
				<div class="product-title"><%=title%></div>
				<p class="product-description"><%=author%></p>
				<br>
				<a href="bookDetail.jsp?id=<%=id%>" style="text-decoration: underline;">View details</a>
			</div>
			<div class="product-price">
				$<%=price%>
			</div>
			<div class="product-removal">
				<a href="removeCartItem.jsp?index=<%=i%>">
					<button class="remove-product">Remove</button>
				</a>
			</div>
		</div>
		<%
		}
		}
		%>
		<div class="totals">
			<div class="totals-item totals-item-total">
				<label>Grand Total: $<%=String.format("%.2f", total)%></label>
			</div>
			<a href="checkout.jsp">
				<button class="checkout">Checkout</button>
			</a>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>