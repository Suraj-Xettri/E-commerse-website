package servletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseController.cartDob;
import model.Cart;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null){
				response.sendRedirect("Login.jsp?error=10");
		
			}else {
	
				try {
					int productId = Integer.parseInt(request.getParameter("productId"));
			        int quantity = Integer.parseInt(request.getParameter("quantity"));
			        int userId = Integer.parseInt(request.getParameter("userID"));
			        
			        
			        if(cartDob.getCartByUserIdAndProductId(userId, productId)) {
			        	if(cartDob.updateQuantity(productId)) {
			        		response.sendRedirect("product.jsp?category=all");
			        	}else {
			        		System.out.print("k vayo k vayoooooo");
			        	}
			        }else {
			        	 
				        Cart cart = new Cart(quantity,userId,productId);
				        int result = cartDob.addCart(cart);
				        
				        if (result > 0) {
				            response.sendRedirect("product.jsp?category=all");
				        } else {
				            System.out.print("error");
				        }
			        }
			        
			       
				}catch (Exception e) {
	        // Log the exception instead of printing stack trace to console
			        e.printStackTrace();
			        response.sendRedirect("product.jsp");
			    }
}
	}
		
	

}
