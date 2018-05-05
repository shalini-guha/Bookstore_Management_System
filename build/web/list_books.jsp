<%-- 
    Document   : Search_Book
    Created on : Apr 19, 2018, 12:42:26 PM
    Author     : Zlalini
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>List of All Books</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
         <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css" rel="stylesheet">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
<!--	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
===============================================================================================
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
===============================================================================================
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
===============================================================================================
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
===============================================================================================
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
===============================================================================================
	<link rel="stylesheet" type="text/css" href="css/util1.css">
	<link rel="stylesheet" type="text/css" href="css/main1.css">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />-->
		<link rel="stylesheet" type="text/css" href="css/list.css" />
<!--===============================================================================================-->
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <header class="codrops-header">
						<h1 style="font-size:60px;">List of Books</h1>	
					</header>
        <br><br>
<div class="tbl-content" align="center">
       <h2 style="color:whitesmoke;"> Book Details </h2>
                                        <br><br>
					
		
					
							<table>
								<thead>
									<tr >
										<th >Book ID</th>
										<th >Book Name</th>
										<th >Author Name</th>
										<th >Quantity</th>
										<th >User Name</th>
                                                                                <th >Price</th>
										<th >Update Values</th>
										<th >Delete Book</th>
									</tr>
								</thead>
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
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String pid = request.getParameter("pid");
String sql ="select * from books" ;
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
                                                                <tbody>
                                                                	<tr >
										<td ><%=resultSet.getString("bid") %></td>
										<td ><%=resultSet.getString("bname") %></td>
										<td ><%=resultSet.getString("author") %></td>
										<td ><%=resultSet.getString("quantity") %></td>
										<td ><%=resultSet.getString("uname") %></td>
                                                                                <td ><%=resultSet.getString("price") %></td>
										<td ><a href="Update_Book.jsp?id=<%=resultSet.getString("bid")%>"><button class="btn btn-warning">Update</button></a></td>
										<td ><a href="Delete_Book.jsp?id=<%=resultSet.getString("bid") %>"><button class="btn btn-danger">Sold</button></a></td>
									</tr>

                                                                </tbody>
							

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);
			$(window).on('resize', function(){
				ps.update();
			})
			$(this).on('ps-x-reach-start', function(){
				$(this).parent().find('.table100-firstcol').removeClass('shadow-table100-firstcol');
			});
			$(this).on('ps-scroll-x', function(){
				$(this).parent().find('.table100-firstcol').addClass('shadow-table100-firstcol');
			});
		});
		
		
		
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>


<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<!--</table>-->
</table>
						
 
       </div>
</body>
</html>

