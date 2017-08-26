<%@ page language="java" import="java.util.*,java.awt.*,java.awt.image.*,java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.stream.ImageOutputStream" %>
<%@ page import="javax.imageio.*" %>
<%
String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//生成随机类
Random random = new Random();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <%
	String yzm="";
	for (int i=0;i<6;i++)
	{
		String rand=String.valueOf(random.nextInt(10));
		yzm+=rand;
	}
	java.text.SimpleDateFormat temp = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String today = temp.format(new Date() );
    String width = request.getParameter("width");
    String height = request.getParameter("height");
    int w = Integer.parseInt(width);
    int h = Integer.parseInt(height);
	w=185;
try {
    BufferedImage bf = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
    for (int i = 0; i < bf.getHeight(); i++) {
     String data = request.getParameter("px" + i);
     String[] ds = data.split(",");
     for (int j = 0; j < bf.getWidth(); j++) {
      int d = Integer.parseInt(ds[j], 16);
      bf.setRGB(j, i, d);
     }
    }

    ImageWriter writer = null;
    ImageTypeSpecifier type = ImageTypeSpecifier.createFromRenderedImage(bf);
    Iterator iter = ImageIO.getImageWriters(type, "jpg");
    if (iter.hasNext()) {
     writer = (ImageWriter) iter.next();
    }
    IIOImage iioImage = new IIOImage(bf,null, null);
    ImageWriteParam param = writer.getDefaultWriteParam();
    param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
    param.setCompressionQuality(1f);
    // save to file
    FileOutputStream fossss=new FileOutputStream(strAbsPath+"//lttx//"+today+yzm+".gif");
    ImageOutputStream outputStream2 = ImageIO.createImageOutputStream(fossss);
    writer.setOutput(outputStream2);
    writer.write(null, iioImage, param);
    outputStream2.close();
    fossss.close();
    writer.notifyAll();
   } catch (Exception e) {
    e.printStackTrace();
   }
//  out.print(w+"===="+h);
//  System.out.println("===================");
  request.getSession().setAttribute("p",strAbsPath+"//lttx//"+today+yzm+".gif");
  response.sendRedirect("scltzp.jsp?photoname="+today+yzm+"");
   %>
  </body>
</html>
