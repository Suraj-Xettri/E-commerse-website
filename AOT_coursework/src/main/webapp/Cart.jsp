<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="DatabaseController.cartDob" %>
  	<%@ page import="model.Product" %>
  		<%@ page import="model.Cart" %>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href='pages/Css/Nav.css'>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .navv{
			position: fixed;
			z-index:100;
			top:0;
}

        .container{
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            position:relative;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 150px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        td{
        	height:100px;
        	width:100px;
        
        }

        th {
            background-color: #f2f2f2;
        }

        .checkout-btn {
            display: block;
            width: 300px;
            padding: 10px;
            text-align: center;
            
            margin: auto;
            margin-top:20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }

        .checkout-btn:hover {
            background-color: #0056b3;
        }

        .product-img {
            max-width: 100px;
            max-height: 100px;
            display: block;
            margin: auto;
        }

        .quantity form {
            display: flex;
            align-items: center;
        }

        .quantity input {
            width: 40px;
            text-align: center;
        }

        .quantity form button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 5px 10px;
            cursor: pointer;
            margin: 0 5px;
        }
        
        .bon{
        	background-color:red;
        	color:black;
        	padding:10px 20px;
        	border:none;
        	border-radius: 10px;
        }
        
         
    </style>
</head>
<body>
<% 
	if(session.getAttribute("email") == null){
	  response.sendRedirect("Login.jsp?error=10");
	
}
%>
	<div class = "navv">
		<%@ include file='pages/components/Nav.jsp' %>
	</div>


    <div class="container">
        <h2>Shopping Cart</h2>
        <table>
				<%
				
				    int userID = 0; 
				    Object userIDObj = session.getAttribute("userID");
				    if (userIDObj != null) {
				        userID = (int) userIDObj;
				    }
				    cartDob db = new cartDob();
				    ArrayList<Product> productList = db.getProductByCart(userID);
				    ArrayList<Cart> cartList = db.getCartList(userID);

				    
				%>
	
				<tr>
				    <th>Image</th>
				    <th>Product</th>
				    <th>Price</th>
				    <th>Quantity</th>
				    <th>Total</th>
				    <th>Action</th>
				</tr>
				
				<tbody>
				
				<%
					int cartItem = 0;
				    double grandTotal = 0.0;
					    for(Product pc : productList){
					    	int qty = db.cartQuantity(pc.getProductId());
					    	session.setAttribute("qty", qty);
					        double productTotal = pc.getProductPrice() * qty; // Initialize product total with the product's base price
				%>
				<tr>
				    <td><img src=<%= pc.getProductImages() %> alt=<%= pc.getProductName() %> class="product-img"></td>
				    <td><%= pc.getProductName() %></td>
				    <td>$<%= pc.getProductPrice() %></td>
				    <td class="quantity">
						<form action="updateCartServlet" method="post">
						    <button type="submit" name="change" value="-1">-</button>
						    <input type="text" name="quantity" value="<%= qty %>" readonly min = "1">
						    <button type="submit" name="change" value="1">+</button>
						    <input type="hidden" name="productId" value="<%= pc.getProductId()%>">
						</form>

				    </td>
				    <td class="total">$<span class="product-total"><%= productTotal %></span></td> <!-- Display product total -->
				    <td>
					    <form action="deleteServlet" method="post">
						    <input type="hidden" name="pruductID"  value = <%= pc.getProductId() %>>
					    	 <button type="submit" class="bon"> Delete </button> 
						</form>
					</td>
				</tr>
					<% 
				        grandTotal += productTotal; // Add product total to grand total
				    }
				%>
				</tbody>
				<tfoot>
				<tr>
				    <td colspan="4" style="text-align: right;"><strong>Total</strong></td>
				    <td>$<span id="grand-total"><%= grandTotal %></span></td> <!-- Display grand total -->
				</tr>
				</tfoot>
			</table>
			
			<%-- <%for(Cart cc : cartList){
		    	int qty = db.cartQuantity(cc.getProductId()); %>
			<form action="orderServlet" method="post">
				<input type="hidden" name="quantity" value= "<%= cc.getQty()%>" > <!-- Example value, replace with actual value -->
			    <input type="hidden" name="productID" value=<%= cc.getProductId() %> >
			     <input type="hidden" name="userID" value=<%= cc.getUserId() %> >
				<button class="checkout-btn" type = "submit">Proceed to Checkout</button>
			</form>
			
			<%} %> --%>
		</div>

<script>
    // JavaScript for updating product total and grand total dynamically
    function updateQuantity(button, change) {
        const input = button.parentNode.querySelector('input');
        let quantity = parseInt(input.value) + change;
        if (quantity < 1) {
            quantity = 1;
        }
        input.value = quantity;
        updateTotal(button);
    }

    function updateTotal(element) {
        const row = element.closest('tr');
        const price = parseFloat(row.querySelector('td:nth-child(3)').textContent.slice(1)); // Extract price from the third cell
        const quantity = parseInt(row.querySelector('input').value);
        const total = price * quantity;
        row.querySelector('.product-total').textContent = total.toFixed(2); // Update product total
        calculateGrandTotal();
    }

    function calculateGrandTotal() {
        const productTotals = document.querySelectorAll('.product-total');
        let grandTotal = 0;
        productTotals.forEach(function(element) {
            grandTotal += parseFloat(element.textContent);
        });
        document.getElementById('grand-total').textContent = grandTotal.toFixed(2); // Update grand total
    }
</script>

</body>
</html>
    