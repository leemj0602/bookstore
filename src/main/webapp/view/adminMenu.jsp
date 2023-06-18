<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Panel</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <div class="second-box" style="backgound-color: blue; margin-left: 250px;">
                <h2 style="margin-left: 500px;"> &nbsp; Administrator Menu </h2>
                <div class="nav-link center" style="margin-left:300px;">
                    <a href="adminNewBook.jsp" style="margin-left:130px">
                        <h3>Add Book</h3>
                    </a>
                    
                    
                    <a href="adminEditDeleteBook.jsp" style="margin-left:103px">
                        <h3>Edit/Delete Book</h3>
                    </a>
                    
                    <a href="adminDeleteMember.jsp" style="margin-left:110px">
                        <h3>Delete Member</h3>
                    </a>
                    
                    <a href="invalidateSession.jsp">
                        <p style="margin-left: 210px; margin-top: 80px; font-size: 40px; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">Log Out</p>
                    </a>            
                </div>
            </div>
        </div>
    </section>
</body>

</html>