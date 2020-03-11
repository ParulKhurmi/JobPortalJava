package model;

public class Register {

	private int userid;
	private String firstname;
	private String lastname;
	private int age;
	private String address;
	private String username;
	private String password;
	private int role;
	private String email;
	
	public Register() {
		super();
		this.userid = 0;
		this.firstname = "";
		this.lastname = "";
		this.age = 0;
		this.address = "";
		this.username = "";
		this.password = "";
		this.role = 0;
		this.email = "";
	}	

	public Register(int id, String firstname, String lastname, int age, String address, String username,
			String password, int role, String email) {
		super();
		this.userid = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.age = age;
		this.address = address;
		this.username = username;
		this.password = password;
		this.role = role;
		this.email = email;
	}

	public int getuserId() {
		return userid;
	}

	public void setuserId(int userid) {
		this.userid = userid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Register [id=" + userid + ", firstname=" + firstname + ", lastname=" + lastname + ", age=" + age
				+ ", address=" + address + ", username=" + username + ", password=" + password + ", role=" + role
				+ ", email=" + email + "]";
	}

}

