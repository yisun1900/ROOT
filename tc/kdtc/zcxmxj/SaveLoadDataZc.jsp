<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] hxbm =request.getParameterValues("hxbm");
String[] jgwzbm =request.getParameterValues("jgwzbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] bzsl =request.getParameterValues("bzsl");
String[] sfxzsl =request.getParameterValues("sfxzsl");
String[] sfbxx =request.getParameterValues("sfbxx");
String[] sfyxsj =request.getParameterValues("sfyxsj");
String[] sjfl =request.getParameterValues("sjfl");
String[] sfyqxtpp =request.getParameterValues("sfyqxtpp");

String[] jldw =request.getParameterValues("jldw");
String[] sfkjm =request.getParameterValues("sfkjm");
String[] jmfl =request.getParameterValues("jmfl");
String[] jmjldw =request.getParameterValues("jmjldw");
String[] yxjmzdsl =request.getParameterValues("yxjmzdsl");
String[] jmdj =request.getParameterValues("jmdj");
String[] fgmc =request.getParameterValues("fgmc");
String[] sjjjfs =request.getParameterValues("sjjjfs");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<tccplbbm.length ;i++ )
	{
		ls_sql="insert into tckd_tcfgzcxmxj (dqbm,bjjbbm,fgmc,hxbm,jgwzbm,tccplbbm,sjfl,sjjjfs,sfbxx,sfyxsj,jldw,sfxzsl   ,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfyqxtpp,lrr,lrsj)  ";
		ls_sql+=" values('"+dqbm+"','"+bjjbbm[i]+"','"+cf.GB2Uni(fgmc[i])+"','"+hxbm[i]+"','"+cf.GB2Uni(jgwzbm[i])+"','"+tccplbbm[i]+"','"+cf.GB2Uni(sjfl[i])+"','"+sjjjfs[i]+"','"+sfbxx[i]+"','"+sfyxsj[i]+"','"+cf.GB2Uni(jldw[i])+"','"+sfxzsl[i]+"'   ,'"+bzsl[i]+"','"+sfkjm[i]+"','"+cf.GB2Uni(jmfl[i])+"','"+cf.GB2Uni(jmjldw[i])+"','"+yxjmzdsl[i]+"','"+jmdj[i]+"','"+sfyqxtpp[i]+"','"+yhmc+"',SYSDATE)";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
