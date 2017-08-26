<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String bjjbbm = request.getParameter("bjjbbm");
String dqbm = request.getParameter("dqbm");

String[] tccpdlbm =request.getParameterValues("tccpdlbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] tcsjflbm =request.getParameterValues("tcsjflbm");
String[] sku =request.getParameterValues("sku");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] dj =request.getParameterValues("dj");
String[] jsj =request.getParameterValues("jsj");
String[] jjje =request.getParameterValues("jjje");
String[] sh =request.getParameterValues("sh");
String[] sfcscp =request.getParameterValues("sfcscp");
String[] xuhao =request.getParameterValues("xuhao");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] sfxclxs =request.getParameterValues("sfxclxs");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	int count=0;
	sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	sql+=" from  bj_tczcbj";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<cpmc.length ;i++ )
	{
		count++;

		String cpbm=null;
		cpbm="TC"+cf.addZero(count,11);

		sql="insert into bj_tczcbj ( bjbbh,dqbm,bjjbbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,xh,gg    ";
		sql+=" ,jldw,xdjldw,xdb,dj,jsj,jjje,sh,sfcscp,ppmc,gysmc,xuhao,sfxclxs   ,lrr,lrsj ) ";
		sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+cpbm+"','"+sku[i]+"','"+tccpdlbm[i]+"','"+tccplbbm[i]+"','"+tcsjflbm[i]+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+dj[i]+"','"+jsj[i]+"','"+jjje[i]+"','"+sh[i]+"','"+sfcscp[i]+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+xuhao[i]+"','"+sfxclxs[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE)";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
