    <%@ page import="java.sql.SQLException" %>
    <%@  page import="DatabaseController.cartDob" %>
  	<%@ page import="model.Cart" %>
<body id = "main">
		<div class="top_nav">
            <div class="logo"> 
                <p> Phone Hut Electronics</p>
            </div>
            
            <div class="search_bar">
                <input type="text" placeholder="search" id="search">
            </div>
         
    
            <div class="rightNav">
            <% if(session.getAttribute("email") == null){	%>
		
                <a href="Login.jsp"><button type="button" class="btn btn-light">Log in</button></a>
                <a href="register.jsp"> <button type="button" class="btn btn-dark">Sign UP</button></a>
                <%}else{%>
                	<a href="userProfile.jsp"> <button type="button" class="btn btn-light"> <%= session.getAttribute("username")%></button></a>
               <% } %> 
            </div>    
        </div>

        <header>
            <div class="navmenu">
                <a href="Home.jsp">Home</a>
                <a href="product.jsp?category=all">Products</a>
                <a href="aboutUs.jsp">About Us</a>
            </div>
          <%
		    cartDob cd = new cartDob();
		    int totalCartItems = 0;
		    int user_Id = 0;
		    Object userIDO = session.getAttribute("userID");
		    if (userIDO != null) {
		        user_Id = (int) userIDO;

		    }
		totalCartItems = cd.getTotalCartItems(user_Id);

%>
           <div class="nav-icons"">
			    <a href="Cart.jsp" class= "text-white d-flex "> 
			        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="24" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
</svg>
			        <%-- Place to show cart items number --%>
			     
			        <span class="cart-items-number"><%= totalCartItems %></span>
    			</a> 
			</div>
        </header> 
</body>

  
