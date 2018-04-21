package com.canvasjs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class JSONDataServlet
 */
@WebServlet("/DataService")
public class DataService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataService() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("type").equalsIgnoreCase("json")) {
			List<Map<Object, Object>> dataPoints = getRandomData(Integer.parseInt(request.getParameter("xstart")),Integer.parseInt(request.getParameter("ystart")), Integer.parseInt(request.getParameter("length")));
			Gson gsonObj = new Gson();
			
			response.setContentType("application/json");
			response.getWriter().println(gsonObj.toJson(dataPoints));
		}
		else if(request.getParameter("type").equalsIgnoreCase("xml")){
			
			response.setContentType("text/xml");
			String fileName = "xmlData.xml";
			List<Map<Object, Object>> dataPoints = this.getRandomData(Integer.parseInt(request.getParameter("xstart")),Integer.parseInt(request.getParameter("ystart")), Integer.parseInt(request.getParameter("length")));
			
			response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);
			ArrayList<String> rows = new ArrayList<String>();
			rows.add("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			rows.add("<data>");
			for (int i = 0; i < dataPoints.size(); i++) {
				
				rows.add("<point>");
				rows.add("<x>" + (dataPoints.get(i).get("x")) + "</x>");
				rows.add("<y>" + (dataPoints.get(i).get("y")) + "</y>");
				rows.add("</point>");
			}
			rows.add("</data>");
			
			Iterator<String> iter = rows.iterator();
			while (iter.hasNext()) {
				String outputString = (String) iter.next();
				response.getOutputStream().print(outputString);
			}
			
			response.getOutputStream().flush();
			
		}
		else if(request.getParameter("type").equalsIgnoreCase("csv")){
			response.setContentType("text/csv");
			String fileName = "CSVData.csv";
			List<Map<Object, Object>> dataPoints = getRandomData(Integer.parseInt(request.getParameter("xstart")),Integer.parseInt(request.getParameter("ystart")), Integer.parseInt(request.getParameter("length")));
			response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);

			ArrayList<String> rows = new ArrayList<String>();
			for (int i = 0; i < 100; i++) {
				rows.add(dataPoints.get(i).get("x")+","+dataPoints.get(i).get("y")+ "\n");
			}

			Iterator<String> iter = rows.iterator();
			while (iter.hasNext()) {
				String outputString = (String) iter.next();
				response.getOutputStream().print(outputString);
			}
			
			response.getOutputStream().flush();
		}
		
	}

	/**
	 * Random Data Generator
	 */
	public List<Map<Object, Object>> getRandomData(int xStart, int yStart, int length) {

		float y1 = yStart;
		float x = xStart;
		List<Map<Object, Object>> dataPoints = new ArrayList<Map<Object, Object>>();

		for (int i = 0; i < length; i++) {
			Random r = new Random();
			int Low = 0;
			int High = 10;
			int random = r.nextInt(High - Low) + Low;
			y1 += random - 5;
			x = x + i;

			Map<Object, Object> dataPoint = new HashMap<Object, Object>();
			dataPoint.put("x", x);
			dataPoint.put("y", y1);
			dataPoints.add(dataPoint);
		}
		return dataPoints;
	}

}
