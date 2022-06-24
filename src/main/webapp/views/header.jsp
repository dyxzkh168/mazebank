<%@ page import="connection.SQLConnection"%>
<style>
.header-logo {
	font-size: 17px;
	padding: 10px 0px;
}

.header-logo img {
	margin: 0px;
	margin-right: 10px;
}

.header-logo a {
	color: white;
	text-decoration: none;
	transition: .150s ease-in-out;
}
</style>

<header class="bg-dark text-white">
	<div class="container d-flex justify-content-between align-items-center">
		<div class="header-logo d-flex align-items-center">
			<a class="logo" href=<% out.print(SQLConnection.contextPath + "index.jsp");%> ><img class="img-fluid" src="./resources/images/mazebanklogo.png" width="35px" height="35px">Maze Bank</a>
		</div>
		<div class="btn-group user">
			<a href="user.jsp" class="btn btn-primary btn-sm name"><% out.print(session.getAttribute("firstname") + " " + session.getAttribute("lastname")); %></a>
			<a href="./views/logout.jsp" onclick="return logout();" class="btn btn-danger btn-sm logout">Logout</a>
		</div>
	</div>
</header>
