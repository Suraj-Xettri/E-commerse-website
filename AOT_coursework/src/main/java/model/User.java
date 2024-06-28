package model;

public class User {
	private int userId;
	private String firstName;
	private String lastName;
	private String email;
	private int number;
	private String dob;
	private String address;
	public String password;
	
	
	
	public User(int userId, String firstName, String lastName, String email, int number, String dob, String address,
			String password) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.number = number;
		this.dob = dob;
		this.address = address;
		this.password = password;
	}

	public User(String firstName, String lastName, String email, int number, String dob, String address,
			String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.number = number;
		this.dob = dob;
		this.address = address;
		this.password = password;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}