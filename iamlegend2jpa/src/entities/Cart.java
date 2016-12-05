package entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Cart implements Comparable<Cart>{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "status")
	@Enumerated(EnumType.STRING)
	private CartStatus status;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "customer_account_number")
	private Customer customer;
	
	@Column(name = "survival_score")
	private float survivalScore;
	
	@OneToMany(mappedBy="cart")
	private Set<Item> cart = new HashSet<Item>();
	
	public Cart(){
		this.status = CartStatus.EMPTY;
		
	}
	
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public CartStatus getCartStatus() {
		return this.status;
	}

	public void setCartStatus(CartStatus status) {
		this.status = status;
	}

	public float getSurvivalScore() {
		return survivalScore;
	}

	public void setSurvivalScore(int survivalScore) {
		this.survivalScore = survivalScore;
	}

	public int getId() {
		return id;
	}
	
	public void checkout(Customer customer){
		this.customer = customer;
		this.status = CartStatus.CHECKOUT;
		this.id = customer.cart.size()+1;
		customer.cart.add(this);
	}
	
	public Integer addItem(Item i){
		if(i == null) return null;
		else if(i.quantity <= 0) return -1;
		else if(totalWeight() >= 40) {this.status = CartStatus.FULL; return -2;}
		else if(totalWeight() + i.getWeight() > 40) return -3;
	
		this.status = CartStatus.SAVED;
		
		if(cart.contains(i)) return ++this.get(i.id).quantity;
		if(cart.add(i)) return i.quantity = 1;
		return null;
	}
	
	public Integer removeItem(Item item){
		if(item == null || !cart.contains(item)) return null;
		else{
				if(cart.size() == 0) return null;
				for(Item i : cart) 
					if(i.id == item.id && i.quantity > 1) return --i.quantity;
					else if(!cart.remove(item)) return null;
			}
		
		if(cart.isEmpty()) this.status = CartStatus.EMPTY;
		
		return --item.quantity;
	}
	
	public float totalWeight(){
		float weight = 0F;
		if(!cart.isEmpty()) for(Item i : this.cart) weight += (i.getWeight()*i.getQuantity());

		return weight;
	}
	
	public float totalPrice(){
		float total = 0;
		if(!cart.isEmpty()) for(Item i : cart) total += (i.MSRP*i.quantity); 
		return total;
	}
	
	public Set<Item> get(){
		return cart;
	}
	
	public Item get(int key){
		for(Item i : cart) if(i.id.equals(key)) return i;
		
		return null;
	}

	@Override
	public int compareTo(Cart o) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String toString() {
		return "Cart [id=" + id + ", status=" + status + " survivalScore=" + survivalScore
				+ ", items=" + cart + "]";
	}


}