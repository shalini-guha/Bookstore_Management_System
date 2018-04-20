<%-- 
    Document   : Update_Book
    Created on : Apr 19, 2018, 1:04:04 PM
    Author     : Zlalini
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
out.println(id);
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
String sql ="select * from books where bid='" + id + "' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update Book Details</h1>
<form method="post" action="Update_Book_Process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("uname") %>">
<br>
User name:<br>
<input readonly type="text" name="id" disabled="disabled" value="<%=resultSet.getString("uname") %>">
<br>
Book ID:<br>
<input type="text" name="bid" value="<%=resultSet.getString("bid") %>">
<br>
Book name:<br>
<input type="text" name="bname" value="<%=resultSet.getString("bname") %>">
<br>
Author:<br>
<input type="text" name="author" value="<%=resultSet.getString("author") %>">
<br>
Quantity:<br>
<input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>">
<br><br>
<input type="submit" value="submit">
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