package DatabaseController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Util.StringUtils;
import model.Product;

public class addProductDob {
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/coursework";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
	}
	
	public int saveProduct(Product p) {
		try (Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_PRODUCTS);
			st.setString(1, p.getProductName());
			st.setInt(2, p.getProductPrice());
			st.setInt(3, p.getProductQunatity());
			st.setString(4, p.getProductDescription());
			st.setString(5, p.getProductImages());
			st.setInt(6, p.getCategory_id());
			
			int result=st.executeUpdate();
			
			return result > 0 ? 1 : 0;

		}catch(SQLException | ClassNotFoundException ex){
			ex.printStackTrace();
			return -1;
		}
	}
	
	public ArrayList<Product>getProduct(){
		ArrayList<Product> productList =new ArrayList<>();
		try (Connection con = getConnection()){
			PreparedStatement ps = con.prepareStatement(StringUtils.GET_PRODUCT);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"), rs.getString("product_desc"), rs.getInt("product_price"), 
						rs.getInt("product_qty"),rs.getString("product_img"), rs.getInt("category_id"));
			productList.add(product);
			}
			
		}catch(ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	
public ArrayList<Product> getProductByCategory(int categoryId) {
	    ArrayList<Product> productCategory = new ArrayList<>();
	    try (Connection con = getConnection()) {
	        PreparedStatement ps = con.prepareStatement(StringUtils.getCategoryProduct);
	        ps.setInt(1, categoryId); // Set the category ID parameter
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"), rs.getString("product_desc"), rs.getInt("product_qty"), 
						rs.getInt("product_price"),rs.getString("product_img"), rs.getInt("category_id"));
			productCategory.add(product);
	        }

	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	    return productCategory;
	}

public static boolean deletProduct(int product_id) {
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.delete_product);
        ps.setInt(1, product_id); // Set the category ID parameter
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; 
  
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return false;
}

}

public ArrayList<Product>getLatestProduct(){
	ArrayList<Product> productList =new ArrayList<>();
	try (Connection con = getConnection()){
		PreparedStatement ps = con.prepareStatement(StringUtils.GET_latestProduct);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"), rs.getString("product_desc"), rs.getInt("product_price"), 
					rs.getInt("product_qty"),rs.getString("product_img"), rs.getInt("category_id"));
		productList.add(product);
		}
		
	}catch(ClassNotFoundException |SQLException e) {
		e.printStackTrace();
	}
	return productList;
}

}
