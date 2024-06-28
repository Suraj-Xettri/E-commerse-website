package DatabaseController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Util.StringUtils;
import model.Cart;
import model.Product;


public class cartDob {
	public static  Connection getConnection() 
			throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/coursework";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
	}
	
public static int addCart(Cart c) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.INSERT_Cart);
		st.setInt(1,c.getProductId());
		st.setInt(2,c.getQty());
		st.setInt(3,c.getUserId());
		
		
		int result = st.executeUpdate();
		return result > 0 ? 1: 0 ;
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return -1;
		
	}
}

public ArrayList<Product> getProductByCart(int user_id) {
    ArrayList<Product> ProductByCart = new ArrayList<>();
    try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.GET_CARTDETAILS);
        ps.setInt(1, user_id); // Set the category ID parameter
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
        	Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"), 
					rs.getInt("product_price"),rs.getString("product_img"));
		ProductByCart.add(product);
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    return ProductByCart;
}



public ArrayList<Cart> getCartList(int user_id) {
    ArrayList<Cart> CartList = new ArrayList<>();
    try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.checkCart);
        ps.setInt(1, user_id); // Set the category ID parameter
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
        	Cart c = new Cart(rs.getInt("quantity"),rs.getInt("user_id"), 
					rs.getInt("product_id"));
		CartList.add(c);
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    return CartList;
}



public static boolean getCartByUserIdAndProductId(int userId, int productId) {
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.checkCart);
        ps.setInt(1, userId);
        ps.setInt(2, productId);
        ResultSet rs = ps.executeQuery(); 
        
        if(rs.next()) {
        	return true;
        }else {
        	return false;
        }
  
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return false;
}
}


public static boolean deletProduct(int product_id) {
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.delet_product);
        ps.setInt(1, product_id); // Set the category ID parameter
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; 
  
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return false;
}

}


public int cartQuantity(int productId) {
    try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.cartQuantity);
        ps.setInt(1, productId); // Set the product ID parameter
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            return rs.getInt("quantity"); // Return the quantity from the first column of the result set
        } else {
            // Product not found in the cart, return 0 or handle accordingly
        	System.out.print("NOuiuiuiuioooooooooooooooooooooooooooooo");
            return 0;
            
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
        System.out.print("NOoooooooooooooooooooooooooooooo");
        return 0;
    }
}



public static boolean updateQuantity(int product_id) {
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.updateQuantity);
        ps.setInt(1, product_id); // Set the category ID parameter
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; 
  
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return false;
}

}


public static boolean updateQuantityCart(int product_id, int qty) {
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.updateQuantityByCart);
        ps.setInt(1, qty);
        ps.setInt(2, product_id); // Set the category ID parameter
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; 
  
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return false;
}

}



public int getTotalCartItems(int user_id){
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.updateQuantityByCart);
        ps.setInt(1, user_id);
        ResultSet rs = ps.executeQuery();
        int totalItems = 0;
        if(rs.next()) {
        	totalItems = rs.getInt("total_items");
        }
        
        return totalItems;
        
        
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return 0;
}
}


}
