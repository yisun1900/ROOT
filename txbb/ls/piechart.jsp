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
//���ݳ�ʼ��
data.setValue("��������",380); 
data.setValue("����",1620); 
data.setValue("��ר",6100); 
data.setValue("����",8310); 
data.setValue("˶ʿ",3520); 
data.setValue("��ʿ",1900); 
/*
JFreeChart chart = ChartFactory.createPieChart(
	"����Աѧ����������-By Alpha",//ͼ�����
	data,//����
	true,//�Ƿ���ʾͼ��
	false,//�Ƿ���ʾ������ʾ
	false//�Ƿ�����URL
	);
*/
JFreeChart chart = ChartFactory.createPieChart3D(
	"����Աѧ����������-By Alpha",//ͼ�����
	data,//����
	true,//�Ƿ���ʾͼ��
	false,//�Ƿ���ʾ������ʾ
	false//�Ƿ�����URL
	);
//chart.setTitle(new TextTitle("����Աѧ����������-By Alpha",new Font("����",Font.ITALIC,22)));//��������ͼ����⣬�ı�����
//chart.setBackgroundPaint(java.awt.Color.white);//��ѡ������ͼƬ����ɫ
//LegendTitle legend=chart.getLegend(0);//ȡ��ͳ��ͼ��ĵ�һ��ͼ��
//legend.setItemFont(new Font("����",Font.BOLD,14));//�޸�ͼ��������
//PiePlot plot=(PiePlot)chart.getPlot();//ȡ�ñ�ͼ��Plot����
//plot.setLabelFont(new Font("����",Font.BOLD,10));//���ñ�ͼ�����ֵı�ǩ����
//plot.setBackgroundPaint(java.awt.Color.red);//���ñ���ɫ
//plot.setBackgroundAlpha(0.9f);//���ñ���͸����
//plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
//plot.setForegroundAlpha(0.5f);//����ǰ��͸����
//plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//�趨ͼƬ���� 
//500��ͼƬ���ȣ�300��ͼƬ�߶�
String filename = ServletUtilities.saveChartAsJPEG(chart,500,300,null,session); 
String graphURL = request.getContextPath()+"/servlet/DisplayChart?filename=" + filename;
%>
<img src="<%=graphURL%>" width=500 height=300 border=0 usemap="#<%=filename%>">
 <%   
  DefaultCategoryDataset dataset=new DefaultCategoryDataset();   
  dataset.addValue(300,   "test",   "1�·�");   
  dataset.addValue(200,   "test",   "2�·�");   
  dataset.addValue(430,   "test",   "3�·�");   
  dataset.addValue(390,   "test",   "4�·�");   
  dataset.addValue(280,   "test",   "5�·�");   
  dataset.addValue(240,   "test",   "6�·�");   
    
  JFreeChart chart2=ChartFactory.createBarChart(//�������3D��״ͼ������createBarChart3D����
												//�����������ͼ������createLineChart������createLineChart3D����
									  "�·ݹ���ͳ��ͼ",   
                                      "�·�",   
                                      "������",   
                                      dataset,   
                                      PlotOrientation.VERTICAL,   
                                      false,   
                                      true,   
                                      false); 
  //chart.setTitle(new TextTitle("�·ݹ���ͳ��ͼ",new Font("����",Font.ITALIC,22)));//��������ͼ����⣬�ı�����
  //CategoryPlot plot=(CategoryPlot)chart2.getPlot();
  //CategoryAxis categoryAxis=plot.getDomainAxis();//ȡ�ú���
  //categoryAxis.setLabelFont(new Font("����",Font.BOLD,22));//���ú�����ʾ��ǩ������
 //categoryAxis.setCategoryLabelPosition(CategoryLabelPositions.UP_45);//�����ǩ��45����б
  //categoryAxis.setTickLabelFont(new Font("����",Font.BOLD,18));
  //NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//ȡ������
  //numberAxis.setLabelFont(new Font("����",Font.BOLD,22));//����������ʾ��ǩ������
  //numberAxis.setTickLabelFont(new Font("����",Font.BOLD,18));//�����������������
  String  filename2= ServletUtilities.saveChartAsPNG(chart2,500,300,null,session);   
  String  graphURL2 = request.getContextPath()+"/servlet/DisplayChart?filename="+filename2;   
  %>   
  <img src="<%=graphURL2%>" width=500 height=300 border=0 usemap="#<%=filename2%>">
  <%
//������ͳ��ʱ����,���ҿ�����TimeSeriesCollection�������timeSeries���˴�����һ������
TimeSeries timeSeries = new TimeSeries("���۹�blog������ͳ��", Month.class);
//ʱ���������ݼ���
TimeSeriesCollection lineDataset = new TimeSeriesCollection();
 
//�������ݼ���
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
												"������ͳ��ʱ����", 
												"�·�", 
												"������", 
												lineDataset, 
												true,
												true, 
												true);
 
//����������
//chart3.setTitle(new TextTitle("���۹�blog������ͳ��", new Font("����", Font.ITALIC, 15)));
//XYPlot plot=(XYPlot)chart3.getPlot();
//ValueAxis categoryAxis=plot.getDomainAxis();
//categoryAxis.setLabelFont(new Font("����",Font.BOLD,22));//���ú�����ʾ��ǩ������
//categoryAxis.setTickLabelFont(new Font("����",Font.BOLD,18));//���ú������������
//NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//ȡ������
//numberAxis.setLabelFont(new Font("����",Font.BOLD,22));//����������ʾ��ǩ������
//numberAxis.setTickLabelFont(new Font("����",Font.BOLD,22));//�����������������
//chart3.setAntiAlias(true);//�趨����ģ���߽�
 
String filename3 = ServletUtilities.saveChartAsPNG(chart3, 1500, 800, null, session);
String graphURL3 = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename3;
%>
<img src="<%= graphURL3 %>"width=1500 height=800 border=0 usemap="#<%= filename3 %>">