var contextPath = "http://localhost:8080/Maze_Bank/";

$(document).ready(function(){
	
	$(".account").click(function(){
		document.getElementById("staticBackdropLabel").innerText = "Account";
		$(".modal-dialog").removeClass("modal-xl");
		$("#content").load("./views/account.jsp");
	})
	
	$(".deposit").click(function(){
		document.getElementById("staticBackdropLabel").innerText = "Deposit";
		$(".modal-dialog").removeClass("modal-xl");
		$("#content").load("./views/deposit.jsp");
	})
	
	$(".withdraw").click(function(){
		document.getElementById("staticBackdropLabel").innerText = "Withdraw";
		$(".modal-dialog").removeClass("modal-xl");
		$("#content").load("./views/withdraw.jsp");
	})
	$(".transactions").click(function(){
		document.getElementById("staticBackdropLabel").innerText = "Transactions";
		//$("#mymodal").addClass('modal');
		$(".modal-dialog").addClass("modal-xl");
		$("#content").load("./views/transactions.jsp");
	})
	$(".transfer").click(function(){
		document.getElementById("staticBackdropLabel").innerText = "Transfer";
		$(".modal-dialog").removeClass("modal-xl");
		$("#content").load("./views/transfer.jsp");
	})
	$(".quicktransfer").click(function(){
		document.getElementById("staticBackdropLabel").innerText = "Quick Transfer";
		$(".modal-dialog").removeClass("modal-xl");
		$("#content").load("./views/quicktransfer.jsp");
	})
	
})

