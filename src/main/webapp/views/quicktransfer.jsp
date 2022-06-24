<script src="./resources/js/bootstrap.bundle.min.js"></script>
<div class="account-container">
	<div class="row">
		<div class="col-md-6">
			<img src="./resources/images/money.png" width="80%" alt="card">
		</div>
		<div class="col-md-6">
			<form method="get" action="./views/quicktransfer-action.jsp" onsubmit="return false;">
				<div class="row mt-1">
					<div class="col-md-12 ">
						<p style="margin: 0px;"><strong>Save</strong> here Maze Bank account of your relatives, friends or business partners. to whom you transfer funds frequently.</p>
						<div class="form-group mt-2">
							<label>Account Number:</label>
							<div class="input-group">
								<input type="text" name="accountnumber" maxlength="11" id="accountnumber" class="form-control"
									autocomplete="off" aria-label="Amount (to the nearest dollar)"
									style="border-bottom-right-radius: 0px; border-top-right-radius: 0px;"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">
								<div class="input-group-append">
									<span class="btn btn-secondary"
										style="border-bottom-left-radius: 0px; border-top-left-radius: 0px;">
										<img src="./resources/images/user.png" width="100%">
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group mt-2">
					<label>Name:</label>
					<input class="form-control mt-1" name="name" maxlength="30" id="name">
				</div>
				<div class="form-group d-flex justify-content-between">
					<button type="submit" class="btn btn-success mt-3" onclick="return sendData();" id="submit">Save</button>
					<button class="btn btn-primary mt-3" onclick="return false;" id="showlist" data-toggle="modal" data-target=".bd-example-modal-sm">Show List</button>
				</div>
			</form>
		</div>
	</div>
</div>

	<div id="contact">

	</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/js/toastr.min.js"></script>
<script>
var myhtml = document.getElementById("contact");
var showlist = document.getElementById('showlist');

document.getElementById('accountnumber').addEventListener('input', function (e) {
	  e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{3})/g, '$1 ').trim();
});


function numberWithSpaces(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

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
				myhtml.innerHTML += '<div class="alert alert-primary d-flex justify-content-between align-items-center" role="alert" style="padding:5px"><div><p style="margin:0px;text-align:left;">'+obj.name.toUpperCase() + " ("+obj.fullname.toUpperCase() +')</p><p style="margin:0px;text-align:left;"><strong>'+numberWithSpaces(obj.accountnumber)+'</strong></p></div><div><button class="btn btn-danger btn-sm" id="'+ obj.id +'" onclick="deleteContact(this);">X</button></div></div>'
		   	}
		   	
		    swal({
		    	title: "Quick Transfer List",
		    	content: myhtml,
		    	icon: "info",
		    })
	    }
	});
});


function deleteContact(e){
	
	swal({
	   title: "Are you sure?",
	   text: "Do you want to delete this?",
	   icon: "warning",
	   buttons: [
	      'Cancel',
	      'Delete'
	   ],
	   dangerMode: true,
	   }).then(function(isConfirm) {
	      if (isConfirm) {
	    	  $.ajax({
	    		    type: 'get',
	    		    url: './views/qt-showlist.jsp',
	    		    data: {
	    		      id: e.id
	    		    },
	    		    success: function (response) {
	    		    	//alert(response);
	    		        if(response.trim() == "true"){
	    		        	swal({title: "Successful!", text:"Deleted Successfully!", timer: 2000 });
	    		        	setTimeout(function(){
	    		        		showlist.click();
	    		        	},3000)
	    		        	//e.parentElement.parentElement.remove();
	    		        }else{
	    		        	swal({title: "Error!", text:"Deleted Failed!", timer: 2000 });
	    		        	setTimeout(function(){
	    		        		showlist.click();
	    		        	},3000)
	    		        }
	    		    }
	    	});
	      }else{
	        	setTimeout(function(){
	        		showlist.click();
	        	},500)
	      }
	 }) 
}


function sendData()
{
  var accountnumber = document.getElementById("accountnumber").value;
  var name = document.getElementById("name").value;
  
  if(accountnumber === "" || name === ""){
	  toastr.error('Field Cannot Be Empty!');
	  return false;
  }
  
  $.ajax({
    type: 'get',
    url: './views/quicktransfer-action.jsp',
    data: {
      accountnumber: accountnumber,
      name: name
    },
    success: function (response) {
        if(response.trim() == "true"){
      	  swal("Success!", "Saved Successfull!", "success");
        }else if(response.trim() == "same"){
      	  swal("Error!", "Cannot Saved Your Own Account!", "error");  
        }else if(response.trim() == "invalid"){
      	  swal("Error!", "Invalid Account or Account Not Found!", "error");  
        }else if(response.trim() == "exist"){
      	  swal("Error!", "Account already Saved!", "error");  
        }else{
      	  swal("Error!", "Error When Trying To Saved, Please Try Again!", "error");  
        }
    }
  });
  
  return false;
}

</script>
