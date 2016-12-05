package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.FilterAccounts;
import data.InventoryDAO;
import entities.Cart;
import entities.Customer;
import entities.UserAccessLevel;

@Controller
@SessionAttributes({"cart", "customer"})
public class InventoryController {

		@Autowired
		public InventoryDAO inventory;
		
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
		
		
		 @RequestMapping("shopMain.do")
		 public ModelAndView ShopMain(Customer customer, Customer admin, Cart cart){
			 ModelAndView mv = new ModelAndView();
	
			 
			 mv.addObject("cart", cart);
			 mv.addObject("inventory", inventory);
			 mv.addObject("customer", customer); 
			 mv.setViewName("shopMain.jsp");
			 return mv;
		 }
		 
		 @RequestMapping("customerShop.do")
		 public ModelAndView shopMain(@ModelAttribute("customer") Customer customer, @RequestParam(name="operation", required=false) Integer operation, @RequestParam(name="select", required=false) String select,
				 						@RequestParam(name="search", required=false) String search, @RequestParam(name="sort", required=false) Integer sort, 
				 						Boolean input1, Boolean input2, Boolean input3, Boolean input4, Boolean input5, Boolean input6, Boolean input7, Boolean input8, Boolean input9,
				 						@RequestParam(name="navigation", required=false) Integer navigation, @RequestParam(name="acct", required=false) Integer acct, Integer key){
			 ModelAndView mv = new ModelAndView();

	
			 	if(navigation != null){
				 
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
//			 else if(operation != null){
//				 FilterAccounts filteredAccts = null;
//				 switch(operation){
//					 case 1: mv.addObject("admin", admin); mv.addObject("customer",  customer = customers.get(acct)); mv.setViewName("adminProfile.jsp"); return mv;
//					 case 2: mv.addObject("register", "adminRegister.do"); mv.addObject("user", admin.getAccountNumber()); mv.setViewName("register.jsp"); mv.addObject("customer", new Customer()); return mv;
//					 case 3: customers.removeAccount(customers.get(acct)); break;
//					 case 4: filteredAccts = new FilterAccounts(4, null, customers, null); break;
//					 case 5: filteredAccts = new FilterAccounts(5, null, customers, null); break;
//					 case 6: filteredAccts = new FilterAccounts(6, null, customers, null); break;
//					 case 7: filteredAccts = new FilterAccounts(7, null, customers, null); break;
//					default: break;
//									
//				 }
//				 mv.addObject("filteredAccts", filteredAccts.customers());  mv.addObject("AcctsKeyList", filteredAccts.keyList());
//			 }
//			 else if (search != null)
//			 {
//				 FilterAccounts filteredAccts = null;
//				 if(input1 != null && input1) filteredAccts = new FilterAccounts(8, search, customers, null);
//				 if(input2 != null && input2) filteredAccts = new FilterAccounts(9, search, customers, filteredAccts);
//				 if(input3 != null && input3) filteredAccts = new FilterAccounts(10, search, customers, filteredAccts);
//				 if(input4 != null && input4) filteredAccts = new FilterAccounts(11, search, customers, filteredAccts);
//				 if(input5 != null && input5) filteredAccts = new FilterAccounts(12, search, customers, filteredAccts);
//				 if(input6 != null && input6) filteredAccts = new FilterAccounts(13, search, customers, filteredAccts);
//				 if(input7 != null && input7) filteredAccts = new FilterAccounts(14, search, customers, filteredAccts);
//				 if(input8 != null && input8) filteredAccts = new FilterAccounts(15, search, customers, filteredAccts);
//				 if(input9 != null && input9) filteredAccts = new FilterAccounts(16, search, customers, filteredAccts);
//			 }
//			else if(select != null && select.length() > 0) mv.addObject("key", Integer.parseInt(select));
			
			 
			 mv.addObject("customer", customer);
//			 mv.addObject("customers",  customers.synchronizeDatabase());
			 mv.addObject("keyList",  inventory.keyList());
			 mv.addObject("inventory", inventory);
//			 mv.addObject("cart", cart);
//			 mv.addObject("customer", customer);
			 //System.out.println("4acct="+acct + " operation=" + operation + " navigation=" + navigation + " select=" + select + " sort= " + sort + " search=" + search + " " + " input=" + input1 + " key " + key);
			 mv.setViewName("shopMain.jsp");
			 
			 return mv;
		 }
		 
		 @RequestMapping("shoppingCart.do")
		 public ModelAndView ShoppingCart(){
			 ModelAndView mv= new ModelAndView();
			 
			 
			 
			 return mv;
		 }
}
