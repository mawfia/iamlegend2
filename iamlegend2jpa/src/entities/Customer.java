package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Entity
public class Customer implements Comparable<Customer> {


	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "id")
	private Integer accountNumber;
	@Column(name = "account_balance")
	private Float accountBalance;
	@Pattern(regexp="^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$", message="Pattern.customer.email")
	private String email;
	@Pattern(regexp="^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[\\w\\d]{6,12}$", message="Pattern.customer.password")
	private String password;
	@Size(min=2, max=30, message="Size.customer.firstName")
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "middle_name")
	private String middleName;
	@Size(min=2, max=30, message="Size.customer.lastName")
	@Column(name = "last_name")
	private String lastName;
	@DecimalMin("18")
	@DecimalMax("130")
	private Float age;
	@DecimalMin("56")
	@DecimalMax("100")
	private Float height;
	@DecimalMin("85")
	@DecimalMax("700")
	private Float weight;
	private Integer zipcode;
	@Enumerated(EnumType.STRING)
	@Column(name = "access_level")
	private UserAccessLevel accessLevel;
	private String geoData;
	@Column(name = "security_question_1")
	private String securityQuestion1;
	@Column(name = "security_question_2")
	private String securityQuestion2;
	@OneToMany(mappedBy = "customer", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	List<Cart> cart;

	public Customer() {
		this.accessLevel = UserAccessLevel.GUEST;
	}
	
	public Customer(String e, String fn, String mn, String ln, String p, Float a, Float h, Float w, Integer z, UserAccessLevel accessLevel) {
		this.accountBalance = 5000.0F;
		this.email = e;
		this.firstName = fn;
		this.middleName = mn;
		this.lastName = ln;
		this.password = p;
		this.age = a;
		this.height = h;
		this.weight = w;
		this.zipcode = z;
		this.accessLevel = accessLevel;
		this.geoData = "";
		this.securityQuestion1 = "";
		this.securityQuestion2 = "";
		this.cart = null;
		this.accountNumber = Math.abs(this.hashCode());
	}
	
	public Customer(Integer acct, Float balance, String e, String fn, String mn, String ln, String p, Float a, Float h, Float w, Integer z, UserAccessLevel accessLevel){
		this(e, fn, mn, ln, p, a, h, w, z, accessLevel);
		this.accountNumber = acct;
		this.accountBalance = balance;
	}

	public Integer getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Integer accountNumber) {
		if(accountNumber == null )this.accountNumber = Math.abs(this.hashCode());
		else this.accountNumber = accountNumber;
	}
	
	public Float getAccountBalance(){
		return accountBalance;
	}
	
	public void setAccountBalance(Float accountBalance){
		this.accountBalance = accountBalance;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getMiddleName(){
		return this.middleName;
	}
	
	public void setMiddleName(String middleName){
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Float getAge() {
		return age;
	}

	public void setAge(Float age) {
		this.age = age;
	}
	
	public Float getHeight(){
		return this.height;
	}
	
	public void setHeight(Float height){
		this.height = height;
	}
	
	public Float getWeight(){
		return this.weight;
	}
	
	public void setWeight(Float weight){
		this.weight = weight;
	}
	
	public Integer getZipcode() {
		return zipcode;
	}
	
	public void setZipcode(Integer zipcode) {
		this.zipcode = zipcode;
	}
	
	public UserAccessLevel getAccessLevel() {
		return accessLevel;
	}

	public void setAccessLevel(UserAccessLevel accessLevel) {
		this.accessLevel = accessLevel;
	}
	
	public void setGeoData(String geoData){
		this.geoData = geoData;
	}
	
	public String getGeoData(){
		return this.geoData;
	}
	
	public List<Cart> getCart() {
		return this.cart;
	}
	
	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}
	
	public boolean addCartToHistory(Cart cart){
		return this.cart.add(cart);
	}
	
	public boolean deleteCartFromHistory(Cart cart){
		return this.cart.remove(cart);
	}
	
	public Customer copyUser(Customer user){
		
		String email = new String(user.email);
		String fname = new String(user.firstName);
		String mname;
		if(user.middleName != null) {mname = new String(user.middleName);}
		else { mname = null; }
		String lname = new String(user.lastName);
		String password = new String(user.password);
		float balance = user.accountBalance;
		float age = user.age;
		float height = user.height;
		float weight = user.weight;
		int zipcode = user.zipcode;
		UserAccessLevel accessLevel = user.accessLevel;
		int accountNumber = user.accountNumber;
		
		return new Customer(accountNumber, balance, email, fname, mname, lname, password, age, height, weight, zipcode, accessLevel);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accessLevel == null) ? 0 : accessLevel.hashCode());
		result = prime * result + ((age == null) ? 0 : age.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((zipcode == null) ? 0 : zipcode.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (accessLevel != other.accessLevel)
			return false;
		if (age == null) {
			if (other.age != null)
				return false;
		} else if (!age.equals(other.age))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (zipcode == null) {
			if (other.zipcode != null)
				return false;
		} else if (!zipcode.equals(other.zipcode))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Customer [accountNumber=" + accountNumber + ", accountBalance=" + accountBalance + ", email=" + email
				+ ", password=" + password + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName="
				+ lastName + ", age=" + age + ", height=" + height + ", weight=" + weight + ", zipcode=" + zipcode
				+ ", accessLevel=" + accessLevel + ", geoData=" + geoData + ", securityQuestion1=" + securityQuestion1
				+ ", securityQuestion2=" + securityQuestion2 + "cart="+ cart + "]";
	}

	@Override
	public int compareTo(Customer c) {
		if(this.lastName.compareTo(c.lastName) == 0)
			if(this.firstName.compareTo(c.firstName) == 0) return this.accountNumber.compareTo(c.accountNumber);
			else return this.firstName.compareTo(c.firstName);
		else return this.lastName.compareTo(c.lastName);		
		
	}


}