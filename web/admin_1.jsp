<%-- 
    Document   : admin_1
    Created on : Apr 20, 2018, 12:48:28 PM
    Author     : Zlalini
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String userid = request.getParameter("userid");
    session.putValue("aid", userid);
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from `admin` where aid='" + userid + "' and apassword='" + password + "'");
    try {

//rs.next();
        rs.next();
        if (rs.getString("apassword").equals(password) && rs.getString("aid").equals(userid)) {
%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Page</title>
        <meta name="description" content="Perspective Page View Navigation: Transforms the page in 3D to reveal a menu" />
        <meta name="keywords" content="3d page, menu, navigation, mobile, perspective, css transform, web development, web design"
              />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script src="js/modernizr.custom.25376.js"></script>
    </head>

    <body background="bg.jpg">
        <div id="perspective" class="perspective effect-airbnb">
            <div class="container">
                <div class="wrapper">
                    <!-- wrapper needed for scroll -->
                    <!-- Top Navigation -->
                    <header class="codrops-header">
                        <h1>Welcome
                            <% out.print(userid);%>
                            <span>Select from the Options menu</span>
                        </h1>
                    </header>
                    <div>
                        <div class="codrops-header">
                            <p>
                                <button id="showMenu">Options</button>
                            </p>
                            <p>Click on this button to see available options.</p>
                        </div>
                    </div>
                    <!-- /main -->
                </div>
                <!-- wrapper -->
            </div>
            <!-- /container -->
            <nav class="outer-nav left vertical">
                <a href="AddBook.jsp?id=<%=rs.getString("aid")%>" class="icon-home">Add Book</a>
                <a href="register.html" class="icon-news">Add Employee</a>
                <a href="index.html" class="icon-news">Employee Login</a>
                <a href="Search_Book.jsp" class="icon-image">Search Book</a>
                <a href="Search.jsp" class="icon-image">Search Employee</a>
                <a href="view.jsp?id=<%=rs.getString("aid")%>" class="icon-home">Statistics</a>
            </nav>
        </div>
        <!-- /perspective -->
        <script src="js/classie.js"></script>
        <script src="js/menu.js"></script>
    </body>
</html>
<%
} else {
    out.println("Invalid password or username.");
%>
<div class="text-center p-t-136">
    <a class="txt2" href="index.html">
        Login as User
        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
    </a>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>