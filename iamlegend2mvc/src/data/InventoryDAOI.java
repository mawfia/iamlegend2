package data;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Ammunition;
import entities.Equipment;
import entities.Food;
import entities.Item;
import entities.Optic;
import entities.Weapon;
import data.Category;

@Transactional
public class InventoryDAOI implements InventoryDAO{
	Map<Integer,Item> inventory = new TreeMap<Integer, Item>();

	@PersistenceContext
	private EntityManager em;
	
	@PostConstruct
	public void init() {
		List<Ammunition> ammunition = em.createQuery("SELECT a FROM Ammunition a", Ammunition.class).getResultList();
		for(Ammunition a: ammunition) { inventory.put(a.getId(), a); }
		List<Optic> optic = em.createQuery("SELECT o FROM Optic o", Optic.class).getResultList();
		for(Optic o: optic) { inventory.put(o.getId(), o); }
		List<Weapon> weapons = em.createQuery("SELECT w FROM Weapon w", Weapon.class).getResultList();
		for(Weapon w: weapons) { mapWeapon(w); inventory.put(w.getId(), w); }
		List<Food> food = em.createQuery("SELECT f FROM Food f", Food.class).getResultList();
		for(Food f: food) { inventory.put(f.getId(), f); }
		List<Equipment> equipment = em.createQuery("SELECT e FROM Equipment e", Equipment.class).getResultList();
		for(Equipment e: equipment) { inventory.put(e.getId(), e); }
		
//		for(Item i : inventory.values()) System.out.println(i.getImage()); 
	}
	
	@Override
	public Collection<Integer> keySet(){
		return inventory.keySet();
	}

	@Override
	public Integer[] keyList(){
		Integer[] keyArray = new Integer[inventory.size()];
		int i= 0;
		for(Integer c: inventory.keySet()) { keyArray[i]=c; i++; }
		return keyArray;
	}
	
	@Override
	public int size(){
		return inventory.size();
	}
	
	@Override
	public Integer index(Integer itemID){
		if(itemID == null) return null;
		else{
				int i = 0;
				for(Integer k : inventory.keySet()) 
					if(k.equals(itemID)) return i;
					else i++;
		}
		return null;
	}
	
	@Override
	public Collection<Item> values(){
		return  inventory.values();
	}
	
	@Override
	public Item get(Integer id) throws NoResultException{
		if(id == null) return null;
		Item i = null;
		try{
				switch(itemCategory(id))
				{
					case Weapon: if( (i = em.find(Weapon.class, id)) !=  null) return i;
					case Food: if( (i = em.find(Food.class, id)) !=  null) return i;
					case Equipment: if( (i = em.find(Equipment.class, id)) !=  null) return i;
					case Ammunition: if( (i = em.find(Ammunition.class, id)) !=  null) return i;
					case Optics: if( (i = em.find(Optic.class, id)) !=  null) return i;
					default: break;
				}
			}
			catch(NoResultException NRE){
				System.err.println(NRE);
				return i;
			}
		
		return inventory.get(id); //  Update to return c;
	}
	
	@Override
	public int adjustInventory(Integer id, int adjust){
		
		if(id != null && inventory.containsKey(id))
			if(adjust <= 0){ // Means item was added to cart and needs to subtracted from inventory
				if(adjust == 0) {  } 
				else { // Means item was added to cart again 
						inventory.get(id).setQuantity(inventory.get(id).getQuantity()+adjust);
				}
			}	
			else if(adjust > 0){ // Means item was removed from cart and needs to be added to inventory
				inventory.get(id).setQuantity(inventory.get(id).getQuantity()+adjust);
			}
		
//		for(Item i : inventory.values()) System.out.println(i.getId() + " "+i.getQuantity());
		return inventory.get(id).getQuantity();
	}
	
	public void mapWeapon(Weapon weapon){
		switch(weapon.getId()){
		case 1000: weapon.setAmmunition((Ammunition)inventory.get(4001)); ((Ammunition)inventory.get(4001)).setWeapon(weapon); break;
		case 1001: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); break;
		case 1002: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); break;
		case 1003: weapon.setAmmunition((Ammunition)inventory.get(4002)); ((Ammunition)inventory.get(4002)).setWeapon(weapon); break;
		case 1004: weapon.setAmmunition((Ammunition)inventory.get(4002)); ((Ammunition)inventory.get(4002)).setWeapon(weapon); break;
		case 1005: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); ((Optic)inventory.get(5002)).setWeapon(weapon); break;
		case 1006: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); break;
		case 1007: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); ((Optic)inventory.get(5001)).setWeapon(weapon); break;
		case 1008: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); break;
		case 1009: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1010: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1011: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); ((Optic)inventory.get(5002)).setWeapon(weapon); break;
		case 1012: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1013: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); ((Optic)inventory.get(5002)).setWeapon(weapon); break;
		case 1014: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); break;
		case 1015: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1016: weapon.setAmmunition((Ammunition)inventory.get(4014)); ((Ammunition)inventory.get(4014)).setWeapon(weapon); break;
		case 1017: weapon.setAmmunition((Ammunition)inventory.get(4014)); ((Ammunition)inventory.get(4014)).setWeapon(weapon); break;
		case 1018: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); break;
		case 1019: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); break;
		case 1020: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1021: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1022: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1023: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1024: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1025: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); break;
		case 1026: weapon.setAmmunition((Ammunition)inventory.get(4002)); ((Ammunition)inventory.get(4002)).setWeapon(weapon); break;
		case 1027: weapon.setAmmunition((Ammunition)inventory.get(4005)); ((Ammunition)inventory.get(4005)).setWeapon(weapon); break;
		case 1028: weapon.setAmmunition((Ammunition)inventory.get(4006)); ((Ammunition)inventory.get(4006)).setWeapon(weapon); break;
		case 1029: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1030: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); break;
		case 1031: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); break;
		case 1032: weapon.setAmmunition((Ammunition)inventory.get(4013)); ((Ammunition)inventory.get(4013)).setWeapon(weapon); ((Optic)inventory.get(5007)).setWeapon(weapon); break;
		case 1033: weapon.setAmmunition((Ammunition)inventory.get(4009)); ((Ammunition)inventory.get(4009)).setWeapon(weapon); break;
		case 1034: weapon.setAmmunition((Ammunition)inventory.get(4008)); ((Ammunition)inventory.get(4008)).setWeapon(weapon); ((Optic)inventory.get(5003)).setWeapon(weapon); break;
		case 1035: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1036: weapon.setAmmunition((Ammunition)inventory.get(4000)); ((Ammunition)inventory.get(4000)).setWeapon(weapon); ((Optic)inventory.get(5008)).setWeapon(weapon); break;
		case 1037: weapon.setAmmunition((Ammunition)inventory.get(4010)); ((Ammunition)inventory.get(4010)).setWeapon(weapon); ((Optic)inventory.get(5002)).setWeapon(weapon); break;
		case 1038: weapon.setAmmunition((Ammunition)inventory.get(4009)); ((Ammunition)inventory.get(4009)).setWeapon(weapon); ((Optic)inventory.get(5005)).setWeapon(weapon); break;
		case 1039: weapon.setAmmunition((Ammunition)inventory.get(4011)); ((Ammunition)inventory.get(4011)).setWeapon(weapon); ((Optic)inventory.get(5005)).setWeapon(weapon); break;
		case 1040: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); ((Optic)inventory.get(5006)).setWeapon(weapon); break;
		case 1041: weapon.setAmmunition((Ammunition)inventory.get(4004)); ((Ammunition)inventory.get(4004)).setWeapon(weapon); ((Optic)inventory.get(5003)).setWeapon(weapon); break;
		case 1042: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1043: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1044: weapon.setAmmunition((Ammunition)inventory.get(4003)); ((Ammunition)inventory.get(4003)).setWeapon(weapon); break;
		case 1045: weapon.setAmmunition((Ammunition)inventory.get(4012)); ((Ammunition)inventory.get(4012)).setWeapon(weapon); break;
		case 1046: weapon.setAmmunition((Ammunition)inventory.get(4012)); ((Ammunition)inventory.get(4012)).setWeapon(weapon); break;
		default: break;
		}
		
		System.out.println( weapon.getId()+ " "+ weapon.getAmmunition());
	}
	
	public void mapAmmunition(Weapon weapon, Integer ammunition){
//		ammunition.setWeapon((Weapon)inventory.get(weapon));
		
	}
	
	public void mapOptics(Optic optics){
		
	}
	
	@Override
	public Category itemCategory(Integer id){
		if (id == null || id < 1000) return null; // Not in inventory
		else if(id < 2000) return Category.Weapon; // Weapons
		else if(id < 3000) return Category.Food; // Food
		else if (id < 4000) return Category.Equipment; // Equipment
		else if (id < 5000) return Category.Ammunition; // Ammunition
		else return Category.Optics; // Optics
	}
}
