<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="css.bootstrap.min.css"/>
<link rel="stylesheet" href="css.bootstrap-theme.min.css"/>
<link rel="stylesheet" href="css.bootstrap-theme.min.css.map"/>
</head>
<body>
	<h1>Account Management</h1>
	<fieldset>
	<legend>View Account</legend>
	<c:choose>
		<c:when test="${ empty key }">
			<table>
			<thead><tr><th>Actions:</th><th>Account Number:</th><th>First Name:</th><th>Last Name:</th><th>Zip Code:</th><th>Age:</th><th>Height:</th><th>Weight:</th></tr></thead>
			<tr>
				<td><a href="admin.do?acct=${customers.get(keyList[0]).accountNumber}&operation=1">Update</a> <a href="admin.do?acct=${customers.get(keyList[0]).accountNumber}&operation=3">Remove</a></td>
       			<td>${customers.get(keyList[0]).accountNumber}</td>
       			<td>${customers.get(keyList[0]).firstName}</td>
       			<td>${customers.get(keyList[0]).lastName}</td>
       			<td>${customers.get(keyList[0]).zipcode}</td>
       			<td>${customers.get(keyList[0]).age}</td>
       			<td>${customers.get(keyList[0]).height}</td>
       			<td>${customers.get(keyList[0]).weight}</td>
    		</tr>
    		</table>
    	</c:when>
    	<c:otherwise>
			<table>
			<thead><tr><th>Actions:</th><th>Account Number:</th><th>First Name:</th><th>Last Name:</th><th>Zip Code:</th><th>Age:</th><th>Height:</th><th>Weight:</th></tr></thead>
			<tr>
				<td><a href="admin.do?acct=${customers.get(key).accountNumber}&operation=1">Update</a> <a href="admin.do?acct=${customers.get(key).accountNumber}&operation=3">Remove</a></td>
       			<td> ${customers.get(key).accountNumber}</td>
       			<td> ${customers.get(key).firstName}</td>
       			<td> ${customers.get(key).lastName}</td>
       			<td> ${customers.get(key).zipcode}</td>
       			<td> ${customers.get(key).age}</td>
       			<td> ${customers.get(key).height}</td>
       			<td> ${customers.get(key).weight}</td>
    		</tr>
 			</table>   	
		</c:otherwise>
	</c:choose>
	<form action="admin.do?acct=${key}" method="POST">
		<input type="text" id="ajax" list="json-datalist" name="select" placeholder="Select Account" title="Numbers Only" size="40" pattern="\d{0,10}">
		<datalist id="json-datalist"> 
			<c:forEach var="account" items="${customers.values()}">

				<option value="${account.accountNumber}">${account.accountNumber} ${account.firstName} ${account.lastName}</option>
			</c:forEach> 
		</datalist>
		<button name="navigation" value="-1">Previous</button>
		<button name="navigation" value="0">Home</button>
		<button name="navigation" value="1">Next</button>
		<input type="submit" value="Select" name="browsers4" autofocus>
<!-- 		<button name="operation" value="1">Update</button> -->
		<button name="operation" value="2">Create Account</button>
<!-- 		<button name="operation" value="3">Remove</button> -->
	</form>
	</fieldset>


	<fieldset>
		<legend>Accounts Sort/Search Options</legend>
		<form action="admin.do" method="POST">
			<select name="operation">
				<option value="4">Alphabetical (Ascending Order)</option>
				<option value="5">Alphabetical (Descending Order)</option>
				<option value="6">Account Balance (Ascending Order)</option>
				<option value="7">Account Balance (Descending Order)</option>
				<option value="8">Membership Date (Ascending Order)</option>
				<option value="9">Membership Date (Descending Order)</option>
				<option value="10">Shopping Cart</option>
			</select><br /> <input type="submit" value="Sort">
		</form><br />

		<form action="admin.do" method="POST">
			Search Accounts:<input type="text" name="search" placeholder="Input Text" required> 
			<input type="submit" value="Search"> <input type="reset"><br />
			<input type="checkbox" name="input1" value="true" > Account Number
			<input type="checkbox" name="input2" value="true" > Account Balance
			<input type="checkbox" name="input3" value="true" > First Name
			<input type="checkbox" name="input4" value="true" > Last Name
			<input type="checkbox" name="input5" value="true" > Zip Code 
			<input type="checkbox" name="input6" value="true" > Age
			<input type="checkbox" name="input7" value="true" > Height
			<input type="checkbox" name="input8" value="true" > Weight
			<input type="checkbox" name="input9" value="true" > Shopping Cart
		</form><br /> <br />

		<c:choose>
			<c:when test="${ not empty filteredAccts}">
						<table>
			<thead>
			<tr>
				<th>Account Number:</th>
				<th>Account Balance:</th>
				<th>Name:</th>
				<th>Email:</th>
				<th>Access Level:</th>
				<th colspan="2">Actions:</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="accounts" items="${filteredAccts}">
				<tr>
					<td>${accounts.accountNumber}</td>
					<td>${accounts.accountBalance}</td>
					<td>${accounts.firstName} ${accounts.lastName}</td>
					<td>${accounts.email}</td> 
					<td>${accounts.accessLevel}</td>
					<td><a href="admin.do?acct=${accounts.accountNumber}&operation=1">Update</a></td>
					<td><a href="admin.do?acct=${accounts.accountNumber}&operation=3">Remove</a></td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot></tfoot>
			</table>

			</c:when>
			<c:otherwise> 
			<table>
			<thead>
			<tr>
				<th>Account Number:</th>
				<th>Account Balance:</th>
				<th>Name:</th>
				<th>Email:</th>
				<th>Access Level:</th>
				<th colspan="2">Actions:</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="accounts" items="${customers.values()}">
				<tr>
					<td>${accounts.accountNumber}</td>
					<td>${accounts.accountBalance}</td>
					<td>${accounts.firstName} ${accounts.lastName}</td>
					<td>${accounts.email}</td> 
					<td>${accounts.accessLevel}</td>
					<td><a href="admin.do?acct=${accounts.accountNumber}&operation=1">Update</a></td>
					<td><a href="admin.do?acct=${accounts.accountNumber}&operation=3">Remove</a></td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot></tfoot>
			</table>
			</c:otherwise>
		</c:choose>
		
	</fieldset>
		
		<form action="admin.do?navigation=-2" method="POST"><input type="submit" value="Profile"></form>
		<form action="adminShop.do" method="POST"><input type="submit" value="Shop"></form>
		<form action="logout.do" method="POST"><input type="submit" value="logout"></form>

</body>
</html>