package servletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseController.EncriptionDao;
import DatabaseController.adminDao;
import DatabaseController.userDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		if (adminDao.isValidAdmin(email,password)) {
			
			String username = adminDao.getAdminName(email);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("Adminemail", email);
			
			session.setMaxInactiveInterval(30 * 60);
			response.sendRedirect("adminPage.jsp");
		}else {
			String encriptPass = EncriptionDao.encrypt(password);
			if (userDao.isValidUser(email, encriptPass)) {
			String username = userDao.getUserName(email);
			int userId = userDao.getUserId(email);
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("username", username);
			session.setAttribute("userID", userId);
			
			session.setMaxInactiveInterval(15 * 60);
			response.sendRedirect("Home.jsp");}
		else {
			response.sendRedirect("Login.jsp?error=1");
		}
	}
		}

}
