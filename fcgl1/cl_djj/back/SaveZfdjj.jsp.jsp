<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

//=====================================将出库批号写入数据库======================================================
String czxh=cf.GB2Uni(request.getParameter("czxh"));
String zfyy=cf.GB2Uni(request.getParameter("zfyy"));

String ls=null;
String zflrr=null;
java.sql.Date zflrsj=null;

zflrr=cf.GB2Uni(request.getParameter("zflrr"));
ls=request.getParameter("zflrsj");
try{
	if (!(ls.equals("")))  zflrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zflrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[作废录入时间]类型转换发生意外:"+e);
	return;
}

String shzt="";

try {
	conn=cf.getConnection();
	ls_sql="update cl_djj set zflrr=?,zflrsj=?,zfyy=?,czzt='8'";
	ls_sql+=" where  (czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zflrr);
	ps.setDate(2,zflrsj);
	ps.setString(3,zfyy);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>