<%@ page import="connection.SQLConnection"%>
<%@ page import="java.sql.*"%>

<%
int i = 1;
String query = "Select Format(date, 'dd-MMM-yyyy HH:mm:ss') Date, TransactionType.name Type ,ISNULL(transfername, '') TransferName, ISNULL(receivername, '') ReceiverName, Cast(amount as varchar) + ' $' Amount, ISNULL(remark, '') Remark from [Transaction] LEFT JOIN Account ON [Transaction].accountid = Account.id LEFT JOIN TransactionType On [Transaction].transactiontypeid = TransactionType.id where Account.username = ? order by [Transaction].id desc";
ResultSet rs;
%>

<div class="container-fluid">
	<table class="table-hover table-bordered table-striped" id="transactions_tbl" style="width: 100%">
	    <thead>
	        <tr class="text-center">
	            <th style="text-align:center; padding: 10px 0px;">No</th>
	            <th style="text-align:center; padding: 10px 0px;">Date</th>
	            <th style="text-align:center; padding: 10px 0px;">Transaction Type</th>
	            <th style="text-align:center; padding: 10px 0px;">Transfer Name</th>
	            <th style="text-align:center; padding: 10px 0px;">Receiver Name</th>
	            <th style="text-align:center; padding: 10px 0px;">Amount</th>
	            <th style="text-align:center; padding: 10px 0px;">Remark</th>
	        </tr>
	    </thead>
	    <tbody class="text-center">
			<%
			try {
				PreparedStatement pst = SQLConnection.getConnection().prepareStatement(query);
				pst.setString(1, (String)session.getAttribute("username"));
				rs = pst.executeQuery();
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+ i +"</td>");
					out.println("<td>"+ rs.getString("Date") +"</td>");
					out.println("<td>"+ rs.getString("Type") +"</td>");
					out.println("<td>"+ rs.getString("TransferName") +"</td>");
					out.println("<td>"+ rs.getString("ReceiverName") +"</td>");
					out.println("<td>"+ rs.getString("Amount") +"</td>");
					out.println("<td>"+ rs.getString("Remark") +"</td>");
					out.println("</tr>");
					i++;
				}
			} catch (SQLException ex) {
				System.out.println(ex);
			}
			%>
		</tbody>
	</table>
</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="resources/js/dataTables.bootstrap5.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/js/toastr.min.js"></script>

<script>
	$(document).ready(function(){
		$("#transactions_tbl").DataTable({});
	})
</script>