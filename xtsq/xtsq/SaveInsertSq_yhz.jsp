<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%//weblogic@ page session=true%>

<%

String ls=null;
String yhzbh=null;
String yhzmc=null;
String yhzms=null;

yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));
yhzmc=cf.GB2Uni(request.getParameter("yhzmc"));
yhzms=cf.GB2Uni(request.getParameter("yhzms"));
String jb=cf.GB2Uni(request.getParameter("jb"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into sq_yhz ( yhzbh,yhzmc,yhzms,jb ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhzbh);
	ps.setString(2,yhzmc);
	ps.setString(3,yhzms);
	ps.setString(4,jb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		out.println("<BR>存盘成功！");
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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