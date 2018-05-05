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
							<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
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
							<link rel="stylesheet" type="text/css" href="css/list.css" />
							<!--===============================================================================================-->
						</head>

						<body>
							<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
							<div>
								<header class="codrops-header">
									<h1 style="font-size:60px;">Search for Employees</h1>
								</header>
								<div align="center">
									<section class="webdesigntuts-workshop">

										<form name="frm" method="post">

											<input type="search" name="pid" id="pid" placeholder="User Name of Employee" size="40">
											<button name="submit" value="Search" class="btn btn-primary">Search</button>
										</form>
									</section>
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

										<div class="tbl-content">

											<h2 style="color:whitesmoke;"> Employee Details </h2>
											<br>
											<br>


											<table table cellpadding="0" cellspacing="0" border="1">
												<thead>
													<tr>
														<th>User Name</th>
														<th>First Name</th>
														<th>Last Name</th>
														<th>Password</th>
														<th>Email</th>
														<th>Update Values</th>
														<th>Delete Employees</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<%=resultSet.getString("userid") %>
														</td>
														<td>
															<%=resultSet.getString("fname") %>
														</td>
														<td>
															<%=resultSet.getString("lname") %>
														</td>
														<td>
															<%=resultSet.getString("password") %>
														</td>
														<td>
															<%=resultSet.getString("email") %>
														</td>
														<td>
															<a href="update.jsp?id=<%=resultSet.getString("userid")%>">
																<button class="btn btn-warning">Update</button>
															</a>
														</td>
														<td>
															<a href="delete.jsp?id=<%=resultSet.getString("userid") %>">
																<button class="btn btn-danger">Delete</button>
															</a>
														</td>
													</tr>

												</tbody>
											</table>

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
									$('.js-pscroll').each(function () {
										var ps = new PerfectScrollbar(this);
										$(window).on('resize', function () {
											ps.update();
										})
										$(this).on('ps-x-reach-start', function () {
											$(this).parent().find('.table100-firstcol').removeClass('shadow-table100-firstcol');
										});
										$(this).on('ps-scroll-x', function () {
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
						</body>

						</html>