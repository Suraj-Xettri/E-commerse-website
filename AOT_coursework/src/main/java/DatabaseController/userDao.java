package DatabaseController;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Util.StringUtils;
import model.User;

public class userDao {
public static Connection getConnection() throws SQLException, ClassNotFoundException{
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/coursework";
	String user = "root";
	String pass = "";
	return DriverManager.getConnection(url, user, pass);
}

public static int addUser(User u) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.INSERT_User);
		st.setString(1,u.getFirstName());
		st.setString(2,u.getLastName());
		st.setString(3,u.getEmail());
		st.setInt(4,u.getNumber());
		st.setString(5,u.getDob());
		st.setString(6,u.getAddress());
		st.setString(7, u.getPassword());
		
		int result = st.executeUpdate();
		return result > 0 ? 1: 0 ;
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return -1;
		
	}
}

public static boolean isValidUser(String email, String password) {
	try {
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_User);
		st.setString(1, email);
		st.setString(2,password);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			return true;
		}
		else {
			return false;
		}
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return false;
	}
		
}	

public static int getCounts() {
	int count = 0;
	int ee = 111;
	try (Connection con = getConnection()){
		PreparedStatement ps = con.prepareStatement(StringUtils.GET_UserTotal);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			count = rs.getInt("total_users");
		}
		return count;
		
	}catch(ClassNotFoundException |SQLException e) {
		e.printStackTrace();
		return ee;
	}
}


public ArrayList<User>getUser(){
	ArrayList<User> userList =new ArrayList<>();
	try (Connection con = getConnection()){
		PreparedStatement ps = con.prepareStatement(StringUtils.GET_User);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			User user = new User(rs.getInt("user_id"),rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), 
					rs.getInt("number"),rs.getString("date"), rs.getString("address"), rs.getString("password"));
		userList.add(user);
		}
		
	}catch(ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	return userList;
}

public static String getUserName(String email) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.GET_USERNAME);
		st.setString(1, email);
		ResultSet rs = st.executeQuery();
		 if (rs.next()) {
	            return rs.getString("firstname");
	        } else {
	            return null;
	        }
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return "Error";
	}
	
}

public static int getUserId(String email) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.GET_USERID);
		st.setString(1, email);
		ResultSet rs = st.executeQuery();
		 if (rs.next()) {
	            return rs.getInt("user_id");
	        } else {
	            return 0;
	        }
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return 0;
	}
	
}

public ArrayList<User> getUserById(int user_id) {
    ArrayList<User> userList = new ArrayList<>();
    try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.GET_UserByID);
        ps.setInt(1, user_id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User user = new User(
                    rs.getInt("user_id"),
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getInt("number"),
                    rs.getString("date"),
                    rs.getString("address"),
                    rs.getString("password"));
            userList.add(user);
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    return userList;
}


public static boolean deletUser(int user_id) {
	try (Connection con = getConnection()) {
        PreparedStatement ps = con.prepareStatement(StringUtils.delet_user);
        ps.setInt(1, user_id); // Set the category ID parameter
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; 
  
}catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    return false;
}

}
}
