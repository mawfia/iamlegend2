<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Dynamic Web Application: I Am Legend 2 Login Page">
    	<meta name="author" content="Michael Andrew Williams">
		<title>Login Page</title>
			<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
			<link rel="stylesheet" type="text/css" href="css/bootstrap.css.map" />
<!-- 			<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" /> -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css.map" />
			<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
			<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
			<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css.map" />
			<link rel="stylesheet" type="text/css" href="css/normalize.css" />
			<link rel="stylesheet" type="text/css" href="css/login.css" />
			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
    		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" ></script>
    		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--     		<script type="text/javascript" src="/js/bootstrap.min.js" ></script> -->
	</head>
	<body class="container-fluid">
		
		<div class="row">
			<div><h1 class="col-sm-6 col-sm-offset-3">I Am Legend 2</h1></div>
		</div>
		<div class =" row">
			<div class="col-sm-8 col-sm-offset-2 background">
				<div class="row ">
					<div class="col-sm-12 col-sm-12 top"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
						<div class="login-row">
							<fieldset class="col-sm-4 col-sm-offset-4 login-form form-group">
							<legend>Login</legend>
								<form:form action="login.do" method="POST" modelAttribute="customer" class="form-horizontal">
									<form:label path="email" class="col-sm-offset-0">Email:</form:label>
									<form:input path="email" class="form-control" type="email" placeholder="Enter email" size="40" />
									<form:errors path="email" />
									<form:label path="password" class="col-sm-offset-0">Password:</form:label>
									<form:input path="password" class="form-control" type="password" placeholder="Enter password"/>
									<form:errors path="password" />
									<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
  										<input type="submit" value="Login"  class="btn btn-default"></input>
  										<a type="button" href="register.do" class="btn btn-default">Register</a>
  										<a type="button" href="index.jsp" class="btn btn-default">Home Page</a>
  									
  											<div class="dropdown" role="group">
    											<div class="col-sm-2"><button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      												Shop As Guest</button>
    										 		<ul class="dropdown-menu">
      													<li><a href="shopMain.do">Shop Main</a></li>
      													<li><a href="shopWeapons.do">Shop Weapons</a></li>
      													<li><a href="shopFood.do">Shop Food</a></li>
    												</ul>
    											</div>
  											</div>
										</div>
<!-- 									<a href="register.do" class="btn btn-secondary">Register</a> -->
<!--   									<a href="index.jsp" class="btn btn-secondary">Home Page</a> -->
<!-- 									<a href="shopMain.do" class="btn btn-default">Guest</a> -->
								</form:form>
							</fieldset>
						</div>
					<div class="col-sm-12 col-sm-12 bottom"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
				</div>
			</div>
		</div>
	

	</body>
</html>