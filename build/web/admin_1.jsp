<%-- 
    Document   : admin_1
    Created on : Apr 20, 2018, 12:48:28 PM
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
ResultSet rs=st.executeQuery("select * from admin where userid='"+userid+"' and password='"+password+"'"); 
try{
    
//rs.next();
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("userid").equals(userid)) 
{ 
out.println("Welcome " +userid); 
 %>
<p>New user. <a href="AddBook.jsp?id=<%=rs.getString("userid") %>">Add a New Book</a>.
<p>New user. <a href="Register.html?">Add a New Employee</a>.
<p>New user. <a href="Search.jsp?">Search and edit Employee</a>.
   
<%
    }
else{
out.println("Invalid password or username.");
%>
 <div class="text-center p-t-136">
						<a class="txt2" href="index.html">
							Login as User
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
<%
}
}

catch (Exception e) {
e.printStackTrace();
}
%>