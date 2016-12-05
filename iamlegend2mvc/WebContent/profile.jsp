<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Page</title>
</head>
<body>
	<h1>Profile Page</h1>


	
			<h2>User Account: ${sessionScope.customer.firstName} ${sessionScope.customer.middleName} ${sessionScope.customer.lastName}</h2>
		

	<table>
			<thead>
				<tr>
					<th>Account Information:</th>
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
						<td>
							<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>	
							<form:form action="update.do?update=1" method="POST" modelAttribute="customer">
								<input type="submit" value="Update"/>
								<form:label path="email" />
								<form:input path="email" />
								<form:errors path="email" />
							</form:form>
						</td>
						</c:when>
						<c:otherwise><td> ${sessionScope.customer.email}</td><td> <a href="update.do?update=-1">Update</a></td> </c:otherwise>
					</c:choose>
			</tr>
			<tr>
				<td>Password:</td>
					<c:choose>
						<c:when test="${ update == 2}">
						<td>
							<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
							<form:form action="update.do?update=2" method="POST" modelAttribute="customer">
								<input type="submit" value="Update"/>
								<form:label path="password" />
								<form:input path="password" />
								<form:errors path="password" />
							</form:form></td>
						</c:when>
						<c:otherwise><td> **************</td><td> <a href="update.do?update=-2">Update</a> </td></c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>First Name:</td>
					<c:choose>
						<c:when test="${ update == 3}">
						<td>
							<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
							<form:form action="update.do?update=3" method="POST" modelAttribute="customer">
								<input type="submit" value="Update"/>
								<form:label path="firstName" />
								<form:input path="firstName" />
								<form:errors path="firstName" />
							</form:form></td>
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
									<td>
										<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
										<form:form action="update.do?update=4" method="POST" modelAttribute="customer">
											<input type="submit" value="Update"/>
											<form:label path="middleName" />
											<form:input path="middleName" />
											<form:errors path="middleName" />
									</form:form></td>
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
							<td>
								<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
								<form:form action="update.do?update=5" method="POST" modelAttribute="customer">
									<input type="submit" value="Update"/>
									<form:label path="lastName" />
									<form:input path="lastName" />
									<form:errors path="lastName" />
							</form:form></td>
						</c:when>
						<c:otherwise><td> ${sessionScope.customer.lastName}</td><td> <a href="update.do?update=-5">Update</a></td> </c:otherwise>
					</c:choose>
			</tr>
			<tr>
				<td>Age:</td>
					<c:choose>
						<c:when test="${ update == 6}">
							<td>
								<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
								<form:form action="update.do?update=6" method="POST" modelAttribute="customer">
									<input type="submit" value="Update"/>
									<form:label path="age" />
									<form:input path="age" />
									<form:errors path="age" />
							</form:form></td>
						</c:when>
						<c:otherwise><td> ${sessionScope.customer.age}</td><td> <a href="update.do?update=-6">Update</a></td> </c:otherwise>
					</c:choose>
			</tr>
			<tr>
				<td>Height:</td>
					<c:choose>
						<c:when test="${ update == 7}">
						<td>
							<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
							<form:form action="update.do?update=7" method="POST" modelAttribute="customer">
								<input type="submit" value="Update"/>
								<form:label path="height" />
								<form:input path="height" />
								<form:errors path="height" />
							</form:form></td>
						</c:when>
						<c:otherwise><td> ${sessionScope.customer.height}</td><td> <a href="update.do?update=-7">Update</a></td> </c:otherwise>
					</c:choose>				
			</tr>
			<tr>
				<td>Weight:</td>
					<c:choose>
						<c:when test="${ update == 8}">
						<td>
							<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
							<form:form action="update.do?update=8" method="POST" modelAttribute="customer">
								<input type="submit" value="Update"/>
								<form:label path="weight" />
								<form:input path="weight" />
								<form:errors path="weight" />
							</form:form></td>
						</c:when>
						<c:otherwise><td> ${sessionScope.customer.weight}</td><td> <a href="update.do?update=-8">Update</a></td> </c:otherwise>
					</c:choose>				
			</tr>
			<tr>
				<td>Zip code:</td>
					<c:choose>
						<c:when test="${ update == 9}">
						<td>
							<form action="update.do" method="GET"><input type="submit" value="Cancel"></form>
							<form:form action="update.do?update=9" method="POST" modelAttribute="customer">
								<input type="submit" value="Update"/>
								<form:label path="zipcode" />
								<form:input path="zipcode" />
								<form:errors path="zipcode" />
							</form:form></td>
						</c:when>
						<c:otherwise><td> ${sessionScope.customer.zipcode}</td><td> <a href="update.do?update=-9">Update</a></td> </c:otherwise>
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

		
		<fieldset>
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

			<form action="customerShop.do" method="POST"><input type="submit" value="Shop"></form>
			<form action="logout.do" method="POST"><input type="submit" value="logout"></form>

</body>
</html>