<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.*" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>

<jsp:include page="../WEB-INF/pages/template.jsp">
	<jsp:param value="Sync Multiple Chart" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer1' style='height: 360px; width: 100%;'></div>
			<div id='chartContainer2' style='height: 360px; width: 100%;'></div>" name="content"/> 	
</jsp:include>

<jsp:scriptlet><![CDATA[
	Gson gsonObj = new Gson();
	String dataPoints1 = "";
	String dataPoints2 = "";
	
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	int yVal = 20;
	
	for(int i = 0; i <= 1000; i++){
		yVal = (int) (yVal +  Math.round(5 + Math.random() *(-5-5)));
		map = new HashMap<Object,Object>();	map.put("x", i++); map.put("y",yVal); list.add(map);
	}
	dataPoints1 = gsonObj.toJson(list);
	list = new ArrayList<Map<Object,Object>>();
	for(int i = 0; i <= 1000; i++){
		yVal = (int) (yVal +  Math.round(5 + Math.random() *(-5-5)));
		map = new HashMap<Object,Object>();	map.put("x", i++); map.put("y",yVal); list.add(map);
	}
	dataPoints2 = gsonObj.toJson(list);
]]></jsp:scriptlet>

<script type="text/javascript">

   $(function () {
       //-------- Chart 1 ---------------
       var chart1 = new CanvasJS.Chart("chartContainer1", {
           zoomEnabled: true,
           animationEnabled: true,
           title: {
               text: "Chart1 - Try Zooming / Panning"
           },
           data: [{
               type: "line",

               dataPoints: <%out.print(dataPoints1);%>
           }],
           rangeChanged: syncHandler
       });
       chart1.render();

       //-------- Chart 2 ---------------
       var chart2 = new CanvasJS.Chart("chartContainer2", {
           zoomEnabled: true,
           animationEnabled: true,
           title: {
               text: "Chart2 - Try Zooming / Panning"
           },
           data: [{
               type: "line",

               dataPoints: <%out.print(dataPoints2);%>
           }],
           rangeChanged: syncHandler
       });

       chart2.render();

       //--------------------Sync Chart-------------------
       var charts = [chart1, chart2];

       function syncHandler(e) {

           for (var i = 0; i < charts.length; i++) {
               var chart = charts[i];

               if (!chart.options.axisX) chart.options.axisX = {};
               if (!chart.options.axisY) chart.options.axisY = {};

               if (e.trigger === "reset") {

                   chart.options.axisX.viewportMinimum = chart.options.axisX.viewportMaximum = null;
                   chart.options.axisY.viewportMinimum = chart.options.axisY.viewportMaximum = null;
                   chart.render();
               } else if (chart !== e.chart) {

                   chart.options.axisX.viewportMinimum = e.axisX[0].viewportMinimum;
                   chart.options.axisX.viewportMaximum = e.axisX[0].viewportMaximum;

                   chart.options.axisY.viewportMinimum = e.axisY[0].viewportMinimum;
                   chart.options.axisY.viewportMaximum = e.axisY[0].viewportMaximum;
                   chart.render();
               }
           }
       }
   });
</script>