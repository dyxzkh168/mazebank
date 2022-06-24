<%@ page import="java.sql.*"%>
<%@ page import="connection.SQLConnection"%>

<%	
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		String query = "Select * from Account Where username=? and password=HASHBYTES('SHA1',?)";
		try {
			PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("id", rs.getInt("id"));
				session.setAttribute("firstname", rs.getString("firstname"));
				session.setAttribute("lastname", rs.getString("lastname"));
				session.setAttribute("gender", rs.getString("gender"));
				session.setAttribute("username",rs.getString("username"));
				session.setAttribute("balance", rs.getString("balance"));
				session.setAttribute("accountnumber", rs.getString("accountnumber"));
			}else{
				out.print(false);
			}
		} catch (SQLException ex) {
			System.out.print(ex);
		} catch (ClassNotFoundException ex) {
			System.out.print(ex);
		}
%>