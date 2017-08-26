<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String dqbm = request.getParameter("dqbm");

String[] cxxmbm =request.getParameterValues("cxxmbm");
String[] xmmc =request.getParameterValues("xmmc");
String[] ppmc =request.getParameterValues("ppmc");
String[] xh =request.getParameterValues("xh");
String[] jldw =request.getParameterValues("jldw");
String[] dj =request.getParameterValues("dj");
String[] bz =request.getParameterValues("bz");


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


	for (int i=0;i<xmmc.length ;i++ )
	{
		sql="insert into tc_cxxm ( bjjbbm,dqbm,cxxmbm,xmmc,ppmc,xh,jldw,dj,bz,lrr,lrsj) ";
		sql+=" values('"+bjjbbm+"','"+dqbm+"','"+cxxmbm[i]+"','"+cf.GB2Uni(xmmc[i])+"','"+cf.GB2Uni(ppmc[i])+"','"+xh[i]+"','"+cf.GB2Uni(jldw[i])+"','"+dj[i]+"','"+cf.GB2Uni(bz[i])+"','"+yhmc+"',SYSDATE)";
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
