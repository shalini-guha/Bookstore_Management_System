<%-- 
    Document   : Update_Book_Process
    Created on : Apr 19, 2018, 1:12:19 PM
    Author     : Zlalini
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/login";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%

String bid = request.getParameter("bid");
String bname=request.getParameter("bname");
String author=request.getParameter("author");
String quantity=request.getParameter("quantity");
String id=request.getParameter("id");
out.println(id);
out.println(bname);
out.println(author);
out.println(quantity);
out.println(bid);

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
String personID = id;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update books set bid=?,bname=?,author=?,quantity=?,uname=? where bid='"+bid+"'";
ps = con.prepareStatement(sql);
ps.setString(1, bid);
ps.setString(2, bname);
ps.setString(3, author);
ps.setString(4, quantity);
ps.setString(5, id);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
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