<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="../css/register.css">
</head>
<body>
	<%
	String message = request.getParameter("code");
	if (message != null) {
		if (message.equals("passwords_mismatch")) {
	%>
			<script>window.alert("Passwords Mismatch!")</script>
	<% 
		}
		
		else if (message.equals("missing_info")){
	%>
			<script>window.alert("Missing Information!")</script>
	<%
		}
	}
	%>
	<div class="form_wrapper">
		<div class="form_container">
			<div class="title_container">
				<h2>Register As Member</h2>
			</div>
			<div class="row clearfix">
				<div class="">
					<form action="insertUser.jsp">
						<div class="input_field">
							<span><i aria-hidden="true" class="fa fa-envelope"></i></span> 
							<input type="email" name="email" placeholder="Email" required />
						</div>
						
						<div class="input_field">
							<span><i aria-hidden="true" class="fa fa-lock"></i></span> 
							<input type="password" name="password" placeholder="Password" required />
						</div>
						
						<div class="input_field">
							<span><i aria-hidden="true" class="fa fa-lock"></i></span> 
							<input type="password" name="confirmPassword" placeholder="Re-type Password" required />
						</div>
						
						<div class="row clearfix">
							<div class="col_half">
								<div class="input_field">
									<span><i aria-hidden="true" class="fa fa-user"></i></span> 
									<input type="text" name="firstName" placeholder="First Name" required />
								</div>
							</div>
							
							<div class="col_half">
								<div class="input_field">
									<span><i aria-hidden="true" class="fa fa-user"></i></span> 
									<input type="text" name="lastName" placeholder="Last Name" required />
								</div>
							</div>
						</div>
						<input class="button" type="submit" value="Register" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>