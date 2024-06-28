package model;

public class Category {
	private int categoryId;
	private String categoryName;
	private String categoryDisc;
	
	public Category(int categoryId, String categoryName, String categoryDisc) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDisc = categoryDisc;
	}

	public Category(String categoryName, String categoryDisc) {
		super();
		this.categoryName = categoryName;
		this.categoryDisc = categoryDisc;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDisc() {
		return categoryDisc;
	}

	public void setCategoryDisc(String categoryDisc) {
		this.categoryDisc = categoryDisc;
	}
	
}
