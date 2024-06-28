<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ page import="java.util.ArrayList" %>
  <%@ page import="DatabaseController.addProductDob" %>
  <%@ page import="model.Product" %>
      
<%@ page import="java.util.ArrayList" %>
<%@ page import="DatabaseController.categoryDao" %>
<%@ page import="model.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product</title>
    <%@ include file='pages/components/common_css_js.jsp' %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href='pages/Css/Nav.css'>
    <link rel="stylesheet" href='pages/Css/footer.css'>
    <link rel="stylesheet" href="pages/Css/productPage.css">
     
</head>
<body>

	<div class = "navv"> <%@ include file='pages/components/Nav.jsp' %> </div> 

	<div class="sidebar">
	    <div class="secondsection">
	        <a href="product.jsp?category=all"> All</a> 
	        <%
					  	categoryDao c = new categoryDao();
						ArrayList<Category> categoryList = new ArrayList<>();
						categoryList = c.getCategories();
						for (Category category : categoryList) {
						   if (category != null) { %>
						    <a href="product.jsp?category=<%= category.getCategoryId() %>">
						      <%= category.getCategoryName() %>
						    </a>
						  <% } %>
						<% } %>
	       
	    </div>
	</div>
	    <div class="products-grid">
	    
	    
	        <% 
	        
	        String cat = request.getParameter("category");
	        if (cat != null) {
	            try {
	            	addProductDob db = new addProductDob();
	            	
	        		ArrayList<Product> productList=new ArrayList<>();
	        		productList = db.getProduct();
	        		
	        		
                	ArrayList<Product> productsInCategory = new ArrayList<>();
                	
	                
	                // Iterate through the product list and display product details
	                if (productList != null && !productList.isEmpty()) {
						if(cat.trim().equals("all")){ 
						
						
			                for (Product product : productList) {
			                	
			        %>
			        	<form action="cartServlet" method = "post">
						         <div class="product-container">
						            <div class="product-image-container">
						                <img class="product-image"
						                src=<%= product.getProductImages() %> alt = "<%= product.getProductName() %>">
						            </div>
						    
						            <div class="product-name">
						               <%= product.getProductName() %>
						            </div>
						
						            <div class="product-description">
						               <%= product.getProductDescription() %>
						            </div>
						    
						    			
						            <div class="product-price">
						                Rs: <%= product.getProductPrice() %>
						            </div>
						            	<input type="hidden" name="quantity" value="1" min="1" >
										<input type="hidden" name="userID" value=<%= session.getAttribute("userID") %> >
										<input type="hidden" name="productId" value=<%= product.getProductId() %>>
						            	<button class="add-to-cart-button button-primary" type="submit">
						                Add to Cart
						            </button>  
					        	</div>
					        	
					        </form>
				         <% 
				         
			                }
			                }else{
			                	int ct = Integer.parseInt(cat.trim());
			                	productsInCategory = db.getProductByCategory(ct);
			                	for (Product pc : productsInCategory) {
			    			        %>
			    			        <form action="cartServlet" method = "post">
				    			      <div class="product-container">
							            <div class="product-image-container">
							                <img class="product-image"
							                src=<%= pc.getProductImages() %> alt = "<%= pc.getProductName() %>">
							            </div>
							    
							            <div class="product-name">
							               <%= pc.getProductName() %>
							            </div>
							
							            <div class="product-description">
							               <%= pc.getProductDescription() %>
							            </div>
							    
							    			
							            <div class="product-price">
							                Rs: <%= pc.getProductPrice() %>
							            </div>
							            <input type="hidden" name="quantity" value="1" min="1" >
										<input type="hidden" name="userID" value=<%= session.getAttribute("userID") %> min="1" >
										<input type="hidden" name="productId" value= <%= pc.getProductId() %>>		    
							            <button class="add-to-cart-button button-primary" type = "submit">
							                Add to Cart
							            </button>
					        		</div>
					        	
					        	</form>
			    	<%		        
			    			        
			                }
			               }
	                
	                }
						else {
			        %>
			                    <div>
			                        <h4>No products available.</h4>
			                    </div>
			          <%     }
	                
			            } catch (Exception e) { 
			                e.printStackTrace(); %>
			                <h1> Server Problem, Please wait for a minute</h1>
			          <%  }
	        }else{%>
	        	<p> No parameter passed </p>
	       <%} %> 
			       
	    </div>  
            
</body>
</html>