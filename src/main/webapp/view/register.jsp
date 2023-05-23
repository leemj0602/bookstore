<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="../css/register.css">
</head>
<body>
	<div class="form_wrapper">
		<div class="form_container">
			<div class="title_container">
				<h2>Register As Member</h2>
			</div>
			<div class="row clearfix">
				<div class="">
					<form>
						<div class="input_field">
							<span><i aria-hidden="true" class="fa fa-envelope"></i></span> <input
								type="email" name="email" placeholder="Email" required />
						</div>
						<div class="input_field">
							<span><i aria-hidden="true" class="fa fa-lock"></i></span> <input
								type="password" name="password" placeholder="Password" required />
						</div>
						<div class="input_field">
							<span><i aria-hidden="true" class="fa fa-lock"></i></span> <input
								type="password" name="password" placeholder="Re-type Password"
								required />
						</div>
						<div class="row clearfix">
							<div class="col_half">
								<div class="input_field">
									<span><i aria-hidden="true" class="fa fa-user"></i></span> <input
										type="text" name="name" placeholder="First Name" />
								</div>
							</div>
							<div class="col_half">
								<div class="input_field">
									<span><i aria-hidden="true" class="fa fa-user"></i></span> <input
										type="text" name="name" placeholder="Last Name" required />
								</div>
							</div>
						</div>
						<div class="input_field radio_option">
							<input type="radio" name="radiogroup1" id="rd1"> <label
								for="rd1">Male</label> <input type="radio" name="radiogroup1"
								id="rd2"> <label for="rd2">Female</label>
						</div>
						<div class="input_field select_option">
							<select>
								<option>Select a country</option>
								<option>Option 1</option>
								<option>Option 2</option>
							</select>
							<div class="select_arrow"></div>
						</div>
						<div class="input_field checkbox_option">
							<input type="checkbox" id="cb1"> <label for="cb1">I
								agree with terms and conditions</label>
						</div>
						<div class="input_field checkbox_option">
							<input type="checkbox" id="cb2"> <label for="cb2">I
								want to receive the newsletter</label>
						</div>
						<input class="button" type="submit" value="Register" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>