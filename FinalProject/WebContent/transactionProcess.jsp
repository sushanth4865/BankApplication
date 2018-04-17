<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("amt");
session.removeAttribute("acct");
session.removeAttribute("transtype");
String tType = request.getParameter("submit");
String amt= request.getParameter("amount");
String acct= request.getParameter("account");
String userid = request.getParameter("userid");
session.setAttribute("amt", amt);
session.setAttribute("acct", acct);

%>





<%
if(tType.equals("DebitFrom"))
{
String transtype="minus";
session.setAttribute("transtype", transtype);
RequestDispatcher requestDispatcher; 
requestDispatcher = request.getRequestDispatcher("/balanceComputer.jsp");
requestDispatcher.forward(request, response);
return;
}
if(tType.equals("DebitFrom")){
String transtype="add";
session.setAttribute("transtype", transtype);
session.setAttribute("acct", userid);
RequestDispatcher requestDispatcher; 
requestDispatcher = request.getRequestDispatcher("/balanceComputer.jsp");
requestDispatcher.forward(request, response);
return;
}

if(tType.equals("CreditTo"))
{
String transtype="add";
session.setAttribute("transtype", transtype);
RequestDispatcher requestDispatcher; 
requestDispatcher = request.getRequestDispatcher("/balanceComputer.jsp");
requestDispatcher.forward(request, response);
return;
}
if(tType.equals("CreditTo"))
{
String transtype="minus";
session.setAttribute("transtype", transtype);
session.setAttribute("acct", userid);
RequestDispatcher requestDispatcher; 
requestDispatcher = request.getRequestDispatcher("/balanceComputer.jsp");
requestDispatcher.forward(request, response);
return;
}
//response.sendRedirect("balanceComputer.jsp");
%>
</body>
</html>