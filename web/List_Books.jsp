<%-- 
    Document   : List_Books
    Created on : Apr 19, 2018, 1:55:20 PM
    Author     : Zlalini
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h1>Search for a Book</h1>
  <form method="post" name="frm">
      <table border="0" width="300" align="center" bgcolor="#e9f">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search Book</h3></td></tr>
        <tr><td ><b>Book Name</b></td>
          <td>: <input  type="text" name="pid" id="pid">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String pid = request.getParameter("pid");
String sql ="select * from books";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<div align ="center">
<table border="1">
<tr>
<td>Book ID</td>
<td>Book name</td>
<td>Author Name</td>
<td>Quantity</td>
<td>User Entered</td>
</tr>
<tr>
<td><%=resultSet.getString("bid") %></td>
<td><%=resultSet.getString("bname") %></td>
<td><%=resultSet.getString("author") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("uname") %></td>
<td><a href="Update_Book.jsp?id=<%=resultSet.getString("bid")%>">Update</a></td>
<td><a href="Delete_Book.jsp?id=<%=resultSet.getString("bid") %>"><button type="button" class="delete">Sold</button></a></td>

</tr>
</div>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
</html>
