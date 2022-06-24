<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connection.SQLConnection"%>
	
<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	if(session.getAttribute("username") == null){
	    response.sendRedirect(SQLConnection.contextPath + "login.jsp");
	}
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<META HTTP-EQUIV="expires" CONTENT="0">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Maze Bank</title>
<link rel ="icon" href="./resources/images/mazebanklogo.png" type="image/x-icon">

<script src="./resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./resources/css/dataTables.bootstrap5.min.css">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/toastr.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css">
<link rel="stylesheet" href="./resources/css/index.css">
<script type="text/javascript" src="./resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<jsp:include page="./views/header.jsp" />

	<div class="container-lg menu-container">
		<div class="menu-child">
			<div class="menu account text-white text-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<img src="./resources/images/accounts.png" class="img-fluid"
					alt="account">
				<p>Account</p>
			</div>
			<div class="menu transfer text-white text-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<img src="./resources/images/transfer.png" class="img-fluid"
					alt="Transfer">
				<p>Transfer</p>
			</div>
		</div>
		<div class="menu-child">
			<div class="menu deposit text-white text-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<img src="./resources/images/deposit.png" class="img-fluid" alt="Deposit" >
				<p>Deposit</p>
			</div>
			<div class="menu withdraw text-white text-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<img src="./resources/images/withdraw.png" class="img-fluid"
					alt="Withdraw">
				<p>Withdraw</p>
			</div>
		</div>
		
		<div class="menu-child">
			<div class="menu quicktransfer text-white text-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<img src="./resources/images/contact.png" class="img-fluid"
					alt="Contact">
				<p>Quick Transfer</p>
			</div>
			<div class="menu transactions text-white text-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<img src="./resources/images/transaction.png" class="img-fluid"
					alt="Transactions">
				<p>Transactions</p>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg" id="mymodal">
		    <div class="modal-content bg-dark text-white">
		      <div class="modal-header">
		        <h3 class="modal-title" id="staticBackdropLabel">Modal title</h3>
		        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal" aria-label="Close">X</button>
		      </div>
		      <div class="modal-body" id="content">
					
		      </div>
		  </div>
		</div>
	</div>
	
	<jsp:include page="./views/footer.jsp" />
	<script type="text/javascript" src="./resources/js/index.js"></script>
</body>
</html>
