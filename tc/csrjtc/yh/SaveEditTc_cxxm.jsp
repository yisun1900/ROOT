<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cxxmbm=null;
String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
double dj=0;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
cxxmbm=cf.GB2Uni(request.getParameter("cxxmbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
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
String wherecxxmbm=null;
wherecxxmbm=cf.GB2Uni(request.getParameter("wherecxxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update tc_cxxm set cxxmbm=?,dqbm=?,bjjbbm=?,xmmc=?,ppmc=?,xh=?,jldw=?,dj=?,bz=?,lrr=?,lrsj=?  ";
	ls_sql+="where (cxxmbm='"+wherecxxmbm+"') ";
	ps= conn.prepareStatement(ls_sql);
    ps.setString(1,cxxmbm);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,xmmc);
	ps.setString(5,ppmc);
	ps.setString(6,xh);
	ps.setString(7,jldw);
	ps.setDouble(8,dj);
	ps.setString(9,bz);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
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