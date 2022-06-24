<%@ page import="java.sql.*"%>
<%@ page import="connection.SQLConnection"%>

<%
	String accountNumber = request.getParameter("accountnumber").replaceAll(" ", "");
	String name = request.getParameter("name");
	int accountid = (Integer)session.getAttribute("id");
	
	if(accountNumber.replaceAll(" ", "").equals((String)session.getAttribute("accountnumber"))){
		out.print("same");
	}else{
		String query = "Select * from Account Where accountnumber=?";
		ResultSet rs;
        try{
            PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
            pst.setString(1, accountNumber.replaceAll(" ", ""));
            rs = pst.executeQuery();
            
            if(!rs.next()){
            	out.print("invalid");
            }else{
            	ResultSet rs2;
            	String query2 = "Select * from Contact Where accountnumber=?";
            	PreparedStatement pst2 = SQLConnection.getConnection().prepareStatement(query2);
                pst2.setString(1, accountNumber);
                rs2 = pst2.executeQuery();
                if(rs2.next()){
                	out.print("exist");
                }else{
                	
                	String query1 = "INSERT INTO Contact Values (?,?,?,?)";
                	PreparedStatement pst1 = SQLConnection.getConnection().prepareStatement(query1);
                	pst1.setInt(1,accountid);
                	pst1.setString(2,name);
                	pst1.setString(3,accountNumber);
                	pst1.setString(4,rs.getString("firstname") + " " + rs.getString("lastname"));
                	
                	if(pst1.executeUpdate() > 0){
                		out.print("true");
                	}else{
                		out.print("false");
                	}
                }
            }
        } catch (SQLException ex) {
			System.out.println(ex);
			out.print("false");
		}
	}
%>