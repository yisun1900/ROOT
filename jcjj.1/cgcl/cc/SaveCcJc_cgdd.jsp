<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ccr=cf.GB2Uni(request.getParameter("ccr"));
String ccbz=cf.GB2Uni(request.getParameter("ccbz"));
java.sql.Date sccsj=null;
java.sql.Date jhccsj=null;
ls=request.getParameter("sccsj");
try{
	if (!(ls.equals("")))  sccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实初测时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测测时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("05"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_cgccdmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set sccsj=?,ccr=?,ccbz=?,clzt='07'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='05'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sccsj);
	ps.setString(2,ccr);
	ps.setString(3,ccbz);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cgccdmx ( xh,ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,bz) ";
	ls_sql+=" select "+xh+"+rownum,ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,bz";
	ls_sql+=" from jc_cgyddmx ";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cgwjccdmx";
	ls_sql+=" select *";
	ls_sql+=" from jc_cgwjyddmx ";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cgdqccdmx";
	ls_sql+=" select *";
	ls_sql+=" from jc_cgdqyddmx ";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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