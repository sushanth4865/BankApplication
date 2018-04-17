<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String named = request.getParameter("name");
String dobd = request.getParameter("dob");
String addressd = request.getParameter("address");
String emaild = request.getParameter("email");
String toa = (String)request.getParameter("accounttype");
//out.print(named+dobd+addressd+emaild+toa);
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String username = "root";
		String password = "";
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/banking",username,password);
		Statement st = con.createStatement();
		int i = st.executeUpdate("insert into accounts (userid,name,dob,address,email,typeofaccount) value(null,'"+named+"','"+dobd+"','"+addressd+"','"+emaild+"','"+toa+"')");
		out.print("Account Created Succesfully"+"<a href='dashboard.jsp'><button>Homepage</button></a>");

	}
	catch(Exception e){
		out.print("User Account is not created <br>Account failed to create please check formatting date is formatted 1989-01-13"+"<br><a href='account'><button>Go Back</button></a>");
		e.printStackTrace();
	}
%>
</body>
</html>