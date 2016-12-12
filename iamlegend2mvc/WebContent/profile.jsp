<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Dynamic Web Application: I Am Legend 2 Profile Page">
    	<meta name="author" content="Michael Andrew Williams">
    	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css.map" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css.map" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css.map" />
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/profile.css" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
    	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" ></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>		
		<title>Profile Page</title>
	</head>
	<body class="container-fluid ">
		
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3"><h1>Profile Page</h1></div>
		</div>
		

		<div class="row">
			<div class="col-sm-8 col-sm-offset-2 background">
				
				<div class="row">	
					<div class="col-sm-8 col-sm-offset-4"><h3>User Account: ${sessionScope.customer.firstName} ${sessionScope.customer.middleName} ${sessionScope.customer.lastName}</h3></div>
				</div>
					
				<div class="row"> 
					<div class="col-sm-8 col-sm-offset-2"><br /><br /><br /><br /><br /></div>
				</div>
			
				<div class="row">
					<fieldset class="col-sm-6 col-sm-offset-3 profile">
					<legend>Account Information:</legend>
					<table>
						<thead>
							<tr>
<!-- 								<th>Account Information:</th> -->
							<tr>
						</thead>
					<tbody>
						<tr>
							<td>Account Number:</td>
							<td>${sessionScope.customer.accountNumber}</td>
						</tr>
						<tr>
							<td>Account Balance:</td>
							<td> ${sessionScope.customer.accountBalance}</td> 
						</tr>
						<tr>
							<td>Email:</td>
							<c:choose>
								<c:when test="${ update == 1}">
							<td class="form-group">
								<form action="update.do" method="GET">	
								<form:form action="update.do?update=1" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="email" />
									<form:input path="email" class="form-control" type="email"/>
									<form:errors path="email" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
								</form:form></form>
							</td>
							<td></td><td></td>
							</c:when>
							<c:otherwise><td> ${sessionScope.customer.email}</td><td> <a href="update.do?update=-1">Update</a></td> </c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>Password:</td>
							<c:choose>
							<c:when test="${ update == 2}">
							<td class="form-group">
								<form action="update.do" method="GET">
								<form:form action="update.do?update=2" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="password" />
									<form:input path="password" class="form-control" type="password"/>
									<form:errors path="password" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
								</form:form></form>
							</td>
							</c:when>
							<c:otherwise><td> **************</td><td> <a href="update.do?update=-2">Update</a> </td></c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>First Name:</td>
							<c:choose>
							<c:when test="${ update == 3}">
							<td class="form-group">
								<form action="update.do" method="GET">
								<form:form action="update.do?update=3" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="firstName" />
									<form:input path="firstName" class="form-control" type="text"/>
									<form:errors path="firstName" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
								</form:form></form></td>
							</c:when>
							<c:otherwise><td> ${sessionScope.customer.firstName}</td><td> <a href="update.do?update=-3">Update</a></td> </c:otherwise>
							</c:choose>
						</tr>
   						<tr>
   							<td>Middle Name:</td>
							<c:choose>
							<c:when test="${not empty sessionScope.customer.middleName || update != -4}">
							<c:choose>
							<c:when test="${ update == 4}">
								<td class="form-group">
									<form action="update.do" method="GET">
									<form:form action="update.do?update=4" method="POST" modelAttribute="customer" class="form-horizontal">
										<form:label path="middleName" />
										<form:input path="middleName" class="form-control" type="text"/>
										<form:errors path="middleName" />
										<button type="submit" class="btn btn-default">Cancel</button>
										<button type="submit" class="btn btn-default" >Update</button>
									</form:form></form>
								</td>
								</c:when>
								<c:otherwise><td> ${sessionScope.customer.middleName}</td><td> <a href="update.do?update=-4">Update</a></td> </c:otherwise>
								</c:choose>
								</c:when>
								<c:otherwise><td><a href="update.do?update=-4">Update</a></td> </c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>Last Name:</td>
								<c:choose>
								<c:when test="${ update == 5}">
								<td class="form-group">
									<form action="update.do" method="GET">
									<form:form action="update.do?update=5" method="POST" modelAttribute="customer" class="form-horizontal">
										<form:label path="lastName" />
										<form:input path="lastName" class="form-control" type="text"/>
										<form:errors path="lastName" />
										<button type="submit" class="btn btn-default">Cancel</button>
										<button type="submit" class="btn btn-default" >Update</button>
									</form:form></form>
								</td>
								</c:when>
								<c:otherwise><td> ${sessionScope.customer.lastName}</td><td> <a href="update.do?update=-5">Update</a></td> </c:otherwise>
								</c:choose>
						</tr>
						<tr>
							<td>Age:</td>
							<c:choose>
							<c:when test="${ update == 6}">
							<td class="form-group">
								<form action="update.do" method="GET">
								<form:form action="update.do?update=6" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="age" />
									<form:input path="age" class="form-control" type="text"/>
									<form:errors path="age" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
								</form:form></form>
							</td>
							</c:when>
							<c:otherwise><td> ${sessionScope.customer.age}</td><td> <a href="update.do?update=-6">Update</a></td> </c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>Height:</td>
							<c:choose>
							<c:when test="${ update == 7}">
							<td class="form-group">
								<form action="update.do" method="GET">
								<form:form action="update.do?update=7" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="height" />
									<form:input path="height" class="form-control" type="number"/>
									<form:errors path="height" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
								</form:form></form>
							</td>
							</c:when>
							<c:otherwise><td> ${sessionScope.customer.height}</td><td><a href="update.do?update=-7">Update</a></td> </c:otherwise>
							</c:choose>				
						</tr>
						<tr>
							<td>Weight:</td>
							<c:choose>
							<c:when test="${ update == 8}">
							<td class="form-group">
								<form action="update.do" method="GET">
								<form:form action="update.do?update=8" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="weight" />
									<form:input path="weight" class="form-control" type="number"/>
									<form:errors path="weight" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
							</form:form></form>
							</td>
							</c:when>
							<c:otherwise><td> ${sessionScope.customer.weight}</td><td><a href="update.do?update=-8">Update</a></td></c:otherwise>
							</c:choose>				
						</tr>
						<tr>
							<td>Zip code:</td>
							<c:choose>
							<c:when test="${ update == 9}">
							<td class="form-group">
								<form action="update.do" method="GET">
								<form:form action="update.do?update=9" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="zipcode" />
									<form:input path="zipcode" class="form-control" type="number"/>
									<form:errors path="zipcode" />
									<button type="submit" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-default" >Update</button>
								</form:form></form>
							</td>
							</c:when>
							<c:otherwise><td> ${sessionScope.customer.zipcode}</td><td> <a href="update.do?update=-9">Update</a></td></c:otherwise>
							</c:choose>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th >Access Level:
								<c:choose>
									<c:when test="${ sessionScope.customer.accessLevel == 'ADMIN'}">
										<a href="admin.do?">${sessionScope.customer.accessLevel}</a>
									</c:when>
									<c:otherwise> ${sessionScope.customer.accessLevel} </c:otherwise>
								</c:choose>
							</th>
						</tr>
					</tfoot>
				</table>
				</fieldset>
		
		<div class="row"> 
			<div class="col-sm-8 col-sm-offset-2"><br/><br/><br/><br/>
				<div class="row"> 
					<div class="col-sm-4 col-sm-offset-4 container">
  						<div class="btn-group">
    						<a type="button" href="index.jsp" class="btn btn-default">Home Page</a>
    						<a type="button" href="refresh.do" class="btn btn-default">Log Out</a>
    						<div class="btn-group">
      							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      							Shop <span class="caret"></span></button>
      							<ul class="dropdown-menu" role="menu">
        							<li><a href="#">Main</a></li>
        							<li><a href="#">Weapons</a></li>
        							<li><a href="#">Food</a></li>
        							<li><a href="#">Equipment</a></li>
      							</ul>
    						</div>
  						</div>
					</div>
				</div>
				<br/><br/><br/></div>
		</div>
		
		</div>
		</div>
		</div>
		
		<div class="row">
			<div class="col-sm-3 col-sm-push-1 ">
			<fieldset class="geoData">
			<legend>Geographical Information:</legend>
				<table>
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="geo" items="${customers.evaluateZipcode(sessionScope.customer.zipcode)}">
							<tr>
								<td>${geo}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot></tfoot>
				</table>
				</fieldset>
			</div>
			
			<div class="col-sm-3 col-sm-push-5 ">
				<fieldset class="cartData">
					<legend>Shopping Cart:</legend>
					<table>
						<thead></thead>
						<tbody></tbody>
						<tfoot></tfoot>
					</table>
				</fieldset>
			</div>
		</div>
		
<%-- 			<form action="customerShop.do" method="POST"><input type="submit" value="Shop"></form> --%>
<%-- 			<form action="logout.do" method="POST"><input type="submit" value="logout"></form> --%>

</body>
</html>