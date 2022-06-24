
var firstname = document.getElementById("firstname");
var lastname = document.getElementById("lastname");
var username = document.getElementById("username");
var gender = document.getElementById("gender");
var password = document.getElementById("password");
var repassword = document.getElementById("re-password");

function showError(error,timestamp = 3000,className = "alert-danger") {
	document.getElementById("login-alert").style.visibility = "visible";
	document.getElementById("login-alert").innerText = error;
	document.getElementById("login-alert").classList.add(className);
	document.getElementById("login-alert").style.animation = "fade-in 1s";
	setTimeout(function() {
		document.getElementById("login-alert").style.visibility = "hidden";
		document.getElementById("login-alert").style.animation = "fade-out 1s";
	}, timestamp)
}

function Validate(){
	
	var contextPath = "http://localhost:8080/Maze_Bank/";
	
	if(firstname.value === ""){
		firstname.style.borderColor = "red";
		return false;
	}else{
		firstname.style.borderColor = "white";
	}
	if(lastname.value === ""){
		lastname.style.borderColor = "red";
		return false;
	}else{
		lastname.style.borderColor = "white";
	}
	
	if(username.value === ""){
		username.style.borderColor = "red";
		return false;
	}else{
		username.style.borderColor = "white";
	}
	
	if(password.value === ""){
		password.style.borderColor = "red";
		return false;
	}else{
		password.style.borderColor = "white";
	}
	
	if(repassword.value === ""){
		repassword.style.borderColor = "red";
		return false;
	}else{
		repassword.style.borderColor = "white";
	}
	
	if(password.value !== repassword.value){
		showError("Password do not match!");
		return false;
	}else{
		var http = new XMLHttpRequest();
		http.open("POST", contextPath + "./views/signupaction.jsp",true);
		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		var params = "lastname=" + lastname.value + "&firstname=" + firstname.value + "&gender=" + gender.value + "&username=" + username.value + "&password=" + password.value;
		http.send(params);
		http.onload = function() {
			if(http.responseText.replace(/\s/g, '') == "false"){
				showError("Username already exist!");
			}else{
				showError("Sign Up Success! Please Log In", 3000, "alert-success");
				setTimeout(function(){ showError("Redirecting...", 3000, "alert-info");  }, 3000);
				setTimeout(function(){ location.replace(contextPath +'login.jsp');  }, 5000);
			}
		}	
	}	
	
	return false;
}