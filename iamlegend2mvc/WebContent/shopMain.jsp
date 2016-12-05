<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop Main</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css.map" />
<link rel="stylesheet" type="text/css" href="css/shopMain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container-fluid">
	

<%-- ${cart.addItem(inventory.get(key))} --%>
<%-- ${cart.addItem(inventory.get(key))}, # added to cart: ${cart.get(key)}, Left in Stock:${inventory.adjustInventory(inventory.get(key), -1)}<br />Cart Weight: ${cart.totalWeight()}<br />Cart Total Price: ${cart.totalPrice()}  --%>
<h1>Shop Inventory</h1>
	<fieldset>
	
	
	
	<legend>View Item</legend>
	<c:choose>
		<c:when test="${ empty key }">
			<img src="${inventory.get(keyList[0]).image}"/>
			<table class="t1">
			<thead><tr><th >Actions:</th><th>Category:</th><th>Name:</th><th>Weight:</th><th>Price:</th><th>Quantity Remaining:</th></thead>
			<tr>
				<td><a href="adminShop.do?acct=${inventory.get(keyList[0]).id}&operation=1">Update</a>
					<a href="adminShop.do?acct=${inventory.get(keyList[0]).id}&operation=3">Remove</a><br />
					<a href="ShoppingCart.do?add=${keyList[0]}" title="Shopping Cart Summary:" data-toggle="popover" data-placement="bottom" data-trigger="focus, hover" 
						data-content="Total Cart Weight: ${sessionScope.cart.totalWeight()} Total Cart Price: ${sessionScope.cart.totalPrice()}">Add To Cart</a>
					<a href="#" data-toggle="modal" data-target="#myModal">View Cart</a>				
				</td>
       			<td>${inventory.itemCategory(inventory.get(keyList[0]).id)}</td>
       			<td>${inventory.get(keyList[0]).name}</td>
       			<td>${inventory.get(keyList[0]).weight}</td>
       			<td>${inventory.get(keyList[0]).MSRP}</td>
       			<td>${inventory.get(keyList[0]).quantity}</td>
    		</tr>
    		</table>
    	</c:when>
    	<c:otherwise>
    		<img src="${inventory.get(key).image}"/>
			<table>
			<thead><tr><th >Actions:</th><th>Category:</th><th>Name:</th><th>Weight:</th><th>Price:</th><th>Quantity Remaining:</th></thead>
			<tr>
				<td><a href="adminShop.do?ID=${key}&operation=1">Update</a>
					<a href="adminShop.do?ID=${key}&operation=3">Remove</a>
					<div><a href="ShoppingCart.do?add=${key}" title="Shopping Cart Summary:" data-toggle="popover" data-placement="bottom" data-trigger="focus, hover" 
						data-content="Total Cart Weight: ${sessionScope.cart.totalWeight()} Total Cart Price: ${sessionScope.cart.totalPrice()}">Add To Cart</a></div>
					<a href="#" data-toggle="modal" data-target="#myModal">View Cart</a>
				</td>
      			<td>${inventory.itemCategory(key)}</td>
       			<td>${inventory.get(key).name}</td>
       			<td>${inventory.get(key).weight}</td>
       			<td>${inventory.get(key).MSRP}</td>
       			<td>${inventory.get(key).quantity}</td>
    		</tr>
 			</table>   	
		</c:otherwise>
	</c:choose>
	<form action="adminShop.do?acct=${key}" method="POST">
		<input type="text" id="ajax" list="json-datalist" name="select" placeholder="Select Item" title="Numbers Only" size="70" pattern="\d{4}">
		<datalist id="json-datalist"> 
			<c:forEach var="item" items="${inventory.values()}">

				<option value="${item.id}">${item.name} ${item.MSRP}</option>
			</c:forEach> 
		</datalist>
		<button name="navigation" value="-1">Previous</button>
		<button name="navigation" value="0">Home</button>
		<button name="navigation" value="1">Next</button>
		<input type="submit" value="Select" name="browsers4" autofocus>
		<button name="operation" value="2">Add Item</button>
	</form>
	</fieldset>




<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});
</script>

<div class="container">
<!--   <h2>Shopping Cart:</h2> -->
  <!-- Trigger the modal with a button -->
  
<!--   <a href="#" data-toggle="modal" data-target="#myModal">View Cart</a> -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Shopping Cart Summary</h4>
        </div>
        <div class="modal-body">
          	<div>Cart Weight: ${cart.totalWeight()}, Cart Total Price: ${cart.totalPrice()}</div>
          	<div>
          		
          		<c:forEach var="i" items="${cart.get()}">
					<p>${inventory.itemCategory(i.id)}, ${i.name}, ${i.weight}, ${i.MSRP}, ${i.quantity}, <a href="ShoppingCart.do?remove=${i.id}">Remove Item</a></p>
				</c:forEach> 
          	</div>
          
        </div>
        <div class="modal-footer">
        	<a href="checkout.jsp" class="btn btn-default">Checkout</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  </div>
	<a href="admin.do?navigation=-2" class="btn btn-default">Profile:</a>
	<a href="weapons.jsp" class="btn btn-default">Shop Weapons:</a>
	<a href="food.jsp" class="btn btn-default">Shop Food:</a>
	<a href="equipment.jsp" class="btn btn-default">Shop Equipment:</a>
	<a href="logout.do" class="btn btn-default">Log Out:</a>

	<fieldset>
		<legend>Inventory Sort/Search Options</legend>
		<form action="adminShop.do" method="POST">
			<select name="operation">
				<option value="4">Alphabetical (Ascending Order)</option>
				<option value="5">Alphabetical (Descending Order)</option>
				<option value="6">Quantity (Ascending Order)</option>
				<option value="7">Quantity (Descending Order)</option>
				<option value="8">Price (Ascending Order)</option>
				<option value="9">Price (Descending Order)</option>
				<option value="10">Weight (Ascending Order)</option>
				<option value="11">Weight (Descending Order)</option>
				<option value="12">Category (Ascending Order)</option>
				<option value="13">Category (Descending Order)</option>
			</select><br /> <input type="submit" value="Sort">
		</form><br />

		<form action="adminShop.do" method="POST">
			Search Accounts:<input type="text" name="search" placeholder="Input Text" required> 
			<input type="submit" value="Search"> <input type="reset"><br />
			<input type="checkbox" name="input1" value="true" > Name
			<input type="checkbox" name="input2" value="true" > Weight
			<input type="checkbox" name="input3" value="true" > Price
			<input type="checkbox" name="input4" value="true" > Quantity
			<input type="checkbox" name="input5" value="true" > Description 
		</form><br /> <br />
		

<%-- 		<c:choose> --%>
<%-- 			<c:when test="${ not empty filteredIventory}"> --%>
<!-- 						<table> -->
<!-- 			<thead> -->
<!-- 			<tr> -->
<!-- 				<th>Name:</th> -->
<!-- 				<th>Weight:</th> -->
<!-- 				<th>Price:</th> -->
<!-- 				<th>Quantity:</th> -->
<!-- 				<th colspan="2">Actions:</th> -->
<!-- 			</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 			<c:forEach var="finventory" items="${filteredInventory}"> --%>
<!-- 				<tr> -->
<%-- 					<td>${finventory.name}</td> --%>
<%-- 					<td>${finventory.weight}</td> --%>
<%-- 					<td>${finventory.MSRP}</td> --%>
<%-- 					<td>${finventory.quantity}</td>  --%>
<%-- 					<td><a href="admin.do?acct=${finventory.id}&operation=1">Update</a></td> --%>
<%-- 					<td><a href="admin.do?acct=${finventory.id}&operation=3">Remove</a></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 			<tfoot></tfoot> -->
<!-- 			</table> -->

<%-- 			</c:when> --%>
<%-- 			<c:otherwise>  --%>

			<c:forEach var="items" items="${inventory.values()}">
			<div class="img">
  			<a target="#" href=""><img src="${items.image}" alt="This is a test" width="300" height="200"></a>
			<table>
			<thead>
			<tr>
				<th>Category:</th>
				<th>Name:</th> 
				<th>Weight:</th>
				<th>Price:</th>
				<th>Quantity:</th>
				<th colspan="2">Actions:</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<td>${inventory.itemCategory(items.id)}</td>
					<td>${items.name}</td>
					<td>${items.weight}</td>
					<td>${items.MSRP} </td>
					<td>${items.quantity}</td> 
					<td colspan="3"><a href="adminShop.do?acct=${items.id}&operation=1">Update</a><br /><a href="adminShop.do?acct=${items.id}&operation=3">Remove</a><div><a href="#" title="Shopping Cart Summary:" 
					data-toggle="popover" data-placement="right" data-trigger="focus, hover" data-content="">Add To Cart</a></div><a href="#" data-toggle="modal" data-target="#myModal">View Cart</a></td>
				</tr>
			</tbody>
			<tfoot></tfoot>
			</table>
  					<div class="desc">Description: None.</div>
				</div>
			</c:forEach>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
	</fieldset>
	<a href="admin.do?navigation=-2" class="btn btn-default">Profile:</a>
	<a href="weapons.jsp" class="btn btn-default">Shop Weapons:</a>
	<a href="food.jsp" class="btn btn-default">Shop Food:</a>
	<a href="equipment.jsp" class="btn btn-default">Shop Equipment:</a>
	<a href="logout.do" class="btn btn-default">Log Out:</a>


</body>
</html>