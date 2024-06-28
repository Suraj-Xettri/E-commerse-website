<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<%@ include file='pages/components/common_css_js.jsp' %>

<link rel="stylesheet" href='pages/Css/Nav.css'>
<link rel="stylesheet" href='pages/Css/footer.css'>

<link rel="stylesheet" href='pages/Css/aboutUs.css'>

</head>
<body>
<div class = "navv">
<%@ include file='pages/components/Nav.jsp' %>
</div>

<div class="SectionY">
    <div class="Container">
        <div class="Content-section">
           <div class="title">
            <h2>About Us</h2>
           </div>
           <div class="Content">
            <h3>
                𝓟𝓱𝓸𝓷𝓮 𝓗𝓾𝓽 𝓔𝓵𝓮𝓬𝓽𝓻𝓸𝓷𝓲𝓬𝓼 
             </h3>
             <p>
             	top-tier retailer offeringdiverse selection of smartphones and accessories, known for quality products and 
                 stellar customer service. They cater to all budgets with a sleek in-store and online experience, 
                 making them a trusted choice for tech enthusiasts and casual users 
                 
             </p>
                
                 
                <div class="Button">
                    <a href="">Read more</a>
                 </div>
                 
                 <div class="Contact-info">
                    <h3>Contact Us</h3>
                    <p>Phone: 9826181073</p>
                    <p>Email: example@example.com</p>
                    
                    <form action="#" method="POST">
                        <input type="email" name="email" id="email" placeholder="Your email" class="input-field">
                        <textarea name="message" id="message" placeholder="Enter your message" class="input-field"></textarea>
                        <input type="submit" value="Send" class="submit-button">
                    </form>
                </div>   
            </div>
           
        </div>
        </div>
    </div>
    <div>
    	<%@ include file='pages/components/Footer.jsp' %>
    </div>
    
</body>
</html>