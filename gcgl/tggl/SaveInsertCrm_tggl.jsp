<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date tgsqsj=null;
String tgsqr=null;
String tgsqyy=null;

ls=request.getParameter("tgsqsj");
try{
	if (!(ls.equals("")))  tgsqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tgsqsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工申请时间]类型转换发生意外:"+e);
	return;
}
tgsqr=cf.GB2Uni(request.getParameter("tgsqr"));
tgsqyy=cf.GB2Uni(request.getParameter("tgsqyy"));

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));


String tgyybm=null;
tgyybm=cf.GB2Uni(request.getParameter("tgyybm"));
java.sql.Date tgkssj=null;
java.sql.Date gjfgsj=null;
ls=request.getParameter("tgkssj");
try{
	if (!(ls.equals("")))  tgkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tgkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gjfgsj");
try{
	if (!(ls.equals("")))  gjfgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gjfgsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[估计复工日期]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into crm_tggl (djbh,khbh,tgsqsj,tgsqr,tgsqyy,lrr,lrsj,lrbm,tgyybm,tgkssj,gjfgsj,zt)";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?,?,'5')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djbh);
	ps.setString(2,khbh);
	ps.setDate(3,tgsqsj);
	ps.setString(4,tgsqr);
	ps.setString(5,tgsqyy);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,tgyybm);
	ps.setDate(10,tgkssj);
	ps.setDate(11,gjfgsj);
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