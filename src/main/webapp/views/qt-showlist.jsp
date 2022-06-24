<%@ page import="java.sql.*"%>
<%@ page import="org.json.*"%>
<%@ page import="connection.SQLConnection"%>
<%@ page import="function.Function"%>

<%
	int id = Integer.parseInt(session.getAttribute("id").toString());
	
	String contactId = (String)request.getParameter("id");
	
	if(contactId != null){
		String query = "DELETE FROM Contact where id = ?";
		PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
		pst.setInt(1, Integer.parseInt(contactId));
		try{
			pst.executeUpdate();
			out.print(true);
		}catch(Exception ex){
			System.out.println(ex);
			out.print("false");
		}
	}else{
		String query = "SELECT * FROM Contact where accountid = ?";
		ResultSet rs;
		PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
		pst.setInt(1, id);
		rs = pst.executeQuery();
		try{
			out.print(Function.convertToJSONArray(rs));
		}catch(Exception ex){
			System.out.println(ex);
		}
	}	
%>