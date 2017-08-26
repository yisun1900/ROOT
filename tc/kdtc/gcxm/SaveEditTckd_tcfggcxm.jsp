<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String xmbh=null;
double bzsl=0;

String lrr=null;
java.sql.Date lrsj=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
ls=request.getParameter("bzsl");
try{
	if (!(ls.equals("")))  bzsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bzsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准数量]类型转换发生意外:"+e);
	return;
}

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
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));

String wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("wherebjjbbm"));
String wherefgmc=cf.GB2Uni(request.getParameter("wherefgmc"));
String wherehxbm=cf.GB2Uni(request.getParameter("wherehxbm"));
String wherejgwzbm=cf.GB2Uni(request.getParameter("wherejgwzbm"));
String wherexmbh=cf.GB2Uni(request.getParameter("wherexmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where dqbm='"+dqbm+"' and  bjjbbm='"+bjjbbm+"' and  xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count==0)
	{
		out.println("错误！项目编号不存在");
		return;
	}

	ls_sql="update tckd_tcfggcxm set jgwzbm=?,xmbh=?,bzsl=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (fgmc='"+wherefgmc+"') and  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"') and  (xmbh='"+wherexmbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jgwzbm);
	ps.setString(2,xmbh);
	ps.setDouble(3,bzsl);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>