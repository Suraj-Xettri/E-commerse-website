package servletController;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseController.EncriptionDao;
import DatabaseController.userDao;
import model.User;


@WebServlet(asyncSupported = true, urlPatterns = {"/RegisterationServlet"})
public class RegisterationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterationServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	
	try {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String dob = request.getParameter("date");
		int number = Integer.parseInt(request.getParameter("number"));
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
	
		
		User user = new User(firstName, lastName, email, number, dob, address, EncriptionDao.encrypt(password));
		int result = userDao.addUser(user);
		
		
		if(result > 0) {
            response.sendRedirect("Login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=1");
            
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("register.jsp?error=2");
    }
}
	
	 
	 
	
	
	
	
}
