<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../WEB-INF/pages/template.jsp">
	<jsp:param value="Render Chart from XML" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/> 	
</jsp:include>

<script type="text/javascript">
$(function () {
   	var dataPoints = [];
	$.get("${pageContext.request.contextPath}/DataService?xstart=1&ystart=10&length=100&type=xml", function(data) {
   		$(data).find("point").each(function () {
   			var $dataPoint = $(this);
   			var x = $dataPoint.find("x").text();
   			var y = $dataPoint.find("y").text();
   			dataPoints.push({x: parseFloat(x), y: parseFloat(y)});
   			
   		});
   		
   		var chart = new CanvasJS.Chart("chartContainer", {
   			animationEnabled: true,
   			zoomEnabled: true,
   			title: {
   			    text: "CanvasJS Charts in JSP using XML & AJAX",
   			},
   			data: [{
   			    type: "line",
   			    dataPoints: dataPoints,
   			  }]
   		});
   		
   		chart.render();
	});
});
</script>