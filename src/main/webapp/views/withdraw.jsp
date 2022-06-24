
<div class="account-container">
	<div class="row">
		<div class="col-md-6">
			<img src="./resources/images/withdrawal.png" width="80%" alt="card">
		</div>
		<div class="col-md-6">
			<p><strong>Maze Bank</strong> truly understands the value of your
				hard-earned money and offers you fixed withdraw with higher return.</p>
			<p><strong>Withdrawal</strong> with our ATM system fast, easy and efficiency.</p>
			<form method="post" onsubmit="return sendData();">
				<div class="form-group">
					<label>Enter Amount To Withdraw:</label>
					<div class="input-group mt-2">
						<input 
							type="text" 
							id="amount"
							class="form-control"
							autocomplete="off"
							aria-label="Amount (to the nearest dollar)"
							style="border-bottom-right-radius: 0px; border-top-right-radius: 0px;" name="amount" 
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');var t = this.value;this.value = (t.indexOf('.') >= 0) ? (t.substr(0, t.indexOf('.')) + t.substr(t.indexOf('.'), 3)) : t;">
						<div class="input-group-append">
							<span class="btn btn-primary"
								style="border-bottom-left-radius: 0px; border-top-left-radius: 0px;">$</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-success mt-3" id="submit">Withdraw</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/js/toastr.min.js"></script>
<script>

function sendData()
{
	
  var amount = document.getElementById("amount").value;
  
  if(amount === ""){
		toastr.error('Amount Cannot Be Empty!');
		return false;
	}
  $.ajax({
    type: 'post',
    url: './views/withdraw-action.jsp',
    data: {
      amount:amount
    },
    success: function (response) {
      if(response.trim() == "true"){
    	  swal("Success!", "Withdraw Successfull!", "success");
      }else{
    	  swal("Error!", "Withdrawal Error!, Please Check Your Balance.", "error");
      }
    }
  });
    
  return false;
}


</script>
