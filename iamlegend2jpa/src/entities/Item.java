package entities;

import java.util.Comparator;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "item")
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Item implements Comparable<Item>{
	
	@Id
	protected Integer id;
	protected String name;
	protected String description;
	protected Float weight;
	protected Float MSRP;
	protected int quantity;
	protected String image;
	@ManyToOne
	@JoinColumn(name="cart_id")
	protected Cart cart;
	
	public Item(){
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getMSRP() {
		return this.MSRP;
	}
	public void setMSRP(float MSRP) {
		this.MSRP = MSRP;
	}
	public Float getWeight() {
		return weight;
	}
	public void setWeight(Float weight) {
		this.weight = weight;
	}
	
	public int getQuantity(){
		return quantity;
	}
	
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		System.out.println("this image is: " + this.image + " new image is:" + image);
		if(this.image == null && image != null) this.image = image;
//		System.out.println("test");
	}

	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((MSRP == null) ? 0 : MSRP.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((weight == null) ? 0 : weight.hashCode());
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
		Item other = (Item) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (MSRP == null) {
			if (other.MSRP != null)
				return false;
		} else if (!MSRP.equals(other.MSRP))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (weight == null) {
			if (other.weight != null)
				return false;
		} else if (!weight.equals(other.weight))
			return false;
		return true;
	}

	@Override
	public int compareTo(Item i) {
//		if( this.id.compareTo(i.id) == 0) 
//			if(this.MSRP.compareTo(i.MSRP) == 0) return this.weight.compareTo(i.weight);
//			else return this.MSRP.compareTo(i.MSRP);
//		else return this.id.compareTo(i.id);
		return this.id.compareTo(i.id);
	}
	
	

}
