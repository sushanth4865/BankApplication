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
	<h1>Perform Debit or Credit operation</h1>
	</div>
	<form action=transactionProcess.jsp>
		Account Number<input type="text" name="account"><br>
		Amount<input type="text" name="amount"><br>
		<input type="submit" name="submit" value="DebitFrom">
		<input type="submit" name="submit" value="CreditTo">
	</form>
	<% 
			out.println("<br/>");
		out.println("<a href='dashboard.jsp'>Return to Dashboard</a>");
	%>
		</body>
</html>