<%@page import="Utils.constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
 
 
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>

<%
constants cons=new constants();
//String uid=session.getAttribute("guid").toString();
//String buid=session.getAttribute("gbuid").toString();
int user=Integer.parseInt("20");
int blockeduser=Integer.parseInt("10");
  final double[][] data = new double[][]{
 {user},
 {blockeduser}
 };

 final CategoryDataset dataset = 
   DatasetUtilities.createCategoryDataset("Algo ", "", data);

 JFreeChart chart = null;
 BarRenderer renderer3D = null;
 CategoryPlot plot = null;


 final CategoryAxis3D categoryAxis = new CategoryAxis3D("Algo");
 final ValueAxis valueAxis = new NumberAxis3D("Performance");
 renderer3D = new BarRenderer3D();

 plot = new CategoryPlot(dataset, categoryAxis, valueAxis, renderer3D);
 plot.setOrientation(PlotOrientation.VERTICAL);
 chart = new JFreeChart("Performance evaluation", JFreeChart.DEFAULT_TITLE_FONT, 
  plot, true);

 chart.setBackgroundPaint(new Color(249, 231, 236));

  try {
 final ChartRenderingInfo info = new ChartRenderingInfo
 (new StandardEntityCollection());
 final File file1 = new File("images"+"3dbarchart.png");
 ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
  } catch (Exception e) {
 out.println(e);
 }
%>

<html>
  <head>
  <meta http-equiv="Content-Type" 
  content="text/html; charset=UTF-8">
  <title>Graph</title>
  </head>
  <body>
  <img SRC="images/3dbarchart.png"  WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart" />
  <br>
 
  </body>
</html>