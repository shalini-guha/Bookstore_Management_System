<%-- 
    Document   : newjsp
    Created on : Apr 19, 2018, 9:47:43 AM
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
	<title>Search for Employee</title>
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
<!--===============================================================================================-->
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      
        <section class="webdesigntuts-workshop">
            <br><br><br><br>
        <h1 style="color:grey;" align="center">Search for employee</h1>  
	<form name="frm" method="post">		    
		<input type="search" name="pid" id="pid" placeholder="User Name of Employee">		    	
		<button name="submit" value="Search">Search</button>
	</form>
</section>
        <br><br><br><br>
<!--   <div class="limiter">
        -->
<!--<h1>Search for an Employee</h1>
  <form method="post" name="frm">
      <table border="0" width="300" align="center" bgcolor="#e9f">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search Employee</h3></td></tr>
        <tr><td ><b>User Name</b></td>
          <td>: <input  type="text" name="pid" id="pid">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
    </div>-->
    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String pid = request.getParameter("pid");
String sql ="select * from users where userid='" + pid + "' ";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
	
        <br><br><br><br>
        <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1">
					<div class="table100-firstcol">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1"> Employee Details</th>
								</tr>
							</thead>
					
						</table>
					</div>
					
					<div class="wrap-table100-nextcols js-pscroll">
						<div class="table100-nextcols">
							<table>
								<thead>
									<tr class="row100 head">
										<th class="cell100 column2">First Name</th>
										<th class="cell100 column3">Last Name</th>
										<th class="cell100 column4" type="password">Password</th>
										<th class="cell100 column5">Email</th>
										<th class="cell100 column6">User Name</th>
										<th class="cell100 column7">Update Values</th>
										<th class="cell100 column8">Delete Employees</th>
									</tr>
								</thead>
                                                                <tbody>
                                                                	<tr class="row100 body">
										<td class="cell100 column2"><%=resultSet.getString("fname") %></td>
										<td class="cell100 column3"><%=resultSet.getString("lname") %></td>
										<td class="cell100 column4"><%=resultSet.getString("password") %></td>
										<td class="cell100 column5"><%=resultSet.getString("email") %></td>
										<td class="cell100 column6"><%=resultSet.getString("userid") %></td>
										<td class="cell100 column7"><a href="update.jsp?id=<%=resultSet.getString("userid")%>">Update</a></td>
										<td class="cell100 column8"><a href="delete.jsp?id=<%=resultSet.getString("userid") %>"><button type="button" class="delete">Delete</button></a></td>
									</tr>

                                                                </tbody>
							</table>
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

</body>
</html>


<!--<!DOCTYPE html>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h1>Retrieve data from database in jsp</h1>
  <form method="post" name="frm">
      <table border="0" width="300" align="center" bgcolor="#e9f">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search User</h3></td></tr>
        <tr><td ><b>User Name</b></td>
          <td>: <input  type="text" name="pid" id="pid">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>-->


<!--<div align ="center">
<table border="1">
<tr>
<td>first name</td>
<td>last name</td>
<td>User Name</td>
<td>Email</td>
<td>Action</td>
</tr>
<tr>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("userid") %></td>
<td><%=resultSet.getString("email") %></td>
<td><a href="update.jsp?id=<%=resultSet.getString("userid")%>">Update</a></td>
<td><a href="delete.jsp?id=<%=resultSet.getString("userid") %>"><button type="button" class="delete">Delete</button></a></td>

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
<!--</table>

</body>
</html>-->
