<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<%@ include file='pages/components/common_css_js.jsp' %>

<link rel="stylesheet" href='pages/Css/Login.css'>
<link rel="stylesheet" href='pages/Css/Nav.css'>
</head>
<body>
<%@ include file='pages/components/Nav.jsp' %>
    <div class="container-fluid mt-4">
		<div class="row g-0">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">
						<h3 class="text-center">Create Account</h3>
						<!--registration-form-->
						<form id="register-form" action="RegisterationServlet" method="post">
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">First name</label> <input type="text"
										name="firstName" class="form-control"
										placeholder="First name" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Last name</label> <input type="text"
										name="lastName" placeholder="Last name"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Mobile number</label> <input
										type="number" name="number" id = "number" required
										placeholder="Mobile number" class="form-control ">
								</div>

                                <div class="col-md-6 mt-2">
									<label class="form-label">Email</label> <input
										type="email" name="email"
										class="form-control" placeholder="Email" required>
								</div>
									
							</div>
							<div id="numberError" style="color: red;"></div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Address</label> <input
										type="text" name="address"
										placeholder="Address" class="form-control" required>
								</div>

                                <div class="col-md-6 mt-2">
									<label class="form-label">Date OF Birth</label> <input
										type="date" name="date"
										class="form-control" required>
								</div>
							</div>  

                            <div class="row">
									<div class="col-md-6 mt-2">
									<label class="form-label">Password</label> <input
										type="password" name="password" id = "password"
										placeholder="Password" class="form-control" required>
								</div>

                                <div class="col-md-6 mt-2">
									<label class="form-label">Conform Password</label> <input
										type="password"
										class="form-control" placeholder=" Conform Password" id = "confirmPassword" required>
								</div>
							</div> 
							<div id="passwordError" style="color: red;"></div>
							

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-primary me-3" onclick="return validateForm()">Register</button>
							</div>
							<div class="mt-3 text-center">
								<h6>
									Already have an account?<a href="Login.jsp"
										style="text-decoration: none"> Sign in</a>
								</h6>
							</div>
							 <%String error = request.getParameter("error");
								
   								if (error != null && error.equals("1")){ %>
									<p style="color: red; text-align: center;">Failed to register? Try Again!!</p>
  
							<% }%>
							<%
							    if (error != null && error.equals("2")){ %>
								   <p style = "color: red;"> Failed to register? Try Again!! </p>
							   
							   <% } %> 
														
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	

<script>
    function validateForm() {
    	var firstName = document.getElementsByName("firstName")[0].value;
        var lastName = document.getElementsByName("lastName")[0].value;
        var email = document.getElementsByName("email")[0].value;
        var number = document.getElementById("number").value;
        var address = document.getElementsByName("address")[0].value;
        var dateOfBirth = document.getElementsByName("date")[0].value;
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var number = document.getElementById("number").value;
        var passwordError = document.getElementById("passwordError");
        var numberError = document.getElementById("numberError");
        
        
        if (firstName === "" || lastName === "" || email === "" || number === "" || address === "" || dateOfBirth === "" || password === "" || confirmPassword === "") {
            alert("All fields are required");
            return false; // Prevent form submission
        }else {
            numberError.textContent = "";
            
        // Validate number length
        if (number.length !== 10) {
            numberError.textContent = "Number must be 10 digits long";
            return false; // Prevent form submission
        } else {
            numberError.textContent = ""; // Clear number error message
        }

        if (password.length <= 8) {
            passwordError.textContent = "Password must be more than 8 characters long";
            return false; // Prevent form submission
        } else {
            passwordError.textContent = ""; // Clear password error message
        }
        // Validate password
        if (password !== confirmPassword) {
            passwordError.textContent = "Passwords do not match";
            return false; // Prevent form submission
        } else {
            passwordError.textContent = ""; // Clear password error message
        }
        return true; // Allow form submission
    }
</script>
</body>
</html>