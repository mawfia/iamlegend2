package entities;
import javax.persistence.*;


@Entity
public class Optic extends Item{
	
	@Column(name ="magnification")
	private String magnification;
	//@Column(name="weapon_id")
	@OneToOne(mappedBy="optic")
	private Weapon weapon;
	@ManyToOne
	@JoinColumn(name="cart_id")
	private Cart cart;

	public Optic(){}
	
	public Weapon getWeapon(){
		return this.weapon;
	}
	
	public void setWeapon(Weapon weapon){
		this.weapon = weapon;
	}
	
	public String getMagnification(){
		return this.magnification;
	}
	
	public void setMagnification(String magnification){
		this.magnification = magnification;
	}
	
	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}


	@Override
	public String toString() {
		return "Optic [magnification=" + magnification + ", weapon=" + weapon + ", cart=" + cart + ", getId()="
				+ getId() + ", getName()=" + getName() + ", getDescription()=" + getDescription() + ", getMSRP()="
				+ getMSRP() + ", getWeight()=" + getWeight() + ", getQuantity()=" + getQuantity() + ", getImage()="
				+ getImage() + ", hashCode()=" + hashCode() + ", getClass()=" + getClass() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}