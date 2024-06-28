package model;

public class Cart{
	private int qty;
	private int cartId;
	private int userId;
	private int productId;
	
	
	

	public Cart(int qty, int userId, int productId) {
		super();
		this.qty = qty;
		this.userId = userId;
		this.productId = productId;
	}



	public Cart(int qty, int cartId, int userId, int productId) {
		super();
		this.qty = qty;
		this.cartId = cartId;
		this.userId = userId;
		this.productId = productId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
