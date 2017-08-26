<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

String ckr=null;
java.sql.Date cksj=null;
ckr=cf.GB2Uni(request.getParameter("ckr"));
ls=request.getParameter("cksj");
try{
	if (!(ls.equals("")))  cksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cksj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库时间]类型转换发生意外:"+e);
	return;
}


String ckdh=cf.GB2Uni(request.getParameter("ckdh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bj_clckd set ckr=?,cksj=?,bz=? ";
	ls_sql+=" where  (ckdh='"+ckdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckr);
	ps.setDate(2,cksj);
	ps.setString(3,bz);
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