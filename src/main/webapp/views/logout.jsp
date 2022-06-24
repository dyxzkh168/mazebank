<%@ page import="connection.SQLConnection"%>

<%
	session.invalidate();
	response.sendRedirect(SQLConnection.contextPath + "login.jsp");
%>