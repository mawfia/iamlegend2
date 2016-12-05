<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css.map" />
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body class="container-fluid">

		<h1 class="col-sm-offset-5">Login Page</h1>
		<div class =" row">
	
		<div class="col-sm-8 col-sm-push-2 background">

	
		<div class="row login-row">
		<div class="col-sm-4 col-sm-push-4 center" >
				<form:form action="login.do" method="POST" modelAttribute="customer" class="form-horizontal">
					<div class="form-group" >
					<form:label path="email" class="control-label col-sm-offset-0">Email:</form:label>
					<form:input path="email" placeholder="Login with registered email address" size="40" />
					<form:errors path="email" />
					</div>
					<div class="form-group">
					<form:label path="password" class="control-label col-sm-offset-0">Password:</form:label>
					<form:input path="password" />
					<form:errors path="password" />
					<input type="submit" value="Login"  class="btn btn-default"/>
					<a href="register.do" class="btn btn-default">Register</a>
					<a href="index.jsp" class="btn btn-default">Home Page</a>
					</div>
				</form:form>
			</div>
			<div class="col-md-4 right"></div>
		</div>
		</div>
		</div>
	

</body>
</html>