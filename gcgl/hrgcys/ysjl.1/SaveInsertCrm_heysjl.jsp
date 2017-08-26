<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysjlh=null;
String yscsjlh=null;
String khbh=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String gcysbbh=null;
String gcysxmbm=null;
String gcysxmmc=null;
long yszxsl=0;
java.sql.Date yssj=null;
String ysr=null;
String sjysjg=null;
ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
yscsjlh=cf.GB2Uni(request.getParameter("yscsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
zjxm=cf.GB2Uni(request.getParameter("zjxm"));
gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
gcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
gcysxmmc=cf.GB2Uni(request.getParameter("gcysxmmc"));
ls=request.getParameter("yszxsl");
try{
	if (!(ls.equals("")))  yszxsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yszxsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[项目验收时间]类型转换发生意外:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
sjysjg=cf.GB2Uni(request.getParameter("sjysjg"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into crm_heysjl ( ysjlh,yscsjlh,khbh,sjs,sgd,zjxm,gcysbbh,gcysxmbm,gcysxmmc,yszxsl,yssj,ysr,sjysjg ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysjlh);
	ps.setString(2,yscsjlh);
	ps.setString(3,khbh);
	ps.setString(4,sjs);
	ps.setString(5,sgd);
	ps.setString(6,zjxm);
	ps.setString(7,gcysbbh);
	ps.setString(8,gcysxmbm);
	ps.setString(9,gcysxmmc);
	ps.setLong(10,yszxsl);
	ps.setDate(11,yssj);
	ps.setString(12,ysr);
	ps.setString(13,sjysjg);
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