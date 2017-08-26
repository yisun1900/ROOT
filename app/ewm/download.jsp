<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.jspsmart.upload.*" %>

<%
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
	String fileName = request.getParameter("fileName");

	fileName = fileName+".jpg";

	// 新建一个SmartUpload对象
	SmartUpload su = new SmartUpload();

	// 初始化
	su.initialize(pageContext);

	// 设定contentDisposition为null以禁止浏览器自动打开文件，
	//保证点击链接后是下载文件。若不设定，则下载的文件扩展名为
	//doc时，浏览器将自动用word打开它。扩展名为pdf时，
	//浏览器将用acrobat打开。
	su.setContentDisposition(null);

	String urlStr = "/yblimg/ewm/khewm/"+fileName;

	System.out.println("fileName--> "+urlStr);
	// 下载文件
	su.downloadFile(urlStr);
/*
*/
%>


