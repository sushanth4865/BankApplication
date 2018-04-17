<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
	<div style="width: 300px; margin-left:auto;margin-right:auto;">
	<h1>Banking System</h1>
	</div>
	<div>
	<ul style="list-style-type:none">
	<li><a href="account">Create Account</a></li>
	<br>
	<li><a href="transaction">Transaction</a></li>
	<br>
	<li><a href="statement">Display Bank Statement</a></li>
	<br>
	<li><a href="authorize">Authorize Credit Card Account</a></li>
	</ul>
	</div>
</body>
</html>