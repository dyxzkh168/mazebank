function showError(error) {
	document.getElementById("login-alert").style.visibility = "visible";
	document.getElementById("login-alert").innerText = error;
	document.getElementById("login-alert").style.animation = "fade-in 1s";
	setTimeout(function() {
		document.getElementById("login-alert").style.visibility = "hidden";
		document.getElementById("login-alert").style.animation = "fade-out 1s";
	}, 3000)
}

function Validate() {
	var contextPath = "http://localhost:8080/Maze_Bank/";
	var username = document.forms["loginform"]["username"].value;
	var password = document.forms["loginform"]["password"].value;
	
	var returnStage = false;
	
	if (password == "" && username == "") {
		//toastr.warning('warning messages');
		showError("Fields cannot be empty!");
		returnStage = false;
	} else if (username == null || username == "") {
		showError("Username cannot be empty!");

		returnStage = false;
	} else if (password == null || password == "") {
		showError("Password cannot be empty!");
		returnStage = false;
	} else {
		var http = new XMLHttpRequest();
		http.open("POST", contextPath + "views/loginaction.jsp",true);
		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		var params = "username=" + username + "&password=" + password;
		http.send(params);
		http.onload = function() {
			if(http.responseText.replace(/\s/g, '') == "false"){
				showError("Username or Password is Incorrect!");
				returnStage = false
			}else{
				location.replace(contextPath +'index.jsp');
			}
		}
	}
	return returnStage;
}