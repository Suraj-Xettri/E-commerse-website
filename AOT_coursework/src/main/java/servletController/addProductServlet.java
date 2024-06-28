package servletController;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DatabaseController.addProductDob;
import model.Product;

/**
 * Servlet implementation class addProductServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 5,
maxRequestSize = 1024 * 1024 * 10)
@WebServlet("/addProductServlet")
public class addProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String productName = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("stockQuantity"));
        String productDesc = request.getParameter("description");
        
        int categoryId = Integer.parseInt(request.getParameter("category"));
		
        
        //Images part
        Part filePart = request.getPart("image");
        
        String fileName = filePart.getSubmittedFileName();
        
        String path = "C:\\Users\\dell\\eclipse-workspace\\AOT_coursework\\src\\main\\webapp\\images";
        
        // Save the image to the specified path
        OutputStream os = null;
        InputStream in = null;
        try {
            os= new FileOutputStream(new File(path + File.separator + fileName));
            in = filePart.getInputStream();
            
            addProductDob prod = new addProductDob();
            
            int read = 0;
            
            byte[] bytes = new byte[1024];
             
            while((read = in.read(bytes)) != -1){
             	os.write(bytes,0,read);
             }
             String Image = "images/"+fileName;
             
             Product product = new Product(productName,productDesc,price,quantity,Image,categoryId);

             int addCheck = prod.saveProduct(product);
             
             if(addCheck>0) {
             	System.out.println("Product added");
             	response.sendRedirect(request.getContextPath()+"/adminPage.jsp");
             }else {
            	 response.sendRedirect(request.getContextPath()+"/adminPage.jsp");
             }
             // Read image data and write it to the file
            
         } catch (FileNotFoundException e) {
             e.printStackTrace();
             System.out.println("Error occurred while saving the image.");
         }finally {
         // Close streams in case of any exceptions
         if (os != null) {
             os.close();
         }
         if (in != null) {
             in.close();
         }
         }
	}
}
