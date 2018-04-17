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
</head>
<body>
<%
String amt = session.getAttribute("amt").toString();
String transtype = session.getAttribute("transtype").toString();
String acct = session.getAttribute("acct").toString();
System.out.println("acct at begining is"+ acct);

int amtInt = Integer.parseInt(amt);
int accountNumber = Integer.parseInt(acct);
out.println(accountNumber);
out.println(amtInt);
int value=0;

Class.forName("com.mysql.jdbc.Driver");
String username ="root";
String password = "";
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/banking",root,root);
Statement st = con.createStatement();

String value2 = null;
String loggeduser = session.getAttribute( "uname" ).toString();
ResultSet sqlReturnedPass2 = st.executeQuery("SELECT `userid` FROM `userlogin` WHERE username='"+loggeduser+"' ");
int valueCount2 = 0;
while(sqlReturnedPass2.next())
	{
    value2=sqlReturnedPass2.getString("userid");
	valueCount2++;
	}
if(valueCount2>1)
{System.out.println("Duplicate userids");}
System.out.println("userid:" +acct);





if(transtype.equals("minus")){
	out.print("minus");


	ResultSet sqlReturnedPass = st.executeQuery("SELECT `balance` FROM `balance` WHERE userid='"+accountNumber+"' ");
	int valueCount = 0;
	while(sqlReturnedPass.next())
		{
	    value=sqlReturnedPass.getInt("balance");
	    
	    valueCount++;
		}
	amtInt=value-amtInt;
	if(valueCount==1)
	{System.out.println(value);
	st.executeUpdate("UPDATE balance SET balance='"+amtInt+"', userid='"+acct+"' WHERE userid='"+acct+"'");
	}
	else if(valueCount <1)
	{System.out.println("no values present with this id new value was created");
	st.executeUpdate("INSERT INTO `balance`(`userid`, `balance`) VALUES ('"+accountNumber+"','"+amtInt+"')");
	}
	else{System.out.println("There are to many Id with this same name");}
	
	
}
else if(transtype.equals("add")){	
	out.print("add");
	


	ResultSet sqlReturnedPass = st.executeQuery("SELECT `balance` FROM `balance` WHERE userid='"+accountNumber+"' ");
	int valueCount = 0;
	while(sqlReturnedPass.next())
		{
	    value=sqlReturnedPass.getInt("balance");
	    
	    valueCount++;
		}
	amtInt=value+amtInt;
	if(valueCount==1)
	{System.out.println(value);
	st.executeUpdate("UPDATE balance SET balance='"+amtInt+"', userid='"+acct+"' WHERE userid='"+acct+"'");
	}
	else if(valueCount < 1)
	{System.out.println("no values present with this id new value was created");
	st.executeUpdate("INSERT INTO `balance`(`userid`, `balance`) VALUES ('"+accountNumber+"','"+amtInt+"')");
	}
	else{System.out.println("There are to many Id with this same name");}
}
else{
out.println("Something incorrect please go back"+"<br><a href='transaction'><button>Go Back</button></a>");
}

%>
<%
double tmt = Double.parseDouble(amt);
DateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
Date dateobj = new Date();
String date = df.format(dateobj);
String acct2 = acct.toString();

if(transtype.equals("minus")){
st.executeUpdate("INSERT INTO `transactions`(`number`, `date`, `description`, `chagenum`, `withdrawamt`, `depositmt`, `availablebal`, `userid`) VALUES (null,'"+date+"','debit','400','"+tmt+"',null,'"+amtInt+"','"+acct2+"')");
}
else if(transtype.equals("add")){
st.executeUpdate("INSERT INTO `transactions`(`number`, `date`, `description`, `chagenum`, `withdrawamt`, `depositmt`, `availablebal`, `userid`) VALUES (null,'"+date+"','credit','300',null,'"+tmt+"','"+amtInt+"','"+acct2+"')");
}
else{
	out.println("no data was inserted to database");
	}

%>


<%response.sendRedirect("balanceComputer2.jsp"); %>
</body>
</html>