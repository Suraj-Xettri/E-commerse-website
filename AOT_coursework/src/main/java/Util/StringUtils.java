package Util;

public class StringUtils{
	public static final String INSERT_User = "Insert into user (firstname,lastname, email, number, date,address, password) value(?,?,?,?,?,?,?)";
	public static final String INSERT_Admin = "Insert into admin (Name, Email, Phone, Password) value(?,?,?,?)";
	public static final String INSERT_Category = "Insert into productcategory (category_name, category_desc) value(?,?)";
	public static final String INSERT_Cart = "Insert into cart (product_id, quantity,user_id) value(?,?,?)";


	public static final String INSERT_PRODUCTS = "Insert into product (product_name,product_price, product_qty, product_desc, product_img,category_id) value(?,?,?,?,?,?)";

	public static final String GET_LOGIN_User = "Select * from user where email = ? and password = ?";
	public static final String GET_LOGIN_Admin = "Select * from admin where email = ? and password = ?";
	
	public static final String GET_CATERORIES = "Select * from productcategory";
	public static final String GET_PRODUCT = "Select * from product";
	public static final String GET_User = "Select * from user";
	
	public static final String GET_productQuantity = "Select product_qty from product where product_id = ?";

	public static final String GET_UserByID = "Select * from user where user_id = ?";
	
	public static final String GET_latestProduct = "Select * from product order by product_id DESC LIMIT 4;";

	public static final String GET_UserTotal = "SELECT COUNT(*) AS total_users FROM user";
	public static final String GET_admin = "Select * from admin";
	
	public static final String GET_TOTALCARTITEMS = "SELECT COUNT(*) AS total_items FROM cart where user_id = ?";
	
	public static final String GET_USERNAME = "Select firstName from user where email = ?";
	public static final String GET_AdminName = "Select Name from admin where email = ?";

	public static final String GET_USERID = "Select  user_id from user where email = ?";
	
	public static final String delet_product = "DELETE FROM cart WHERE product_id = ?";

	public static final String delet_user = "DELETE FROM user WHERE user_id = ?";

	public static final String checkCart = "SELECT * FROM cart WHERE user_id = ?";

	
	public static final String GET_CARTDETAILS = "SELECT p.product_id, p.product_name, p.product_price, p.product_img From cart c JOIN product p ON c.product_id = p.product_id "
			+ "										Join user u on c.user_id = u.user_id"
			+ "										WHERE c.user_id = ?";

	public static final String updateQuantity = "UPDATE cart SET quantity = quantity + 1 where product_id = ? ";
	
	public static final String updateQuantityByCart = "UPDATE cart SET quantity = ? where product_id = ? ";

	
	
	public static final String cartQuantity = "SELECT quantity from cart where product_id = ? ";
	

	public static final String delete_product = "DELETE FROM product WHERE product_id = ?";
		
	
	public static final String getCategoryProduct = "Select * from product where category_id = ? ";
}
