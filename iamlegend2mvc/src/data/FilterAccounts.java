package data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import entities.Customer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

public class FilterAccounts extends AuthenticationDAOI{
	
	List<Customer> filteredList = new ArrayList<Customer>();
//	AuthenticationDAOI filteredMap = new AuthenticationDAOI();
	
	
	public FilterAccounts(int selection, String search, AuthenticationDAO customers, FilterAccounts list) {
		
		if(search == null || list == null) for(Customer c : customers.values()) filteredList.add(c);
		else for(Customer c: list.values()) filteredList.add(c);
		Integer input =  null;

		switch (selection) {
		case 4: 
			Collections.sort(filteredList);
			//printAccounts(filteredList);
			break;
		case 5:
			Collections.sort(filteredList, (c1, c2) -> -(c1.getLastName().compareToIgnoreCase(c2.getLastName())));
			//printPresidents(presidentsList);	// For debugging purposes	
			break;
		case 6:
			Collections.sort(filteredList, (c1, c2) -> c1.getAccountBalance().compareTo(c2.getAccountBalance()));
			//printPresidents(filteredList);
			break;
		case 7:
			Collections.sort(filteredList, (c1, c2) -> -(c1.getAccountBalance().compareTo(c2.getAccountBalance())));
			//printPresidents(filteredList);			
			break;
		case 8:
				input =  null;
				try{
						input = Integer.parseInt(search);
					} catch(NumberFormatException NFE){ System.err.println(NFE); }
				if (input == null) {filteredList = null; return;} filteredList = filterAccounts(filteredList, (c) -> c.getAccountNumber().toString().contains(search)); break;
		case 9:
				input =  null;
				try{
						input = Integer.parseInt(search);
					} catch(NumberFormatException NFE){ System.err.println(NFE); }
				if (input == null) {filteredList = null; return;} filteredList = filterAccounts(filteredList, (c) -> c.getAccountBalance().toString().contains(search));
//			filteredList = filterAccounts(filteredList, (c) -> c.getLastName().toUpperCase().startsWith(search));
			//printPresidents(filteredList);												
			break;
		case 10: filteredList = filterAccounts(filteredList, (c) -> c.getFirstName().toLowerCase().contains(search.toLowerCase()));
				printAccounts();
			break;
		case 11: filteredList = filterAccounts(filteredList, (c) -> c.getLastName().toLowerCase().contains(search.toLowerCase()));
				printAccounts();									
			break;
			default: break;
		}
		
				
	}
	
	public List<Customer> customers(){
		return this.filteredList;
	}
	
	public List<Customer> filterAccounts(List<Customer> customers, Predicate<Customer> predicate) {
		
		List<Customer> tempList = new ArrayList<>();
		
		for (Customer customer : customers) if (predicate.test(customer)) tempList.add(customer);
		
		return tempList;
	}

	public void printAccounts() {
		for (Customer customer : filteredList) {
			System.out.println(customer);
		}

	}

}