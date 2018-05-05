<%-- 
    Document   : statistics1
    Created on : Apr 21, 2018, 9:28:13 AM
    Author     : Zlalini
--%>
	<%@ page import="java.util.*" %>
		<%@page import="com.google.gson.Gson"%>
			<%@page import="com.google.gson.JsonObject"%>
				<%@ page import="java.util.*,java.sql.*" %>
					<%--<jsp:include page="/WEB-INF/pages/template.jsp">
	<jsp:param value="Basic Column Chart" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/>
</jsp:include>--%>

						<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "");
	Statement statement = connection.createStatement();
	
	
	ResultSet resultSet = statement.executeQuery("select * from books");
	
	while(resultSet.next()){
		int count = Integer.parseInt(resultSet.getString("bcount"));
                int quant = Integer.parseInt(resultSet.getString("price"));
		int yVal = count*quant;
                int xVal = Integer.parseInt(resultSet.getString("bcount"));
		map = new HashMap<Object,Object>(); map.put("x", xVal); map.put("y", yVal); list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	connection.close();
        System.out.println(list); 
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>
							<!DOCTYPE HTML>
							<html>

							<head>
								<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
							<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css" rel="stylesheet">
								<script type="text/javascript">
									window.onload = function () { 
 
<% if (dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
												animationEnabled: true,
												exportEnabled: true,
												title: {
													text: "Best Seller"
												},
												data: [{
													type: "pie", //change type to bar, line, area, pie, etc
													dataPoints: <% out.print(dataPoints);%>
	}]
});
										chart.render();
<% } %> 
 
};
								</script>
							</head>

							<body>
								<br>
								<br>
								<br>
								<div id="chartContainer" style="height: 370px; width: 100%;"></div>
								<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
							</body>
							<br>
							<br>
							<br>
							<div align="center">
								<button type="button" class="btn btn-warning" onclick="location.href = 'view.jsp';">Statistics</button>
							</div>

							</html>