<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qcph=null;
String qcxh=null;
String sjxm=null;
java.sql.Date gcsj=null;
java.sql.Date njrq=null;
double yxsgls=0;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
qcph=cf.GB2Uni(request.getParameter("qcph"));
qcxh=cf.GB2Uni(request.getParameter("qcxh"));
sjxm=cf.GB2Uni(request.getParameter("sjxm"));
ls=request.getParameter("gcsj");
try{
	if (!(ls.equals("")))  gcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[购车时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("njrq");
try{
	if (!(ls.equals("")))  njrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量njrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[年检日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxsgls");
try{
	if (!(ls.equals("")))  yxsgls=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxsgls不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已行使公里数]类型转换发生意外:"+e);
	return;
}
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String whereqcph=null;
whereqcph=cf.GB2Uni(request.getParameter("whereqcph"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_qcdm set qcph=?,qcxh=?,sjxm=?,gcsj=?,njrq=?,yxsgls=?,ssfgs=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (qcph='"+whereqcph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qcph);
	ps.setString(2,qcxh);
	ps.setString(3,sjxm);
	ps.setDate(4,gcsj);
	ps.setDate(5,njrq);
	ps.setDouble(6,yxsgls);
	ps.setString(7,ssfgs);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,bz);
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
	out.print("Exception: " + e);
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