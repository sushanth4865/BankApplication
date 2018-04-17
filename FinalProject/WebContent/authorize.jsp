<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>

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
	<h1>Authorize Credit Card Transaction</h1>
	</div>
	<form action="ccauth.jsp">
		Name<input type="text" name="name"><br>
		Card Number<input type="text" name="cc"><br>
		CVV2/CVC2<input type="text" name="cvv"><br>
		Amount<input type="text" name="amount"><br>
		<input type="submit" value="Authorize">
	</form>
</body>
</html>