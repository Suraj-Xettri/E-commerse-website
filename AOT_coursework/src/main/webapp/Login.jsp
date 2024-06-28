<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In Page</title>
<%@ include file='pages/components/common_css_js.jsp' %>
<link rel="stylesheet" href='pages/Css/Nav.css'>
<link rel="stylesheet" href='pages/Css/Login.css'>

</head>
<body>

<%@ include file='pages/components/Nav.jsp' %>

	
   <div class="god">
        <div class="mainSection">
            <div class="top">
                <div class="tooop">
                    <p>Phone Hut</p>
                </div>
                <div class="lab">
                    <form action="LoginServlet" method = "post">
                        <input type="text" placeholder="Phone number, username, or email" name = "email"><br>
                        <input type="password" name="password" id="pd" placeholder="password"><br>
                          <%
					   	String error = request.getParameter("error");
					   if (error != null && error.equals("1")){ %>
						   <div class = "error">
						   		<p style = "color: red"> Invalid user name or password </p>
						   </div>
					   		<%} %>
					   	<%
					   		if (error != null && error.equals("10")){ %>
						   <div class = "error">
						   		<p style = "color: red"> Log In first to get access !!</p>
						   </div>
					   	<%} %>
                        <button type = "submit">Log in</button>
                    </form>
                </div>
                <div class="mid">
                    <div class="miss">
                        <p>OR</p>
                    </div>
                </div>
    
                <div class="button">
                    <div>
                        <p>Don't have an account?<a href="register.jsp">Sign up</a></p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
   

</body>
</html>