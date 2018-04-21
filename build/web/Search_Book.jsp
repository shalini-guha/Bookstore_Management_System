<%-- 
    Document   : Search_Book
    Created on : Apr 19, 2018, 12:42:26 PM
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
<html lang="en">
<head>
	<title>Search for Book</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
         <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css" rel="stylesheet">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util1.css">
	<link rel="stylesheet" type="text/css" href="css/main1.css">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
<!--===============================================================================================-->
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <div>
            <header class="codrops-header">
						<h1 style="font-size:60px;">Search for Books</h1>	
					</header>
        <section class="webdesigntuts-workshop">
      
            <form name="frm" method="post">	
  
		<input type="search" name="pid" id="pid" placeholder="User Name of Employee">		    	
		<button name="submit" value="Search">Search</button>
	</form>
            <p><a href="index.html">Employee Login</a></p>
</section>
<!--<!DOCTYPE html>
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
    </form>-->

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String pid = request.getParameter("pid");
String sql ="select * from books where bname='" + pid + "' and quantity <> 0" ;
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<div>
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1">
					<div class="table100-firstcol">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Book Details</th>
								</tr>
							</thead>
					
						</table>
					</div>
					
					<div class="wrap-table100-nextcols js-pscroll">
						<div class="table100-nextcols">
							<table>
								<thead>
									<tr class="row100 head">
										<th class="cell100 column2">Book ID</th>
										<th class="cell100 column3">Book Name</th>
										<th class="cell100 column4">Author Name</th>
										<th class="cell100 column5">Quantity</th>
										<th class="cell100 column6">User Name</th>
                                                                                <th class="cell100 column7">Price</th>
										<th class="cell100 column8">Update Values</th>
										<th class="cell100 column9">Delete Book</th>
									</tr>
								</thead>
                                                                <tbody>
                                                                	<tr class="row100 body">
										<td class="cell100 column2"><%=resultSet.getString("bid") %></td>
										<td class="cell100 column3"><%=resultSet.getString("bname") %></td>
										<td class="cell100 column4"><%=resultSet.getString("author") %></td>
										<td class="cell100 column5"><%=resultSet.getString("quantity") %></td>
										<td class="cell100 column6"><%=resultSet.getString("uname") %></td>
                                                                                <td class="cell100 column7"><%=resultSet.getString("price") %></td>
										<td class="cell100 column8"><a href="Update_Book.jsp?id=<%=resultSet.getString("bid")%>">Update</a></td>
										<td class="cell100 column9"><a href="Delete_Book.jsp?id=<%=resultSet.getString("bid") %>"><button type="button" class="delete">Sold</button></a></td>
									</tr>

                                                                </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 
       </div>

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

<!--<div align ="center">
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
</div>-->
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<!--</table>-->

</body>
</html>
