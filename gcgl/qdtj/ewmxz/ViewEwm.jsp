<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tools.*" %>
<%@ page import='ybl.common.*,java.sql.*,java.net.URLEncoder' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>查看二维码</title>
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

<center>点击图片下载</center>
<BR>

	<% 
	String khbh = request.getParameter("khbh");
	String fileName = "";
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();
		
		ls_sql="select ewmmc";
		ls_sql+=" from  app_ewmscmx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fileName=cf.fillNull(rs.getString("ewmmc"));
		}
		else{
			out.println("错误！咨询客户信息不存在");
			
		}
		rs.close();
		ps.close();
	
	
	
	

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
	
	String fileNameDown = java.net.URLEncoder.encode(fileName, "UTF-8");
   %>
    	<img title="点击下载图片"  src="/yblimg/ewm/khewm/<%=fileName%>.jpg" onClick="window.open('/app/ewm/download.jsp?fileName=<%=fileNameDown%>')"  />
  	

  </body>
</html>
