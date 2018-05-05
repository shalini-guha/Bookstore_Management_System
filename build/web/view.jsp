<%-- 
    Document   : view
    Created on : Apr 21, 2018, 9:30:53 AM
    Author     : Zlalini
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String userid = request.getParameter("id");
    session.putValue("id", userid);
%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Statistics</title>
        <meta name="description" content="Perspective Page View Navigation: Transforms the page in 3D to reveal a menu" />
        <meta name="keywords" content="3d page, menu, navigation, mobile, perspective, css transform, web development, web design"
              />
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
                <div class="wrapper">
                    <!-- wrapper needed for scroll -->
                    <!-- Top Navigation -->
                    <header class="codrops-header">
                        <h1>Welcome
                            <% out.print(userid);%>
                            <span>Select from the Statistics menu</span>
                        </h1>
                    </header>
                    <div>
                        <div class="codrops-header">
                            <p>
                                <button id="showMenu">Statistics</button>
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
                <a href="statistics.jsp" class="icon-home">View books sold</a>
                <a href="statistics1.jsp" class="icon-news">View Best Seller</a>
                <a href="list_books.jsp" class="icon-image">View all Books</a>
            </nav>
        </div>
        <!-- /perspective -->
        <script src="js/classie.js"></script>
        <script src="js/menu.js"></script>
    </body>

</html>