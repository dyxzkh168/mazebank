<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  
<%@ page import="connection.SQLConnection"%>  

<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	if(session.getAttribute("username") != null){
	    response.sendRedirect(SQLConnection.contextPath + "index.jsp");
	}

%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Maze Bank - SignUp</title>
<link rel="icon" href="./resources/images/mazebanklogo.png" type="image/x-icon">
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

	<div class="alert alert-sm login-alert alert-dismissible fade show" id="login-alert" style="top: 11%;">
		
	</div>	
	<form class="login-container bg-dark text-white" method="post" action="./views/signupaction.jsp" name="loginform" autocomplete="off">
		  <img src="./resources/images/mazebanklogo.png" class="img-fluid" alt="Responsive image">
		  <h2>Login</h2>
		  <div class="form-field">
		  	<div class="row">
		  		<div class="col-md-6 ">
		  			<input type="text" placeholder=" " class="text-white" name="firstname" id="firstname" />
		    		<label>Firstname</label>
		  		</div>
		  		<div class="col-md-6">
		  			<input type="text" placeholder=" " class="text-white" name="lastname" id="lastname" />
		    		<label class="lblastname">Lastname</label>
		  		</div>
		  	</div>
		  

		  </div>
		  <div class="form-field">
		  	<select class="form-select bg-dark text-white gender" name="gender" id="gender">
		  		<option value="Male">Male</option>
		  		<option value="Female">Female</option>
		  	</select>
		  </div>
		  <div class="form-field username">
		    <input type="text" placeholder=" " class="text-white" name="username" id="username"/>
		    <label>Username</label>
		  </div>
		  <div class="form-field pass">
		    <input type="password" placeholder=" " class="text-white" name="password" id="password">
		    <label>Password</label>
		  </div>
		  <div class="form-field re-pass">
		    <input type="password" placeholder=" " class="text-white" name="re-password" id="re-password">
		    <label>Re-Password</label>
		  </div>
		  <button class="btn btn-primary btn-lg mt-3 button" onclick="return Validate();" name="submit" type="submit">Sign Up</button>
		<a href="login.jsp" class="link-info">Back to Login</a>
	</form>

	<jsp:include page="./views/footer.jsp" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="./resources/js/signup.js"></script>
</body>
</html>