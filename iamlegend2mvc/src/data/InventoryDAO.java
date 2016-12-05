package data;

import java.util.Collection;

import javax.persistence.NoResultException;

import entities.Item;

public interface InventoryDAO {

	public Collection<Integer> keySet();
	public Integer[] keyList();
	public int size();
	public Integer index(Integer itemID);
	public Item get(Integer id);
	public Category itemCategory(Integer id);
	public Collection<Item> values();
	public int adjustInventory(Integer id, int adjust);
}
