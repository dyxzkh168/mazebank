<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="connection.SQLConnection"%>
<%@ page import="function.Function"%>

<%
	ResultSet rs;
	double balance = 0;
	String query = "Select * from Account Where username=?";
	try {
		PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
		pst.setString(1, (String)session.getAttribute("username"));
		rs = pst.executeQuery();
		if (rs.next()) {
			balance = Double.parseDouble(rs.getString("balance"));
			session.removeAttribute("balance");
			session.setAttribute("balance", rs.getString("balance"));
		}
	} catch (SQLException ex) {
		System.out.print(ex);
	} catch (ClassNotFoundException ex) {
		System.out.print(ex);
	}
	
	String accountNumber = Function.getAccountNumber((String)session.getAttribute("accountnumber"));
%>

<div class="account-container">
	<div class="row">
		<div class="col-md-6">
			<img src="./resources/images/card.png" width="80%" alt="card">
		</div>
		<div class="col-md-6">
			<label>Account Number:</label>
			<p style="font-weight: bold; font-size: 22px"><% out.print(accountNumber + " (" + session.getAttribute("firstname") + " " + session.getAttribute("lastname") + ")"); %></p>
			<label>Balance (US):</label>
			<p style="font-weight: bold; font-size: 22px"><% out.print(session.getAttribute("balance") + " $"); %></p>
			<label>Balance (KH):</label>
			<p style="font-weight: bold; font-size: 22px"><% out.print(new BigDecimal(balance * 4100).toPlainString() + " Riel"); %></p>
		</div>
	</div>
</div>