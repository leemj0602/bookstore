<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
	<%
	String message = request.getParameter("errCode");

	if (message != null && message.equals("invalidLogin")) {
	%>
	<script>
		window.alert("Invalid Login Credentials!");
	</script>
	<%
	}
	%>

	<div class="login-page">
		<div class="form">
			<h1>
				<strong>Login</strong>
			</h1>
			<form class="login-form" action="verifyUser.jsp" method="POST">
				<input type="text" placeholder="Email" name="email" /> <input
					type="password" placeholder="Password" name="password" />
				<button>submit</button>
				<p class="message">
					Not registered? <a href="register.jsp">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>