package entities;

import javax.persistence.*;

@Entity
public class Food extends Item{
	
	
	private Float calories;
	@Enumerated(EnumType.STRING)
	@Column(name = "food_type")
	private FoodType foodType;
	@ManyToOne
	@JoinColumn(name="cart_id")
	private Cart cart;
	
	public Food() {
	}
	
//	public Food(Integer id, String name, String description, Float weight, Float MSRP, Integer quantity, String image, Cart cart, Float calories, FoodType foodType){
//		super(id, name, description, weight, MSRP, quantity, "happy", null);
//		this.calories = calories;
//		this.foodType = foodType;
//	}
	

	public float getCalories() {
		return calories;
	}

	public void setCalories(float calories) {
		this.calories = calories;
	}

	public FoodType getFoodType() {
		return foodType;
	}

	public void setFoodType(FoodType foodType) {
		this.foodType = foodType;
	}

	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

}