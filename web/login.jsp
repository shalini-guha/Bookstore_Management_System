<%-- 
    Document   : login
    Created on : Apr 16, 2018, 8:27:35 PM
    Author     : Zlalini
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid"); 
session.putValue("userid",userid); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"' and password='"+password+"'"); 
try{
    
//rs.next();
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("userid").equals(userid)) 
{ 
out.println("Welcome " +userid); 
 %>
<p>New user. <a href="AddBook.jsp?id=<%=rs.getString("userid") %>">Add a New Book</a>.
    <div class="text-center p-t-136">
						<a class="txt2" href="admin.html">
							Login as Admin
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
<%
    }
else{
out.println("Invalid password or username.");
}
}

catch (Exception e) {
e.printStackTrace();
}
%>