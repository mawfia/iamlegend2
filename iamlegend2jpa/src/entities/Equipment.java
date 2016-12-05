package entities;
import javax.persistence.*;


@Entity
public class Equipment extends Item{
	
	@Column(name="category")
	@Enumerated(EnumType.STRING)
	private EquipmentCategory category;
	@ManyToOne
	@JoinColumn(name="cart_id")
	private Cart cart;
	
	public Equipment(){}

	public EquipmentCategory getEquipmentCategory() {
		return this.category;
	}
	public void setEquipmentCategory(EquipmentCategory category) {
		this.category = category;
	}

	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
}