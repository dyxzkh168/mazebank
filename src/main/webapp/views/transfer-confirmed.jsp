<%@ page import="java.sql.*"%>
<%@ page import="connection.SQLConnection"%>

<%

String receivername = (String)request.getParameter("receivername");
double amount = Double.parseDouble(request.getParameter("amount"));
String remark = (String)request.getParameter("remark");
int receiverid = Integer.parseInt(request.getParameter("receiverid"));
double balance = Double.parseDouble((String)session.getAttribute("balance"));
        try{
        	
        	//Update Trasnfer Account Balance
        	String query1 = "UPDATE Account SET balance = ? where accountnumber = ?";
            balance = balance - amount; 
            PreparedStatement pst1 = SQLConnection.getConnection().prepareStatement(query1);
            pst1.setDouble(1, balance);
            pst1.setString(2, (String)session.getAttribute("accountnumber"));
            pst1.executeUpdate();
            
            //Update Receiver Account Balance
            String query2 = "UPDATE Account SET balance = balance + ? where id = ?";
            PreparedStatement pst2 = SQLConnection.getConnection().prepareStatement(query2);
            pst2.setDouble(1, amount);
            pst2.setInt(2, receiverid);
            pst2.executeUpdate();
            
            //Add Transaction Transfer ACC
            
            String query3 = "INSERT INTO [dbo].[Transaction]([date],[accountid],[transactiontypeid],transfername,receivername,[amount],remark) VALUES (getdate(),?,?,?,?,?,?)";
            PreparedStatement pst3 = SQLConnection.getConnection().prepareStatement(query3);
            pst3.setInt(1, (Integer)session.getAttribute("id"));
            pst3.setInt(2, 3);
            pst3.setString(3, (String)session.getAttribute("firstname") + " " + (String)session.getAttribute("lastname"));
            pst3.setString(4, receivername);
            pst3.setDouble(5, amount);
            pst3.setString(6, remark);
            pst3.executeUpdate();
            
            //Add Transaction Receiver ACC
            String query4 = "INSERT INTO [dbo].[Transaction]([date],[accountid],[transactiontypeid],transfername,receivername,[amount],remark) VALUES (getdate(),?,?,?,?,?,?)";
            PreparedStatement pst4 = SQLConnection.getConnection().prepareStatement(query4);
            pst3.setInt(1, receiverid);
            pst3.setInt(2, 4);
            pst3.setString(3, (String)session.getAttribute("firstname") + " " + (String)session.getAttribute("lastname"));
            pst3.setString(4, receivername);
            pst3.setDouble(5, amount);
            pst3.setString(6, remark);
            pst3.executeUpdate();
            
    		balance -= amount;
    		session.removeAttribute("balance");
    		session.setAttribute("balance", balance);
            
            
        } catch (SQLException ex) {
			System.out.println(ex);
			out.print("false");
		}

%>