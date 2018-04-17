<% 
if(session.getAttribute("uname") != null)
{
out.print("<h5>"+"Logged in as "+session.getAttribute( "uname" )+"</h5>");
out.print("<a href='logout.jsp'>Logout</a>");
}
else
{
response.sendRedirect("index.jsp");
}
%>
