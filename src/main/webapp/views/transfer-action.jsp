<%@ page import="java.sql.*"%>
<%@ page import="connection.SQLConnection"%>

<%
	
float amount = Float.parseFloat(request.getParameter("amount"));
String accountNumber = request.getParameter("accountnumber");
String remark = (String)request.getParameter("remark");

	
	if(accountNumber.replaceAll(" ", "").equals((String)session.getAttribute("accountnumber"))){
		out.print("same");
	}else{
		String query1 = "Select * from Account Where accountnumber=?";
		ResultSet rs;
        try{
            PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query1);
            pst.setString(1, accountNumber.replaceAll(" ", ""));
            rs = pst.executeQuery();
            
            if(!rs.next()){
            	out.print("invalid");
            }else{
            	session.setAttribute("receivernumber", accountNumber);
            	out.print("{\"transfernumber\":\""+ (String)session.getAttribute("accountnumber") +"\", \"transfername\" : \""+ (String)session.getAttribute("firstname") + " " + (String)session.getAttribute("lastname") +"\", \"receiverid\" : \""+ rs.getString("id") +"\", \"receivernumber\" : \""+ accountNumber.toString() +"\", \"receivername\" : \"" + rs.getString("firstname") + " " + rs.getString("lastname")+"\", \"amount\" : \""+amount+"\", \"remark\":\""+remark+"\" }");
            }
        } catch (SQLException ex) {
			System.out.println(ex);
			out.print("false");
		}
	}

%>