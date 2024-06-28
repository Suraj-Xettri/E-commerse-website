package servletController;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DatabaseController.categoryDao;
import model.Category;

@WebServlet(asyncSupported = true, urlPatterns = {"/categoryServlet"})
public class categoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public categoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String category_name = request.getParameter("Cname");
            String category_desc = request.getParameter("Cdisc");

            if (category_name == null || category_desc == null || category_name.isEmpty() || category_desc.isEmpty()) {
                response.sendRedirect("addCategory.jsp?error=1");
                return; // Return to avoid further processing
            }

            Category category = new Category(category_name, category_desc);

            int result = categoryDao.addCategory(category);

            if (result > 0) {
                response.sendRedirect("adminPage.jsp");
            } else {
                System.out.print("error");
            }
        } catch (Exception e) {
            // Log the exception instead of printing stack trace to console
            e.printStackTrace();
        }
    }
}
