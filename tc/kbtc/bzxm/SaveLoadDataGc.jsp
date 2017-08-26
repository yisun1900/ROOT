<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] hxbm =request.getParameterValues("hxbm");
String[] jgwzbm =request.getParameterValues("jgwzbm");
String[] xmbh =request.getParameterValues("xmbh");
String[] jldw =request.getParameterValues("jldw");
String[] sl =request.getParameterValues("sl");
String[] dj =request.getParameterValues("dj");
String[] sfksc =request.getParameterValues("sfksc");
String[] sfkth =request.getParameterValues("sfkth");


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


	for (int i=0;i<xmbh.length ;i++ )
	{
		sql="insert into tckb_bpgcxm ( bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,xmbh,jldw,sl,dj,sfksc,sfkth,lrr,lrsj) ";
		sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm[i]+"','"+hxbm[i]+"','"+cf.GB2Uni(jgwzbm[i])+"','"+xmbh[i]+"','"+cf.GB2Uni(jldw[i])+"','"+sl[i]+"','"+dj[i]+"','"+sfksc[i]+"','"+sfkth[i]+"','"+yhmc+"',SYSDATE)";
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
