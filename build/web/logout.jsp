<%-- 
    Document   : logout
    Created on : Apr 21, 2018, 11:56:48 AM
    Author     : Zlalini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%session.invalidate();%>
You have logged out. Please
<a href="index.html"><b>Login</b></a>
