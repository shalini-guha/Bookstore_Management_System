<%-- 
    Document   : list_books
    Created on : Apr 21, 2018, 10:21:38 AM
    Author     : Zlalini
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html>
<html lang="en" >
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css" rel="stylesheet">
<head>
  <meta charset="UTF-8">
  <title>Fixed table header</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="css/list.css">

  
</head>

<body>
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/login"
        user="root" password=""
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM books;
    </sql:query>
  </body>   

  <section>
  <!--for demo wrap-->
  <h1>All Books</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Book ID</th>
          <th>Book Name</th>
          <th>Quantity</th>
          <th>Author</th>
          <th>Price</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
            <c:forEach var="user" items="${listUsers.rows}">
        <tr>
          <td><c:out value="${user.bid}" /></td>
          <td><c:out value="${user.bname}" /></td>
          <td><c:out value="${user.quantity}" /></td>
          <td><td><c:out value="${user.author}" /></td>
           <td><td><c:out value="${user.price}" /></td>
            </c:forEach>
        </tr>
      </tbody>
    </table>
  </div>
</section>
<div align="center">
<button type="button" class="btn btn-primary" onclick="location.href = 'view.jsp';">Statistics</button>
</div>
<!-- follow me template -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/script1.js"></script>
</html>

