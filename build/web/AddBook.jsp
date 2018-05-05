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
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
						<html lang="en">

						<head>
							<title>Add Book</title>
							<meta charset="UTF-8">
							<meta name="viewport" content="width=device-width, initial-scale=1">
							<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
							<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css" rel="stylesheet">

							<!--===============================================================================================-->
							<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
							<!--===============================================================================================-->
							<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
							<!--===============================================================================================-->
							<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
							<!--===============================================================================================-->
							<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
							<!--===============================================================================================-->
							<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
							<!--===============================================================================================-->
							<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
							<!--===============================================================================================-->
							<link rel="stylesheet" type="text/css" href="css/util.css">
							<link rel="stylesheet" type="text/css" href="css/main.css">
							<!--===============================================================================================-->
						</head>

						<body>

							<div class="limiter">
								<div class="container-login100">
									<div class="wrap-login100">
										<div class="login100-pic js-tilt" data-tilt>
											<img src="images/img-03.png" alt="IMG">
										</div>

										<form class="login100-form validate-form" action="Add.jsp" method="post">
											<span class="login100-form-title">
												Add Book
											</span>
											<input type="hidden" name="id" value="<%=resultSet.getString("userid") %>">
											<br>
											<div class="wrap-input100">
												<input class="input100" readonly type="text" name="userid" disabled="disabled" value="<%=resultSet.getString("userid") %>">
												<span class="focus-input100"></span>
												<span class="symbol-input100">
													<i class="fa fa-bookmark" aria-hidden="true"></i>
												</span>
											</div>
											<div class="wrap-input100 ">
												<input class="input100" type="text" name="bid" placeholder="Accesion Number">
												<span class="focus-input100"></span>
												<span class="symbol-input100">
													<i class="fa fa-bookmark" aria-hidden="true"></i>
												</span>
											</div>
											<div class="wrap-input100">
												<input class="input100" type="text" name="bname" placeholder="Book Name">
												<span class="focus-input100"></span>
												<span class="symbol-input100">
													<i class="fa fa-bookmark" aria-hidden="true"></i>
												</span>
											</div>

											<div class="wrap-input100">
												<input class="input100" type="text" name="author" placeholder="Author Name">
												<span class="focus-input100"></span>
												<span class="symbol-input100">
													<i class="fa fa-bookmark" aria-hidden="true"></i>
												</span>
											</div>
											<div class="wrap-input100">
												<input class="input100" type="text" name="quantity" placeholder="Quantity">
												<span class="focus-input100"></span>
												<span class="symbol-input100">
													<i class="fa fa-bookmark" aria-hidden="true"></i>
												</span>
											</div>
											<div class="wrap-input100">
												<input class="input100" type="text" name="price" placeholder="Price">
												<span class="focus-input100"></span>
												<span class="symbol-input100">
													<i class="fa fa-bookmark" aria-hidden="true"></i>
												</span>
											</div>

											<div class="container-login100-form-btn">
												<button class="login100-form-btn">
													Add Details

												</button>
											</div>
										</form>
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
							<script src="vendor/tilt/tilt.jquery.min.js"></script>
							<script>
								$('.js-tilt').tilt({
									scale: 1.1
								})
							</script>
							<!--===============================================================================================-->
							<script src="js/main.js"></script>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
						</body>

						</html>