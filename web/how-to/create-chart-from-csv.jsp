<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<jsp:include page="../WEB-INF/pages/template.jsp">
	<jsp:param value="Render Chart from CSV" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/> 	
</jsp:include>

<%!
String csvDataGenerator(int startX, int startY, int noOfY){
	String csv = "";

	int xVal = 0,yVal = 20;

	for(int i = 0; i <= 100; i++){
		xVal++;
		yVal = (int) (yVal +  Math.round(5 + Math.random() *(-5-5)));
		csv +=(xVal+","+yVal +"\n");
	}
	return csv;
}
%>

<script type="text/javascript">
   $(function () {
   	var dataPoints = [];
  	 
       function getDataPointsFromCSV(csv) {
           var dataPoints = csvLines = points = [];
           csvLines = csv.split(/[\r?\n|\r|\n]+/);         
	        
           for (var i = 0; i < csvLines.length; i++)
               if (csvLines[i].length > 0) {
                   points = csvLines[i].split(",");
                   dataPoints.push({ 
                       x: parseFloat(points[0]), 
                       y: parseFloat(points[1]) 		
                   });
               }
           return dataPoints;
       }

		$.get("${pageContext.request.contextPath}/DataService?xstart=1&ystart=10&length=100&type=csv", function(data) {
		    var chart = new CanvasJS.Chart("chartContainer", {
		    	animationEnabled: true,
		    	zoomEnabled: true,
		    	title: {
			         text: "CanvasJS Charts in JSP using CSV & AJAX",
			    },
			    data: [{
			         type: "line",
			         dataPoints: getDataPointsFromCSV(data)
			      }]
		     });
			
		      chart.render();
		
		});
   });
</script>