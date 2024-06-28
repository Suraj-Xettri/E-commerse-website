package servletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseController.cartDob;

/**
 * Servlet implementation class updateCartServlet
 */
@WebServlet("/updateCartServlet")
public class updateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCartServlet() {
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
		int productId = Integer.parseInt(request.getParameter("productId"));
        int change = Integer.parseInt(request.getParameter("change"));
        int currentQuantity = Integer.parseInt(request.getParameter("quantity"));
        
        int newQuantity = currentQuantity + change;
        
        // Call your method to update the quantity in the database
        boolean success = cartDob.updateQuantityCart(productId, newQuantity);
        
        if (success) {
            response.sendRedirect("Cart.jsp");
        } else {
            // Handle update failure
            response.sendRedirect("error.jsp");
        }
	}

}
