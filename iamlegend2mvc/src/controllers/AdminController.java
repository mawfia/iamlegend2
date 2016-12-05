package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.AuthenticationDAO;
import data.AuthenticationDAOI;
import entities.Cart;
import entities.Customer;
import entities.Item;
import entities.UserAccessLevel;
import entities.Customer;
import data.FilterAccounts;
import data.InventoryDAO;

@Controller
@SessionAttributes({"cart", "customer", "admin"})
public class AdminController {

	@Autowired
	public AuthenticationDAO customers;
	
	@Autowired
	public InventoryDAO inventory;
	
	@Autowired
	public Cart cart;
	
	@ModelAttribute("customer")
	public Customer verify(){
		Customer customer = new Customer();
		return customer;
	}
	
	@ModelAttribute("cart")
	public Cart initCart(){
		Cart cart = new Cart();
		return cart;
	}
	
	@ModelAttribute("admin")
	public Customer initAdmin(){
			Customer admin = new Customer();
			return admin;
	}
	
	 
	 @RequestMapping("admin.do")
	 public ModelAndView adminPage(@ModelAttribute("customer") Customer customer, @RequestParam(name="operation", required=false) Integer operation, @RequestParam(name="select", required=false) String select,
			 						@RequestParam(name="search", required=false) String search, @RequestParam(name="sort", required=false) Integer sort, 
			 						Boolean input1, Boolean input2, Boolean input3, Boolean input4, Boolean input5, Boolean input6, Boolean input7, Boolean input8, Boolean input9,
			 						@RequestParam(name="navigation", required=false) Integer navigation, @ModelAttribute("admin") Customer admin, @RequestParam(name="acct", required=false) Integer acct, Integer key){
		 ModelAndView mv = new ModelAndView();
		 inventory.get(1001).getImage();

		 if(customer.getAccessLevel().equals(UserAccessLevel.ADMIN) && admin.getFirstName() == null) {
			 admin = customer.copyUser(customer);
			 customer = new Customer();
		 }		
		 else if(navigation != null){
			 
			 	if(navigation == -2) { mv.addObject("customer", admin.copyUser(admin)); admin = new Customer(); mv.setViewName("profile.jsp"); return mv; }
			 	Integer index = customers.index(acct);
	 			Integer[] keyList = customers.keyList();
			 	switch(navigation){
			 	case -1: 
			 		if(index == null || index == 0 || index-1 < 0) {mv.addObject("key", keyList[customers.size()-1]); break; }
			 		else mv.addObject("key", keyList[index-1]); break;
			 	case 0:
			 		mv.addObject("key", keyList[0]); break;
			 	case 1: 
			 		if(index == null ) index = 0;
			 		if(index+1 > customers.size()-1) { mv.addObject("key", keyList[0]); break; }
			 		else mv.addObject("key", keyList[index+1]); break;
			 	default: break;
			 }
		 }
		 else if(operation != null){
			 FilterAccounts filteredAccts = null;
			 switch(operation){
				 case 1: mv.addObject("admin", admin); mv.addObject("customer",  customer = customers.get(acct)); mv.setViewName("adminProfile.jsp"); return mv;
				 case 2: mv.addObject("register", "adminRegister.do"); mv.addObject("user", admin.getAccountNumber()); mv.setViewName("register.jsp"); mv.addObject("customer", new Customer()); return mv;
				 case 3: customers.removeAccount(customers.get(acct)); break;
				 case 4: filteredAccts = new FilterAccounts(4, null, customers, null); break;
				 case 5: filteredAccts = new FilterAccounts(5, null, customers, null); break;
				 case 6: filteredAccts = new FilterAccounts(6, null, customers, null); break;
				 case 7: filteredAccts = new FilterAccounts(7, null, customers, null); break;
				default: break;
								
			 }
			 mv.addObject("filteredAccts", filteredAccts.customers());  mv.addObject("AcctsKeyList", filteredAccts.keyList());
		 }
		 else if (search != null)
		 {
			 FilterAccounts filteredAccts = null;
			 if(input1 != null && input1) filteredAccts = new FilterAccounts(8, search, customers, null);
			 if(input2 != null && input2) filteredAccts = new FilterAccounts(9, search, customers, filteredAccts);
			 if(input3 != null && input3) filteredAccts = new FilterAccounts(10, search, customers, filteredAccts);
			 if(input4 != null && input4) filteredAccts = new FilterAccounts(11, search, customers, filteredAccts);
			 if(input5 != null && input5) filteredAccts = new FilterAccounts(12, search, customers, filteredAccts);
			 if(input6 != null && input6) filteredAccts = new FilterAccounts(13, search, customers, filteredAccts);
			 if(input7 != null && input7) filteredAccts = new FilterAccounts(14, search, customers, filteredAccts);
			 if(input8 != null && input8) filteredAccts = new FilterAccounts(15, search, customers, filteredAccts);
			 if(input9 != null && input9) filteredAccts = new FilterAccounts(16, search, customers, filteredAccts);
		 }
		else if(select != null && select.length() > 0) mv.addObject("key", Integer.parseInt(select));
		
		 
		 mv.addObject("admin", admin);
		 mv.addObject("customers",  customers.synchronizeDatabase());
		 mv.addObject("keyList",  customers.keyList());
		 mv.addObject("customer", customer);
		 //System.out.println("4acct="+acct + " operation=" + operation + " navigation=" + navigation + " select=" + select + " sort= " + sort + " search=" + search + " " + " input=" + input1 + " key " + key);
		 mv.setViewName("admin.jsp");
		 
		 return mv;
	 }
	 
	 @RequestMapping("adminUpdate.do")
	 public ModelAndView updateAccountPage(@Valid Customer customer, Errors errors, @RequestParam(name="update", required=false) Integer update, @ModelAttribute("admin") Customer admin){
		 ModelAndView mv = new ModelAndView();
		 
		 if(update != null){
			if(update < 0) mv.addObject("update", Math.abs(update));
			else if(errors.getFieldErrorCount() != 0) { mv.addObject("update", update); }
			else if(update > 0){ 
				customer = customers.updateAccount(customer);
				mv.addObject("update", 0); }
		 }

		 mv.addObject("customer", customer); 
		 mv.addObject("admin", admin.copyUser(customers.get(admin.getAccountNumber())));
		 mv.addObject("customers",  customers.synchronizeDatabase());
		 mv.addObject("keyList",  customers.keyList());
		 mv.setViewName("adminProfile.jsp");
		 return mv;
	 }
	 
	 @RequestMapping(path="adminRegister.do")
	 public ModelAndView AccountRegistration(@Valid Customer customer, Errors errors, Customer admin, @RequestParam(name="user", required=false) Integer user, String register){
		 ModelAndView mv = new ModelAndView();
		 //System.out.println(user + " \n" + errors.getFieldErrorCount());
		
		 Boolean registerEmail = customers.registerEmail(customer.getEmail());
		Boolean registerPassword = customers.registerPassword(customer.getPassword());
		Boolean registerAge = customers.registerAge(customer.getAge());
		Boolean registerHeight = customers.registerHeight(customer.getHeight());
		Boolean registerWeight = customers.registerWeight(customer.getWeight());
		Boolean registerZipcode = customers.registerZipcode(customer.getZipcode());
		    
				 if(errors.getFieldErrorCount() != 0 || registerEmail == null    || !registerEmail 
		    										 || registerPassword == null || !registerPassword 
		    										 || registerAge == null      || !registerAge 
		    										 || registerHeight == null   || !registerHeight 
		    										 || registerWeight == null   || !registerWeight 
		    										 || registerZipcode == null  || !registerZipcode) { 
		    	mv.addObject("register", "adminRegister.do"); mv.addObject("user", user); mv.setViewName("register.jsp");
		    	if(registerEmail == null) errors.rejectValue("email", "Email.customer.email");		    	
		    	if(registerPassword ==  null || !registerPassword) errors.rejectValue("password", "Password.customer.password");
		    	if(registerAge == null) errors.rejectValue("age", "Age.customer.age");
		    	if(registerHeight == null) errors.rejectValue("height", "Height.customer.age");
		    	if(registerWeight == null) errors.rejectValue("weight", "Weight.customer.weight");
		    	if(registerZipcode == null) errors.rejectValue("zipcode", "Zipcode.customer.zipcode");
		    	else if(!registerZipcode) errors.rejectValue("zipcode", "Pattern.customer.zipcode");
		    	return mv; 
		    }
		    else if(customers.createAccount(customer) != null) { 
		    	System.out.println("successful creation");
		    		//customers.createAccount(new Customer(customer.getEmail(), customer.getFirstName(), customer.getMiddleName(), customer.getLastName(), customer.getPassword(), customer.getAge(), customer.getHeight(), customer.getWeight(), customer.getZipcode(), UserAccessLevel.BASIC));
		    }
		    else if(register != null){ 
		    	mv.addObject("register", "adminRegister.do"); mv.addObject("Result", "Unsuccessful Registration.");
		    	System.out.println("in unsuccessful");
		    }

		 mv.addObject("admin", admin.copyUser(customers.get(user)));
		 mv.addObject("customers",  customers.synchronizeDatabase());
		 mv.addObject("keyList",  customers.keyList());
		 mv.setViewName("admin.jsp");
		 
		 return mv;
		 
	 }
	 
	 @RequestMapping("adminShop.do")
	 public ModelAndView adminShopMain(@ModelAttribute("customer") Customer customer, @RequestParam(name="operation", required=false) Integer operation, @RequestParam(name="select", required=false) String select,
			 						@RequestParam(name="search", required=false) String search, @RequestParam(name="sort", required=false) Integer sort,
			 						Boolean input1, Boolean input2, Boolean input3, Boolean input4, Boolean input5, Boolean input6, Boolean input7, Boolean input8, Boolean input9,
			 						@RequestParam(name="navigation", required=false) Integer navigation, @ModelAttribute("admin") Customer admin, @RequestParam(name="acct", required=false) Integer acct, Integer key){
		 ModelAndView mv = new ModelAndView();
		 if(customer.getAccessLevel().equals(UserAccessLevel.ADMIN) && admin.getFirstName() == null) {
			 admin = customer.copyUser(customer);
			 customer = new Customer();
		 }		
		 else if(navigation != null){
			 
			 	if(navigation == -2) { mv.addObject("customer", admin.copyUser(admin)); admin = new Customer(); mv.setViewName("profile.jsp"); return mv; }
			 	Integer index = inventory.index(acct);
	 			Integer[] keyList = inventory.keyList();
			 	switch(navigation){
			 	case -1: 
			 		if(index == null || index == 0 || index-1 < 0) {mv.addObject("key", keyList[inventory.size()-1]); break; }
			 		else mv.addObject("key", keyList[index-1]); break;
			 	case 0:
			 		mv.addObject("key", keyList[0]); break;
			 	case 1: 
			 		if(index == null ) index = 0;
			 		if(index+1 > inventory.size()-1) { mv.addObject("key", keyList[0]); break; }
			 		else mv.addObject("key", keyList[index+1]); break;
			 	default: break;
			 }
		 }
		
//		 else if(operation != null){
//			 FilterAccounts filteredAccts = null;
//			 switch(operation){
//				 case 1: mv.addObject("admin", admin); mv.addObject("customer",  customer = customers.get(acct)); mv.setViewName("adminProfile.jsp"); return mv;
//				 case 2: mv.addObject("register", "adminRegister.do"); mv.addObject("user", admin.getAccountNumber()); mv.setViewName("register.jsp"); mv.addObject("customer", new Customer()); return mv;
//				 case 3: customers.removeAccount(customers.get(acct)); break;
//				 case 4: filteredAccts = new FilterAccounts(4, null, customers, null); break;
//				 case 5: filteredAccts = new FilterAccounts(5, null, customers, null); break;
//				 case 6: filteredAccts = new FilterAccounts(6, null, customers, null); break;
//				 case 7: filteredAccts = new FilterAccounts(7, null, customers, null); break;
//				default: break;
//								
//			 }
//			 mv.addObject("filteredAccts", filteredAccts.customers());  mv.addObject("AcctsKeyList", filteredAccts.keyList());
//		 }
//		 else if (search != null)
//		 {
//			 FilterAccounts filteredAccts = null;
//			 if(input1 != null && input1) filteredAccts = new FilterAccounts(8, search, customers, null);
//			 if(input2 != null && input2) filteredAccts = new FilterAccounts(9, search, customers, filteredAccts);
//			 if(input3 != null && input3) filteredAccts = new FilterAccounts(10, search, customers, filteredAccts);
//			 if(input4 != null && input4) filteredAccts = new FilterAccounts(11, search, customers, filteredAccts);
//			 if(input5 != null && input5) filteredAccts = new FilterAccounts(12, search, customers, filteredAccts);
//			 if(input6 != null && input6) filteredAccts = new FilterAccounts(13, search, customers, filteredAccts);
//			 if(input7 != null && input7) filteredAccts = new FilterAccounts(14, search, customers, filteredAccts);
//			 if(input8 != null && input8) filteredAccts = new FilterAccounts(15, search, customers, filteredAccts);
//			 if(input9 != null && input9) filteredAccts = new FilterAccounts(16, search, customers, filteredAccts);
//		 }
		else if(select != null && select.length() > 0) mv.addObject("key", Integer.parseInt(select));
		 //cart.addItem(inventory.get(key));

		 mv.addObject("admin", admin);
//		 mv.addObject("customers",  customers.synchronizeDatabase());
		 mv.addObject("keyList",  inventory.keyList());
//		 mv.addObject("cart", cart);
		 mv.addObject("inventory", inventory);
		 mv.addObject("cart", cart);
//		 mv.addObject("customer", customer);
		 //System.out.println("4acct="+acct + " operation=" + operation + " navigation=" + navigation + " select=" + select + " sort= " + sort + " search=" + search + " " + " input=" + input1 + " key " + key + "shop=" + shop);
		 mv.setViewName("shopMain.jsp");
		 return mv;
	 }
	 
	 @RequestMapping("ShoppingCart.do")
	 public ModelAndView ShoppingCart(String destination, Customer admin, Integer add, Integer remove){
		 ModelAndView mv = new ModelAndView();
//		 System.out.println(remove + " " + add);
		 if(add != null){ 
			 Integer status = cart.addItem(inventory.get(add));
			 if( status != null) 
				 if(status > 0) inventory.get(add).setQuantity(inventory.adjustInventory(add, -1));
			 
			 System.out.println("added "+cart.get(add).getQuantity());
			 //System.out.println("added cart q: "+ cart.get(add).getQuantity() + " inventory q: " + inventory.get(add).getQuantity());
		 }
		 if(remove != null){
			 Integer status = cart.removeItem(inventory.get(remove));
			 if (status != null) 
				 if(status > 0) inventory.adjustInventory(remove, 1);
			 
			 System.out.println(" inventory q: " + inventory.get(remove).getQuantity());

		 }
		 
		 System.out.println("In controller");
//			for(Item i : inventory.values()) System.out.println(i.getId() + " "+i.getQuantity());
		//inventory.adjustInventory(inventory.get(123), -1);

		mv.addObject("admin", admin);
		mv.addObject("cart", cart);
		mv.addObject("keyList", inventory.keyList());
		mv.addObject("inventory", inventory);
		mv.setViewName("shopMain.jsp");
		return mv;
	 }
	 
	 
}
