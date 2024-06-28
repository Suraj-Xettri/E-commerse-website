<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DatabaseController.userDao" %>
<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<%@ include file='pages/components/common_css_js.jsp' %>
<link rel="stylesheet" href='pages/Css/userProfile.css'>
<link rel="stylesheet" href='pages/Css/Nav.css'>
</head>
<body>

<div class = "navv">
<%@ include file='pages/components/Nav.jsp' %>
</div>


<%

		int userID = 0; 
		Object userIDObj = session.getAttribute("userID");
		if (userIDObj != null) {
		    userID = (int) userIDObj;
		}
	userDao u = new userDao();
	ArrayList<User> userList = new ArrayList<>();
	userList = u.getUserById(userID);
	for (User user : userList) {
	   if (user != null) { %>
	<section class="d-flex justify-content-center align-items-center h-100" style="background-color: #f4f5f7">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col col-lg-6 mb-4 mb-lg-0">
	        <div class="card mb-3" style="border-radius: .5rem;">
	          <div class="row g-0">
	            <div class="col-md-4 gradient-custom text-center text-white"
	              style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
	              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
	                alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
	              <h5><%= user.getFirstName() %> <%= user.getLastName() %></h5>
	              <i class="far fa-edit mb-5"></i>
	            </div>
	            <div class="col-md-8">
	              <div class="card-body p-4">
	                <h6>Information</h6>
	                <hr class="mt-0 mb-4">
	                <div class="row pt-1">
	                  <div class="col-6 mb-3">
	                    <h6>Email</h6>
	                    <p class="text-muted"><%= user.getEmail() %></p>
	                  </div>
	                  <div class="col-6 mb-3">
	                    <h6>Phone</h6>
	                    <p class="text-muted"><%= user.getNumber() %></p>
	                  </div>
	                </div>
	                <h6>Order History</h6>
	                <hr class="mt-0 mb-4">
	                <div class="row pt-1">
	                  <div class="col-6 mb-3">
	                   
	                    <a href= "Cart.jsp" ><button type="button" class="btn btn-outline-secondary">View ordered Items</button></a>
	                  </div>
	                </div>
					                
					 <div class="d-flex justify-content-center mt-2">
					  <form action="logOutServlet" method="get">
					  
					 		<button type="submit" class="btn btn-danger">Log Out</button>
					 	</form>
					  </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	
<% }else{ %> 

		<p>Error vayoooooo</p>
<%	
	}		
	}%>

	
	
		                	
	
</body>
</html>