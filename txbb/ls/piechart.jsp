<%@ page contentType="text/html;charset=GBK" %>

<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.Color"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.event.*"%>
<%@ page import="javax.swing.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.title.LegendTitle"%>
<%@ page import="org.jfree.data.*"%>
<%@ page import="org.jfree.data.general.*"%>
<%@ page import="org.jfree.data.category.*"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.category.CategoryDataset"%>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page import="org.jfree.ui.ApplicationFrame"%>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page import="org.jfree.chart.axis.NumberAxis"%>
<%@ page import="org.jfree.chart.axis.ValueAxis"%>
<%@ page import="org.jfree.chart.renderer.category.LineAndShapeRenderer"%>
<%@ page import="org.jfree.chart.renderer.category.*"%>
<%@ page import="org.jfree.chart.renderer.category.LineAndShapeRenderer"%>
<%@ page import="org.jfree.chart.plot.PiePlot"%>
<%@page import ="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%> 
<%@page import ="org.jfree.chart.renderer.category.BarRenderer3D"%> 
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.chart.labels.StandardPieToolTipGenerator"%>
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="org.jfree.chart.axis.CategoryAxis,org.jfree.chart.axis.CategoryLabelPositions,org.jfree.chart.axis.NumberAxis"%>
<%@ page import = "org.jfree.chart.ChartFactory,
              org.jfree.chart.JFreeChart,
              org.jfree.chart.servlet.ServletUtilities,
              org.jfree.chart.title.TextTitle,
              org.jfree.data.time.TimeSeries,
              org.jfree.data.time.Month,
              org.jfree.data.time.TimeSeriesCollection,
              java.awt.Font"%>
<%

DefaultPieDataset data = new DefaultPieDataset(); 
//数据初始化
data.setValue("高中以下",380); 
data.setValue("高中",1620); 
data.setValue("大专",6100); 
data.setValue("本科",8310); 
data.setValue("硕士",3520); 
data.setValue("博士",1900); 
/*
JFreeChart chart = ChartFactory.createPieChart(
	"程序员学历情况调查表-By Alpha",//图表标题
	data,//数据
	true,//是否显示图例
	false,//是否显示工具提示
	false//是否生成URL
	);
*/
JFreeChart chart = ChartFactory.createPieChart3D(
	"程序员学历情况调查表-By Alpha",//图表标题
	data,//数据
	true,//是否显示图例
	false,//是否显示工具提示
	false//是否生成URL
	);
//chart.setTitle(new TextTitle("程序员学历情况调查表-By Alpha",new Font("黑体",Font.ITALIC,22)));//重新设置图表标题，改变字体
//chart.setBackgroundPaint(java.awt.Color.white);//可选，设置图片背景色
//LegendTitle legend=chart.getLegend(0);//取得统计图表的第一个图例
//legend.setItemFont(new Font("宋体",Font.BOLD,14));//修改图例的字体
//PiePlot plot=(PiePlot)chart.getPlot();//取得饼图的Plot对象
//plot.setLabelFont(new Font("黑体",Font.BOLD,10));//设置饼图各部分的标签字体
//plot.setBackgroundPaint(java.awt.Color.red);//设置背景色
//plot.setBackgroundAlpha(0.9f);//设置背景透明度
//plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
//plot.setForegroundAlpha(0.5f);//设置前景透明度
//plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//设定图片链接 
//500是图片长度，300是图片高度
String filename = ServletUtilities.saveChartAsJPEG(chart,500,300,null,session); 
String graphURL = request.getContextPath()+"/servlet/DisplayChart?filename=" + filename;
%>
<img src="<%=graphURL%>" width=500 height=300 border=0 usemap="#<%=filename%>">
 <%   
  DefaultCategoryDataset dataset=new DefaultCategoryDataset();   
  dataset.addValue(300,   "test",   "1月份");   
  dataset.addValue(200,   "test",   "2月份");   
  dataset.addValue(430,   "test",   "3月份");   
  dataset.addValue(390,   "test",   "4月份");   
  dataset.addValue(280,   "test",   "5月份");   
  dataset.addValue(240,   "test",   "6月份");   
    
  JFreeChart chart2=ChartFactory.createBarChart(//如果生成3D柱状图，请用createBarChart3D方法
												//如果生成折线图，请用createLineChart方法和createLineChart3D方法
									  "月份故障统计图",   
                                      "月份",   
                                      "故障数",   
                                      dataset,   
                                      PlotOrientation.VERTICAL,   
                                      false,   
                                      true,   
                                      false); 
  //chart.setTitle(new TextTitle("月份故障统计图",new Font("黑体",Font.ITALIC,22)));//重新设置图表标题，改变字体
  //CategoryPlot plot=(CategoryPlot)chart2.getPlot();
  //CategoryAxis categoryAxis=plot.getDomainAxis();//取得横轴
  //categoryAxis.setLabelFont(new Font("宋体",Font.BOLD,22));//设置横轴显示标签的字体
 //categoryAxis.setCategoryLabelPosition(CategoryLabelPositions.UP_45);//分类标签以45度倾斜
  //categoryAxis.setTickLabelFont(new Font("黑体",Font.BOLD,18));
  //NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//取得纵轴
  //numberAxis.setLabelFont(new Font("宋体",Font.BOLD,22));//设置纵轴显示标签的字体
  //numberAxis.setTickLabelFont(new Font("黑体",Font.BOLD,18));//设置纵轴坐标的字体
  String  filename2= ServletUtilities.saveChartAsPNG(chart2,500,300,null,session);   
  String  graphURL2 = request.getContextPath()+"/servlet/DisplayChart?filename="+filename2;   
  %>   
  <img src="<%=graphURL2%>" width=500 height=300 border=0 usemap="#<%=filename2%>">
  <%
//访问量统计时间线,而且可以用TimeSeriesCollection包含多个timeSeries，此处仅以一个举例
TimeSeries timeSeries = new TimeSeries("阿蜜果blog访问量统计", Month.class);
//时间曲线数据集合
TimeSeriesCollection lineDataset = new TimeSeriesCollection();
 
//构造数据集合
timeSeries.add(new Month(1, 2007), 11200);
timeSeries.add(new Month(2, 2007), 9000);
timeSeries.add(new Month(3, 2007), 6200);
timeSeries.add(new Month(4, 2007), 8200);
timeSeries.add(new Month(5, 2007), 8200);
timeSeries.add(new Month(6, 2007), 12200);
timeSeries.add(new Month(7, 2007), 13200);
timeSeries.add(new Month(8, 2007), 8300);
timeSeries.add(new Month(9, 2007), 12400);
timeSeries.add(new Month(10, 2007), 12500);
timeSeries.add(new Month(11, 2007), 13600);
timeSeries.add(new Month(12, 2007), 12500);
 
lineDataset.addSeries(timeSeries);
JFreeChart chart3 = ChartFactory.createTimeSeriesChart(
												"访问量统计时间线", 
												"月份", 
												"访问量", 
												lineDataset, 
												true,
												true, 
												true);
 
//设置主标题
//chart3.setTitle(new TextTitle("阿蜜果blog访问量统计", new Font("隶书", Font.ITALIC, 15)));
//XYPlot plot=(XYPlot)chart3.getPlot();
//ValueAxis categoryAxis=plot.getDomainAxis();
//categoryAxis.setLabelFont(new Font("宋体",Font.BOLD,22));//设置横轴显示标签的字体
//categoryAxis.setTickLabelFont(new Font("黑体",Font.BOLD,18));//设置横轴坐标的字体
//NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//取得纵轴
//numberAxis.setLabelFont(new Font("宋体",Font.BOLD,22));//设置纵轴显示标签的字体
//numberAxis.setTickLabelFont(new Font("宋体",Font.BOLD,22));//设置纵轴坐标的字体
//chart3.setAntiAlias(true);//设定字体模糊边界
 
String filename3 = ServletUtilities.saveChartAsPNG(chart3, 1500, 800, null, session);
String graphURL3 = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename3;
%>
<img src="<%= graphURL3 %>"width=1500 height=800 border=0 usemap="#<%= filename3 %>">