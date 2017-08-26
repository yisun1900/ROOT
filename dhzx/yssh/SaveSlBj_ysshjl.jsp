<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String slr=null;
java.sql.Date slsj=null;
String slsm=null;

slr=cf.GB2Uni(request.getParameter("slr"));
ls=request.getParameter("slsj");
try{
	if (!(ls.equals("")))  slsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[slsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[受理时间]类型转换发生意外:"+e);
	return;
}
slsm=cf.GB2Uni(request.getParameter("slsm"));
String jsy=cf.GB2Uni(request.getParameter("jsy"));
long fwmj=0;
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套内建筑面积]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getysshbz="";
	ls_sql="select ysshbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getysshbz=cf.fillNull(rs.getString("ysshbz"));
	}
	rs.close();
	ps.close();

	if (!getysshbz.equals("B"))////N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过;S：修改方案授权
	{
		out.println("错误！客户预算申请状态不正确："+getysshbz);
		return;
	}

	getysshbz="";
	ls_sql="select ysshbz";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  (ysshjl='"+ysshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getysshbz=cf.fillNull(rs.getString("ysshbz"));
	}
	rs.close();
	ps.close();

	if (!getysshbz.equals("B"))////N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过;S：修改方案授权
	{
		out.println("错误！申请记录状态不正确："+getysshbz);
		return;
	}

	conn.setAutoCommit(false);

	String ysshbz="C";//C：受理申请
	ls_sql="update bj_ysshjl set ysshbz=?,slr=?,slsj=SYSDATE,slsm=?,jsy=?";
	ls_sql+=" where  (ysshjl='"+ysshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshbz);
	ps.setString(2,slr);
	ps.setString(3,slsm);
	ps.setString(4,jsy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set ysshbz=?,fwmj=?";
	ls_sql+=" where  (khbh='"+khbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshbz);
	ps.setLong(2,fwmj);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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