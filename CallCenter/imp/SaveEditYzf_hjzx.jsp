<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xgbmclqk=null;
String clr=null;
java.sql.Date clsj=null;
xgbmclqk=cf.GB2Uni(request.getParameter("xgbmclqk"));
clr=cf.GB2Uni(request.getParameter("clr"));
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理时间]类型转换发生意外:"+e);
	return;
}

String wherexh=null;
String wherekhbh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yzf_hjzx set xgbmclqk=?,clr=?,clsj=?,clzt='2' ";
	ls_sql+=" where  (xh="+wherexh+") and  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgbmclqk);
	ps.setString(2,clr);
	ps.setDate(3,clsj);
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