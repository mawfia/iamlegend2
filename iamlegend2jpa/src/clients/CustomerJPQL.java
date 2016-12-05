package clients;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

import entities.CartStatus;
import entities.Customer;
import entities.Item;
import entities.Optic;
import entities.Weapon;
import entities.Cart;

public class CustomerJPQL {
	
	Cart cart = new Cart();
	
	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("iamlegend3");
		EntityManager em = emf.createEntityManager();
//		EntityTransaction tx = em.getTransaction();

		
//		Optic weap = em.find(Optic.class, 5000);
//		Cart cart = em.find(Cart.class, 2);
//		cart.setActive(true);
//		cart.setSurvivalScore(99);
//		cust.setAge(35F);
//		cust.setOrderStatus("Pending");
//		System.out.println(cart);
//		System.out.println(weap);
		
		//Customer customer = new Customer("mawfia@gmail.com", "George", null, "Washington", "Password0", 22F, 71F, 175F,94102, UserAccessLevel.BASIC);
		
		//em.getTransaction().begin();
		//Customer cust = em.find(Customer.class, 1503781774);
//		tx.begin();
		//em.remove(cust);
		//em.persist(customer);
		//em.getTransaction().commit();
		
		//tx.commit();
		em.close();
		emf.close();

	}

//	public Integer addItem(Item i){
//		System.out.println("In add" + i.getId() + " " + i.getQuantity());
//		if(i == null) return null;
//		else if(i.getQuantity() <= 0) return -1;
//		else if(new CustomerJPQL().totalWeight() >= 40) {cart.setCartStatus(CartStatus.FULL); return -2;}
//		else if(cart.totalWeight() + i.getWeight() > 40) return -3;
//	
//		cart.setCartStatus(CartStatus.SAVED);
//		//i.setQuantity(i.getQuantity()-1);
//		//if(cart.add(item)) return cart.size();
//		return null;
//	}
//	
//	public float totalWeight(){
//		float weight = 0;
//		//if(cart.size() > 0) for(Item i : cart.values()) weight += i.getWeight();
//		
//		return weight;
//	}
	
	
	
}
