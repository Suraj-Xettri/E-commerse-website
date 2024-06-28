<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="DatabaseController.categoryDao" %>
<%@ page import="model.Category" %>

<%@ page import="DatabaseController.addProductDob" %>
 <%@ page import="model.Product" %>
 
 <%@ page import="DatabaseController.userDao" %>
 <%@ page import="model.User" %>
 
 <%@ page import="DatabaseController.adminDao" %>
 <%@ page import="model.Admin" %>

        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@ include file='pages/components/common_css_js.jsp' %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href='pages/Css/admin.css'>
</head>
<body>

<% if(session.getAttribute("Adminemail") == null){
	  response.sendRedirect("Login.jsp?error=10");
	  
}
%>

 <div class="sidebar">
        <div class="head">
            <h2><%= session.getAttribute("username")%></h2>
        </div>
       
        <div class="middle">

                <a href="adminPage.jsp?mode=dashboard">Dashboard</a>
                <a href="adminPage.jsp?mode=admin">Admin</a>
                <a href="adminPage.jsp?mode=category">Category</a>
                <a href="adminPage.jsp?mode=product">Product</a>
        </div>
        
       
            <form action="logOutServlet" method="get">
    			<button type="submit" class="btn btn-danger">Log Out</button>
			</form>
    </div>
    
    
    <% 
    	String mode = request.getParameter("mode");
    	if (mode == null || mode.trim().equals("dashboard")){
    %>
	    <div class="nav">
	        <h3 class="main-title">Dashboard</h3>
	    </div>
	    
	    <div class="main-content">
	        <div class="card-container">
	            <div class="card-wrapper">
	                <div class="payment-card" style="background: #FEE2E2;">
	                    <div class="card-header">
	                    <a class="amount" href="adminPage.jsp?mode=user">
	                    	
	                            <span class="title">Total Users</span>
	                         
	                            <span class="amount-value"> <%= request.getAttribute("userCount") %> </span>
	                    </a>
	                        
	                        <i class="fas fa-user icon x" style="background: #edcece;"></i>
	                    </div>
	                </div>
	        
	                <div class="payment-card" style="background: #EDE2FE;">
	                    <div class="card-header">
	                        <div class="amount">
	                            <span class="title">Pending Orders</span>
	                            <span class="amount-value">20</span>
	                        </div>
	                        <i class="fas fa-list icon" style="background: #8C4BB5;"></i>
	                    </div>
	                </div>
	        
	                <div class="payment-card" style="background: #D0FEE2;">
	                    <div class="card-header">
	                        <div class="amount">
	                            <span class="title">Earned</span>
	                            <span class="amount-value">$5000000</span>
	                        </div> 
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
 
    <% } else if(mode.trim().equals("admin")){ %>
    	<div class="coontainer">
	        <h2>Admin</h2>
	        <table>
	            <thead>
	                <tr>
	                	<th>Admin ID</th>
  	                    <th>Name</th>
	                    <th>Email</th>
	                    <th>Phone Number</th>
	                </tr>
	            </thead>
	            <tbody>
	            
	         
 				<%
		            adminDao adb = new adminDao();
		    		ArrayList<Admin> adminList=new ArrayList<>();
		    	 	adminList = adb.getAdmin();
		        	for (Admin admin : adminList) {
	            %>
	            	<tr>
	                    <td><%= admin.getId() %></td>
	                    <td><%= admin.getName() %></td>
	                    <td><%= admin.getEmail() %></td>
	                    <td><%= admin.getPassword() %></td>	                    
	                </tr>
	                <% } %>
	            </tbody>
        	</table>
        	
        	<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#addAdmin">
    			Add Admin
  			</button>
    	</div>
	          
	   
	    
	  
  
	    
	    
	    
	    
	   <!--  Category Page -->
	   
    <% }else if(mode.trim().equals("category")){ %>
		    <div class="tab">
		    	<h2>Category</h2>
		        <table>
		            <thead>
		                <tr>
		                    <th>Name</th>
		                    <th>Description</th>
		                    <th>Actions</th>
		                </tr>
		            </thead>
		            <tbody>
		             <%
					  	categoryDao c = new categoryDao();
						ArrayList<Category> categoryList = new ArrayList<>();
						categoryList = c.getCategories();
						for (Category category : categoryList) {
						   if (category != null) { %>
						     <tr>
			                    <td><%= category.getCategoryName() %></td>
			                    <td><%= category.getCategoryDisc() %></td>
			                    <td>
			                    
			                        <button class="delete-button">Delete</button>
			                    </td>
		                	</tr>
						  <% } %>
						<% } %>
		               
		            </tbody>
		        </table>
		        
		        <div class="button-container">
				    <button type="submit" data-toggle="modal" data-target="#add-category-model">
				        Add category
				    </button>
				</div>
		</div>
	    
		
		<!-- End Category Page -->
		
	<!-- Product Page  -->
	
	<% }else if(mode.trim().equals("product")){ %>
	    
	     <div class="coontainer">
	        <h2>Products</h2>
	        <table>
	            <thead>
	                <tr>
	                    <th>Image</th>
	                    <th>Product</th>
	                    <th>Price</th>
	                    <th>Quantity</th>
	                    <th>Action</th>
	                </tr>
	            </thead>
	            <tbody>
	            
	            <%
		            addProductDob db = new addProductDob();
		    		ArrayList<Product> productList=new ArrayList<>();
		    		productList = db.getProduct();
		        	ArrayList<Product> productsInCategory = new ArrayList<>();
		        	for (Product product : productList) {
	            %>
	                <tr>
	                    <td><img src=<%= product.getProductImages() %> alt=<%= product.getProductName() %> class="product-img"></td>
	                    <td><%= product.getProductName() %></td>
	                    <td><%= product.getProductPrice() %></td>
	                    <td class="quantity">
	                        <input type="text" value=<%= product.getProductQunatity() %> readonly>
	                    </td>
	                     <td> 
		                    <form action="deletProductServlet" method = "post">
		                    
		                    	 <input type="hidden" name="productId" value=<%= product.getProductId()%>>
		                   		 <button id = "b" type = "submit"> Delete Product </button> 
		                    
		                    </form>
	                    
	                    </td>
	                </tr>
	                <% } %>
	            </tbody>
        	</table>
	        <button type="button" id= "button" class="btn btn-primary" data-toggle="modal" data-target="#addProduct">
	    			Add Product
	  		</button>
    	</div>
<% }else if(mode.trim().equals("user")){ %>
	
		<div class="coontainer">
	        <h2>Users</h2>
	        <table>
	            <thead>
	                <tr>
	                    <th>First name</th>
	                    <th>Last name</th>
	                    <th>Email</th>
	                    <th>Phone Number</th>
	                    <th>Address</th>
	                    <th> Action</th>
	                    
	                </tr>
	            </thead>
	            <tbody>
 				<%
		            userDao udb = new userDao();
		    		ArrayList<User> userList=new ArrayList<>();
		    	 	userList = udb.getUser();
		        	for (User user : userList) {
	            %>
	            	<tr>
	                    <td><%= user.getFirstName() %></td>
	                    <td><%= user.getLastName() %></td>
	                    <td><%= user.getEmail() %></td>
	                    <td><%= user.getNumber() %></td>
	                    <td><%= user.getAddress() %></td>
	                   
	                   <td> 
		                    <form action="deletUserServlet" method = "post">
		                    
		                    	 <input type="hidden" name="userId" value=<%= user.getUserId() %>>
		                   		 <button id = "b" type = "submit"> Remove User </button> 
		                    
		                    </form>
	                    
	                    </td>
	                </tr>
	                <% } %>
	            </tbody>
        	</table>
    	</div>
	
	
	
  <% }else{ %> 
  
  		<h2>Bigreyooo</h2> 
         
     <%} %>
     
   
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	  
<!--Add category model -->
  <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Add Category</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="categoryServlet" method="post">
            <div class="form-group">
                <input type="text" class="form-control"  name = "Cname" placeholder="Caterogy Name" required>
            </div>

            <div class="form-group">
                <textarea name="Cdisc"cols="30" rows="10" required class="form-control" placeholder="Discription"></textarea>
            </div>

            <div class="container text-center">
                <button class="btn btn-outline-success">Add Category</button>
            </div> 
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- end add category model -->
   
                
                  
  <!-- Add products -->
  <!-- Modal -->
  <div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lar modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        
        	<form action="addProductServlet" method="post" enctype="multipart/form-data">
	            <div class="form-group">
	                <label for="productName">Product Name:</label>
	                <input type="text" id="productName" name="productName" required>
	            </div>
	            
	            
	            <div class="form-group">
	                <label for="description">Description:</label>
	                <textarea id="description" name="description" rows="3" required></textarea>
	            </div>
	            
	             <div class="form-group">
	            	<label for="category">Select a category:</label>
					<select id="category" name="category">
					<%
					  	categoryDao c = new categoryDao();
						ArrayList<Category> categoryList = new ArrayList<>();
						categoryList = c.getCategories();
						for (Category category : categoryList) { %>
						
					  <option value= <%= category.getCategoryId()%> ><%= category.getCategoryName() %></option>
					
					<%} %>
					</select>
	            </div>
	            
	            <div class="form-group" id = "in">
		            <div>
		            	<label for="stockQuantity">Stock Quantity:</label>
		                <input type="number" id="stockQuantity" name="stockQuantity" required>
		            </div>
		            
		            <div>
			            <label for="price">Price:</label>
		                <input type="number" id="price" name="price" required>
		            </div>
	            </div>
	            
	            <div class="form-group">
	                <label for="image">Image:</label>
	                <input type="file" id="image" name="image" accept="image/*" required>
	            </div>
	            <div class="form-group">
	                <input type="submit" value="Add Product">
	            </div>
        	</form>
        
        </div>
      </div>
    </div>
  </div>

  <!-- end add product model -->
  
  
   <!-- Start Add admin -->

     <!-- Button trigger modal -->

  <!-- Modal -->
  <div class="modal fade" id="addAdmin" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lar modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header cream-background">
          <h5 class="modal-title text-center" id="exampleModalLongTitle">Add Admin</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        
        <form id="register-form" action="addAdminServlet" method = "post">
							<div class="form-group">
								<label class="form-label">Username</label> <input type="text"
									name="Name"  class="form-control"
									placeholder="First name" required>
							</div>
							<div class="form-group">
								
								<label class="form-label">Mobile number</label> <input
									type="number" name = "number" id = "number" required
									placeholder="Mobile number" class="form-control ">
									
							</div>
							<div class="form-group">
								<label class="form-label">Email</label> <input
										type="email"
										class="form-control" placeholder="Email" name= "email" required>
							</div>
							
                            <div class="row">
									<div class="col-md-6 mt-2">
									<label class="form-label">Password</label> <input
										type="password" id = "password"
										placeholder="Password" class="form-control" name= "password" required>
								</div>

                                <div class="col-md-6 mt-2">
									<label class="form-label">Conform Password</label> <input
										type="password"
										class="form-control" placeholder=" Conform Password" id = "confirmPassword" required>
								</div>
							</div> 
							<div id="passwordError" style="color: red;"></div>
							

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-primary me-3">Add admin</button>
							</div>
 
    </form>
        </div>
      </div>
    </div>
  </div>

  <!-- end add admin model -->
                  
             
            
  
</body>
</html>