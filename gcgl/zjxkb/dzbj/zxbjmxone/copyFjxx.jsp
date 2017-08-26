<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String oldjgwzbm=cf.GB2Uni(request.getParameter("oldjgwzbm"));
String newjgwzbm=cf.GB2Uni(request.getParameter("newjgwzbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_fjxxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+newjgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！房间名称已存在");
		return;
	}
	
	int xuhao=0;
	ls_sql="SELECT max(xuhao)";
	ls_sql+=" FROM bj_fjxxh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xuhao++;


	conn.setAutoCommit(false);

	//增加房间信息 
	ls_sql="insert into bj_fjxxh ( zjxxh,khbh,jgwzbm,xuhao,oldjgwzbm ) values('"+zjxxh+"','"+khbh+"','"+newjgwzbm+"',"+xuhao+",'"+newjgwzbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	//增加工程量明细
	ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
	ls_sql+=" select zjxxh,khbh,dqbm,xmbh,'"+newjgwzbm+"',0,0,0,'N' ";
	ls_sql+=" from  bj_gclmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+oldjgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("拷贝成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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