<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] fgmc =request.getParameterValues("fgmc");
String[] hxbm =request.getParameterValues("hxbm");
String[] jgwzbm =request.getParameterValues("jgwzbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] bzsl =request.getParameterValues("bzsl");
String[] jldw =request.getParameterValues("jldw");
String[] nbbm =request.getParameterValues("nbbm");
String[] bz =request.getParameterValues("bz");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<tccplbbm.length ;i++ )
	{
		ls_sql="insert into tckd_tcfgzcxm (dqbm,bjjbbm,fgmc,hxbm,jgwzbm,tccplbbm,jldw,bzsl,nbbm,bz,lrr,lrsj)  ";
		ls_sql+=" values('"+dqbm+"','"+bjjbbm[i]+"','"+cf.GB2Uni(fgmc[i])+"','"+hxbm[i]+"','"+cf.GB2Uni(jgwzbm[i])+"','"+tccplbbm[i]+"','"+cf.GB2Uni(jldw[i])+"','"+bzsl[i]+"','"+nbbm[i]+"','"+cf.GB2Uni(bz[i])+"','"+yhmc+"',SYSDATE)";
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
