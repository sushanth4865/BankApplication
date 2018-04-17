<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String value = null;
String cc = request.getParameter("cc").toString();
String amt = request.getParameter("amount").toString();
Double amount = Double.parseDouble(amt);
Class.forName("com.mysql.jdbc.Driver");
String username ="root";
String password = "";
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/banking",root,root);
Statement st = con.createStatement();
ResultSet sqlReturnedCC = st.executeQuery("SELECT `cc` FROM `credit_card` WHERE cc='"+cc+"' ");
int valueCount = 0;
while(sqlReturnedCC.next())
{
	System.out.println("inside");
value=sqlReturnedCC.getString("cc");
	System.out.println(value);
valueCount++;
}
if(amount<1)
{
if(valueCount==1)
{out.println("Approved");}
if(valueCount>1)
{out.println("Rejected </br>Error:Duplicate Credit Cards");}
if(valueCount==0)
{out.println("Rejected <br/>Error:No Credit Cards Found");}
}
else
{
	out.println("Rejected <br/>Error:Amount need to be less then 1lakh");
}
out.println("<br/>");
out.println("<a href='dashboard.jsp'>Return to Dashboard</a>");
%>
</body>
</html>