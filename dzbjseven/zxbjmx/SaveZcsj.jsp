<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String khbjjbbm=cf.GB2Uni(request.getParameter("khbjjbbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！请首先删除已选的主材");
		return;
	}

	String bjbbh=null;
	String ssfgs=null;
	ls_sql="select bjbbh,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_tcsjcjb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ls_sql+=" and bjjbbm1>bjjbbm";
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
		out.println("错误！没有升级差价，请联系管理员");
		return;
	}

	ls_sql=" update  bj_khzcxmxj set bjjbbm='"+bjjbbm+"'";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + e);
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