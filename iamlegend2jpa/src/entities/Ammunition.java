
package entities;

import java.beans.Transient;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Ammunition extends Item{

	//@Column(name="weapon_id")
	@OneToOne(mappedBy="ammunition")
	private Weapon weapon;
	@ManyToOne
	@JoinColumn(name="cart_id")
	private Cart cart;
	private String caliber;
	
	public Ammunition() {
	}
	
	public void setWeapon(Weapon weapon){
		this.weapon = weapon;
	}
	
	public Weapon getWeapon(){
		return this.weapon;
	}
	
	public String getCaliber(){
		return this.caliber;
	}
	
	public void setCaliber(String caliber){
		this.caliber = caliber;
	}

	@Override
	public String toString() {
		return "Ammunition [getId()=" + getId() + ", getName()=" + getName() + ", getDescription()=" + getDescription()
				+ ", getMSRP()=" + getMSRP() + ", getWeight()=" + getWeight() + ", getQuantity()=" + getQuantity()
				+ ", getImage()=" + getImage() + ", getCart()=" + getCart()	+ ", getClass()=" + getClass() + "]";
	}
	
	
}
