package DatabaseController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Util.StringUtils;
import model.Category;

public class categoryDao {
	public static  Connection getConnection() 
			throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/coursework";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
	}
	
	

public static int addCategory(Category c) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.INSERT_Category);
		st.setString(1,c.getCategoryName());
		st.setString(2,c.getCategoryDisc());
		
		
		int result = st.executeUpdate();
		return result > 0 ? 1: 0 ;
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return -1;
		
	}
}

public ArrayList<Category> getCategories() {
    ArrayList<Category> categories = new ArrayList<>();
    try (Connection con = getConnection()) {
        PreparedStatement st = con.prepareStatement(StringUtils.GET_CATERORIES);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("category_id");
            String name = rs.getString("category_name");
            String description = rs.getString("category_desc");
            Category category = new Category(id, name, description);
            categories.add(category);
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // Handle exceptions appropriately
    }

    return categories;
    
	}

    
}




