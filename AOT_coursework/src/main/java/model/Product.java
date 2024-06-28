package model;

public class Product {
	private int productId;
    private String productName;
    private String productDescription;
    private int productPrice;
    private int productQunatity;
    private String productImages;
    private int category_id;
	

    
public Product(int productId, String productName, int productPrice, String productImages) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productImages = productImages;
	}



public Product(String productName, String productDescription, int productPrice, int productQunatity,
			String productImages, int category_id) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
		this.category_id = category_id;
	}



	public Product(int productId, String productName, String productDescription, int productPrice,
			int productQunatity, String productImages, int category_id) {
		super();
		this.category_id = category_id;
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
	}
		
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQunatity() {
		return productQunatity;
	}

	public void setProductQunatity(int productQunatity) {
		this.productQunatity = productQunatity;
	}

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

}
