<%@ page import="java.sql.*"%>
<%@ page import="connection.SQLConnection"%>

<%
	double amount = Double.parseDouble(request.getParameter("amount"));

	if(amount > 0){
		double balance = Double.parseDouble((String)session.getAttribute("balance"));
		balance += amount;
        String query = "Update Account set balance=? where username=?";
        try{
            PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
            pst.setDouble(1, balance);
            pst.setString(2, (String)session.getAttribute("username"));
            pst.executeUpdate();
            
            //transaction
            String query1 = "INSERT INTO [dbo].[Transaction]([date],[accountid],[transactiontypeid],transfername,receivername,[amount],[remark]) VALUES (getdate(),?,?,?,?,?,?)";
            PreparedStatement pst1 = SQLConnection.getConnection().prepareStatement(query1);
            pst1.setInt(1, (Integer)(session.getAttribute("id")));
            pst1.setInt(2, 1);
            pst1.setString(3, null);
            pst1.setString(4, null);
            pst1.setDouble(5, amount);
            pst1.setString(6, null);
            pst1.executeUpdate();
            
            out.print("true");
        } catch (SQLException ex) {
			System.out.println(ex);
			out.print("false");
		}
	}
%>

