<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "login";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where userid='" + id + "' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Add a new Book</h1>
<form method="post" action="Add.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("userid") %>">
<br>
User name:<br>
<input readonly type="text" name="id" disabled="disabled" value="<%=resultSet.getString("userid") %>">
<br>
Book ID:<br>
<input  type="text" name="bid">
<br>
Book Name:<br>
<input  type="text" name="bname" >
<br>
Author Name:<br>
<input  type="text" name="author">
<br>
Quantity:<br>
<input  type="text" name="quantity">
<br>
<input type="submit" />
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
