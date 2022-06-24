<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connection.SQLConnection"%>
	
<%
	SQLConnection.contextPath = request.getContextPath() + "/";

	response.setHeader("Cache-Control", "no-cache, no-store");
	if(session.getAttribute("username") != null){
	    response.sendRedirect(SQLConnection.contextPath + "index.jsp");
	}
%>
	
	
	
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="expires" CONTENT="0">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Maze Bank - Login</title>
<link rel="icon" href="./resources/images/mazebanklogo.png" type="image/x-icon">
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css">  -->

<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css"
  rel="stylesheet"
/>

<link rel="stylesheet" href="./resources/css/login.css">

</head>
<body>
	<jsp:include page="./views/header-noUser.jsp" />

	<div class="alert alert-danger alert-sm login-alert alert-dismissible fade show" id="login-alert" style="top: 22%;">
		
	</div>	
	<form class="login-container bg-dark text-white" method="post" action="./views/loginaction.jsp" name="loginform" autocomplete="off">
		  <img src="./resources/images/mazebanklogo.png" class="img-fluid" alt="Responsive image">
		  <h2>Login</h2>
		  <div class="form-field email">
		    <input type="text" placeholder=" " class="text-white" name="username" />
		    <label>Username</label>
		  </div>
		  <div class="form-field pass">
		    <input type="password" placeholder=" " class="text-white" name="password">
		    <label>Password</label>
		</div>
		<button class="btn btn-primary btn-lg mt-3 button" onclick="return Validate();" name="submit" type="submit">Login</button>
		<a href="signup.jsp" class="link-info">No Account? Sign Up</a>
	</form>

	<jsp:include page="./views/footer.jsp" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="./resources/js/login.js"></script>
</body>
</html>





















