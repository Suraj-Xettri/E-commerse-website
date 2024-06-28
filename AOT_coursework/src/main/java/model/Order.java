package model;



public class Order {
	private int order_id;
	private int user_id;
	private int product_id;
	private int quantity;
	public Order(int order_id, int user_id, int product_id, int quantity) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.quantity = quantity;
	}
	public Order(int user_id, int product_id, int quantity) {
		super();
		this.user_id = user_id;
		this.product_id = product_id;
		this.quantity = quantity;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}