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
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
<head>
	<title>Register</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
         <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css" rel="stylesheet">

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
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
					<img src="images/img-02.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="Update_Book_Process.jsp" method="post">
					<span class="login100-form-title">
						Update Book Details
					</span>
                                <input type="hidden" name="bid" value="<%=resultSet.getString("bid") %>">
                                <input type="hidden" name="id" value="<%=resultSet.getString("uname") %>">
<br>
					<div class="wrap-input100">
						<input class="input100" readonly type="text" name="id" disabled="disabled" value="<%=resultSet.getString("uname") %>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
					</div>
                                    <div class="wrap-input100 ">
						<input class="input100" readonly type="text" name="bid" disabled="disabled" value="<%=resultSet.getString("bid") %>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
					</div>
                                    <div class="wrap-input100">
						<input class="input100" type="text" name="bname" value="<%=resultSet.getString("bname") %>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100">
						<input class="input100" type="text" name="author" value="<%=resultSet.getString("author") %>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
					</div>
                                    <div class="wrap-input100">
						<input class="input100" type="text" name="quantity" value="<%=resultSet.getString("quantity") %>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
					</div>
                                        <div class="wrap-input100">
						<input class="input100" type="text" name="price" value="<%=resultSet.getString("price") %>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
                                                   Update Details
							
						</button>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="Search_Books.jsp">
							Back
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
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
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>


<!--<!DOCTYPE html>
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
</form>-->
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<!--</body>
</html>-->