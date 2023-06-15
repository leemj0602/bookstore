<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Panel</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/adminMenu.css" />
</head>

<body>
	<%
	String sessUserEmail = (String) session.getAttribute("sessUserEmail");
	String sessUserRole = (String) session.getAttribute("sessUserRole");
	String message = request.getParameter("status");

  	if (sessUserEmail == null || !sessUserRole.equals("Admin")) {
		response.sendRedirect("403.html");
	}
  	
  	else {
  		if (message != null) {
  			if (message.equals("error_occurred")) {
  	%>
	<script>window.alert("An error has occurred!")</script>
	<%
  			}
  			
  			else if (message.equals("successful")) {
  	%>
	<script>window.alert("Successful!")</script>
	<%
  			}
  		}
  	}
	%>
    <header class="nav center">
        <h1>Welcome, Administrator</h1>
    </header>
    <section class="main">
        <div class="box">
            <div class="second-box">
                <h2 style="margin-left: 380px;"> &nbsp; Administrator Menu </h2>
                <div class="nav-link center" style="margin-left:300px;">
                    <a href="adminNewBook.jsp">
                        <h3>Add Book</h3>
                    </a>
                    
                    <div class="line"></div>
                    
                    <a href="adminEditDeleteBook.jsp">
                        <h3>Edit/Delete Book</h3>
                    </a>
                </div>
            </div>
        </div>
    </section>
</body>

</html>