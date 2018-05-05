<%-- 
    Document   : delete
    Created on : Apr 19, 2018, 10:06:17 AM
    Author     : Zlalini
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("DELETE FROM users WHERE userid='" + id + "' ");
response.sendRedirect("Search.jsp");
%>
<%

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>