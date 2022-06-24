<%@ page import="java.sql.*"%>
<%@ page import="connection.SQLConnection"%>

<%
	String fname = request.getParameter("firstname");
	String gender = request.getParameter("gender");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String lname = request.getParameter("lastname");
	
	String query = "Select * from Account Where username=?";
	try {
		PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
		pst.setString(1, username);;
		ResultSet rs = pst.executeQuery();
		
		if (rs.next()) {
			out.print(false);
		}else{
			String insertquery = "INSERT INTO Account(firstname,lastname,gender,balance,username,password) values (?,?,?,?,?,HASHBYTES('SHA1',?))";
			PreparedStatement pst1 = SQLConnection.getConnection().prepareStatement(insertquery);
            pst1.setString(1, fname);
            pst1.setString(2, lname);
            pst1.setString(3, gender);
            pst1.setFloat(4, 0);
            pst1.setString(5, username);
            pst1.setString(6, password);
            
            if(pst1.executeUpdate() > 0){
            	out.print(true);
            }
		}

	} catch (SQLException ex) {
		System.out.print(ex);
	} catch (ClassNotFoundException ex) {
		System.out.print(ex);
	}



%>