package DatabaseController;

import java.sql.Connection;	
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Util.StringUtils;
import model.Admin;



public class adminDao {
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/coursework";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
	}
	

public static int addAdmin(Admin a) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.INSERT_Admin);
		st.setString(1,a.getName());
		st.setString(2,a.getEmail());
		st.setInt(3,a.getPhone());
		st.setString(4, a.getPassword());
		
		
		int result = st.executeUpdate();
		return result > 0 ? 1: 0 ;
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return -1;
		
	}
}
public static boolean isValidAdmin(String email, String password) {
	try {
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_Admin);
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


public ArrayList<Admin>getAdmin(){
	ArrayList<Admin> adminList =new ArrayList<>();
	try (Connection con = getConnection()){
		PreparedStatement ps = con.prepareStatement(StringUtils.GET_admin);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Admin admin = new Admin(rs.getInt("admin_id"),rs.getString("Name"), rs.getString("Email"),
					rs.getInt("Phone"),rs.getString("Password"));
			adminList.add(admin);
		}
		
	}catch(ClassNotFoundException |SQLException e) {
		e.printStackTrace();
	}
	return adminList;
}


public static String getAdminName(String email) {
	try (Connection con = getConnection()){
		PreparedStatement st = con.prepareStatement(StringUtils.GET_AdminName);
		st.setString(1, email);
		ResultSet rs = st.executeQuery();
		 if (rs.next()) {
	            return rs.getString("Name");
	        } else {
	            return null;
	        }
		
	}catch(SQLException | ClassNotFoundException ex) {
		ex.printStackTrace();
		return "Error";
	}
	
}
}
