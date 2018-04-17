<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td{
border: 1px solid black;
}
</style>
</head>
<body>
	<%@include file="header.jsp" %>
		<div style="width: 300px; margin-left:auto;margin-right:auto;">
			<h1>Display Statement</h1>
		</div>
		Date Range
		<form action="display.jsp">
		
		<%
		
		DateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		Date dateobj = new Date();
		String dated = df.format(dateobj);
		
		
		%>
			From<input type="text" name="from" value="16/04/07 00:00:00">
			To<input type="text" name="to" value=<%out.print("'"+dated+"'"); %>>
			<input type="submit" value="Display">
		</form>
<% 
		Class.forName("com.mysql.jdbc.Driver");
		String username ="root";
		String password = "";
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/banking",root,root);
		Statement st = con.createStatement();
		String signedIn=session.getAttribute("signedIn").toString();
		ResultSet rs=st.executeQuery("SELECT `number`, `date`, `description`, `chagenum`, `withdrawamt`, `depositmt`, `availablebal`, `userid` FROM `transactions` WHERE userid='"+signedIn+"' AND date >= '16/04/07 00:00:00' AND date <= '16/04/07 12:10:08'");
		out.print("<table><tr><th>Number</th><th>Date</th><th>Description</th><th>Charge No.</th><th>Withdraw</th><th>Deposit</th><th>Available Balance</th></tr>");
		while(rs.next())
		{
			String number=rs.getString("number");
			String date=rs.getString("date");
			String description=rs.getString("description");
			String chagenum=rs.getString("chagenum");
			String withdrawamt=rs.getString("withdrawamt");
			String depositmt=rs.getString("depositmt");
			String availablebal=rs.getString("availablebal");
			out.print("<tr><td>"+number+"</td><td>"+date+"</td><td>"+description+"</td><td>"+chagenum+"</td><td>"+withdrawamt+"</td><td>"+depositmt+"</td><td>"+availablebal+"</td></tr>");
		}
		out.print("</table>");
		out.println("<br/>");
		out.println("<a href='dashboard.jsp'>Return to Dashboard</a>");
%>
		</body>
</html>