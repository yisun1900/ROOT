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
String fkcs=null;
String jdbz=null;
String fgsbh=null;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xuhao������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
kmdm=cf.GB2Uni(request.getParameter("kmdm"));
kmmc=cf.GB2Uni(request.getParameter("kmmc"));
kmlb=cf.GB2Uni(request.getParameter("kmlb"));
yefx=cf.GB2Uni(request.getParameter("yefx"));
qm=cf.GB2Uni(request.getParameter("qm"));
xmfzhs=cf.GB2Uni(request.getParameter("xmfzhs"));
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
fkcs=cf.GB2Uni(request.getParameter("fkcs"));

jdbz=cf.GB2Uni(request.getParameter("jdbz"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherexuhao=null;
wherexuhao=cf.GB2Uni(request.getParameter("wherexuhao"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jzkmdm set xuhao=?,kmdm=?,kmmc=?,kmlb=?,yefx=?,qm=?,xmfzhs=?,fklxbm=?,fkcs=?,jdbz=?,fgsbh=? ";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xuhao);
	ps.setString(2,kmdm);
	ps.setString(3,kmmc);
	ps.setString(4,kmlb);
	ps.setString(5,yefx);
	ps.setString(6,qm);
	ps.setString(7,xmfzhs);
	ps.setString(8,fklxbm);
	ps.setString(9,fkcs);
	ps.setString(10,jdbz);
	ps.setString(11,fgsbh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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