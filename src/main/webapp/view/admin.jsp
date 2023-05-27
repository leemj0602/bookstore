<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Panel</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
</head>
<body>
	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");

	if (sessUserEmail == null) {
		response.sendRedirect("login.jsp?errCode=invalidLogin");
	}
	%>
	<header role="banner">
		<h1>Administrator Panel</h1>
		<ul class="utilities">
			<li class="users"><a href="#">My Account</a></li>
			<li class="logout warn"><a id="Logout">Log Out</a></li>
		</ul>
	</header>

	<nav role='navigation'>
		<ul class="main">
			<li class="write"><a
				href="http://localhost:3001/admin_new_actor.html">Add New Actor</a></li>
			<li class="write"><a
				href="http://localhost:3001/admin_new_customer.html">Add New
					Customer</a></li>
		</ul>
	</nav>

	<main role="main">
		<section class="panel important">
			<h2>New Actor</h2>
			<form>
				<div class="twothirds">
					First Name:<br /> <input type="text" id="firstName"
						placeholder="Enter first name of actor" /><br /> Last name:<br />
					<input type="text" id="lastName"
						placeholder="Enter last name of actor" /> <br /> <input
						type="submit" value="Add" id="Add" />
					<h2 id="msg"></h2>
				</div>
			</form>
		</section>
	</main>
</body>
</html>