<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Creation Screen</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div style="width: 300px; margin-left:auto;margin-right:auto;">
		
		<h1>Account Creation Screen</h1>
		<form action="accountCreate.jsp">
			<table>
				<tr>
					<td>			
					Name
					</td>
					<td>
					<input type="text" name="name"><br>
					</td>
				</tr>
				
				<tr>
					<td>
					DOB
					</td>
					<td>
					<input type="text" name="dob" placeholder="Sample Format 1989-01-31"><br>
					</td>
				</tr>
				
				<tr>
					<td>
					Address
					</td>
					<td>
					<textarea type="textarea" name="address" rows=10 style="width:200px; height:100px;"></textarea><br>
					</td>
				</tr>
				
				<tr>
					<td>
					Email ID
					</td>
					<td>
					<input type="textarea" name="email" placeholder="Sample Format test@awesome.com"><br>
					</td>
				</tr>
				
				<tr>
					<td>
					Type of account
					</td>
					<td>
					<select name="accounttype">
					   <option  value="AAA">AAA</option>
					   <option value="BBB">BBB</option>
					   <option value="CCC">CCC</option>
					   <option value="DDD">DDD</option>
					</select> <br>		
					<td>
				</tr>
				<tr>
					<td>
					<input type="submit" value="Create Account">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>