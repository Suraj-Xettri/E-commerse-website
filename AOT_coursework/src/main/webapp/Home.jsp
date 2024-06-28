<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList" %>
  <%@ page import="DatabaseController.addProductDob" %>
  <%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@ include file='pages/components/common_css_js.jsp' %>
<link rel="stylesheet" href='pages/Css/footer.css'>
<link rel="stylesheet" href='pages/Css/Nav.css'>

<link rel="stylesheet" href='pages/Css/Home.css'>

</head>
<body>

<div class = "navv">
	<%@ include file='pages/components/Nav.jsp' %>
</div>


<div class = "mainHome">
	
	<div class="swiper">
	      <img src="images/image1.jpg" alt="" >
	</div>
  


<div class="products-grid">
	        <% 
	            try {
	            	addProductDob db = new addProductDob();
	        		ArrayList<Product> productList=new ArrayList<>();
	        		productList = db.getLatestProduct();
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
				          
			 <%     }
	                
			            } catch (Exception e) { 
			                e.printStackTrace(); %>
			                <h1> Server Problem, Please wait for a minute</h1>
			          <%  }%>	                
</div>

	 <div class = "footer">
	    <%@ include file='pages/components/Footer.jsp' %>
	</div>

</div>

</body>
</html>