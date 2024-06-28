package servletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseController.adminDao;
import model.Admin;


@WebServlet("/addAdminServlet")
public class addAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addAdminServlet() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String name = request.getParameter("Name");
		String email = request.getParameter("email");
		int number = Integer.parseInt(request.getParameter("number"));
		String password = request.getParameter("password");
		
		Admin admin = new Admin(name,email,number,password);
		
		int result = adminDao.addAdmin(admin);
		
		
		if(result > 0) {
			response.sendRedirect("adminPage.jsp");
		}else {
			response.sendRedirect("addAdmin.jsp?error=1");
			System.out.println("Error");		}
	}

}
