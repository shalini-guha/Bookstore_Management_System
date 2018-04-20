<%-- 
    Document   : Add
    Created on : Apr 19, 2018, 11:55:35 AM
    Author     : Zlalini
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/login";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String bid = request.getParameter("bid");
String bname=request.getParameter("bname");
String author=request.getParameter("author");
String quantity=request.getParameter("quantity");
//out.println(id);
//out.println(first_name);
//out.println(last_name);
//out.println(password);
//out.println(email);

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
String personID = id;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="insert into books(bid,bname,author,quantity,uname)values('"+bid+"','"+bname+"','"+author+"','"+quantity+"','"+id+"')";
Statement st=con.createStatement();
int i=st.executeUpdate(sql);
if(i > 0)
{
out.print("Record Inserted Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>