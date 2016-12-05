package entities;
import javax.persistence.*;


@Entity
public class Weapon  extends Item{
	
	private String manufactuer;	
	@Enumerated(EnumType.STRING)
	@Column(name="weapon_type")
	private WeaponType weaponType;
	@Column(name="country_of_origin")
	private String countryOfOrigin;
	@Column(name="production_year")
	private Integer productionYear;
	private String length;
	@Column(name="barrel_length")
	private String barrelLength;
	@Column(name="rate_of_fire")
	private String rateOfFire;
	@Column(name="muzzel_velocity")
	private String muzzelVelocity;
	@Column(name="effective_firing_range")
	private String effectiveFiringRange;
	@Column(name="maximum_firing_range")
	private String maximumFiringRange;
	
	@OneToOne
	@JoinColumn(name="ammunition")
	private Ammunition ammunition;
	
	@OneToOne
	@JoinColumn(name="optic")
	private Optic optic;
	
	@ManyToOne
	@JoinColumn(name="cart_id")
	private Cart cart;
	
	
	public Weapon(){		
	}
	
	public int getQuantity(){
		return super.quantity;
	}
	
	public void setQuantity(int quantity){
		super.quantity = quantity;
	}

	public String getManufactuer() {
		return manufactuer;
	}


	public void setManufactuer(String manufactuer) {
		this.manufactuer = manufactuer;
	}


	public WeaponType getWeaponType() {
		return weaponType;
	}


	public void setWeaponType(WeaponType weaponType) {
		this.weaponType = weaponType;
	}


	public String getCountryOfOrigin() {
		return countryOfOrigin;
	}


	public void setCountryOfOrigin(String countryOfOrigin) {
		this.countryOfOrigin = countryOfOrigin;
	}


	public int getProductionYear() {
		return productionYear;
	}


	public void setProductionYear(int productionYear) {
		this.productionYear = productionYear;
	}


	public String getLength() {
		return length;
	}


	public void setLength(String length) {
		this.length = length;
	}


	public String getBarrelLenght() {
		return barrelLength;
	}


	public void setBarrelLenght(String barrelLength) {
		this.barrelLength = barrelLength;
	}


	public String getRateOfFire() {
		return rateOfFire;
	}


	public void setRateOfFire(String rateOfFire) {
		this.rateOfFire = rateOfFire;
	}


	public String getMuzzelVelocity() {
		return muzzelVelocity;
	}


	public void setMuzzelVelocity(String muzzelVelocity) {
		this.muzzelVelocity = muzzelVelocity;
	}


	public String getEffectiveFiringRange() {
		return effectiveFiringRange;
	}


	public void setEffectiveFiringRange(String effectiveFiringRange) {
		this.effectiveFiringRange = effectiveFiringRange;
	}


	public String getMaximumFiringRange() {
		return maximumFiringRange;
	}


	public void setMaximumFiringRange(String maximumFiringRange) {
		this.maximumFiringRange = maximumFiringRange;
	}


	public Ammunition getAmmunition() {
		return ammunition;
	}


	public void setAmmunition(Ammunition ammunition) {
		this.ammunition = ammunition;
	}


	public Optic getOptic() {
		return optic;
	}


	public void setOptic(Optic optic) {
		this.optic = optic;
	}


	public Cart getCart() {
		return cart;
	}


	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	public String getImage(){
		return this.image;
	}
	
	@Override
	public void setImage(String image){
		super.image ="images/weapon/"+(super.id-1000)+".jpg";
	}

	@Override
	public String toString() {
		return "Weapon [manufactuer=" + manufactuer + ", weaponType=" + weaponType + ", countryOfOrigin="
				+ countryOfOrigin + ", getId()=" + getId() + ", getName()=" + getName() + ", getDescription()=" + getDescription()
				+ ", getMSRP()=" + getMSRP() + ", getWeight()=" + getWeight() + ", getQuantity()=" + getQuantity()
				+ ", getImage()=" + getImage() + "]";
	}
	

	

}