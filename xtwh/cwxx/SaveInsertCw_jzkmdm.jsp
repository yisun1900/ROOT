<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xuhao=0;
String kmdm=null;
String kmmc=null;
String kmlb=null;
String yefx=null;
String qm=null;
String xmfzhs=null;
String fklxbm=null;
long fkcs=0;
String jdbz=null;
String fgsbh=null;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xuhao不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
kmdm=cf.GB2Uni(request.getParameter("kmdm"));
kmmc=cf.GB2Uni(request.getParameter("kmmc"));
kmlb=cf.GB2Uni(request.getParameter("kmlb"));
yefx=cf.GB2Uni(request.getParameter("yefx"));
qm=cf.GB2Uni(request.getParameter("qm"));
xmfzhs=cf.GB2Uni(request.getParameter("xmfzhs"));
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
ls=request.getParameter("fkcs");
try{
	if (!(ls.equals("")))  fkcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收款期数]类型转换发生意外:"+e);
	return;
}
jdbz=cf.GB2Uni(request.getParameter("jdbz"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into cw_jzkmdm ( xuhao,kmdm,kmmc,kmlb,yefx,qm,xmfzhs,fklxbm,fkcs,jdbz,fgsbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xuhao);
	ps.setString(2,kmdm);
	ps.setString(3,kmmc);
	ps.setString(4,kmlb);
	ps.setString(5,yefx);
	ps.setString(6,qm);
	ps.setString(7,xmfzhs);
	ps.setString(8,fklxbm);
	ps.setLong(9,fkcs);
	ps.setString(10,jdbz);
	ps.setString(11,fgsbh);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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