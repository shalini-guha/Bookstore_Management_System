<%-- 
    Document   : login
    Created on : Apr 16, 2018, 8:27:35 PM
    Author     : Zlalini
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid"); 
session.putValue("userid",userid); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"' and password='"+password+"'"); 
try{
    
//rs.next();
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("userid").equals(userid)) 
{ 
 %>
 <!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>User Page</title>
		<meta name="description" content="Perspective Page View Navigation: Transforms the page in 3D to reveal a menu" />
		<meta name="keywords" content="3d page, menu, navigation, mobile, perspective, css transform, web development, web design" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
		<script src="js/modernizr.custom.25376.js"></script>
	</head>
	<body background="image/bg.jpg">
		<div id="perspective" class="perspective effect-airbnb">
			<div class="container">
				<div class="wrapper"><!-- wrapper needed for scroll -->
					<!-- Top Navigation -->
					<header class="codrops-header">
						<h1>Welcome <% out.print(userid); %><span>Select from the Options menu</span></h1>	
					</header>
					<div>
						<div class="codrops-header">
							<p><button id="showMenu">Options</button></p>
							<p>Click on this button to see available options.</p>
						</div>
					</div><!-- /main -->
				</div><!-- wrapper -->
			</div><!-- /container -->
			<nav class="outer-nav left vertical">
				<a href="AddBook.jsp?id=<%=rs.getString("userid") %>" class="icon-home">Add Book</a>
				<a href="admin.html" class="icon-news">Admin Login</a>
				<a href="Search_Book.jsp" class="icon-image">Search Book</a>
			</nav>
		</div><!-- /perspective -->
		<script src="js/classie.js"></script>
		<script src="js/menu.js"></script>
	</body>
</html>
 
<!--<p>New user. <a href="AddBook.jsp?id=<%=rs.getString("userid") %>">Add a New Book</a>.
    <div class="text-center p-t-136">
						<a class="txt2" href="admin.html">
							Login as Admin
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>-->
<%
    }
else
{
%>
<!DOCTYPE html>
<html>
<head>
<title>Smooth Error Page Flat Responsive Widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Smooth Error Page template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web forms, Login sign up Responsive web Forms, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!-- //web font -->
</head>
<body>
<!--mian-content-->
<h1>Invalid Login Details</h1>
	<div class="main-wthree">
		<h2>ERROR</h2>
		
		<!--form--><p><a href="index.html">Please Login Again </a></p>
		<!--//form-->
	</div>
<!--//mian-content-->
<!-- copyright -->
	

<%
} 
}
catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>