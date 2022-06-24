<%
	String balance = (String)session.getAttribute("balance");
%>


<div class="account-container">
	<div class="row">
		<div class="col-md-6">
			<img src="./resources/images/money-transfer.png" width="80%" alt="card">
		</div>
		<div class="col-md-6">
			<h4>Your Balance: <strong id="balance" style="font-size: 30px;"><% out.print(balance); %> $</strong></h4>
			<form method="get" action="./views/transfer-action.jsp" onsubmit="return sendData()">
				<div class="row mt-3">
					<div class="col-md-6 ">
						<div class="form-group ">
							<label>Account Number:</label>
							<div class="input-group mt-1">
								<input type="text" name="accountnumber" maxlength="11" id="accountnumber" class="form-control"
									autocomplete="off" aria-label="Amount (to the nearest dollar)"
									style="border-bottom-right-radius: 0px; border-top-right-radius: 0px;"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
								<div class="input-group-append">
									<span class="btn btn-danger"
										style="border-bottom-left-radius: 0px; border-top-left-radius: 0px;" id="showlist"><img
										src="./resources/images/contact1.png" width="100%"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Amount:</label>
							<div class="input-group mt-1">
								<input type="text" id="amount" class="form-control" maxlength="7"
									autocomplete="off" aria-label="Amount (to the nearest dollar)"
									style="border-bottom-right-radius: 0px; border-top-right-radius: 0px;"
									name="amount"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');var t = this.value;this.value = (t.indexOf('.') >= 0) ? (t.substr(0, t.indexOf('.')) + t.substr(t.indexOf('.'), 3)) : t;">
								<div class="input-group-append">
									<span class="btn btn-primary"
										style="border-bottom-left-radius: 0px; border-top-left-radius: 0px;">
										<img src="./resources/images/dollar.png" width="100%"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group mt-2">
					<label>Remark:</label>
					<textarea class="form-control mt-1" name="remark" id="remark" style="resize:none;"></textarea>
				</div>
				<div class="form-group">
					<button class="btn btn-success mt-3" id="submit">Transfer</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="contact">

</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var showlist = document.getElementById('showlist');
var myhtml = document.getElementById("contact");

showlist.addEventListener('click', function(){
	$.ajax({
	    type: 'get',
	    url: './views/qt-showlist.jsp',
	    icon: 'info',
	    success: function (response) {
		   	var list = JSON.parse(response.trim());
		   	myhtml.innerHTML = "";
		   	for(let i = 0; i < list.length; i++) {
		   	    let obj = list[i];
				myhtml.innerHTML += '<div id="'+obj.accountnumber+'" onclick="AddAccountNumber(this)" class="alert alert-primary d-flex justify-content-between align-items-center" role="alert" style="padding:5px; cursor: pointer;"><div><p style="margin:0px;text-align:left;">'+obj.name.toUpperCase() + " ("+obj.fullname.toUpperCase() +')</p><p style="margin:0px;text-align:left;"><strong>'+numberWithSpaces(obj.accountnumber)+'</strong></p></div><div></div></div>'
		   	}
		   	
		    swal({
		    	title: "Quick Transfer List",
		    	content: myhtml,
		    	icon: "info",
		    })
	    }
	});
});


document.getElementById('accountnumber').addEventListener('input', function (e) {
	  e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{3})/g, '$1 ').trim();
});


function numberWithSpaces(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

function AddAccountNumber(e){
	//alert(e.id);
	document.getElementById('accountnumber').value = numberWithSpaces(e.id);
	swal.close();
}

function sendData()
{
  var balance = parseFloat(document.getElementById("balance").innerText);
  var accountnumber = document.getElementById("accountnumber").value;
  var amount = document.getElementById("amount").value;
  var remark = document.getElementById("remark").value;
  
  if(accountnumber === ""){
	  toastr.error('Account Number Cannot Be Empty!');
	  return false;
  }
  
  if(amount === ""){
	  toastr.error('Amount Cannot Be Empty!');
	  return false;
  }
  
  if(amount > balance){
	  swal("Error!", "Transfer Error!, Please Check Your Balance!", "error");
	  return false;
  }
  
  
  $.ajax({
    type: 'post',
    url: './views/transfer-action.jsp',
    data: {
      accountnumber: accountnumber,
      amount:amount,
      remark:remark
    },
    success: function (response) {
    	//alert(response);
      if(response.trim() == "true"){
    	  swal("Success!", "Deposit Successfull!", "success");
      }else if(response.trim() == "same"){
    	  swal("Error!", "Cannot Transfer To Your Own Account!", "error");  
      }else if(response.trim() == "invalid"){
    	  swal("Error!", "Invalid Account or Account Not Found!", "error");  
      }else if(response.trim() == "false"){
    	  swal("Error!", "Error When Trying To Transfer, Please Try Again!", "error");  
      }else{
    	  var confirm = JSON.parse(response.trim());
    	  var myhtml = document.createElement("div");
    	  myhtml.innerHTML = '<div class="row"><div style="text-align:left" class="col-md-6"><p>Account Transfer Number</p><p>Account Transfer Name</p><p>Account Receiver Number</p><p>Account Receiver Name</p><p>Amount</p><p>Remark</p></div><div style="text-align:left" class="col-md-6"><p>: '+numberWithSpaces(confirm.transfernumber)+'</p><p>: '+confirm.transfername+'</p><p>: '+numberWithSpaces(confirm.receivernumber)+'</p><p>: '+confirm.receivername+'</p><p>: '+confirm.amount+' $</p><p>: '+confirm.remark+'</p></div></div>';
    	  //alert(confirm.receiverid)
    	  swal({
    	      title: "Are you sure?",
    	      content: myhtml,
    	      icon: "info",
    	      buttons: [
    	        'No, cancel it!',
    	        'Ok, Transfer'
    	      ],
    	      dangerMode: false,
    	    }).then(function(isConfirm) {
    	      if (isConfirm) {
    	    	  
    	    	$.ajax({
    	    		type: 'post',
    	    	    url: './views/transfer-confirmed.jsp',
    	    	    data: {
    	    	      accountnumber: accountnumber,
    	    	      amount:amount,
    	    	      remark:remark,
    	    	      receiverid: confirm.receiverid,
    	    	      receivername: confirm.receivername
    	    	    },success: function(response){
    	    	    	swal({
    	      	          title: 'Transfer',
    	      	          text: 'Transfer are successfully!',
    	      	          icon: 'success'
    	      	        })
    	      	      $("#content").load("./views/transfer.jsp");
    	    	    }
    	    	})  
    	      }
    	    })
    	}
  	}
  }) 
  return false;
}


</script>
