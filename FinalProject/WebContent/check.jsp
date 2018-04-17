<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String un = request.getParameter("username");
String passedword = request.getParameter("password");


String pass = null;
String value = null;
String value2 = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String username ="root";
	String password = "";
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/banking",root,root);
	Statement st = con.createStatement();


	ResultSet sqlReturnedPass = st.executeQuery("SELECT `password` FROM `userlogin` WHERE username='"+un+"' ");
	int valueCount = 0;
	while(sqlReturnedPass.next())
		{
	    value=sqlReturnedPass.getString("password");
		valueCount++;
		}
	if(valueCount>1)
	{System.out.println("Duplicate usernames");}
	System.out.println("username:"+value);
	
	
	
	ResultSet sqlReturnedUserId = st.executeQuery("SELECT `userid` FROM `userlogin` WHERE username='"+un+"' ");
	int valueCount2 = 0;
	while(sqlReturnedUserId.next())
		{
	    value2=sqlReturnedUserId.getString("userid");
		valueCount2++;
		}
	if(valueCount2>1)
	{System.out.println("Duplicate userid");}
	System.out.println("userid:"+value2);
	
}
catch(Exception e){
	e.printStackTrace();
}




	


	if(passedword.equals(value))
	{
		
	    session.setAttribute("uname",un);
	    session.setAttribute("signedIn", value2);
	    response.sendRedirect("dashboard.jsp");
	}
	else{
		response.sendRedirect("invalidlogin.jsp");
	}
	
	

%>
