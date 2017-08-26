<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>删除照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
String clbm=request.getParameter("clbm");
String zp=request.getParameter("zp");

String path=getServletContext().getRealPath("")+"/jxc/zckcpwh/images";
String fileName=path+"/"+zp;

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try 
{
	java.io.File lsFile=null;
	lsFile=new java.io.File(fileName);

	if (!lsFile.delete())
	{
		out.println("<BR>删除图片【"+zp+"】失败！");
		return;
	}

	conn=cf.getConnection();
	
	ls_sql="update jxc_clbm set zp=null";
	ls_sql+=" where clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>

</body>
</html>


